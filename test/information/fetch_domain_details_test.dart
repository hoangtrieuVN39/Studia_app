import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:studia/core/data/datasources/local/drift/database.dart';
import 'package:studia/features/information/domain/usecases/fetch_domain_details.dart';

class MockAppDatabase extends Mock implements AppDatabase {}

void main() {
  late FetchDomainDetails usecase;
  late MockAppDatabase mockDatabase;

  setUp(() {
    mockDatabase = MockAppDatabase();
    usecase = FetchDomainDetails(database: mockDatabase);
  });

  final testDomain = Domains(domain_id: 1, domain_name: 'Test Domain');

  final testLevel = Levels(level_id: 1, level_name: 'Test Level');

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

  test('should return domain details with levels and skills', () async {
    // Arrange
    when(
      () => mockDatabase.selectStandards(),
    ).thenAnswer((_) async => [testStandard]);
    when(
      () => mockDatabase.selectLevels(),
    ).thenAnswer((_) async => [testLevel]);
    when(
      () => mockDatabase.selectSkills(),
    ).thenAnswer((_) async => [testSkill]);

    // Act
    final result = await usecase.call(testDomain, userPerformance);

    // Assert
    expect(result, isA<DomainFullDetails>());
    expect(result.domain, equals(testDomain));
    expect(result.levelsDomains, isNotEmpty);
    expect(result.levelsDomains.first.level, equals(testLevel));
    expect(result.levelsDomains.first.skills, contains(testSkill));
    expect(result.progress, equals(0.8));

    verify(() => mockDatabase.selectStandards()).called(1);
    verify(() => mockDatabase.selectLevels()).called(1);
    verify(() => mockDatabase.selectSkills()).called(1);
  });

  test('should return empty levels when no standards found', () async {
    // Arrange
    when(() => mockDatabase.selectStandards()).thenAnswer((_) async => []);
    when(
      () => mockDatabase.selectLevels(),
    ).thenAnswer((_) async => [testLevel]);
    when(
      () => mockDatabase.selectSkills(),
    ).thenAnswer((_) async => [testSkill]);

    // Act
    final result = await usecase.call(testDomain, userPerformance);

    // Assert
    expect(result, isA<DomainFullDetails>());
    expect(result.domain, equals(testDomain));
    expect(result.levelsDomains, isEmpty);
    expect(result.progress, equals(0.0));

    verify(() => mockDatabase.selectStandards()).called(1);
    verify(() => mockDatabase.selectLevels()).called(1);
    verify(() => mockDatabase.selectSkills()).called(1);
  });
}
