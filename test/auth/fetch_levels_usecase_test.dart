import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:studia/core/data/datasources/local/drift/database.dart';
import 'package:studia/features/auth/domain/usecases/fetch_levels_usecase.dart';

@GenerateNiceMocks([MockSpec<AppDatabase>()])
import 'fetch_levels_usecase_test.mocks.dart';

void main() {
  late FetchLevelsUsecase usecase;
  late MockAppDatabase mockAppDatabase;

  setUp(() {
    mockAppDatabase = MockAppDatabase();
    usecase = FetchLevelsUsecase(mockAppDatabase);
  });

  test('should fetch levels from database', () async {
    // arrange
    final levels = [
      Levels(level_id: 1, level_name: 'Level 1'),
      Levels(level_id: 2, level_name: 'Level 2'),
    ];
    when(mockAppDatabase.selectLevels()).thenAnswer((_) async => levels);

    // act
    final result = await usecase();

    // assert
    verify(mockAppDatabase.selectLevels());
    expect(result, levels);
  });
}
