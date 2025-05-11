import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:studia/core/data/datasources/local/drift/database.dart';
import 'package:studia/features/home/domain/usecases/fetch_performance_usecase.dart';
import 'package:studia/features/home/domain/usecases/fetch_questions_usecase.dart';
import 'package:studia/features/home/domain/usecases/fetch_standards_usecase.dart';
import 'package:studia/features/playground/domain/entities/questions.dart';

part 'home_event.dart';
part 'home_state.dart';
part 'home_bloc.freezed.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final FetchStandardsUsecase fetchStandardsUsecase;
  final FetchPerformanceUsecase fetchPerformanceUsecase;
  final FetchQuestionsUsecase fetchQuestionsUsecase;

  HomeBloc({
    required this.fetchStandardsUsecase,
    required this.fetchPerformanceUsecase,
    required this.fetchQuestionsUsecase,
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
    final standards = await fetchStandardsUsecase.call(level: 10);
    final performance = await fetchPerformanceUsecase.call(userId: '1');
    final Map<Standards, double> standards_performance = {};
    for (var standard in standards) {
      standards_performance[standard] =
          performance[standard.standard_id.toString()]['performance'];
    }
    emit(
      state.copyWith(
        isLoading: false,
        standards_performance: standards_performance,
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
    final questions = await fetchQuestionsUsecase.call(
      standard: state.selectedStandard!.standard_id,
    );
    emit(state.copyWith(questions: questions, isPlayTapped: true));
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
