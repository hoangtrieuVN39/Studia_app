import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:studia/core/data/datasources/local/drift/database.dart';
import 'package:studia/features/profile/domain/usecases/get_learned_skills_usecase.dart';

void main() {
  late GetLearnedSkillsUsecase usecase;

  setUp(() {
    usecase = GetLearnedSkillsUsecase();
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

  test('should return map of learned skills', () {
    // Act
    final result = usecase.call(testSkills);

    // Assert
    expect(result, isA<Map<Skills, bool>>());
    expect(result.length, equals(2));
    expect(result[testSkills.keys.first], isTrue);
    expect(result[testSkills.keys.last], isFalse);
  });

  test('should return empty map when no skills provided', () {
    // Act
    final result = usecase.call({});

    // Assert
    expect(result, isEmpty);
  });
}
