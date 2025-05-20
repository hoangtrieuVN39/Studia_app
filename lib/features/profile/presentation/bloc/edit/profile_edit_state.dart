part of 'profile_edit_bloc.dart';

@freezed
abstract class ProfileEditState with _$ProfileEditState {
  const factory ProfileEditState({
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
  }) = _EditState;
}

enum Gender { Male, Female, Other }

extension GenderExtension on Gender {
  String get name {
    return switch (this) {
      Gender.Male => 'male',
      Gender.Female => 'female',
      Gender.Other => 'other',
    };
  }

  String get displayName {
    return switch (this) {
      Gender.Male => 'Male',
      Gender.Female => 'Female',
      Gender.Other => 'Other',
    };
  }
}
