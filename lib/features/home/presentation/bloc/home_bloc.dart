import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:studia/core/data/datasources/local/drift/database.dart';
import 'package:studia/features/home/domain/usecases/fetch_performance_usecase.dart';
import 'package:studia/features/home/domain/usecases/fetch_standards_usecase.dart';

part 'home_event.dart';
part 'home_state.dart';
part 'home_bloc.freezed.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final FetchStandardsUsecase fetchStandardsUsecase;
  final FetchPerformanceUsecase fetchPerformanceUsecase;

  HomeBloc({
    required this.fetchStandardsUsecase,
    required this.fetchPerformanceUsecase,
  }) : super(const HomeState()) {
    on<Initial>((event, emit) => _onInitialEvent(event, emit));
    on<StandardNodeTapped>(
      (event, emit) => _onStandardNodeTappedEvent(event, emit),
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
}
