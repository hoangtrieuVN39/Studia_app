import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:studia/core/core.dart';
import 'package:studia/core/data/datasources/local/drift/database.dart';
import 'package:studia/core/domain/entities/user.dart';
import 'package:studia/features/auth/domain/usecases/fetch_domains_usecase.dart';
import 'package:studia/features/auth/domain/usecases/fetch_levels_usecase.dart';
import 'package:studia/features/profile/domain/usecases/edit_usecase.dart';

part 'profile_edit_event.dart';
part 'profile_edit_state.dart';
part 'profile_edit_bloc.freezed.dart';

class ProfileEditBloc extends Bloc<ProfileEditEvent, ProfileEditState> {
  final FetchLevelsUsecase fetchLevelsUsecase;
  final FetchDomainsUsecase fetchDomainsUsecase;
  final EditProfileUsecase editProfileUsecase;
  final User user;

  ProfileEditBloc(
    this.fetchLevelsUsecase,
    this.fetchDomainsUsecase,
    this.editProfileUsecase,
    this.user,
  ) : super(const ProfileEditState()) {
    on<Initial>((event, emit) => _onInitial(event, emit));
    on<PickGradeRequested>((event, emit) => _onPickGradeRequested(event, emit));
    on<GradeSelected>((event, emit) => _onGradeSelected(event, emit));
    on<SetGender>((event, emit) => _onSetGender(event, emit));
    on<PickYearOfBirthRequested>(
      (event, emit) => _onPickYearOfBirthRequested(event, emit),
    );
    on<YobSelected>((event, emit) => _onYobSelected(event, emit));
    on<ContinuePressed>((event, emit) => _onContinuePressed(event, emit));
    on<BackPressed>((event, emit) => _onBackPressed(event, emit));
    on<SetFirstName>((event, emit) => _onSetFirstName(event, emit));
    on<SetLastName>((event, emit) => _onSetLastName(event, emit));
    add(const Initial());
  }

  Future<void> _onInitial(Initial event, Emitter<ProfileEditState> emit) async {
    emit(state.copyWith(isLoading: true));
    final levels = await fetchLevelsUsecase();
    final genders = Gender.values.map((e) => MapEntry(e, e.name)).toList();
    emit(
      state.copyWith(
        firstName: user.firstName,
        lastName: user.lastName,
        gender: genders.firstWhere((e) => e.value == user.gender).key,
        yearOfBirth: user.birthYear,
        levels: levels,
        selectedLevel: user.level!,
      ),
    );
    emit(state.copyWith(isLoading: false));
  }

  Future<void> _onPickGradeRequested(
    PickGradeRequested event,
    Emitter<ProfileEditState> emit,
  ) async {
    emit(state.copyWith(showLevelPicker: true));
  }

  Future<void> _onGradeSelected(
    GradeSelected event,
    Emitter<ProfileEditState> emit,
  ) async {
    emit(state.copyWith(selectedLevel: event.level, showLevelPicker: false));
  }

  Future<void> _onSetGender(
    SetGender event,
    Emitter<ProfileEditState> emit,
  ) async {
    emit(state.copyWith(gender: event.gender));
  }

  Future<void> _onPickYearOfBirthRequested(
    PickYearOfBirthRequested event,
    Emitter<ProfileEditState> emit,
  ) async {
    emit(state.copyWith(showYearOfBirthPicker: true));
  }

  Future<void> _onYobSelected(
    YobSelected event,
    Emitter<ProfileEditState> emit,
  ) async {
    emit(state.copyWith(yearOfBirth: event.year, showYearOfBirthPicker: false));
  }

  Future<void> _onContinuePressed(
    ContinuePressed event,
    Emitter<ProfileEditState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    await editProfileUsecase(
      firstName: state.firstName,
      lastName: state.lastName,
      gender: state.gender.name,
      level: state.selectedLevel,
      birthYear: state.yearOfBirth,
    ).then((value) {
      emit(state.copyWith(isLoading: false, isContinuePressed: true));
    });
  }

  Future<void> _onBackPressed(
    BackPressed event,
    Emitter<ProfileEditState> emit,
  ) async {
    emit(state.copyWith(isBackPressed: true));
  }

  Future<void> _onSetFirstName(
    SetFirstName event,
    Emitter<ProfileEditState> emit,
  ) async {
    emit(state.copyWith(firstName: event.firstName));
  }

  Future<void> _onSetLastName(
    SetLastName event,
    Emitter<ProfileEditState> emit,
  ) async {
    emit(state.copyWith(lastName: event.lastName));
  }
}
