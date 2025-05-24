part of 'register_bloc.dart';

@freezed
abstract class RegisterState with _$RegisterState {
  const factory RegisterState({
    @Default(false) bool isLoading,
    @Default(false) bool isError,
    @Default('') String message,
    @Default(false) bool showGradePicker,
    @Default(null) Levels? selectedLevel,
    @Default([]) List<Levels> levels,
    @Default('') String firstName,
    @Default('') String lastName,
    @Default(Gender.Male) Gender gender,
    @Default(AppTextConstants.yearOfBirthDefault) int yearOfBirth,
    @Default(false) bool showYearOfBirthPicker,
    @Default(false) bool showLevelPicker,
    @Default(false) bool isContinuePressed,
    @Default(false) bool isBackPressed,
    @Default(0) int pageIndex,
    @Default([]) List<Domains> domains,
    @Default([]) List<Domains> selectedDomains,
    @Default(false) bool isContinueFavPressed,
  }) = _RegisterState;
}
