part of 'play_bloc.dart';

@freezed
abstract class PlayState with _$PlayState {
  factory PlayState({
    @Default(false) bool isLoading,
    @Default(false) bool isError,
    @Default('') String message,
    @Default([]) List<Question> questions,
    @Default([]) List<int> selectedChoices,
    @Default(0) int currentQuestionIndex,
    @Default(false) bool isViewingSolution,
    @Default(false) bool isDone,
    @Default(false) bool isNextQuestion,
    @Default(false) bool isSubmit,
    @Default(false) bool isViewingResults,
    @Default(false) bool isQuit,
    @Default(false) bool isQuitConfirmed,
    @Default(false) bool isPlayAgain,
  }) = _PlayState;
}
