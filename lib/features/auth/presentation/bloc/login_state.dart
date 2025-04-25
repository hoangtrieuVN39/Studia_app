part of 'login_bloc.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState({
    @Default(false) bool isLoading,
    @Default(false) bool isError,
    @Default('') String message,
    @Default({'id': '', 'email': '', 'newUser': 'true'}) Map<String, String> loginResult,
  }) = _LoginState;
}
