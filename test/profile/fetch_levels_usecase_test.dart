import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:studia/core/data/datasources/local/drift/database.dart';
import 'package:studia/features/profile/domain/usecases/fetch_levels_usecase.dart';

class MockAppDatabase extends Mock implements AppDatabase {}

void main() {
  late FetchLevelsUsecase usecase;
  late MockAppDatabase mockDatabase;

  setUp(() {
    mockDatabase = MockAppDatabase();
    usecase = FetchLevelsUsecase(mockDatabase);
  });

  final testLevels = [
    Levels(level_id: 1, level_name: 'Level 1'),
    Levels(level_id: 2, level_name: 'Level 2'),
  ];

  test('should return list of levels', () async {
    // Arrange
    when(() => mockDatabase.selectLevels()).thenAnswer((_) async => testLevels);

    // Act
    final result = await usecase.call();

    // Assert
    expect(result, equals(testLevels));
    verify(() => mockDatabase.selectLevels()).called(1);
  });

  test('should return empty list when no levels found', () async {
    // Arrange
    when(() => mockDatabase.selectLevels()).thenAnswer((_) async => []);

    // Act
    final result = await usecase.call();

    // Assert
    expect(result, isEmpty);
    verify(() => mockDatabase.selectLevels()).called(1);
  });
}
