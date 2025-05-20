import 'package:studia/core/data/datasources/local/drift/database.dart';

class FetchSkillsUsecase {
  final AppDatabase appDatabase;

  FetchSkillsUsecase(this.appDatabase);

  Future<Map<Skills, Domains>> call(Levels level) async {
    final skills_domains = Map<Skills, Domains>();
    final skills = await appDatabase.selectSkills(level: level.level_id);
    final domains = await appDatabase.selectDomains();
    for (var skill in skills) {
      skills_domains[skill] = domains.firstWhere(
        (domain) => domain.domain_id == skill.domain,
      );
    }
    return skills_domains;
  }
}
