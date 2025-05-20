import 'package:studia/core/data/datasources/local/drift/database.dart';

class GetPerformanceSkillsUsecase {
  final AppDatabase appDatabase;

  GetPerformanceSkillsUsecase(this.appDatabase);

  Future<double> call(List<double> standardsPerformance, Skills skill) async {
    final standardsThreshold = 0.8;
    final standards = await appDatabase.selectStandards(skill: skill.skill_id);
    final standardsId = standards.map((standard) => standard.standard_id);
    final standardsPerformances = standardsId.map(
      (standard_id) => standardsPerformance[standard_id],
    );
    int count = 0;
    for (var performance in standardsPerformances) {
      if (performance >= standardsThreshold) {
        count++;
      }
    }
    return count / standardsPerformances.length;
  }
}
