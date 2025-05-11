part of 'menu_bloc.dart';

@freezed
class MenuEvent with _$MenuEvent {
  const factory MenuEvent.initial() = Initial;
  const factory MenuEvent.viewProfile() = ViewProfile;
  const factory MenuEvent.viewSkills() = ViewSkills;
  const factory MenuEvent.viewSettings() = ViewSettings;
  const factory MenuEvent.logout() = Logout;
}
