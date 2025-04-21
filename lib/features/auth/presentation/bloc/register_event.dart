part of 'register_bloc.dart';

@freezed
class RegisterEvent with _$RegisterEvent {
  // Step 1: Basic info
  const factory RegisterEvent.step1Submitted(
    String email,
    String password,
    String confirmPassword,
  ) = Step1Submitted;

  // Event for showing grade picker
  const factory RegisterEvent.pickGradeRequested() = PickGradeRequested;

  // Event for selecting grade
  const factory RegisterEvent.gradeSelected(String grade) = GradeSelected;

  // Step 2: School info
  const factory RegisterEvent.step2Submitted(
    String schoolName,
    String grade,
    // Add other fields if necessary based on Figma
  ) = Step2Submitted;
}
