import 'package:studia/core/core.dart';
import 'package:studia/core/data/datasources/local/drift/database.dart';
import 'package:studia/features/profile/domain/repositories/profile_repository.dart';
import 'package:studia/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:studia/main.dart';

class SortSkillsUsecase {
  final ProfileRepository profileRepository;

  SortSkillsUsecase(this.profileRepository);

  Future<Map<Skills, Map<String, dynamic>>> call(
    Map<Skills, Map<String, dynamic>> skills,
    SkillsSort skillsSort,
  ) async {
    final sortedSkills = <Skills, Map<String, dynamic>>{};
    switch (skillsSort) {
      case SkillsSort.latest:
        final skillsTime = await profileRepository.getSkillsTime(
          skills.keys.toList(),
        );
        final skillsList = skills.keys.toList();
        final sortedSkillsList = bubbleSortTime(skillsList, skillsTime, true);
        for (var skill in sortedSkillsList) {
          sortedSkills[skill] = skills[skill]!;
        }
        return sortedSkills;
      case SkillsSort.oldest:
        final skillsTime = await profileRepository.getSkillsTime(
          skills.keys.toList(),
        );
        final skillsList = skills.keys.toList();
        final sortedSkillsList = bubbleSortTime(skillsList, skillsTime, false);
        for (var skill in sortedSkillsList) {
          sortedSkills[skill] = skills[skill]!;
        }
        return sortedSkills;
      case SkillsSort.mostPerformance:
        final skillsPerformance = skills.map(
          (key, value) => MapEntry(key, value['performance'] as double),
        );
        final sortedSkillsList = bubbleSortPerformance(
          skills.keys.toList(),
          skillsPerformance,
          true,
        );
        for (var skill in sortedSkillsList) {
          sortedSkills[skill] = skills[skill]!;
        }
        return sortedSkills;
      case SkillsSort.leastPerformance:
        final skillsPerformance = skills.map(
          (key, value) => MapEntry(key, value['performance'] as double),
        );
        final sortedSkillsList = bubbleSortPerformance(
          skills.keys.toList(),
          skillsPerformance,
          false,
        );
        for (var skill in sortedSkillsList) {
          sortedSkills[skill] = skills[skill]!;
        }
        return sortedSkills;
    }
  }
}

List<Skills> bubbleSortTime(
  List<Skills> skillsList,
  Map<Skills, DateTime> skillsTime,
  bool isDescending,
) {
  for (var i = 0; i < skillsList.length - 1; i++) {
    for (var j = 0; j < skillsList.length - i - 1; j++) {
      if (isDescending
          ? skillsTime[skillsList[j]]!.compareTo(
                skillsTime[skillsList[j + 1]]!,
              ) >
              0
          : skillsTime[skillsList[j]]!.compareTo(
                skillsTime[skillsList[j + 1]]!,
              ) <
              0) {
        final temp = skillsList[j];
        skillsList[j] = skillsList[j + 1];
        skillsList[j + 1] = temp;
      }
    }
  }
  return skillsList;
}

List<Skills> bubbleSortPerformance(
  List<Skills> skillsList,
  Map<Skills, double> skillsPerformance,
  bool isDescending,
) {
  for (var i = 0; i < skillsList.length - 1; i++) {
    for (var j = 0; j < skillsList.length - i - 1; j++) {
      if (isDescending
          ? skillsPerformance[skillsList[j]]! <
              skillsPerformance[skillsList[j + 1]]!
          : skillsPerformance[skillsList[j]]! >
              skillsPerformance[skillsList[j + 1]]!) {
        final temp = skillsList[j];
        skillsList[j] = skillsList[j + 1];
        skillsList[j + 1] = temp;
      }
    }
  }
  return skillsList;
}

enum SkillsSort { latest, oldest, mostPerformance, leastPerformance }

extension SkillsSortExtension on SkillsSort {
  String get name {
    switch (this) {
      case SkillsSort.latest:
        return getIt.get<AppTextConstants>().latestSkills;
      case SkillsSort.oldest:
        return getIt.get<AppTextConstants>().oldestSkills;
      case SkillsSort.mostPerformance:
        return getIt.get<AppTextConstants>().mostPerformancedSkills;
      case SkillsSort.leastPerformance:
        return getIt.get<AppTextConstants>().leastPerformancedSkills;
    }
  }
}
