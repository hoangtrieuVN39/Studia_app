import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:studia/core/data/datasources/local/drift/database.dart';
import 'package:studia/core/domain/entities/user.dart';
import 'package:studia/features/skills/domain/usecases/fetch_domains_usecase.dart';
import 'package:studia/features/skills/domain/usecases/fetch_levels_usecase.dart';
import 'package:studia/features/skills/domain/usecases/fetch_skills_usecase.dart';

part 'skills_event.dart';
part 'skills_state.dart';
part 'skills_bloc.freezed.dart';

class SkillsBloc extends Bloc<SkillsEvent, SkillsState> {
  final FetchLevelsUsecase fetchLevelsUsecase;
  final FetchDomainsUsecase fetchDomainsUsecase;
  final FetchSkillsUsecase fetchSkillsUsecase;
  final User user;

  SkillsBloc({
    required this.fetchLevelsUsecase,
    required this.fetchDomainsUsecase,
    required this.fetchSkillsUsecase,
    required this.user,
  }) : super(SkillsState()) {
    on<Initial>(_onInitial);
    on<SelectLevel>(_onSelectLevel);
    on<LevelSelected>(_onLevelSelected);
    on<SkillSelected>(_onSkillSelected);
    on<DomainSelected>(_onDomainSelected);
    on<Navigate>(_onNavigate);
    add(Initial());
  }

  Future<void> _onInitial(Initial event, Emitter<SkillsState> emit) async {
    emit(state.copyWith(isLoading: true));
    final levels = await fetchLevelsUsecase.call();
    emit(state.copyWith(levels: levels, selectedLevel: user.level));
    await _UIUpdate(emit);
  }

  void _onSelectLevel(SelectLevel event, Emitter<SkillsState> emit) {
    emit(state.copyWith(selectLevel: true));
    emit(state.copyWith(selectLevel: false));
  }

  Future<void> _onLevelSelected(
    LevelSelected event,
    Emitter<SkillsState> emit,
  ) async {
    emit(state.copyWith(selectedLevel: event.level));
    await _UIUpdate(emit);
  }

  void _onSkillSelected(SkillSelected event, Emitter<SkillsState> emit) {
    emit(state.copyWith(skillSelected: event.skill));
    emit(state.copyWith(skillSelected: null));
  }

  void _onDomainSelected(DomainSelected event, Emitter<SkillsState> emit) {
    emit(state.copyWith(domainSelected: event.domain));
    emit(state.copyWith(domainSelected: null));
  }

  void _onNavigate(Navigate event, Emitter<SkillsState> emit) {
    emit(state.copyWith(selectedNavItem: event.navItem));
  }

  Future<void> _UIUpdate(Emitter<SkillsState> emit) async {
    emit(state.copyWith(isLoading: true));
    final skills = await fetchSkillsUsecase.call(
      user.performance,
      state.selectedLevel!,
    );
    final domains = await fetchDomainsUsecase.call(
      user.performance,
      state.selectedLevel!,
    );

    emit(
      state.copyWith(
        isLoading: false,
        skillsDetails: skills,
        domainsDetails: domains,
      ),
    );
  }
}

enum NavItem { skills, domains }

extension NavItemExtension on NavItem {
  String get label {
    switch (this) {
      case NavItem.domains:
        return 'Domains';
      case NavItem.skills:
        return 'Skills';
    }
  }
}
