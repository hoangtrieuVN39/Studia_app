part of 'skills_bloc.dart';

@freezed
abstract class SkillsState with _$SkillsState {
  const factory SkillsState({
    @Default(false) bool isLoading,
    @Default(false) bool isError,
    @Default('') String message,
    @Default([]) List<SkillDetails> skillsDetails,
    @Default([]) List<DomainDetails> domainsDetails,
    @Default([]) List<Levels> levels,
    @Default(null) Levels? selectedLevel,
    @Default(false) bool selectLevel,
    @Default(null) Skills? skillSelected,
    @Default(null) Domains? domainSelected,
    @Default(NavItem.domains) NavItem selectedNavItem,
  }) = _SkillsState;
}
