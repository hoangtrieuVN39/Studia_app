part of 'home_bloc.dart';

@freezed
abstract class HomeState with _$HomeState {
  const factory HomeState({
    @Default(false) bool isLoading,
    @Default(false) bool isError,
    @Default('') String message,
    @Default(null) Standards? selectedStandard,
    @Default({}) Map<Standards, double> standards_performance,
    @Default([]) List<Question> questions,
    @Default(false) bool isPlayTapped,
    @Default(false) bool isViewInfoTapped,
  }) = _HomeState;
}
