import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:studia/core/di/provider.dart';
import 'package:studia/core/error/exceptions.dart';
import 'package:studia/core/network/network_info.dart';
import 'package:studia/features/auth/domain/usecases/check_internet_connection_usecase.dart';
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
  final CheckInternetConnectionUsecase checkInternetConnectionUsecase;
  final UserProvider userProvider;
  final NetworkInfo networkInfo;
  StreamSubscription<NetworkStatus>? _networkSubscription;

  LoginBloc({
    required this.loginSharedPrefsUsecase,
    required this.loginGoogleUsecase,
    required this.loginRemoteUsecase,
    required this.userProvider,
    required this.checkInternetConnectionUsecase,
    required this.networkInfo,
  }) : super(const LoginState()) {
    on<LoginRequested>((event, emit) => _onLoginEvent(event, emit));
    on<Initial>((event, emit) => _onInitialEvent(event, emit));

    add(const Initial());
  }

  @override
  Future<void> close() {
    _networkSubscription?.cancel();
    return super.close();
  }

  Future<void> _onNetworkStatusChanged(
    NetworkStatusChanged event,
    Emitter<LoginState> emit,
  ) async {
    switch (event.status) {
      case NetworkStatus.disconnected:
        emit(
          state.copyWith(
            isNoInternetConnection: true,
            message: 'No internet connection',
          ),
        );
        break;
      case NetworkStatus.connected:
        emit(state.copyWith(isNoInternetConnection: false, message: ''));
        break;
      case NetworkStatus.serverInaccessible:
        emit(
          state.copyWith(isError: true, message: 'Server is not accessible'),
        );
        break;
      case NetworkStatus.serverAccessible:
        emit(state.copyWith(isError: false, message: ''));
        break;
    }
  }

  Future<void> _onLoginEvent(LoginEvent event, Emitter<LoginState> emit) async {
    try {
      emit(state.copyWith(isLoading: true, isError: false, message: ''));

      // Check internet connection first
      bool hasConnection = await checkInternetConnectionUsecase();

      if (!hasConnection) {
        emit(
          state.copyWith(
            isLoading: false,
            isError: true,
            message:
                'No internet connection. Please check your connection and try again.',
            isNoInternetConnection: true,
          ),
        );
        print('No internet connection');
        return;
      }

      // Attempt Google Sign In
      final googleUser = await loginGoogleUsecase();
      if (googleUser == null) {
        // User cancelled the sign-in
        emit(state.copyWith(isLoading: false, isError: false, message: ''));
        return;
      }

      print('Google Sign In successful. User ID: ${googleUser.id}');

      // Attempt to get user from backend
      try {
        final user = await loginRemoteUsecase(googleUser.id);
        if (user != null) {
          // Existing user - proceed with login
          userProvider.setUser(user);
          emit(
            state.copyWith(
              isLoggedIn: true,
              isLoading: false,
              isError: false,
              message: '',
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
      final googleUser = await loginSharedPrefsUsecase();
      print('Checking saved user: $googleUser');
      if (googleUser != null) {
        final user = await loginRemoteUsecase(googleUser['id']);
        if (user != null) {
          userProvider.setUser(user);
          emit(state.copyWith(isLoggedIn: true, isLoading: false));
        } else {
          emit(
            state.copyWith(
              isLoggedIn: false,
              isRegister: true,
              isLoading: false,
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
