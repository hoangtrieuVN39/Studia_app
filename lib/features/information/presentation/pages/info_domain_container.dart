import 'package:flutter/material.dart';
import 'package:studia/core/core.dart';
import 'package:studia/core/data/datasources/local/drift/database.dart';
import 'package:studia/features/information/domain/usecases/fetch_domain_details.dart';
import 'package:studia/features/information/presentation/bloc/info_bloc.dart';

class InfoDomainContainer extends StatefulWidget {
  final DomainFullDetails domain;
  final InfoBloc infoBloc;

  const InfoDomainContainer({
    super.key,
    required this.domain,
    required this.infoBloc,
  });

  @override
  State<InfoDomainContainer> createState() => _InfoDomainContainerState();
}

class _InfoDomainContainerState extends State<InfoDomainContainer> {
  DomainFullDetails? domain;
  Levels? selectedLevel;

  @override
  void initState() {
    super.initState();
    domain = widget.domain;
    selectedLevel = domain!.levelsDomains.first.level;
  }

  @override
  Widget build(BuildContext context) {
    if (domain == null) {
      return const LoadingWidget();
    }
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Text(domain!.domain!.domain_name, style: AppTextStyles.h3),
          SizedBox(height: 16),
          Text('Progress', style: AppTextStyles.subheading),
          SizedBox(height: 8),
          CustomProgress(
            progress: domain!.progress!,
            size: ProgressBarSize.regular,
            showPercentage: true,
          ),
          SizedBox(height: 16),
          CustomPicker(
            label: 'Level',
            value: selectedLevel!.level_name,
            onTap: () {
              CustomBottomSheet.show(
                context,
                domain!.levelsDomains
                    .map(
                      (e) => BottomSheetItem(
                        text: e.level.level_name,
                        isSelected:
                            e.level.level_name == selectedLevel?.level_name,
                        onTap: () {
                          setState(() {
                            selectedLevel = e.level;
                          });
                          Navigator.pop(context);
                        },
                      ),
                    )
                    .toList(),
              );
            },
          ),
          SizedBox(height: 16),
          Text('Level', style: AppTextStyles.subheading),
          SizedBox(height: 8),
          LevelItem(
            level: selectedLevel!,
            onPressed: (level) {
              widget.infoBloc.add(InfoEvent.onSelect(level));
            },
          ),
          SizedBox(height: 16),
          Text('Skills', style: AppTextStyles.subheading),
          SizedBox(height: 8),
          ...List<Widget>.generate(
            domain!.levelsDomains
                .firstWhere((e) => e.level.level_id == selectedLevel!.level_id)
                .skills
                .length,
            (index) => Column(
              children: [
                SkillItem(
                  skill:
                      domain!.levelsDomains
                          .firstWhere(
                            (e) => e.level.level_id == selectedLevel!.level_id,
                          )
                          .skills[index],
                  onPressed: (skill) {
                    widget.infoBloc.add(InfoEvent.onSelect(skill));
                  },
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
