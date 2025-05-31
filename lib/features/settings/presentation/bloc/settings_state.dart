part of 'settings_bloc.dart';

@freezed
abstract class SettingsState with _$SettingsState {
  const factory SettingsState({
    @Default(false) bool isLoading,
    @Default(false) bool isError,
    @Default('') String message,
    @Default(Language.en) Language language,
    @Default(false) bool isLanguageTap,
    @Default(false) bool isLogoutTap,
    @Default(false) bool isBackTap,
  }) = _SettingsState;
}
