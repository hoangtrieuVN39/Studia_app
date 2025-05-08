import 'package:flutter/material.dart';
import 'package:studia/core/core.dart';

class CustomChip extends StatelessWidget {
  CustomChip({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class CustomFractionChip extends CustomChip {
  final int numerator;
  final int denominator;

  CustomFractionChip({
    super.key,
    required this.numerator,
    required this.denominator,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.snow,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: AppColors.coolgray),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: Text(
              '$numerator',
              style: AppTextStyles.subheading.copyWith(
                color: AppColors.darkgray,
              ),
            ),
          ),
          Text(
            '/',
            style: AppTextStyles.subheading.copyWith(color: AppColors.darkgray),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: Text(
              '$denominator',
              style: AppTextStyles.subheading.copyWith(
                color: AppColors.darkgray,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomIconChip extends CustomChip {
  final String text;
  final bool isSelected;
  final void Function() onPressed;
  final CustomChipSize chipSize;
  final CustomChipColor chipColor;
  final double maxWidth;

  CustomIconChip({
    super.key,
    required this.text,
    this.isSelected = false,
    required this.onPressed,
    this.chipSize = CustomChipSize.regular,
    this.chipColor = CustomChipColor.gray,
    this.maxWidth = 100,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: chipSize == CustomChipSize.small ? 8 : 12,
        vertical: 4,
      ),
      decoration: BoxDecoration(
        color:
            chipColor == CustomChipColor.gray
                ? AppColors.coolgray
                : AppColors.orange,
        borderRadius: BorderRadius.circular(64),
      ),
      child: InkWell(
        onTap: onPressed,
        child: Container(
          constraints: BoxConstraints(maxWidth: maxWidth),
          height: chipSize == CustomChipSize.small ? 24 : 36,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: Text(
                  text,
                  style:
                      chipSize == CustomChipSize.small
                          ? AppTextStyles.body
                          : AppTextStyles.subheading,
                  softWrap: true,
                  maxLines: null,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              isSelected
                  ? CustomIcon(
                    icon: Icons.close,
                    color: AppColors.darkgray,
                    size: chipSize == CustomChipSize.small ? 16 : 24,
                  )
                  : SizedBox.shrink(),
            ],
          ),
        ),
      ),
    );
  }
}

enum CustomChipSize { small, regular }

enum CustomChipColor { gray, orange }
