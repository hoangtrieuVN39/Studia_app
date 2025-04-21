part of 'register_bloc.dart';

@freezed
class RegisterState with _$RegisterState {
  const factory RegisterState({
    @Default(1) int currentStep, // To track the current registration step
    @Default(false) bool isLoading,
    @Default(false) bool isError,
    @Default('') String message,
    @Default(false) bool showGradePicker, // To control the bottom sheet
    String? selectedGrade, // Store the selected grade
    // Add fields to hold data from step 1 and step 2 if needed
    String? email,
    String? password,
    String? schoolName,
  }) = _RegisterState;
}
