import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:studia/core/core.dart';
import 'package:studia/core/data/datasources/local/drift/database.dart';
import 'package:studia/features/auth/domain/usecases/fetch_domains_usecase.dart';
import 'package:studia/features/auth/domain/usecases/fetch_levels_usecase.dart';
import 'package:studia/features/auth/domain/usecases/logout_usecase.dart';
import 'package:studia/features/auth/domain/usecases/register_usecase.dart';

part 'register_event.dart';
part 'register_state.dart';
part 'register_bloc.freezed.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final FetchLevelsUsecase fetchLevelsUsecase;
  final LogoutUsecase logoutUsecase;
  final FetchDomainsUsecase fetchDomainsUsecase;
  final RegisterUsecase registerUsecase;
  String id;
  String email;

  RegisterBloc(
    this.id,
    this.email,
    this.fetchLevelsUsecase,
    this.logoutUsecase,
    this.fetchDomainsUsecase,
    this.registerUsecase,
  ) : super(const RegisterState()) {
    id = id;
    email = email;

    on<Initial>((event, emit) => _onInitial(event, emit));
    on<PickGradeRequested>((event, emit) => _onPickGradeRequested(event, emit));
    on<GradeSelected>((event, emit) => _onGradeSelected(event, emit));
    on<SetGender>((event, emit) => _onSetGender(event, emit));
    add(const Initial());
    on<PickYearOfBirthRequested>(
      (event, emit) => _onPickYearOfBirthRequested(event, emit),
    );
    on<YobSelected>((event, emit) => _onYobSelected(event, emit));
    on<ContinuePressed>((event, emit) => _onContinuePressed(event, emit));
    on<BackPressed>((event, emit) => _onBackPressed(event, emit));
    on<SetFirstName>((event, emit) => _onSetFirstName(event, emit));
    on<SetLastName>((event, emit) => _onSetLastName(event, emit));

    on<InitialFav>(_onInitialFav);
    on<DomainSelected>(_onDomainSelected);
    on<ContinueFavPressed>(_onContinueFavPressed);
    on<DomainUnselected>(_onDomainUnselected);
  }

  Future<void> _onInitial(Initial event, Emitter<RegisterState> emit) async {
    emit(state.copyWith(isLoading: true));
    final levels = await fetchLevelsUsecase();
    emit(
      state.copyWith(
        levels: levels,
        selectedLevel: levels.isEmpty ? null : levels.first,
        isLoading: false,
      ),
    );
  }

  Future<void> _onPickGradeRequested(
    PickGradeRequested event,
    Emitter<RegisterState> emit,
  ) async {
    emit(state.copyWith(showLevelPicker: true));
  }

  Future<void> _onGradeSelected(
    GradeSelected event,
    Emitter<RegisterState> emit,
  ) async {
    emit(state.copyWith(selectedLevel: event.level, showLevelPicker: false));
  }

  Future<void> _onSetGender(
    SetGender event,
    Emitter<RegisterState> emit,
  ) async {
    emit(state.copyWith(gender: event.gender));
  }

  Future<void> _onPickYearOfBirthRequested(
    PickYearOfBirthRequested event,
    Emitter<RegisterState> emit,
  ) async {
    emit(state.copyWith(showYearOfBirthPicker: true));
  }

  Future<void> _onYobSelected(
    YobSelected event,
    Emitter<RegisterState> emit,
  ) async {
    emit(state.copyWith(yearOfBirth: event.year, showYearOfBirthPicker: false));
  }

  Future<void> _onContinuePressed(
    ContinuePressed event,
    Emitter<RegisterState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    add(const InitialFav());
    emit(
      state.copyWith(isContinuePressed: true, isLoading: false, pageIndex: 1),
    );
  }

  Future<void> _onBackPressed(
    BackPressed event,
    Emitter<RegisterState> emit,
  ) async {
    await logoutUsecase.call();
    emit(state.copyWith(isBackPressed: true));
  }

  Future<void> _onSetFirstName(
    SetFirstName event,
    Emitter<RegisterState> emit,
  ) async {
    emit(state.copyWith(firstName: event.firstName));
  }

  Future<void> _onSetLastName(
    SetLastName event,
    Emitter<RegisterState> emit,
  ) async {
    emit(state.copyWith(lastName: event.lastName));
  }

  Future<void> _onInitialFav(
    InitialFav event,
    Emitter<RegisterState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    final domains = await fetchDomainsUsecase();
    emit(state.copyWith(domains: domains, isLoading: false));
  }

  Future<void> _onDomainSelected(
    DomainSelected event,
    Emitter<RegisterState> emit,
  ) async {
    final selectedDomains = [...state.selectedDomains, event.domain];
    emit(
      state.copyWith(
        selectedDomains: selectedDomains,
        domains:
            state.domains
                .where((domain) => !selectedDomains.contains(domain))
                .toList(),
      ),
    );
  }

  Future<void> _onDomainUnselected(
    DomainUnselected event,
    Emitter<RegisterState> emit,
  ) async {
    emit(
      state.copyWith(
        selectedDomains:
            state.selectedDomains
                .where((domain) => domain != event.domain)
                .toList(),
        domains: [...state.domains, event.domain],
      ),
    );
  }

  Future<void> _onContinueFavPressed(
    ContinueFavPressed event,
    Emitter<RegisterState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    await registerUsecase(
      id,
      email,
      state.firstName,
      state.lastName,
      state.gender.name,
      state.yearOfBirth,
      state.selectedLevel!,
      state.selectedDomains,
    );
    emit(state.copyWith(isLoading: false, isContinueFavPressed: true));
  }
}

enum Gender { Male, Female, Other }

extension GenderExtension on Gender {
  String get name {
    switch (this) {
      case Gender.Male:
        return 'male';
      case Gender.Female:
        return 'female';
      case Gender.Other:
        return 'other';
    }
  }
}
