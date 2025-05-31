import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studia/core/core.dart';
import 'package:studia/core/widgets/app_nav_bar.dart';

import 'package:studia/features/skills/presentation/bloc/skills_bloc.dart';
import 'package:studia/main.dart';

class SkillsContainer extends StatelessWidget {
  const SkillsContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SkillsBloc, SkillsState>(
      listener: (context, state) {
        if (state.skillSelected != null) {
          NavigatorService.push(
            context,
            AppRoutes.info,
            data: state.skillSelected,
          );
        }
        if (state.domainSelected != null) {
          NavigatorService.push(
            context,
            AppRoutes.info,
            data: state.domainSelected,
          );
        }

        if (state.selectLevel) {
          CustomBottomSheet.show(
            context,
            state.levels
                .map(
                  (level) => BottomSheetItem(
                    text: level.level_name,
                    isSelected: level == state.selectedLevel,
                    onTap: () {
                      context.read<SkillsBloc>().add(
                        SkillsEvent.levelSelected(level),
                      );
                      Navigator.pop(context);
                    },
                  ),
                )
                .toList(),
          );
        }
      },
      builder: (context, state) {
        final bloc = context.read<SkillsBloc>();
        if (state.isLoading) {
          return const LoadingWidget();
        }

        return Scaffold(
          appBar: CustomAppBarTitle.build(
            context,
            getIt.get<AppTextConstants>().skills,
            leading: CustomButton(
              leading: Icon(Icons.arrow_back, color: AppColors.darkgray),
              onPressed: () => NavigatorService.pop(context),
              type: AppButtonType.transparent,
            ),
          ),
          body: SafeArea(
            maintainBottomViewPadding: true,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  CustomPicker(
                    label: getIt.get<AppTextConstants>().level,
                    value: state.selectedLevel?.level_name ?? '',
                    onTap: () => bloc.add(SkillsEvent.onSelectLevel()),
                  ),
                  SizedBox(height: 8),
                  AppNavBar(
                    navBarStatus: [NavItem.skills.label, NavItem.domains.label],
                    onTap: (int index) {
                      context.read<SkillsBloc>().add(
                        SkillsEvent.navigate(NavItem.values[index]),
                      );
                    },
                    currentIndex: state.selectedNavItem.index,
                  ),
                  SizedBox(height: 16),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          ...state.selectedNavItem == NavItem.skills
                              ? List<Widget>.generate(
                                state.skillsDetails.length,
                                (index) => Column(
                                  children: [
                                    SkillItem(
                                      skill: state.skillsDetails[index].skill!,
                                      domain: state.skillsDetails[index].domain,
                                      progress:
                                          state.skillsDetails[index].progress ??
                                          0,
                                      onPressed:
                                          (skill) => bloc.add(
                                            SkillsEvent.skillSelected(skill),
                                          ),
                                    ),
                                    SizedBox(height: 8),
                                  ],
                                ),
                              )
                              : List<Widget>.generate(
                                state.domainsDetails.length,
                                (index) => Column(
                                  children: [
                                    DomainItem(
                                      domain:
                                          state.domainsDetails[index].domain!,
                                      progress:
                                          state
                                              .domainsDetails[index]
                                              .progress ??
                                          0,
                                      onPressed:
                                          (domain) => bloc.add(
                                            SkillsEvent.domainSelected(domain),
                                          ),
                                    ),
                                    SizedBox(height: 8),
                                  ],
                                ),
                              ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
