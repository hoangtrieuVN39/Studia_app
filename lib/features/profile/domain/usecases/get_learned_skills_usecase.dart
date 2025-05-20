import 'package:studia/core/data/datasources/local/drift/database.dart';

class GetLearnedSkillsUsecase {
  GetLearnedSkillsUsecase();

  Map<Skills, bool> call(Map<Skills, Map<String, dynamic>> skills) {
    final learnThreshold = 0.8;
    final Map<Skills, bool> learnedSkills = skills.map(
      (key, value) => MapEntry(key, value['performance'] >= learnThreshold),
    );
    return learnedSkills;
  }
}
