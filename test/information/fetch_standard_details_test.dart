import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:studia/core/data/datasources/local/drift/database.dart';
import 'package:studia/features/information/domain/usecases/fetch_standard_details.dart';

class MockAppDatabase extends Mock implements AppDatabase {}

void main() {
  late FetchStandardDetails usecase;
  late MockAppDatabase mockDatabase;

  setUp(() {
    mockDatabase = MockAppDatabase();
    usecase = FetchStandardDetails(database: mockDatabase);
  });

  final testStandard = Standards(
    standard_id: 1,
    standard: 'Test Standard',
    level: 1,
    domain: 1,
    skill: 1,
    description: 'Test Description',
  );

  final testSubstandard = Standards(
    standard_id: 2,
    standard: 'Test Substandard',
    parent_id: 1,
    level: 1,
    domain: 1,
    skill: 1,
    description: 'Test Description',
  );

  final testSkill = Skills(
    skill_id: 1,
    skill_name: 'Test Skill',
    domain: 1,
    level: 1,
  );

  final testLevel = Levels(level_id: 1, level_name: 'Test Level');

  final testDomain = Domains(domain_id: 1, domain_name: 'Test Domain');

  final userPerformance = [0.8, 0.6];

  test('should return standard details with substandards', () async {
    // Arrange
    when(
      () => mockDatabase.selectStandards(),
    ).thenAnswer((_) async => [testStandard, testSubstandard]);
    when(
      () => mockDatabase.selectSkills(),
    ).thenAnswer((_) async => [testSkill]);
    when(
      () => mockDatabase.selectLevels(),
    ).thenAnswer((_) async => [testLevel]);
    when(
      () => mockDatabase.selectDomains(),
    ).thenAnswer((_) async => [testDomain]);

    // Act
    final result = await usecase.call(testStandard, userPerformance);

    // Assert
    expect(result, isA<StandardFullDetails>());
    expect(result.standard, equals(testStandard));
    expect(result.progress, equals(0.8));
    expect(result.skill, equals(testSkill));
    expect(result.level, equals(testLevel));
    expect(result.domain, equals(testDomain));
    expect(result.substandards, isNotEmpty);
    expect(result.substandards.first.standard, equals(testSubstandard));
    expect(result.substandards.first.progress, equals(0.6));

    verify(() => mockDatabase.selectStandards()).called(1);
    verify(() => mockDatabase.selectSkills()).called(1);
    verify(() => mockDatabase.selectLevels()).called(1);
    verify(() => mockDatabase.selectDomains()).called(1);
  });

  test('should return empty substandards when no substandards found', () async {
    // Arrange
    when(
      () => mockDatabase.selectStandards(),
    ).thenAnswer((_) async => [testStandard]);
    when(
      () => mockDatabase.selectSkills(),
    ).thenAnswer((_) async => [testSkill]);
    when(
      () => mockDatabase.selectLevels(),
    ).thenAnswer((_) async => [testLevel]);
    when(
      () => mockDatabase.selectDomains(),
    ).thenAnswer((_) async => [testDomain]);

    // Act
    final result = await usecase.call(testStandard, userPerformance);

    // Assert
    expect(result, isA<StandardFullDetails>());
    expect(result.standard, equals(testStandard));
    expect(result.progress, equals(0.8));
    expect(result.skill, equals(testSkill));
    expect(result.level, equals(testLevel));
    expect(result.domain, equals(testDomain));
    expect(result.substandards, isEmpty);

    verify(() => mockDatabase.selectStandards()).called(1);
    verify(() => mockDatabase.selectSkills()).called(1);
    verify(() => mockDatabase.selectLevels()).called(1);
    verify(() => mockDatabase.selectDomains()).called(1);
  });
}
