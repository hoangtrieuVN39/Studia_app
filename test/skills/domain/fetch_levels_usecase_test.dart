import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:studia/features/skills/domain/usecases/fetch_levels_usecase.dart';
import 'package:studia/core/data/datasources/local/drift/database.dart';

@GenerateNiceMocks([MockSpec<AppDatabase>()])
import 'fetch_levels_usecase_test.mocks.dart';

void main() {
  late FetchLevelsUsecase usecase;
  late MockAppDatabase mockDatabase;

  setUp(() {
    mockDatabase = MockAppDatabase();
    usecase = FetchLevelsUsecase(mockDatabase);
  });

  test('should return list of levels', () async {
    final levels = <Levels>[];
    when(mockDatabase.selectLevels()).thenAnswer((_) async => levels);
    final result = await usecase.call();
    expect(result, levels);
  });
}
