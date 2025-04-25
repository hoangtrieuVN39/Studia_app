import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:studia/features/auth/domain/usecases/login.dart';

part 'login_event.dart';
part 'login_state.dart';
part 'login_bloc.freezed.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUsecase loginUsecase;

  LoginBloc({required this.loginUsecase}) : super(const LoginState()) {
    on<LoginEvent>((event, emit) => _onLoginEvent(event, emit));
  }

  Future<void> _onLoginEvent(LoginEvent event, Emitter<LoginState> emit) async {
    emit(state.copyWith(isLoading: true));
    final result = await loginUsecase();
    emit(state.copyWith(loginResult: result, isLoading: false));
  }
}
