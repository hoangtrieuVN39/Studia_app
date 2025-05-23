import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:studia/core/data/datasources/local/drift/database.dart';
import 'package:studia/features/information/domain/usecases/fetch_skill_details.dart';

class MockAppDatabase extends Mock implements AppDatabase {}

void main() {
  late FetchSkillDetails usecase;
  late MockAppDatabase mockDatabase;

  setUp(() {
    mockDatabase = MockAppDatabase();
    usecase = FetchSkillDetails(database: mockDatabase);
  });

  final testSkill = Skills(
    skill_id: 1,
    skill_name: 'Test Skill',
    domain: 1,
    level: 1,
  );

  final testLevel = Levels(level_id: 1, level_name: 'Test Level');

  final testDomain = Domains(domain_id: 1, domain_name: 'Test Domain');

  final testStandard = Standards(
    standard_id: 1,
    standard: 'Test Standard',
    level: 1,
    domain: 1,
    skill: 1,
    description: 'Test Description',
  );

  final userPerformance = [0.8];

  test('should return skill details with level and domain', () async {
    // Arrange
    when(
      () => mockDatabase.selectStandards(),
    ).thenAnswer((_) async => [testStandard]);
    when(
      () => mockDatabase.selectLevels(),
    ).thenAnswer((_) async => [testLevel]);
    when(
      () => mockDatabase.selectDomains(),
    ).thenAnswer((_) async => [testDomain]);

    // Act
    final result = await usecase.call(testSkill, userPerformance);

    // Assert
    expect(result, isA<SkillFullDetails>());
    expect(result.skill, equals(testSkill));
    expect(result.level, equals(testLevel));
    expect(result.domain, equals(testDomain));
    expect(result.standardsInfo, isNotEmpty);
    expect(result.standardsInfo.first.standard, equals(testStandard));
    expect(result.standardsInfo.first.progress, equals(0.8));

    verify(() => mockDatabase.selectStandards()).called(1);
    verify(() => mockDatabase.selectLevels()).called(1);
    verify(() => mockDatabase.selectDomains()).called(1);
  });

  test('should return empty standards when no standards found', () async {
    // Arrange
    when(() => mockDatabase.selectStandards()).thenAnswer((_) async => []);
    when(
      () => mockDatabase.selectLevels(),
    ).thenAnswer((_) async => [testLevel]);
    when(
      () => mockDatabase.selectDomains(),
    ).thenAnswer((_) async => [testDomain]);

    // Act
    final result = await usecase.call(testSkill, userPerformance);

    // Assert
    expect(result, isA<SkillFullDetails>());
    expect(result.skill, equals(testSkill));
    expect(result.level, equals(testLevel));
    expect(result.domain, equals(testDomain));
    expect(result.standardsInfo, isEmpty);

    verify(() => mockDatabase.selectStandards()).called(1);
    verify(() => mockDatabase.selectLevels()).called(1);
    verify(() => mockDatabase.selectDomains()).called(1);
  });
}
