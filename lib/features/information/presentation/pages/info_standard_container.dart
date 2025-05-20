import 'package:flutter/material.dart';
import 'package:studia/core/core.dart';
import 'package:studia/features/information/domain/usecases/fetch_standard_details.dart';
import 'package:studia/features/information/presentation/bloc/info_bloc.dart';

class InfoStandardContainer extends StatelessWidget {
  final StandardFullDetails standard;
  final InfoBloc infoBloc;

  const InfoStandardContainer({
    super.key,
    required this.standard,
    required this.infoBloc,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Text(standard.standard!.standard, style: AppTextStyles.h3),
          SizedBox(height: 16),
          Text('Progress', style: AppTextStyles.subheading),
          SizedBox(height: 8),
          CustomProgress(
            progress: standard.progress!,
            size: ProgressBarSize.regular,
            showPercentage: true,
          ),
          SizedBox(height: 16),
          Text('Description', style: AppTextStyles.subheading),
          SizedBox(height: 8),
          Text(standard.standard!.description!, style: AppTextStyles.body),
          SizedBox(height: 16),
          Text('Skills', style: AppTextStyles.subheading),
          SizedBox(height: 8),
          SkillItem(
            skill: standard.skill!,
            onPressed: (skill) {
              infoBloc.add(InfoEvent.onSelect(skill));
            },
          ),
          SizedBox(height: 16),
          Text('Domains', style: AppTextStyles.subheading),
          SizedBox(height: 8),
          DomainItem(
            domain: standard.domain!,
            onPressed: (domain) {
              infoBloc.add(InfoEvent.onSelect(domain));
            },
          ),
          SizedBox(height: 16),
          Text('Levels', style: AppTextStyles.subheading),
          SizedBox(height: 8),
          LevelItem(
            level: standard.level!,
            onPressed: (level) {
              infoBloc.add(InfoEvent.onSelect(level));
            },
          ),
        ],
      ),
    );
  }
}
