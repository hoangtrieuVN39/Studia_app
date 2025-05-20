part of 'register_bloc.dart';

@freezed
class RegisterEvent with _$RegisterEvent {
  const factory RegisterEvent.initial() = Initial;

  const factory RegisterEvent.pickGradeRequested() = PickGradeRequested;
  const factory RegisterEvent.pickYearOfBirthRequested() =
      PickYearOfBirthRequested;
  const factory RegisterEvent.yobSelected(int year) = YobSelected;
  const factory RegisterEvent.gradeSelected(Levels level) = GradeSelected;
  const factory RegisterEvent.continuePressed() = ContinuePressed;

  const factory RegisterEvent.setGender(Gender gender) = SetGender;

  const factory RegisterEvent.setFirstName(String firstName) = SetFirstName;
  const factory RegisterEvent.setLastName(String lastName) = SetLastName;

  const factory RegisterEvent.backPressed() = BackPressed;

  const factory RegisterEvent.initialFav() = InitialFav;

  const factory RegisterEvent.domainSelected(Domains domain) = DomainSelected;

  const factory RegisterEvent.domainUnselected(Domains domain) =
      DomainUnselected;

  const factory RegisterEvent.continueFavPressed() = ContinueFavPressed;
}
