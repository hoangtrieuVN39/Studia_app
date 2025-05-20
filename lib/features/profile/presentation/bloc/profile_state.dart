part of 'profile_bloc.dart';

@freezed
abstract class ProfileState with _$ProfileState {
  const factory ProfileState({
    @Default(false) bool isLoading,
    @Default(false) bool isError,
    @Default('') String message,
    @Default(null) User? user,
    @Default(false) bool isSelectGrade,
    @Default(false) bool isEditProfile,
    @Default(false) bool isViewAllSkills,
    @Default(false) bool isSelectSkillsSort,
    @Default(null) Levels? selectedLevel,
    @Default({}) Map<Skills, Map<String, dynamic>> skills,
    @Default([]) List<Levels> levels,
    @Default([]) List<Skills> learnedSkills,
    @Default(SkillsSort.latest) SkillsSort sortedSkills,
    @Default(false) bool isBack,
    @Default(0) int avgPerformance,
    @Default(null) Skills? viewSkill,
  }) = _ProfileState;
}
