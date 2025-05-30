import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:studia/features/playground/domain/entities/answer.dart';
import 'package:studia/features/playground/domain/entities/questions.dart';
import 'package:studia/features/playground/domain/usecases/send_answer_usecase.dart';
import 'package:studia/features/playground/domain/usecases/update_user_performance_usecase.dart';

part 'play_event.dart';
part 'play_state.dart';
part 'play_bloc.freezed.dart';

class PlayBloc extends Bloc<PlayEvent, PlayState> {
  final SendAnswersUsecase sendAnswersUsecase;
  final UpdateUserPerformanceUseCase updateUserPerformanceUseCase;

  List<Question>? questions;
  bool isFirstPlay = false;
  late int timeStamp;

  PlayBloc(
    this.questions,
    this.isFirstPlay,
    this.sendAnswersUsecase,
    this.updateUserPerformanceUseCase,
  ) : super(PlayState()) {
    on<Initial>((event, emit) => _onInitialEvent(event, emit));
    on<SelectChoice>((event, emit) => _onSelectChoiceEvent(event, emit));
    on<Submit>((event, emit) => _onSubmitEvent(event, emit));
    on<ViewSolution>((event, emit) => _onViewSolutionEvent(event, emit));
    on<NextQuestion>((event, emit) => _onNextQuestionEvent(event, emit));
    on<Done>((event, emit) => _onDoneEvent(event, emit));
    on<ViewResults>((event, emit) => _onViewResultsEvent(event, emit));
    on<Quit>((event, emit) => _onQuitEvent(event, emit));
    on<QuitConfirmed>((event, emit) => _onQuitConfirmedEvent(event, emit));
    add(const Initial());
  }

  Future<void> _onInitialEvent(Initial event, Emitter<PlayState> emit) async {
    emit(state.copyWith(isLoading: true));
    List<int> selectedChoices = [];
    for (int i = 0; i < questions!.length; i++) {
      selectedChoices.add(-1);
    }
    emit(
      state.copyWith(
        questions: questions!,
        selectedChoices: selectedChoices,
        isFirstPlay: isFirstPlay,
      ),
    );
    emit(state.copyWith(isLoading: false));
    timeStamp = DateTime.now().millisecondsSinceEpoch;
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
    bool isCorrect = false;
    int correctAnswers = state.correctAnswers;
    int timeTaken = DateTime.now().millisecondsSinceEpoch - timeStamp;
    timeStamp = DateTime.now().millisecondsSinceEpoch;
    List<Answer> answers = List<Answer>.from(state.answers);
    if (state.selectedChoices[state.currentQuestionIndex] ==
        state.questions[state.currentQuestionIndex].answer) {
      correctAnswers++;
      isCorrect = true;
    }
    answers.add(
      Answer(
        questionId: state.questions[state.currentQuestionIndex].id,
        choiceNumber: state.selectedChoices[state.currentQuestionIndex],
        timeTaken: timeTaken,
        isCorrect: isCorrect,
        timeCreated: DateTime.now(),
      ),
    );
    emit(
      state.copyWith(
        isSubmit: true,
        correctAnswers: correctAnswers,
        answers: answers,
      ),
    );
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

  Future<void> _onDoneEvent(Done event, Emitter<PlayState> emit) async {
    emit(state.copyWith(isLoading: true, isSubmit: false));
    final result = await sendAnswersUsecase(state.answers);
    updateUserPerformanceUseCase(result);
    emit(state.copyWith(isDone: true, isLoading: false));
  }
}
