part of 'profile_edit_bloc.dart';

@freezed
class ProfileEditEvent with _$ProfileEditEvent {
  const factory ProfileEditEvent.initial() = Initial;

  const factory ProfileEditEvent.pickGradeRequested() = PickGradeRequested;
  const factory ProfileEditEvent.pickYearOfBirthRequested() =
      PickYearOfBirthRequested;
  const factory ProfileEditEvent.yobSelected(int year) = YobSelected;
  const factory ProfileEditEvent.gradeSelected(Levels level) = GradeSelected;
  const factory ProfileEditEvent.continuePressed() = ContinuePressed;

  const factory ProfileEditEvent.setGender(Gender gender) = SetGender;

  const factory ProfileEditEvent.setFirstName(String firstName) = SetFirstName;
  const factory ProfileEditEvent.setLastName(String lastName) = SetLastName;

  const factory ProfileEditEvent.backPressed() = BackPressed;
}
