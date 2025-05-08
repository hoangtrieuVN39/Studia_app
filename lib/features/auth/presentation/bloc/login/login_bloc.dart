import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:studia/features/auth/domain/usecases/login_google_usecase.dart';
import 'package:studia/features/auth/domain/usecases/login_shared-prefs_usecase.dart';

part 'login_event.dart';
part 'login_state.dart';
part 'login_bloc.freezed.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginSharedPrefsUsecase loginSharedPrefsUsecase;
  final LoginGoogleUsecase loginGoogleUsecase;

  LoginBloc({
    required this.loginSharedPrefsUsecase,
    required this.loginGoogleUsecase,
  }) : super(const LoginState()) {
    on<LoginRequested>((event, emit) => _onLoginEvent(event, emit));
    on<Initial>((event, emit) => _onInitialEvent(event, emit));
    add(const Initial());
  }

  Future<void> _onLoginEvent(LoginEvent event, Emitter<LoginState> emit) async {
    emit(state.copyWith(isLoading: true));
    final result = await loginGoogleUsecase();
    emit(state.copyWith(loginResult: result, isLoading: false));
  }

  Future<void> _onInitialEvent(
    LoginEvent event,
    Emitter<LoginState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    final result = await loginSharedPrefsUsecase();
    if (result != null) {
      emit(state.copyWith(loginResult: result, isLoading: false));
    }
  }
}
