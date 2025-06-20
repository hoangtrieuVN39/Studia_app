import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:studia/core/data/datasources/local/drift/database.dart';
import 'package:studia/core/domain/entities/user.dart';
import 'package:studia/features/home/domain/usecases/fetch_questions_usecase.dart';
import 'package:studia/features/home/domain/usecases/fetch_recommend_actions_usecase.dart';
import 'package:studia/features/home/domain/usecases/fetch_standards_usecase.dart';
import 'package:studia/features/home/domain/usecases/fetch_valid_actions_usecase.dart';
import 'package:studia/features/playground/domain/entities/questions.dart';

part 'home_event.dart';
part 'home_state.dart';
part 'home_bloc.freezed.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final FetchStandardsUsecase fetchStandardsUsecase;
  final FetchQuestionsUsecase fetchQuestionsUsecase;
  final FetchValidActionsUsecase fetchValidActionsUsecase;
  final FetchRecommendActionsUsecase fetchRecommendActionsUsecase;
  final int languageId;
  final User user;

  HomeBloc({
    required this.languageId,
    required this.fetchStandardsUsecase,
    required this.fetchQuestionsUsecase,
    required this.fetchValidActionsUsecase,
    required this.fetchRecommendActionsUsecase,
    required this.user,
  }) : super(const HomeState()) {
    on<Initial>((event, emit) => _onInitialEvent(event, emit));
    on<StandardNodeTapped>(
      (event, emit) => _onStandardNodeTappedEvent(event, emit),
    );
    on<OnPlayButtonTapped>(
      (event, emit) => _onPlayButtonTappedEvent(event, emit),
    );
    on<OnViewInfoButtonTapped>(
      (event, emit) => _onViewInfoButtonTappedEvent(event, emit),
    );
    add(const Initial());
  }

  Future<void> _onInitialEvent(Initial event, Emitter<HomeState> emit) async {
    emit(state.copyWith(isLoading: true));
    final questions = await fetchQuestionsUsecase(
      standardId: null,
      languageId: languageId,
    );
    if (!questions.isEmpty) {
      emit(state.copyWith(isFirstPlay: true, questions: questions));
      return;
    }

    final standards = await fetchStandardsUsecase.call(
      level: user.level!.level_id,
    );

    final validActions = await fetchValidActionsUsecase.call(null);
    final recommendActions = await fetchRecommendActionsUsecase.call(null);

    final performance = user.performance;
    final Map<Standards, double> standards_performance = {};

    for (var standard in standards) {
      standards_performance[standard] = performance[standard.standard_id];
    }

    emit(
      state.copyWith(
        isLoading: false,
        standards_performance: standards_performance,
        validActions: validActions.fold(
          (failure) => [],
          (validActions) => validActions,
        ),
        recommendActions: recommendActions.fold(
          (failure) => 0,
          (recommendActions) => recommendActions,
        ),
      ),
    );
  }

  Future<void> _onStandardNodeTappedEvent(
    StandardNodeTapped event,
    Emitter<HomeState> emit,
  ) async {
    emit(state.copyWith(selectedStandard: event.selectedStandard));
  }

  Future<void> _onPlayButtonTappedEvent(
    OnPlayButtonTapped event,
    Emitter<HomeState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    if (state.selectedStandard == null) {
      return;
    }
    final questions = await fetchQuestionsUsecase(
      standardId: state.selectedStandard?.standard_id,
      languageId: languageId,
    );
    if (!questions.isEmpty) {
      emit(state.copyWith(questions: questions, isPlayTapped: true));
    }
    emit(state.copyWith(isLoading: false));
  }

  Future<void> _onViewInfoButtonTappedEvent(
    OnViewInfoButtonTapped event,
    Emitter<HomeState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));

    emit(state.copyWith(isLoading: false));
  }
}
