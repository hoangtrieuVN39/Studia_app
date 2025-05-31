part of 'settings_bloc.dart';

@freezed
class SettingsEvent with _$SettingsEvent {
  const factory SettingsEvent.initial() = Initial;
  const factory SettingsEvent.onLanguageTap() = LanguageTap;
  const factory SettingsEvent.onLanguageChanged(Language language) =
      LanguageChanged;
  const factory SettingsEvent.onBackTap() = BackTap;
}
