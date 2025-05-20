import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studia/core/core.dart';
import 'package:studia/core/data/datasources/local/drift/database.dart';
import 'package:studia/core/widgets.dart';
import 'package:studia/core/widgets/standard_item.dart';
import 'package:studia/features/information/domain/usecases/fetch_skill_details.dart';
import 'package:studia/features/information/presentation/bloc/info_bloc.dart';

class InfoSkillContainer extends StatelessWidget {
  final SkillFullDetails skill;
  final InfoBloc infoBloc;

  const InfoSkillContainer({
    super.key,
    required this.skill,
    required this.infoBloc,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Text(skill.skill!.skill_name, style: AppTextStyles.h4),
          SizedBox(height: 16),
          Text('Progress', style: AppTextStyles.subheading),
          SizedBox(height: 8),
          CustomProgress(
            progress: skill.progress!,
            size: ProgressBarSize.regular,
            showPercentage: true,
          ),

          SizedBox(height: 16),
          Text('Skills', style: AppTextStyles.subheading),
          SizedBox(height: 8),
          SkillItem(
            skill: skill.skill!,
            onPressed: (skill) {
              infoBloc.add(InfoEvent.onSelect(skill));
            },
          ),
          SizedBox(height: 16),
          Text('Domains', style: AppTextStyles.subheading),
          SizedBox(height: 8),
          DomainItem(
            domain: skill.domain!,
            onPressed: (domain) {
              infoBloc.add(InfoEvent.onSelect(domain));
            },
          ),
          SizedBox(height: 16),
          Text('Levels', style: AppTextStyles.subheading),
          SizedBox(height: 8),
          LevelItem(
            level: skill.level!,
            onPressed: (level) {
              infoBloc.add(InfoEvent.onSelect(level));
            },
          ),
          SizedBox(height: 16),
          Text('Standards', style: AppTextStyles.subheading),
          SizedBox(height: 8),
          ...List<Widget>.generate(
            skill.standards!.length,
            (index) => Column(
              children: [
                StandardItem(
                  standard: skill.standards![index].standard!,
                  onPressed: (standard) {
                    infoBloc.add(InfoEvent.onSelect(standard));
                  },
                  progress: skill.standards![index].progress,
                  showDescription: true,
                  substandards: skill.standards![index].substandards,
                ),
                SizedBox(height: 8),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
