import 'package:flutter/material.dart';
import 'package:studia/core/core.dart';
import 'package:studia/core/data/datasources/local/drift/database.dart';
import 'package:studia/features/information/domain/usecases/fetch_level_details.dart';
import 'package:studia/features/information/presentation/bloc/info_bloc.dart';

class InfoLevelContainer extends StatefulWidget {
  final LevelFullDetails level;
  final InfoBloc infoBloc;

  const InfoLevelContainer({
    super.key,
    required this.level,
    required this.infoBloc,
  });

  @override
  State<InfoLevelContainer> createState() => _InfoLevelContainerState();
}

class _InfoLevelContainerState extends State<InfoLevelContainer> {
  LevelFullDetails? level;
  Domains? selectedDomain;

  @override
  void initState() {
    super.initState();
    level = widget.level;
    selectedDomain = level!.domainsLevels.first.domain;
  }

  @override
  Widget build(BuildContext context) {
    if (level == null) {
      return const LoadingWidget();
    }
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Text(level!.level.level_name, style: AppTextStyles.h3),
          SizedBox(height: 16),
          Text('Progress', style: AppTextStyles.subheading),
          SizedBox(height: 8),
          CustomProgress(
            progress: level!.progress!,
            size: ProgressBarSize.regular,
            showPercentage: true,
          ),
          SizedBox(height: 16),
          CustomPicker(
            label: 'Domain',
            value: selectedDomain!.domain_name,
            onTap: () {
              CustomBottomSheet.show(
                context,
                level!.domainsLevels
                    .map(
                      (e) => BottomSheetItem(
                        text: e.domain.domain_name,
                        isSelected:
                            e.domain.domain_name == selectedDomain?.domain_name,
                        onTap: () {
                          setState(() {
                            selectedDomain = e.domain;
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
          Text('Domain', style: AppTextStyles.subheading),
          SizedBox(height: 8),
          DomainItem(
            domain: selectedDomain!,
            onPressed: (domain) {
              widget.infoBloc.add(InfoEvent.onSelect(domain));
            },
          ),
          SizedBox(height: 16),
          Text('Skills', style: AppTextStyles.subheading),
          SizedBox(height: 8),
          ...List<Widget>.generate(
            level!.domainsLevels
                .firstWhere(
                  (e) => e.domain.domain_id == selectedDomain!.domain_id,
                )
                .skills
                .length,
            (index) => Column(
              children: [
                SkillItem(
                  skill:
                      level!.domainsLevels
                          .firstWhere(
                            (e) =>
                                e.domain.domain_id == selectedDomain!.domain_id,
                          )
                          .skills[index],
                  onPressed: (skill) {
                    widget.infoBloc.add(Select(skill));
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
