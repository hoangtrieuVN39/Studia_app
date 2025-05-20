part of 'skills_bloc.dart';

@freezed
class SkillsEvent with _$SkillsEvent {
  const factory SkillsEvent.initial() = Initial;
  const factory SkillsEvent.onSelectLevel() = SelectLevel;
  const factory SkillsEvent.levelSelected(Levels level) = LevelSelected;
  const factory SkillsEvent.skillSelected(Skills skill) = SkillSelected;
  const factory SkillsEvent.domainSelected(Domains domain) = DomainSelected;
  const factory SkillsEvent.navigate(NavItem navItem) = Navigate;
}
