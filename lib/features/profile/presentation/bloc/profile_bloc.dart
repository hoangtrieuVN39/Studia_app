import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:studia/core/data/datasources/local/drift/database.dart';
import 'package:studia/core/domain/entities/user.dart';
import 'package:studia/features/auth/domain/usecases/fetch_levels_usecase.dart';
import 'package:studia/features/profile/domain/usecases/edit_usecase.dart';
import 'package:studia/features/profile/domain/usecases/fetch_skills_usecase.dart';
import 'package:studia/features/profile/domain/usecases/get_learned_skills_usecase.dart';
import 'package:studia/features/profile/domain/usecases/get_performance_skills_usecase.dart';
import 'package:studia/features/profile/domain/usecases/sort_skills_usecase.dart';

part 'profile_event.dart';
part 'profile_state.dart';
part 'profile_bloc.freezed.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  User user;
  FetchLevelsUsecase fetchLevelsUsecase;
  FetchSkillsUsecase fetchSkillsUsecase;
  GetLearnedSkillsUsecase getLearnedSkillsUsecase;
  GetPerformanceSkillsUsecase getPerformanceSkillsUsecase;
  SortSkillsUsecase sortSkillsUsecase;
  EditProfileUsecase editProfileUsecase;

  ProfileBloc(
    this.user,
    this.fetchLevelsUsecase,
    this.fetchSkillsUsecase,
    this.getLearnedSkillsUsecase,
    this.getPerformanceSkillsUsecase,
    this.sortSkillsUsecase,
    this.editProfileUsecase,
  ) : super(ProfileState()) {
    on<_Initial>((event, emit) => _onInitialEvent(event, emit));
    on<_SelectGrade>((event, emit) => _onSelectGradeEvent(event, emit));
    on<_EditProfile>((event, emit) => _onEditProfileEvent(event, emit));
    on<_ViewAllSkills>((event, emit) => _onViewAllSkillsEvent(event, emit));
    on<_SelectSkillsSort>(
      (event, emit) => _onSelectSkillsSortEvent(event, emit),
    );
    on<_Back>((event, emit) => _onBackEvent(event, emit));
    on<_ViewSkill>((event, emit) => _onViewSkillEvent(event, emit));
    add(const _Initial());
  }

  Future<void> _onInitialEvent(
    ProfileEvent event,
    Emitter<ProfileState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    final levels = await fetchLevelsUsecase.call();
    emit(state.copyWith(levels: levels, selectedLevel: user.level));
    await _onUIUpdateEvent(state, emit);
  }

  Future<void> _onUIUpdateEvent(
    ProfileState state,
    Emitter<ProfileState> emit,
  ) async {
    final skills = await fetchSkillsUsecase.call(state.selectedLevel!);
    final Map<Skills, Map<String, dynamic>> skillsWithDomain = {};
    for (var skill in skills.keys) {
      skillsWithDomain[skill] = {
        'domain': skills[skill],
        'performance': await getPerformanceSkillsUsecase.call(
          user.performance,
          skill,
        ),
      };
    }
    final skills_learned = getLearnedSkillsUsecase.call(skillsWithDomain);
    final List<Skills> learnedSkills = [];
    for (var skill in skillsWithDomain.keys) {
      if (skills_learned[skill] == true) {
        learnedSkills.add(skill);
      }
    }
    final sortedSkills = await sortSkillsUsecase.call(
      skillsWithDomain,
      state.sortedSkills,
    );
    final avgPerformance =
        _onCalculateAvgPerformanceEvent(sortedSkills).round();
    emit(
      state.copyWith(
        isLoading: false,
        skills: sortedSkills,
        learnedSkills: learnedSkills,
        user: user,
        avgPerformance: avgPerformance,
      ),
    );
  }

  Future<void> _onSelectGradeEvent(
    _SelectGrade event,
    Emitter<ProfileState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    try {
      await editProfileUsecase.call(level: event.level);
      await _onUIUpdateEvent(state, emit);
      emit(state.copyWith(selectedLevel: event.level));
    } catch (e) {
      emit(state.copyWith(isLoading: false));
    }
  }

  void _onEditProfileEvent(ProfileEvent event, Emitter<ProfileState> emit) {
    emit(state.copyWith(isLoading: true, isEditProfile: true));
  }

  void _onViewAllSkillsEvent(ProfileEvent event, Emitter<ProfileState> emit) {
    emit(state.copyWith(isViewAllSkills: true));
    emit(state.copyWith(isViewAllSkills: false));
  }

  void _onViewSkillEvent(_ViewSkill event, Emitter<ProfileState> emit) {
    emit(state.copyWith(isLoading: true, viewSkill: event.skill));
  }

  Future<void> _onSelectSkillsSortEvent(
    _SelectSkillsSort event,
    Emitter<ProfileState> emit,
  ) async {
    emit(state.copyWith(isLoading: true, sortedSkills: event.skillsSort));
    await _onUIUpdateEvent(state, emit);
  }

  void _onBackEvent(ProfileEvent event, Emitter<ProfileState> emit) {
    emit(state.copyWith(isBack: true));
  }

  double _onCalculateAvgPerformanceEvent(
    Map<Skills, Map<String, dynamic>> skills,
  ) {
    double sum = 0;

    for (var performance in skills.values.map(
      (value) => value['performance'],
    )) {
      sum += performance;
    }

    return sum / skills.length * 100;
  }
}
