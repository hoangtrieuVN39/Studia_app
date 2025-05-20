import 'package:studia/core/data/datasources/local/drift/database.dart';

class FetchDomainDetails {
  final AppDatabase database;

  FetchDomainDetails({required this.database});

  Future<DomainFullDetails> call(
    Domains selectedDomain,
    List<double> userPerformance,
  ) async {
    List<Standards> standards = await database.selectStandards();
    List<LevelDomainDetails> levelsDomains = [];

    List<Levels> levels = await database.selectLevels();
    List<Skills> skills = await database.selectSkills();

    List<Standards> filteredStandards = [];

    filteredStandards =
        standards
            .where((standard) => standard.domain == selectedDomain.domain_id)
            .toList();

    final uniqueLevels =
        levels
            .where(
              (level) => filteredStandards.any(
                (standard) => standard.level == level.level_id,
              ),
            )
            .toList();

    for (final level in uniqueLevels) {
      final levelSkills =
          skills
              .where(
                (skill) =>
                    skill.level == level.level_id &&
                    skill.domain == selectedDomain.domain_id,
              )
              .toList();
      if (levelSkills.isNotEmpty) {
        levelsDomains.add(LevelDomainDetails(level: level, skills: levelSkills));
      }
    }

    return DomainFullDetails(
      levelsDomains: levelsDomains,
      progress: getProgress(userPerformance, filteredStandards),
      domain: selectedDomain,
    );
  }

  double getProgress(List<double> userPerformance, List<Standards> standards) {
    double progress = 0;
    for (Standards standard in standards) {
      progress += userPerformance[standard.standard_id];
    }
    return progress / standards.length;
  }
}

class DomainDetails {
  Domains? domain;
  double? progress;

  DomainDetails({this.domain, this.progress});
}

class DomainFullDetails extends DomainDetails {
  List<LevelDomainDetails> levelsDomains;

  DomainFullDetails({
    required this.levelsDomains,
    required super.progress,
    required super.domain,
  });
}

class LevelDomainDetails {
  Levels level;
  List<Skills> skills;

  LevelDomainDetails({required this.level, required this.skills});
}
