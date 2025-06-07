import 'package:studia/core/data/datasources/local/drift/database.dart';

class FetchLevelDetails {
  final AppDatabase database;

  FetchLevelDetails({required this.database});

  Future<LevelFullDetails> call(
    Levels selectedLevel,
    List<double> userPerformance,
  ) async {
    List<Standards> standards = await database.selectStandards();
    List<DomainLevelDetails> domainsLevels = [];

    List<Domains> domains = await database.selectDomains();
    List<Skills> skills = await database.selectSkills();

    List<Standards> filteredStandards = [];

    filteredStandards =
        standards
            .where((standard) => standard.level == selectedLevel.level_id)
            .toList();

    final uniqueDomains =
        domains
            .where(
              (domain) => filteredStandards.any(
                (standard) => standard.domain == domain.domain_id,
              ),
            )
            .toList();

    for (final domain in uniqueDomains) {
      final domainSkills =
          skills
              .where(
                (skill) =>
                    skill.domain == domain.domain_id &&
                    skill.level == selectedLevel.level_id,
              )
              .toList();
      if (domainSkills.isNotEmpty) {
        domainsLevels.add(
          DomainLevelDetails(domain: domain, skills: domainSkills),
        );
      }
    }

    return LevelFullDetails(
      domainsLevels: domainsLevels,
      progress: getProgress(userPerformance, filteredStandards),
      level: selectedLevel,
    );
  }

  double getProgress(List<double> userPerformance, List<Standards> standards) {
    if (standards.isEmpty) {
      return 0.0;
    }
    double progress = 0;
    for (Standards standard in standards) {
      if (standard.standard_id > 0 &&
          standard.standard_id <= userPerformance.length) {
        progress += userPerformance[standard.standard_id - 1];
      }
    }
    return progress / standards.length;
  }
}

class LevelDetails {
  Levels level;
  double progress;

  LevelDetails({required this.level, required this.progress});
}

class LevelFullDetails extends LevelDetails {
  List<DomainLevelDetails> domainsLevels;

  LevelFullDetails({
    required this.domainsLevels,
    required super.progress,
    required super.level,
  });
}

class DomainLevelDetails {
  Domains domain;
  List<Skills> skills;

  DomainLevelDetails({required this.domain, required this.skills});
}
