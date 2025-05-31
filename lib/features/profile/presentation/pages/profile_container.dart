import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studia/core/core.dart';
import 'package:studia/features/profile/domain/usecases/sort_skills_usecase.dart';
import 'package:studia/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:studia/main.dart';

class ProfileContainer extends StatelessWidget {
  const ProfileContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileBloc, ProfileState>(
      listener: (context, state) {
        if (state.isBack) {
          NavigatorService.pushReplacement(context, AppRoutes.main);
        }
        if (state.isEditProfile) {
          NavigatorService.pushReplacement(context, AppRoutes.profileEdit);
        }
        if (state.isViewAllSkills) {
          NavigatorService.push(context, AppRoutes.skills);
        }
        if (state.viewSkill != null) {
          NavigatorService.push(context, AppRoutes.info, data: state.viewSkill);
        }
      },
      builder: (context, state) {
        if (state.isLoading || state.user == null) {
          return const LoadingWidget();
        }

        return Scaffold(
          appBar: CustomAppBarTitle.build(
            context,
            getIt.get<AppTextConstants>().profile,
            leading: CustomButton(
              leading: Icon(Icons.arrow_back, color: AppColors.darkgray),
              onPressed:
                  () => context.read<ProfileBloc>().add(ProfileEvent.back()),
              type: AppButtonType.transparent,
            ),
          ),
          body: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  _buildHeader(context, state),
                  SizedBox(height: 8),
                  CustomButton(
                    text: getIt.get<AppTextConstants>().editProfile,
                    onPressed: () {
                      context.read<ProfileBloc>().add(
                        ProfileEvent.editProfile(),
                      );
                    },
                    type: AppButtonType.outlined,
                    color: AppButtonColor.gray,
                    size: AppButtonSize.small,
                  ),
                  SizedBox(height: 16),
                  _buildSkillsOverview(context, state),
                  SizedBox(height: 16),
                  _buildSkills(context, state),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  _buildHeader(BuildContext context, ProfileState state) {
    return Row(
      children: [
        ClipOval(
          child:
              state.user!.avatar != null && state.user!.avatar!.isNotEmpty
                  ? Image.network(
                    state.user!.avatar!,
                    width: 96,
                    height: 96,
                    fit: BoxFit.cover,
                  )
                  : CustomIcon(
                    icon: Icons.account_circle_rounded,
                    size: 96,
                    color: AppColors.gray,
                  ),
        ),
        SizedBox(width: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  '${state.user!.firstName} ${state.user!.lastName}',
                  style: AppTextStyles.h2,
                ),
                SizedBox(width: 4),
                _buildGender(state),
              ],
            ),
            SizedBox(height: 4),
            CustomPicker(
              label: getIt.get<AppTextConstants>().level,
              value: state.selectedLevel?.level_name ?? '',
              onTap: () {
                CustomBottomSheet.show(
                  context,
                  state.levels
                      .map(
                        (level) => BottomSheetItem(
                          text: level.level_name,
                          isSelected: level == state.selectedLevel,
                          onTap: () {
                            context.read<ProfileBloc>().add(
                              ProfileEvent.selectGrade(level),
                            );
                            Navigator.pop(context);
                          },
                        ),
                      )
                      .toList(),
                );
              },
              width: AppPickerWidth.fit,
              size: AppPickerSize.small,
            ),
          ],
        ),
      ],
    );
  }

  _buildGender(ProfileState state) {
    return state.user!.gender == 'male'
        ? CustomIcon(icon: Icons.male_rounded, size: 32, color: AppColors.blue)
        : CustomIcon(
          icon: Icons.female_rounded,
          size: 32,
          color: AppColors.pink,
        );
  }

  _buildSkillsOverview(BuildContext context, ProfileState state) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                getIt.get<AppTextConstants>().skillsOverview,
                style: AppTextStyles.h4,
              ),
            ),
            CustomButton(
              text: getIt.get<AppTextConstants>().viewAll,
              onPressed: () {
                context.read<ProfileBloc>().add(ProfileEvent.viewAllSkills());
              },
              type: AppButtonType.transparent,
              color: AppButtonColor.orange,
              size: AppButtonSize.small,
            ),
          ],
        ),
        SizedBox(height: 8),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: _buildLearnedSkills(
                state,
                state.learnedSkills.length,
                state.skills.length,
              ),
            ),
            SizedBox(width: 8),
            Expanded(
              child: _buildAvgPerformance(
                state,
                state.learnedSkills.length,
                state.skills.length,
              ),
            ),
          ],
        ),
      ],
    );
  }

  _buildLearnedSkills(
    ProfileState state,
    int learnedSkillsCount,
    int totalSkillsCount,
  ) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.gray),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            getIt.get<AppTextConstants>().learnedSkills,
            style: AppTextStyles.body,
          ),
          SizedBox(height: 8),
          Row(
            children: [
              Text(
                '${state.learnedSkills.length}',
                style: AppTextStyles.h2.copyWith(color: AppColors.orange),
              ),
              Text('/${state.skills.length}', style: AppTextStyles.h3),
            ],
          ),
        ],
      ),
    );
  }

  _buildAvgPerformance(
    ProfileState state,
    int learnedSkillsCount,
    int totalSkillsCount,
  ) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.gray),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            getIt.get<AppTextConstants>().avgPerformance,
            style: AppTextStyles.body,
            textAlign: TextAlign.left,
          ),
          SizedBox(height: 8),
          Text(
            '${state.avgPerformance}%',
            style: AppTextStyles.h2.copyWith(color: AppColors.orange),
            textAlign: TextAlign.left,
          ),
        ],
      ),
    );
  }

  _buildSkills(BuildContext context, ProfileState state) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                getIt.get<AppTextConstants>().skills,
                style: AppTextStyles.h4,
              ),
            ),
            CustomPicker(
              label: getIt.get<AppTextConstants>().sortBy,
              value: state.sortedSkills.name,
              onTap: () {
                CustomBottomSheet.show(
                  context,
                  SkillsSort.values
                      .map(
                        (sort) => BottomSheetItem(
                          text: sort.name,
                          isSelected: sort == state.sortedSkills,
                          onTap: () {
                            context.read<ProfileBloc>().add(
                              ProfileEvent.selectSkillsSort(sort),
                            );
                            Navigator.pop(context);
                          },
                        ),
                      )
                      .toList(),
                );
              },
              width: AppPickerWidth.fit,
              size: AppPickerSize.small,
              type: AppPickerType.transparent,
            ),
          ],
        ),
        SizedBox(height: 8),
        ...List<Widget>.generate(
          state.skills.length,
          (index) => Column(
            children: [
              SkillItem(
                skill: state.skills.keys.toList()[index],
                domain: state.skills.values.toList()[index]['domain'],
                progress: state.skills.values.toList()[index]['performance'],
                onPressed: (skill) {
                  context.read<ProfileBloc>().add(
                    ProfileEvent.viewSkill(skill),
                  );
                },
              ),
              SizedBox(height: 8),
            ],
          ),
        ),
      ],
    );
  }
}
