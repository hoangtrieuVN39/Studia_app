import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studia/core/core.dart';
import 'package:studia/features/profile/presentation/bloc/edit/profile_edit_bloc.dart';

import 'package:studia/features/profile/presentation/bloc/profile_bloc.dart';

class ProfileEditContainer extends StatelessWidget {
  const ProfileEditContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final profileEditBloc = context.read<ProfileEditBloc>();
    return BlocConsumer<ProfileEditBloc, ProfileEditState>(
      listener: (context, state) {
        if (state.showYearOfBirthPicker) {
          CustomBottomSheet.show(
            context,
            List.generate(
              AppTextConstants.yearOfBirthMax -
                  AppTextConstants.yearOfBirthMin +
                  1,
              (index) => BottomSheetItem(
                text: (AppTextConstants.yearOfBirthMin + index).toString(),
                isSelected:
                    state.yearOfBirth ==
                    AppTextConstants.yearOfBirthMin + index,
                onTap: () {
                  profileEditBloc.add(
                    ProfileEditEvent.yobSelected(
                      AppTextConstants.yearOfBirthMin + index,
                    ),
                  );
                  Navigator.pop(context);
                },
              ),
            ).reversed.toList(),
          );
          if (state.isContinuePressed) {
            profileEditBloc.add(const ContinuePressed());
          }
        }
        if (state.showLevelPicker) {
          CustomBottomSheet.show(
            context,
            state.levels
                .map(
                  (level) => BottomSheetItem(
                    text: level.level_name,
                    isSelected: level == state.selectedLevel,
                    onTap: () {
                      profileEditBloc.add(
                        ProfileEditEvent.gradeSelected(level),
                      );
                      Navigator.pop(context);
                    },
                  ),
                )
                .toList(),
          );
        }
        if (state.isBackPressed) {
          NavigatorService.pushReplacement(context, AppRoutes.profile);
        }
        if (state.isContinuePressed) {
          NavigatorService.pushReplacement(context, AppRoutes.profile);
        }
      },
      builder: (context, state) {
        final isStep1Valid =
            profileEditBloc.state.firstName.isNotEmpty &&
            profileEditBloc.state.lastName.isNotEmpty;
        if (state.isLoading && state.lastName.isEmpty) {
          return const LoadingWidget();
        }
        return Scaffold(
          backgroundColor: AppColors.snow,
          appBar: CustomAppBarTitle.build(
            context,
            'Profile Edit',
            leading: CustomButton(
              onPressed: () {
                profileEditBloc.add(const BackPressed());
              },
              leading: CustomIcon(icon: Icons.arrow_back),
              size: AppButtonSize.small,
              color: AppButtonColor.gray,
              type: AppButtonType.transparent,
              width: AppButtonWidth.fit,
            ),
          ),
          body: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomTextField(
                          label: 'First Name',
                          hint: 'Input your first name',
                          initialValue: profileEditBloc.state.firstName,
                          onChanged: (value) {
                            profileEditBloc.add(
                              ProfileEditEvent.setFirstName(value),
                            );
                          },
                        ),
                        const SizedBox(height: 16),
                        CustomTextField(
                          label: 'Last Name',
                          hint: 'Input your last name',
                          initialValue: profileEditBloc.state.lastName,
                          onChanged: (value) {
                            profileEditBloc.add(
                              ProfileEditEvent.setLastName(value),
                            );
                          },
                        ),
                        const SizedBox(height: 16),
                        Text('Gender', style: AppTextStyles.h3),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Expanded(
                              child: _buildGenderField(
                                context,
                                Gender.Male,
                                Gender.Male == profileEditBloc.state.gender,
                                () => profileEditBloc.add(
                                  ProfileEditEvent.setGender(Gender.Male),
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: _buildGenderField(
                                context,
                                Gender.Female,
                                Gender.Female == profileEditBloc.state.gender,
                                () => profileEditBloc.add(
                                  ProfileEditEvent.setGender(Gender.Female),
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: _buildGenderField(
                                context,
                                Gender.Other,
                                Gender.Other == profileEditBloc.state.gender,
                                () => profileEditBloc.add(
                                  ProfileEditEvent.setGender(Gender.Other),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Text('Year of Birth', style: AppTextStyles.h3),
                        const SizedBox(height: 8),
                        CustomPicker(
                          label: 'Year of Birth',
                          value: profileEditBloc.state.yearOfBirth.toString(),
                          onTap:
                              () => profileEditBloc.add(
                                const PickYearOfBirthRequested(),
                              ),
                        ),
                        const SizedBox(height: 16),
                        Text('Current school level', style: AppTextStyles.h3),
                        const SizedBox(height: 8),
                        CustomPicker(
                          label: 'Current school level',
                          value:
                              state.selectedLevel != null
                                  ? state.selectedLevel!.level_name
                                  : '',
                          onTap:
                              () => profileEditBloc.add(
                                const PickGradeRequested(),
                              ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Container(
                  padding: const EdgeInsets.only(
                    left: 16,
                    right: 16,
                    bottom: 24,
                    top: 8,
                  ),
                  child: CustomElevatedButton(
                    text: 'Continue',
                    onPressed:
                        () => profileEditBloc.add(const ContinuePressed()),
                    active: isStep1Valid,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildGenderField(
    BuildContext context,
    Gender gender,
    bool isSelected,
    void Function() onBtnPressed,
  ) {
    onPressed() => onBtnPressed();
    return TextButton(
      style: TextButton.styleFrom(
        backgroundColor: isSelected ? const Color(0xFFFFCDA9) : AppColors.snow,
        foregroundColor:
            isSelected ? AppColors.powerorange : AppColors.darkgray,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        padding: const EdgeInsets.only(top: 8, bottom: 8, left: 16, right: 8),
        side: BorderSide(
          color: isSelected ? AppColors.powerorange : AppColors.divider,
        ),
        alignment: Alignment.centerLeft,
        minimumSize: Size.fromHeight(48),
      ),
      onPressed: onPressed,
      child: Text(
        gender.displayName,
        style: AppTextStyles.body.copyWith(
          color: isSelected ? AppColors.powerorange : AppColors.darkgray,
        ),
      ),
    );
  }
}
