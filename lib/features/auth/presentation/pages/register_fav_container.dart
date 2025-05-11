import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studia/core/data/datasources/local/drift/database.dart';
import 'package:studia/core/widgets/app_bar.dart';
import '../../../../core/core.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/theme/app_colors.dart';
import '../bloc/register_fav/register_fav_bloc.dart';

class RegisterFavContainer extends StatelessWidget {
  RegisterFavContainer({super.key});

  late RegisterFavBloc registerFavBloc;

  @override
  Widget build(BuildContext context) {
    registerFavBloc = context.read<RegisterFavBloc>();
    return BlocConsumer<RegisterFavBloc, RegisterFavState>(
      listener: (context, state) {},
      builder: (context, state) {
        final domains = registerFavBloc.state.domains;
        final selected_domains = registerFavBloc.state.selectedDomains;
        if (state.isLoading || domains.isEmpty) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }
        if (state.isContinuePressed) {
          return NavigatorService.pushAndRemoveUntil(context, AppRoutes.login);
        }
        return Scaffold(
          backgroundColor: AppColors.snow,
          appBar: CustomAppBarTitle.build(
            context,
            'Setup',
            leading: CustomButton(
              onPressed: () {
                Navigator.pop(context);
              },
              leading: CustomIcon(icon: Icons.arrow_back),
              size: AppButtonSize.small,
              color: AppButtonColor.gray,
              type: AppButtonType.transparent,
              width: AppButtonWidth.fit,
            ),
            actions: CustomFractionChip(numerator: 2, denominator: 2),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          'Favorite topics (Optional)',
                          style: AppTextStyles.h3,
                        ),
                        const SizedBox(height: 8),
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: AppColors.gray),
                          ),
                          constraints: BoxConstraints(
                            maxHeight:
                                36.0 * 4 +
                                24, // 4 rows of 36px height + padding
                          ),
                          child:
                              selected_domains.isEmpty
                                  ? Container(
                                    padding: const EdgeInsets.only(left: 16),
                                    height: 36,
                                    child: Row(
                                      children: [
                                        Text(
                                          'Pick topics below',
                                          style: AppTextStyles.subheading
                                              .copyWith(color: AppColors.gray),
                                        ),
                                      ],
                                    ),
                                  )
                                  : SingleChildScrollView(
                                    child: _buildTopicContainer(
                                      selected_domains,
                                      true,
                                      CustomChipSize.small,
                                      context,
                                    ),
                                  ),
                        ),
                        const SizedBox(height: 16),
                        _buildTopicContainer(
                          domains,
                          false,
                          CustomChipSize.small,
                          context,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.only(
                    left: 16,
                    right: 16,
                    bottom: 24,
                    top: 8,
                  ),
                  child: CustomElevatedButton(
                    text: 'Continue',
                    onPressed: () {
                      registerFavBloc.add(ContinuePressed());
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildTopicContainer(
    List<Domains> domains,
    bool isSelected,
    CustomChipSize size,
    BuildContext context,
  ) {
    return Wrap(
      alignment: WrapAlignment.start,
      spacing: 8.0,
      runSpacing: 8.0,
      children:
          List<Widget>.generate(domains.length, (int index) {
            return _buildTopicItem(
              domains[index],
              () {
                isSelected
                    ? registerFavBloc.add(DomainUnselected(domains[index]))
                    : registerFavBloc.add(DomainSelected(domains[index]));
              },
              isSelected,
              size,
              MediaQuery.of(context).size.width,
            );
          }).toList(),
    );
  }

  Widget _buildTopicItem(
    Domains domain,
    void Function() onPressed,
    bool isSelected,
    CustomChipSize size,
    double maxWidth,
  ) {
    return CustomIconChip(
      text: domain.domain_name,
      isSelected: isSelected,
      onPressed: onPressed,
      chipSize: size,
      chipColor: CustomChipColor.gray,
      maxWidth: maxWidth,
    );
  }
}
