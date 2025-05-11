part of 'menu_bloc.dart';

@freezed
abstract class MenuState with _$MenuState {
  const factory MenuState({
    @Default(false) bool isLoading,
    @Default(false) bool isError,
    @Default('') String message,
    @Default('') String avatar,
    @Default('') String name,
    @Default(false) bool isViewProfile,
    @Default(false) bool isViewSkills,
    @Default(false) bool isViewSettings,
    @Default(false) bool isLogout,
  }) = _MainState;
}
