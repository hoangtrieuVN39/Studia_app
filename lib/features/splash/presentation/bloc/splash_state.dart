part of 'splash_bloc.dart';

@freezed
class SplashState with _$SplashState {
  const factory SplashState({
    @Default(false) bool isLoading,
    @Default(false) bool isError,
    @Default('') String message,
    @Default(false) bool done,
  }) = _SplashState;
}
