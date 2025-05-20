part of 'login_bloc.dart';

@freezed
abstract class LoginState with _$LoginState {
  const factory LoginState({
    @Default(false) bool isLoading,
    @Default(false) bool isError,
    @Default('') String message,
    @Default(false) bool isRegister,
    @Default('') String id,
    @Default('') String email,
    @Default(false) bool isLoggedIn,
    @Default(false) bool isNoInternetConnection,
  }) = _LoginState;
}
