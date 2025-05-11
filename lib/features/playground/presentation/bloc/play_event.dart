part of 'play_bloc.dart';

@freezed
class PlayEvent with _$PlayEvent {
  const factory PlayEvent.initial() = Initial;
  const factory PlayEvent.selectChoice(int index) = SelectChoice;
  const factory PlayEvent.submit() = Submit;
  const factory PlayEvent.viewSolution() = ViewSolution;
  const factory PlayEvent.nextQuestion() = NextQuestion;
  const factory PlayEvent.done() = Done;
  const factory PlayEvent.viewResults() = ViewResults;
  const factory PlayEvent.quit() = Quit;
  const factory PlayEvent.playAgain() = PlayAgain;
  const factory PlayEvent.quitConfirmed() = QuitConfirmed;
}
