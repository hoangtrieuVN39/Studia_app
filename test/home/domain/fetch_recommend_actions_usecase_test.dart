import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:dartz/dartz.dart';
import 'package:studia/features/home/domain/usecases/fetch_recommend_actions_usecase.dart';
import 'package:studia/features/home/domain/repositories/home_repository.dart';
import 'package:studia/core/error/failures.dart';

@GenerateNiceMocks([MockSpec<HomeRepository>()])
import 'fetch_recommend_actions_usecase_test.mocks.dart';

void main() {
  late FetchRecommendActionsUsecase usecase;
  late MockHomeRepository mockRepository;

  setUp(() {
    mockRepository = MockHomeRepository();
    usecase = FetchRecommendActionsUsecase(repository: mockRepository);
  });

  test('should return int on success', () async {
    when(mockRepository.fetchRecommendActions()).thenAnswer((_) async => 42);
    final result = await usecase.call(null);
    expect(result, Right(42));
  });

  test('should return failure on exception', () async {
    when(mockRepository.fetchRecommendActions()).thenThrow(Exception('error'));
    final result = await usecase.call(null);
    expect(result.isLeft(), true);
    result.fold(
      (failure) => expect(failure, isA<FetchRecommendActionsFailure>()),
      (_) => fail('Should not succeed'),
    );
  });
}
