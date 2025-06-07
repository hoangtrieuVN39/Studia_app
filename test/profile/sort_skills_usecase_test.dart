import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:studia/core/data/datasources/local/drift/database.dart';
import 'package:studia/features/profile/domain/repositories/profile_repository.dart';
import 'package:studia/features/profile/domain/usecases/sort_skills_usecase.dart';
import 'package:studia/features/profile/presentation/bloc/profile_bloc.dart';

class MockProfileRepository extends Mock implements ProfileRepository {}

void main() {
  late SortSkillsUsecase usecase;
  late MockProfileRepository mockProfileRepository;

  setUp(() {
    mockProfileRepository = MockProfileRepository();
    usecase = SortSkillsUsecase(mockProfileRepository);
  });

  final testSkills = {
    Skills(skill_id: 1, skill_name: 'Skill 1', domain: 1, level: 1): {
      'domain': Domains(domain_id: 1, domain_name: 'Domain 1'),
      'performance': 0.9,
    },
    Skills(skill_id: 2, skill_name: 'Skill 2', domain: 2, level: 1): {
      'domain': Domains(domain_id: 2, domain_name: 'Domain 2'),
      'performance': 0.7,
    },
  };

  final testSkillsTime = {
    testSkills.keys.first: DateTime(2024, 3, 1),
    testSkills.keys.last: DateTime(2024, 3, 2),
  };

  test('should sort skills by latest', () async {
    // Arrange
    when(
      () => mockProfileRepository.getSkillsTime(any()),
    ).thenAnswer((_) async => testSkillsTime);

    // Act
    final result = await usecase.call(testSkills, SkillsSort.latest);

    // Assert
    expect(result.keys.first, equals(testSkills.keys.first)); // skill_id: 1
    expect(result.keys.last, equals(testSkills.keys.last)); // skill_id: 2
    verify(() => mockProfileRepository.getSkillsTime(any())).called(1);
  });

  test('should sort skills by oldest', () async {
    // Arrange
    when(
      () => mockProfileRepository.getSkillsTime(any()),
    ).thenAnswer((_) async => testSkillsTime);

    // Act
    final result = await usecase.call(testSkills, SkillsSort.oldest);

    // Assert
    expect(result.keys.first, equals(testSkills.keys.last)); // skill_id: 2
    expect(result.keys.last, equals(testSkills.keys.first)); // skill_id: 1
    verify(() => mockProfileRepository.getSkillsTime(any())).called(1);
  });

  test('should sort skills by most performance', () async {
    // Act
    final result = await usecase.call(testSkills, SkillsSort.mostPerformance);

    // Assert
    expect(result.keys.first, equals(testSkills.keys.first));
    expect(result.keys.last, equals(testSkills.keys.last));
  });

  test('should sort skills by least performance', () async {
    // Act
    final result = await usecase.call(testSkills, SkillsSort.leastPerformance);

    // Assert
    expect(result.keys.first, equals(testSkills.keys.last));
    expect(result.keys.last, equals(testSkills.keys.first));
  });
}
