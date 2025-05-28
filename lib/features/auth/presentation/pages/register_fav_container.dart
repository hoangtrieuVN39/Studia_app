import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studia/core/data/datasources/local/drift/database.dart';
import '../../../../core/core.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/theme/app_colors.dart';
import '../bloc/register/register_bloc.dart';

class RegisterFavContainer extends StatelessWidget {
  RegisterFavContainer({super.key, required this.state});

  final RegisterState state;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                Text('Favorite topics (Optional)', style: AppTextStyles.h3),
                const SizedBox(height: 8),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: AppColors.gray),
                  ),
                  constraints: BoxConstraints(
                    maxHeight: 36.0 * 4 + 24, // 4 rows of 36px height + padding
                  ),
                  child:
                      state.selectedDomains.isEmpty
                          ? Container(
                            padding: const EdgeInsets.only(left: 16),
                            height: 36,
                            child: Row(
                              children: [
                                Text(
                                  'Pick topics below',
                                  style: AppTextStyles.subheading.copyWith(
                                    color: AppColors.gray,
                                  ),
                                ),
                              ],
                            ),
                          )
                          : SingleChildScrollView(
                            child: _buildTopicContainer(
                              state.selectedDomains,
                              true,
                              CustomChipSize.small,
                              context,
                            ),
                          ),
                ),
                const SizedBox(height: 16),
                _buildTopicContainer(
                  state.domains,
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
              context.read<RegisterBloc>().add(ContinueFavPressed());
            },
          ),
        ),
      ],
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
                    ? context.read<RegisterBloc>().add(
                      DomainUnselected(domains[index]),
                    )
                    : context.read<RegisterBloc>().add(
                      DomainSelected(domains[index]),
                    );
              },
              isSelected,
              size,
            );
          }).toList(),
    );
  }

  Widget _buildTopicItem(
    Domains domain,
    void Function() onPressed,
    bool isSelected,
    CustomChipSize size,
  ) {
    return CustomIconChip(
      text: domain.domain_name,
      isSelected: isSelected,
      onPressed: onPressed,
      chipSize: size,
      chipColor: CustomChipColor.gray,
      chipWidth: CustomChipWidth.fit,
    );
  }
}
