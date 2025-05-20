import 'package:studia/core/data/datasources/local/drift/database.dart';

class FetchStandardDetails {
  final AppDatabase database;

  FetchStandardDetails({required this.database});

  Future<StandardFullDetails> call(
    Standards selectedStandard,
    List<double> userPerformance,
  ) async {
    List<StandardDetails> substandardsInfo = [];
    Skills? currentSkill;
    Levels? currentLevel;
    Domains? currentDomain;

    //Skill
    List<Skills> skills = await database.selectSkills();
    for (Skills skill in skills) {
      if (skill.skill_id == selectedStandard.skill) {
        currentSkill = skill;
        break;
      }
    }

    //Level
    List<Levels> levels = await database.selectLevels();
    for (Levels level in levels) {
      if (level.level_id == selectedStandard.level) {
        currentLevel = level;
        break;
      }
    }

    //Domain
    List<Domains> domains = await database.selectDomains();
    for (Domains domain in domains) {
      if (domain.domain_id == selectedStandard.domain) {
        currentDomain = domain;
        break;
      }
    }

    //Substandards
    List<Standards> substandards = await database.selectStandards();
    for (Standards substandard in substandards) {
      if (substandard.parent_id == selectedStandard.standard_id) {
        substandardsInfo.add(
          StandardDetails(
            standard: substandard,
            progress: userPerformance[substandard.standard_id],
          ),
        );
      }
    }

    return StandardFullDetails(
      standard: selectedStandard,
      progress: userPerformance[selectedStandard.standard_id],
      skill: currentSkill!,
      level: currentLevel!,
      domain: currentDomain!,
      substandards: substandardsInfo,
    );
  }
}

class StandardDetails {
  Standards? standard;
  double? progress;

  StandardDetails({required this.standard, required this.progress});
}

class StandardFullDetails extends StandardDetails {
  Skills skill;
  Levels level;
  Domains domain;
  List<StandardDetails> substandards;

  StandardFullDetails({
    required this.skill,
    required this.level,
    required this.domain,
    required this.substandards,
    required super.standard,
    required super.progress,
  });
}
