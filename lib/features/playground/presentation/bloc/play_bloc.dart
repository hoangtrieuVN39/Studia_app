import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:studia/features/playground/domain/entities/choice.dart';
import 'package:studia/features/playground/domain/entities/questions.dart';

part 'play_event.dart';
part 'play_state.dart';
part 'play_bloc.freezed.dart';

class PlayBloc extends Bloc<PlayEvent, PlayState> {
  List<Question> questions;

  PlayBloc(this.questions) : super(PlayState()) {
    on<Initial>((event, emit) => _onInitialEvent(event, emit));
    on<SelectChoice>((event, emit) => _onSelectChoiceEvent(event, emit));
    on<Submit>((event, emit) => _onSubmitEvent(event, emit));
    on<ViewSolution>((event, emit) => _onViewSolutionEvent(event, emit));
    on<NextQuestion>((event, emit) => _onNextQuestionEvent(event, emit));
    on<Done>((event, emit) => _onDoneEvent(event, emit));
    on<ViewResults>((event, emit) => _onViewResultsEvent(event, emit));
    on<Quit>((event, emit) => _onQuitEvent(event, emit));
    on<PlayAgain>((event, emit) => _onPlayAgainEvent(event, emit));
    on<QuitConfirmed>((event, emit) => _onQuitConfirmedEvent(event, emit));
    add(const Initial());
  }

  Future<void> _onInitialEvent(Initial event, Emitter<PlayState> emit) async {
    emit(state.copyWith(isLoading: true));
    List<Question> questions = [
      Question(
        question: 'What is the capital of France?',
        language_id: 1,
        solution: 'Paris is the capital of France',
        answer: 1,
        choices: [
          Choice(choice_number: 0, choice_text: 'Paris'),
          Choice(choice_number: 1, choice_text: 'London'),
          Choice(choice_number: 2, choice_text: 'Berlin'),
          Choice(choice_number: 3, choice_text: 'Madrid'),
        ],
        standard_id: 0,
      ),
      Question(
        question: 'What is the capital of France?',
        language_id: 1,
        solution: 'Paris is the capital of France',
        answer: 1,
        choices: [
          Choice(choice_number: 0, choice_text: 'Paris'),
          Choice(choice_number: 1, choice_text: 'London'),
          Choice(choice_number: 2, choice_text: 'Berlin'),
          Choice(choice_number: 3, choice_text: 'Madrid'),
        ],
        standard_id: 0,
      ),
    ];
    List<int> selectedChoices = [];
    for (int i = 0; i < questions.length; i++) {
      selectedChoices.add(-1);
    }
    emit(
      state.copyWith(questions: questions, selectedChoices: selectedChoices),
    );
    emit(state.copyWith(isLoading: false));
  }

  Future<void> _onSelectChoiceEvent(
    SelectChoice event,
    Emitter<PlayState> emit,
  ) async {
    List<int> selectedChoices = List<int>.from(state.selectedChoices);
    selectedChoices[state.currentQuestionIndex] = event.index;
    emit(state.copyWith(selectedChoices: selectedChoices));
  }

  Future<void> _onSubmitEvent(Submit event, Emitter<PlayState> emit) async {
    emit(state.copyWith(isSubmit: true));
  }

  Future<void> _onViewSolutionEvent(
    ViewSolution event,
    Emitter<PlayState> emit,
  ) async {
    emit(state.copyWith(isViewingSolution: true));
    emit(state.copyWith(isViewingSolution: false));
  }

  Future<void> _onNextQuestionEvent(
    NextQuestion event,
    Emitter<PlayState> emit,
  ) async {
    emit(
      state.copyWith(
        isSubmit: false,
        currentQuestionIndex: state.currentQuestionIndex + 1,
      ),
    );
  }

  Future<void> _onViewResultsEvent(
    ViewResults event,
    Emitter<PlayState> emit,
  ) async {
    emit(
      state.copyWith(
        isViewingResults: true,
        isSubmit: false,
        isDone: false,
        isViewingSolution: false,
      ),
    );
  }

  Future<void> _onQuitEvent(Quit event, Emitter<PlayState> emit) async {
    if (!state.isDone) {
      emit(state.copyWith(isQuit: true));
      emit(state.copyWith(isQuit: false));
    } else {
      emit(state.copyWith(isQuitConfirmed: true));
    }
  }

  Future<void> _onQuitConfirmedEvent(
    QuitConfirmed event,
    Emitter<PlayState> emit,
  ) async {
    emit(state.copyWith(isQuitConfirmed: true));
  }

  Future<void> _onPlayAgainEvent(
    PlayAgain event,
    Emitter<PlayState> emit,
  ) async {
    emit(state.copyWith(isPlayAgain: true));
    emit(state.copyWith(isQuit: false));
  }

  Future<void> _onDoneEvent(Done event, Emitter<PlayState> emit) async {
    emit(state.copyWith(isSubmit: false, isDone: true));
  }
}
