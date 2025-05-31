import 'package:flutter/material.dart';
import 'package:studia/core/core.dart';
import 'package:studia/features/information/domain/usecases/fetch_standard_details.dart';
import 'package:studia/features/information/presentation/bloc/info_bloc.dart';
import 'package:studia/main.dart';

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
          Text(
            getIt.get<AppTextConstants>().progress,
            style: AppTextStyles.subheading,
          ),
          SizedBox(height: 8),
          CustomProgress(
            progress: standard.progress!,
            size: ProgressBarSize.regular,
            showPercentage: true,
          ),
          SizedBox(height: 16),
          Text(
            getIt.get<AppTextConstants>().description,
            style: AppTextStyles.subheading,
          ),
          SizedBox(height: 8),
          Text(standard.standard!.description!, style: AppTextStyles.body),
          SizedBox(height: 16),
          Text(
            getIt.get<AppTextConstants>().skills,
            style: AppTextStyles.subheading,
          ),
          SizedBox(height: 8),
          SkillItem(
            skill: standard.skill!,
            onPressed: (skill) {
              infoBloc.add(InfoEvent.onSelect(skill));
            },
          ),
          SizedBox(height: 16),
          Text(
            getIt.get<AppTextConstants>().domain,
            style: AppTextStyles.subheading,
          ),
          SizedBox(height: 8),
          DomainItem(
            domain: standard.domain!,
            onPressed: (domain) {
              infoBloc.add(InfoEvent.onSelect(domain));
            },
          ),
          SizedBox(height: 16),
          Text(
            getIt.get<AppTextConstants>().level,
            style: AppTextStyles.subheading,
          ),
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
