import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:studia/core/data/datasources/local/drift/database.dart';
import 'package:studia/features/profile/domain/usecases/fetch_skills_usecase.dart';

class MockAppDatabase extends Mock implements AppDatabase {}

void main() {
  late FetchSkillsUsecase usecase;
  late MockAppDatabase mockDatabase;

  setUp(() {
    mockDatabase = MockAppDatabase();
    usecase = FetchSkillsUsecase(mockDatabase);
  });

  final testLevel = Levels(level_id: 1, level_name: 'Test Level');

  final testSkills = [
    Skills(skill_id: 1, skill_name: 'Skill 1', domain: 1, level: 1),
    Skills(skill_id: 2, skill_name: 'Skill 2', domain: 2, level: 1),
  ];

  final testDomains = [
    Domains(domain_id: 1, domain_name: 'Domain 1'),
    Domains(domain_id: 2, domain_name: 'Domain 2'),
  ];

  test('should return map of skills and their domains', () async {
    // Arrange
    when(
      () => mockDatabase.selectSkills(level: testLevel.level_id),
    ).thenAnswer((_) async => testSkills);
    when(
      () => mockDatabase.selectDomains(),
    ).thenAnswer((_) async => testDomains);

    // Act
    final result = await usecase.call(testLevel);

    // Assert
    expect(result, isA<Map<Skills, Domains>>());
    expect(result.length, equals(2));
    expect(result[testSkills[0]], equals(testDomains[0]));
    expect(result[testSkills[1]], equals(testDomains[1]));
    verify(
      () => mockDatabase.selectSkills(level: testLevel.level_id),
    ).called(1);
    verify(() => mockDatabase.selectDomains()).called(1);
  });

  test('should return empty map when no skills found', () async {
    // Arrange
    when(
      () => mockDatabase.selectSkills(level: testLevel.level_id),
    ).thenAnswer((_) async => []);
    when(
      () => mockDatabase.selectDomains(),
    ).thenAnswer((_) async => testDomains);

    // Act
    final result = await usecase.call(testLevel);

    // Assert
    expect(result, isEmpty);
    verify(
      () => mockDatabase.selectSkills(level: testLevel.level_id),
    ).called(1);
    verify(() => mockDatabase.selectDomains()).called(1);
  });
}
