import 'package:studia/core/data/datasources/local/drift/database.dart';

class FetchSkillsUsecase {
  final AppDatabase appDatabase;

  FetchSkillsUsecase(this.appDatabase);

  Future<List<SkillDetails>> call(
    List<double> standardsPerformance,
    Levels level,
  ) async {
    List<Standards> standards = await appDatabase.selectStandards(
      level: level.level_id,
    );
    List<Skills> skills = await appDatabase.selectSkills(level: level.level_id);
    List<SkillDetails> skillsDetails = [];
    for (Skills skill in skills) {
      List<Standards> filteredStandards =
          standards
              .where((standard) => standard.skill == skill.skill_id)
              .toList();
      skillsDetails.add(
        SkillDetails(
          skill: skill,
          progress: getProgress(standardsPerformance, filteredStandards),
        ),
      );
    }
    return skillsDetails;
  }

  double getProgress(List<double> userPerformance, List<Standards> standards) {
    double progress = 0;
    for (Standards standard in standards) {
      progress += userPerformance[standard.standard_id];
    }
    return progress / standards.length;
  }
}

class SkillDetails {
  Skills? skill;
  Domains? domain;
  double? progress;

  SkillDetails({this.skill, this.progress});
}
