part of 'profile_bloc.dart';

@freezed
class ProfileEvent with _$ProfileEvent {
  const factory ProfileEvent.initial() = _Initial;
  const factory ProfileEvent.selectGrade(Levels level) = _SelectGrade;
  const factory ProfileEvent.editProfile() = _EditProfile;
  const factory ProfileEvent.viewAllSkills() = _ViewAllSkills;
  const factory ProfileEvent.selectSkillsSort(SkillsSort skillsSort) =
      _SelectSkillsSort;
  const factory ProfileEvent.viewSkill(Skills skill) = _ViewSkill;

  const factory ProfileEvent.back() = _Back;
}
