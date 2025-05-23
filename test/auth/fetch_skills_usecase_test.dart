import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:studia/core/data/datasources/local/drift/database.dart';
import 'package:studia/features/auth/domain/usecases/fetch_skills_usecase.dart';

@GenerateNiceMocks([MockSpec<AppDatabase>()])
import 'fetch_skills_usecase_test.mocks.dart';

void main() {
  late FetchSkillsUsecase usecase;
  late MockAppDatabase mockAppDatabase;

  setUp(() {
    mockAppDatabase = MockAppDatabase();
    usecase = FetchSkillsUsecase(mockAppDatabase);
  });

  test('should fetch skills from database', () async {
    // arrange
    final skills = [
      Skills(skill_id: 1, skill_name: 'Skill 1', domain: 1, level: 1),
      Skills(skill_id: 2, skill_name: 'Skill 2', domain: 2, level: 2),
    ];
    when(mockAppDatabase.selectSkills()).thenAnswer((_) async => skills);

    // act
    final result = await usecase();

    // assert
    verify(mockAppDatabase.selectSkills());
    expect(result, skills);
  });
}
