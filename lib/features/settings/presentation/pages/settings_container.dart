import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:studia/core/core.dart';
import 'package:studia/main.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../bloc/settings_bloc.dart';

class SettingsContainer extends StatelessWidget {
  const SettingsContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SettingsBloc, SettingsState>(
      listener: (context, state) {
        final settingsBloc = context.read<SettingsBloc>();
        if (state.isBackTap) {
          NavigatorService.pushReplacement(context, AppRoutes.main);
        }
        if (state.isLanguageTap) {
          CustomBottomSheet.show(
            context,
            List.generate(
              Language.values.length,
              (index) => BottomSheetItem(
                text: Language.values[index].name,
                isSelected: state.language == Language.values[index],
                onTap: () {
                  settingsBloc.add(
                    SettingsEvent.onLanguageChanged(Language.values[index]),
                  );
                  Navigator.pop(context);
                },
              ),
            ).reversed.toList(),
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: CustomAppBarTitle.build(
            context,
            getIt<AppTextConstants>().settings,
            leading: CustomButton(
              leading: Icon(Icons.arrow_back, color: AppColors.darkgray),
              onPressed:
                  () => context.read<SettingsBloc>().add(
                    SettingsEvent.onBackTap(),
                  ),
              type: AppButtonType.transparent,
            ),
          ),
          body: Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  getIt<AppTextConstants>().language,
                  style: AppTextStyles.h3,
                ),
                const SizedBox(height: 8),
                CustomPicker(
                  label: getIt<AppTextConstants>().language,
                  value: state.language.name,
                  onTap:
                      () => context.read<SettingsBloc>().add(
                        SettingsEvent.onLanguageTap(),
                      ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
