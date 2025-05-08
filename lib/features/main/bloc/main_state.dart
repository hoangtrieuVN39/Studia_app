part of 'main_bloc.dart';

@freezed
abstract class MainState with _$MainState {
  const factory MainState({
    @Default(false) bool isLoading,
    @Default(false) bool isError,
    @Default('') String message,
    @Default(0) int navBarStatus,
  }) = _MainState;
}
