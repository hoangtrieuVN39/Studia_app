import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:studia/core/data/datasources/local/drift/database.dart';
import 'package:studia/features/information/domain/usecases/fetch_level_details.dart';

class MockAppDatabase extends Mock implements AppDatabase {}

void main() {
  late FetchLevelDetails usecase;
  late MockAppDatabase mockDatabase;

  setUp(() {
    mockDatabase = MockAppDatabase();
    usecase = FetchLevelDetails(database: mockDatabase);
  });

  final testLevel = Levels(level_id: 1, level_name: 'Test Level');

  final testDomain = Domains(domain_id: 1, domain_name: 'Test Domain');

  final testSkill = Skills(
    skill_id: 1,
    skill_name: 'Test Skill',
    domain: 1,
    level: 1,
  );

  final testStandard = Standards(
    standard_id: 1,
    standard: 'Test Standard',
    level: 1,
    domain: 1,
    skill: 1,
    description: 'Test Description',
  );

  final userPerformance = [0.8];

  test('should return level details with domains and skills', () async {
    // Arrange
    when(
      () => mockDatabase.selectStandards(),
    ).thenAnswer((_) async => [testStandard]);
    when(
      () => mockDatabase.selectDomains(),
    ).thenAnswer((_) async => [testDomain]);
    when(
      () => mockDatabase.selectSkills(),
    ).thenAnswer((_) async => [testSkill]);

    // Act
    final result = await usecase.call(testLevel, userPerformance);

    // Assert
    expect(result, isA<LevelFullDetails>());
    expect(result.level, equals(testLevel));
    expect(result.domainsLevels, isNotEmpty);
    expect(result.domainsLevels.first.domain, equals(testDomain));
    expect(result.domainsLevels.first.skills, contains(testSkill));
    expect(result.progress, equals(0.8));

    verify(() => mockDatabase.selectStandards()).called(1);
    verify(() => mockDatabase.selectDomains()).called(1);
    verify(() => mockDatabase.selectSkills()).called(1);
  });

  test('should return empty domains when no standards found', () async {
    // Arrange
    when(() => mockDatabase.selectStandards()).thenAnswer((_) async => []);
    when(
      () => mockDatabase.selectDomains(),
    ).thenAnswer((_) async => [testDomain]);
    when(
      () => mockDatabase.selectSkills(),
    ).thenAnswer((_) async => [testSkill]);

    // Act
    final result = await usecase.call(testLevel, userPerformance);

    // Assert
    expect(result, isA<LevelFullDetails>());
    expect(result.level, equals(testLevel));
    expect(result.domainsLevels, isEmpty);
    expect(result.progress, equals(0.0));

    verify(() => mockDatabase.selectStandards()).called(1);
    verify(() => mockDatabase.selectDomains()).called(1);
    verify(() => mockDatabase.selectSkills()).called(1);
  });
}
