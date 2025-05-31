import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:studia/core/di/provider.dart';
import 'package:studia/core/error/exceptions.dart';
import 'package:studia/features/auth/domain/usecases/get_language_usecase.dart';
import 'package:studia/features/auth/domain/usecases/login_google_usecase.dart';
import 'package:studia/features/auth/domain/usecases/login_remote_usecase.dart';
import 'package:studia/features/auth/domain/usecases/login_shared-prefs_usecase.dart';

part 'login_event.dart';
part 'login_state.dart';
part 'login_bloc.freezed.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginSharedPrefsUsecase loginSharedPrefsUsecase;
  final LoginGoogleUsecase loginGoogleUsecase;
  final LoginRemoteUsecase loginRemoteUsecase;
  final GetLanguageUsecase getLanguageUsecase;
  final UserProvider userProvider;

  LoginBloc({
    required this.loginSharedPrefsUsecase,
    required this.loginGoogleUsecase,
    required this.loginRemoteUsecase,
    required this.getLanguageUsecase,
    required this.userProvider,
  }) : super(const LoginState()) {
    on<LoginRequested>((event, emit) => _onLoginEvent(event, emit));
    on<Initial>((event, emit) => _onInitialEvent(event, emit));

    add(const Initial());
  }

  Future<void> _onLoginEvent(LoginEvent event, Emitter<LoginState> emit) async {
    try {
      emit(state.copyWith(isLoading: true, isError: false, message: ''));

      // Attempt Google Sign In
      final googleUser = await loginGoogleUsecase();
      if (googleUser == null) {
        // User cancelled the sign-in
        emit(
          state.copyWith(
            isLoading: false,
            isError: false,
            message: '',
            id: googleUser!.id,
            email: googleUser.email,
          ),
        );
        return;
      }

      print('Google Sign In successful. User ID: ${googleUser.id}');

      emit(state.copyWith(isLoading: false));

      try {
        final user = await loginRemoteUsecase(googleUser.id);
        if (user != null) {
          userProvider.setUser(user);
          emit(
            state.copyWith(
              isLoggedIn: true,
              isLoading: false,
              isError: false,
              message: '',
              id: googleUser.id,
              email: googleUser.email,
            ),
          );
        } else {
          // New user - proceed to registration
          emit(
            state.copyWith(
              isLoggedIn: false,
              isRegister: true,
              isLoading: false,
              isError: false,
              message: '',
              id: googleUser.id,
              email: googleUser.email,
            ),
          );
        }
      } on ServerException catch (e) {
        print('Server error during login: ${e.message}');
        emit(
          state.copyWith(
            isLoading: false,
            isError: true,
            message: 'Server error: ${e.message}',
          ),
        );
      } on NetworkException catch (e) {
        print('Network error during login: ${e.message}');
        emit(
          state.copyWith(isLoading: false, isError: true, message: e.message),
        );
      }
    } catch (e) {
      print('Unexpected error during login: $e');
      emit(
        state.copyWith(
          isLoading: false,
          isError: true,
          message: 'An unexpected error occurred. Please try again.',
        ),
      );
    }
  }

  Future<void> _onInitialEvent(
    LoginEvent event,
    Emitter<LoginState> emit,
  ) async {
    try {
      await getLanguageUsecase();
      final googleUser = await loginSharedPrefsUsecase();
      print('Checking saved user: $googleUser');
      if (googleUser != null) {
        final user = await loginRemoteUsecase(googleUser['id']);
        if (user != null) {
          userProvider.setUser(user);
          emit(
            state.copyWith(
              isLoggedIn: true,
              isLoading: false,
              id: googleUser['id'],
              email: googleUser['email'],
            ),
          );
        } else {
          emit(
            state.copyWith(
              isLoggedIn: false,
              isRegister: true,
              isLoading: false,
              id: googleUser['id'],
              email: googleUser['email'],
            ),
          );
        }
      }
    } catch (e) {
      print('Error during initial login check: $e');
      // Don't show error to user for initial check
    }
  }
}
