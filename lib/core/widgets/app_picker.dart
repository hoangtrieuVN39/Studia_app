import 'package:flutter/material.dart';
import 'package:studia/core/core.dart';
import 'package:studia/core/widgets/app_icon.dart';

class CustomPicker extends StatelessWidget {
  final String label;
  final String value;
  final Function() onTap;
  final IconData icon;
  final AppPickerWidth width;
  final AppPickerSize size;
  final AppPickerType type;

  const CustomPicker({
    super.key,
    required this.label,
    required this.value,
    required this.onTap,
    this.icon = Icons.keyboard_arrow_down_rounded,
    this.width = AppPickerWidth.fill,
    this.size = AppPickerSize.regular,
    this.type = AppPickerType.fill,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => onTap(),
      style: TextButton.styleFrom(
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        minimumSize: Size(
          AppPickerWidth.fit == width ? 0 : double.infinity,
          AppPickerSize.small == size ? 36 : 48,
        ),
        backgroundColor:
            type == AppPickerType.fill
                ? AppColors.coolgray
                : Colors.transparent,
        foregroundColor: AppColors.darkgray,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          ...width == AppPickerWidth.fill
              ? [
                Expanded(
                  child: Text(
                    value,
                    style: AppTextStyles.body.copyWith(
                      color: AppColors.darkgray,
                    ),
                  ),
                ),
                SizedBox(width: 8),
              ]
              : [
                Text(
                  value,
                  style: AppTextStyles.body.copyWith(color: AppColors.darkgray),
                ),
                SizedBox(width: 8),
              ],
          CustomIcon(icon: icon, color: AppColors.darkgray, size: 24),
        ],
      ),
    );
  }
}

enum AppPickerWidth { fill, fit }

enum AppPickerSize { small, regular }

enum AppPickerType { transparent, fill }
