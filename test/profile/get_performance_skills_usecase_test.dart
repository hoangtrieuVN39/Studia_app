import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:studia/core/data/datasources/local/drift/database.dart';
import 'package:studia/features/profile/domain/usecases/get_performance_skills_usecase.dart';

class MockAppDatabase extends Mock implements AppDatabase {}

void main() {
  late GetPerformanceSkillsUsecase usecase;
  late MockAppDatabase mockDatabase;

  setUp(() {
    mockDatabase = MockAppDatabase();
    usecase = GetPerformanceSkillsUsecase(mockDatabase);
  });

  final testSkill = Skills(
    skill_id: 1,
    skill_name: 'Test Skill',
    domain: 1,
    level: 1,
  );

  final testStandards = [
    Standards(
      standard_id: 1,
      standard: 'Standard 1',
      level: 1,
      domain: 1,
      skill: 1,
      description: 'Description 1',
    ),
    Standards(
      standard_id: 2,
      standard: 'Standard 2',
      level: 1,
      domain: 1,
      skill: 1,
      description: 'Description 2',
    ),
  ];

  final userPerformance = [0.9, 0.7];

  test('should return average performance for a skill', () async {
    // Arrange
    when(
      () => mockDatabase.selectStandards(skill: testSkill.skill_id),
    ).thenAnswer((_) async => testStandards);

    // Act
    final result = await usecase.call(userPerformance, testSkill);

    // Assert
    expect(result, equals(0.5)); // 1 standard above threshold, 1 below
    verify(
      () => mockDatabase.selectStandards(skill: testSkill.skill_id),
    ).called(1);
  });

  test('should return 0.0 when no standards found', () async {
    // Arrange
    when(
      () => mockDatabase.selectStandards(skill: testSkill.skill_id),
    ).thenAnswer((_) async => []);

    // Act
    final result = await usecase.call(userPerformance, testSkill);

    // Assert
    expect(result, equals(0.0));
    verify(
      () => mockDatabase.selectStandards(skill: testSkill.skill_id),
    ).called(1);
  });
}
