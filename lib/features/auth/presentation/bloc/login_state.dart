part of 'login_bloc.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState({
    @Default(false) bool isLoading,
    @Default(false) bool isError,
    @Default('') String message,
    // Add specific login state fields if needed
  }) = _LoginState;
}
