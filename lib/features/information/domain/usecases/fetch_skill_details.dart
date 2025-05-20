import 'package:studia/core/data/datasources/local/drift/database.dart';
import 'package:studia/features/information/domain/usecases/fetch_standard_details.dart';

class FetchSkillDetails {
  final AppDatabase database;

  FetchSkillDetails({required this.database});

  Future<SkillFullDetails> call(
    Skills selectedSkill,
    List<double> userPerformance,
  ) async {
    List<Standards> standards = await database.selectStandards();
    Levels? currentLevel;
    Domains? currentDomain;
    List<StandardFullDetails> standardsInfo = [];

    //Level
    List<Levels> levels = await database.selectLevels();
    for (Levels level in levels) {
      if (level.level_id == selectedSkill.level) {
        List<Standards> filteredStandards = [];
        for (Standards standard in standards) {
          if (standard.level == level.level_id) {
            filteredStandards.add(standard);
          }
        }
        double progress = getProgress(userPerformance, filteredStandards);
        currentLevel = level;
        progress = progress;
        break;
      }
    }

    //Domain
    List<Domains> domains = await database.selectDomains();
    for (Domains domain in domains) {
      if (domain.domain_id == selectedSkill.domain) {
        List<Standards> filteredStandards = [];
        for (Standards standard in standards) {
          if (standard.domain == domain.domain_id) {
            filteredStandards.add(standard);
          }
        }
        double progress = getProgress(userPerformance, filteredStandards);
        currentDomain = domain;
        progress = progress;
        break;
      }
    }

    //Standards
    List<StandardDetails> substandardsInfo = [];
    for (Standards standard in standards) {
      if (standard.skill == selectedSkill.skill_id &&
          standard.parent_id == null) {
        for (Standards standardd in standards) {
          if (standardd.parent_id == standard.standard_id) {
            substandardsInfo.add(
              StandardDetails(
                standard: standardd,
                progress: userPerformance[standardd.standard_id],
              ),
            );
          }
        }
        standardsInfo.add(
          StandardFullDetails(
            skill: selectedSkill,
            level: currentLevel!,
            domain: currentDomain!,
            standard: standard,
            progress: userPerformance[standard.standard_id],
            substandards: substandardsInfo,
          ),
        );
      }
    }

    return SkillFullDetails(
      level: currentLevel!,
      domain: currentDomain!,
      standards: standardsInfo,
      progress: getProgress(
        userPerformance,
        standardsInfo.map((e) => e.standard!).toList(),
      ),
      skill: selectedSkill,
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

class SkillDetails {
  Skills? skill;
  double? progress;

  SkillDetails({this.skill, this.progress});
}

class SkillFullDetails extends SkillDetails {
  Levels level;
  Domains domain;
  List<StandardFullDetails> standards;

  SkillFullDetails({
    required this.level,
    required this.domain,
    required this.standards,
    required super.progress,
    required super.skill,
  });
}
