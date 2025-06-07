import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:studia/features/home/domain/usecases/fetch_standards_usecase.dart';
import 'package:studia/features/home/domain/repositories/home_repository.dart';
import 'package:studia/core/data/datasources/local/drift/database.dart';

@GenerateNiceMocks([MockSpec<HomeRepository>()])
import 'fetch_standards_usecase_test.mocks.dart';

void main() {
  late FetchStandardsUsecase usecase;
  late MockHomeRepository mockRepository;

  setUp(() {
    mockRepository = MockHomeRepository();
    usecase = FetchStandardsUsecase(homeRepository: mockRepository);
  });

  test('should return list of standards for a level', () async {
    final standards = <Standards>[];
    when(
      mockRepository.selectStandards(level: 1),
    ).thenAnswer((_) async => standards);
    final result = await usecase.call(level: 1);
    expect(result, standards);
  });
}
