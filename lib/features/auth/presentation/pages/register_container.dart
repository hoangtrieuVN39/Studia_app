import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studia/features/auth/presentation/pages/register_fav_container.dart';
import 'package:studia/main.dart';
import '../../../../core/core.dart';
import '../bloc/register/register_bloc.dart';

class RegisterContainer extends StatelessWidget {
  const RegisterContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final registerBloc = context.read<RegisterBloc>();

    return BlocConsumer<RegisterBloc, RegisterState>(
      listener: (context, state) {
        if (state.isBackPressed) {
          NavigatorService.pushReplacement(context, AppRoutes.login);
        }
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
                  registerBloc.add(
                    RegisterEvent.yobSelected(
                      AppTextConstants.yearOfBirthMin + index,
                    ),
                  );
                  Navigator.pop(context);
                },
              ),
            ).reversed.toList(),
          );
        }
        if (state.isContinueFavPressed) {
          NavigatorService.pushReplacement(context, AppRoutes.login);
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
                      registerBloc.add(RegisterEvent.gradeSelected(level));
                      Navigator.pop(context);
                    },
                  ),
                )
                .toList(),
          );
        }
      },
      builder: (context, state) {
        final isStep1Valid =
            registerBloc.state.firstName.isNotEmpty &&
            registerBloc.state.lastName.isNotEmpty;
        if (state.isLoading) {
          return const LoadingWidget();
        }
        return Scaffold(
          backgroundColor: AppColors.snow,
          appBar: CustomAppBarTitle.build(
            context,
            getIt.get<AppTextConstants>().setup,
            leading: CustomButton(
              onPressed: () {
                registerBloc.add(RegisterEvent.backPressed());
              },
              leading: CustomIcon(icon: Icons.arrow_back),
              size: AppButtonSize.small,
              color: AppButtonColor.gray,
              type: AppButtonType.transparent,
              width: AppButtonWidth.fit,
            ),
            actions: CustomFractionChip(
              numerator: state.pageIndex + 1,
              denominator: 2,
            ),
          ),
          body: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child:
                state.isContinuePressed
                    ? RegisterFavContainer(state: state)
                    : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomTextField(
                                  label: getIt.get<AppTextConstants>().firstName,
                                  hint: getIt.get<AppTextConstants>().inputYourFirstName,
                                  onChanged: (value) {
                                    registerBloc.add(
                                      RegisterEvent.setFirstName(value),
                                    );
                                  },
                                ),
                                const SizedBox(height: 16),
                                CustomTextField(
                                  label: getIt.get<AppTextConstants>().lastName,
                                  hint: getIt.get<AppTextConstants>().inputYourLastName,
                                  onChanged: (value) {
                                    registerBloc.add(
                                      RegisterEvent.setLastName(value),
                                    );
                                  },
                                ),
                                const SizedBox(height: 16),
                                Text(getIt.get<AppTextConstants>().gender, style: AppTextStyles.h3),
                                const SizedBox(height: 8),
                                Row(
                                  children: [
                                    Expanded(
                                      child: _buildGenderField(
                                        context,
                                        Gender.Male,
                                        Gender.Male ==
                                            registerBloc.state.gender,
                                        () {
                                          registerBloc.add(
                                            RegisterEvent.setGender(
                                              Gender.Male,
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                    Expanded(
                                      child: _buildGenderField(
                                        context,
                                        Gender.Female,
                                        Gender.Female ==
                                            registerBloc.state.gender,
                                        () {
                                          registerBloc.add(
                                            RegisterEvent.setGender(
                                              Gender.Female,
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                    Expanded(
                                      child: _buildGenderField(
                                        context,
                                        Gender.Other,
                                        Gender.Other ==
                                            registerBloc.state.gender,
                                        () {
                                          registerBloc.add(
                                            RegisterEvent.setGender(
                                              Gender.Other,
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 16),
                                Text(getIt.get<AppTextConstants>().yearOfBirth, style: AppTextStyles.h3),
                                const SizedBox(height: 8),
                                CustomPicker(
                                  label: getIt.get<AppTextConstants>().yearOfBirth,
                                  value:
                                      registerBloc.state.yearOfBirth.toString(),
                                  onTap: () {
                                    registerBloc.add(
                                      const PickYearOfBirthRequested(),
                                    );
                                  },
                                ),
                                const SizedBox(height: 16),
                                Text(
                                  getIt.get<AppTextConstants>().currentSchoolLevel,
                                  style: AppTextStyles.h3,
                                ),
                                const SizedBox(height: 8),
                                CustomPicker(
                                  label: getIt.get<AppTextConstants>().currentSchoolLevel,
                                  value:
                                      state.selectedLevel != null
                                          ? state.selectedLevel!.level_name
                                          : '',
                                  onTap: () {
                                    registerBloc.add(
                                      const PickGradeRequested(),
                                    );
                                  },
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
                            text: getIt.get<AppTextConstants>().continueButton,
                            onPressed: () {
                              registerBloc.add(const ContinuePressed());
                            },
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
    void Function() onPressed,
  ) {
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
      onPressed: () => onPressed(),
      child: Text(
        gender.name,
        style: AppTextStyles.body.copyWith(
          color: isSelected ? AppColors.powerorange : AppColors.darkgray,
        ),
      ),
    );
  }
}
