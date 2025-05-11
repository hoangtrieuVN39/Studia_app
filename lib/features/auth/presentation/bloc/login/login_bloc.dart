import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:studia/core/di/provider.dart';
import 'package:studia/core/domain/entities/user.dart';
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
  final UserProvider userProvider;

  LoginBloc({
    required this.loginSharedPrefsUsecase,
    required this.loginGoogleUsecase,
    required this.loginRemoteUsecase,
    required this.userProvider,
  }) : super(const LoginState()) {
    on<LoginRequested>((event, emit) => _onLoginEvent(event, emit));
    on<Initial>((event, emit) => _onInitialEvent(event, emit));
    add(const Initial());
  }

  Future<void> _onLoginEvent(LoginEvent event, Emitter<LoginState> emit) async {
    emit(state.copyWith(isLoading: true));
    final user = await loginGoogleUsecase();
    if (user != null) {
      userProvider.setUser(user);
    }
    final result = {
      'id': user?.id,
      'email': user?.email,
      'newUser': user != null,
    };
    emit(state.copyWith(loginResult: result, isLoading: false));
  }

  Future<void> _onInitialEvent(
    LoginEvent event,
    Emitter<LoginState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    final result = await loginSharedPrefsUsecase();
    if (result != null) {
      var user = await loginRemoteUsecase(result['id']);
      if (user != null) {
        userProvider.setUser(user);
      }
      emit(state.copyWith(loginResult: result, isLoading: false));
    }
  }
}
