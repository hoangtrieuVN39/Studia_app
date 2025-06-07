import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:dartz/dartz.dart';
import 'package:studia/features/home/domain/usecases/fetch_valid_actions_usecase.dart';
import 'package:studia/features/home/domain/repositories/home_repository.dart';
import 'package:studia/core/error/failures.dart';

@GenerateNiceMocks([MockSpec<HomeRepository>()])
import 'fetch_valid_actions_usecase_test.mocks.dart';

void main() {
  late FetchValidActionsUsecase usecase;
  late MockHomeRepository mockRepository;

  setUp(() {
    mockRepository = MockHomeRepository();
    usecase = FetchValidActionsUsecase(repository: mockRepository);
  });

  test('should return list of actions on success', () async {
    when(mockRepository.fetchValidActions()).thenAnswer((_) async => [1, 2, 3]);
    final result = await usecase.call(null);
    expect(result, isA<Right<Failure, List<int>>>());
    expect(result.getOrElse(() => []), [1, 2, 3]);
  });

  test('should return failure on exception', () async {
    when(mockRepository.fetchValidActions()).thenThrow(Exception('error'));
    final result = await usecase.call(null);
    expect(result.isLeft(), true);
    result.fold(
      (failure) => expect(failure, isA<FetchValidActionsFailure>()),
      (_) => fail('Should not succeed'),
    );
  });
}
