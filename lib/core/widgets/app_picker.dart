import 'package:flutter/material.dart';
import 'package:studia/core/core.dart';
import 'package:studia/core/widgets/app_icon.dart';

class CustomPicker extends StatelessWidget {
  final String label;
  final String value;
  final Function() onTap;
  final IconData icon;

  const CustomPicker({
    super.key,
    required this.label,
    required this.value,
    required this.onTap,
    this.icon = Icons.keyboard_arrow_down_rounded,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => onTap(),
      style: TextButton.styleFrom(
        minimumSize: Size.fromHeight(48),
        backgroundColor: AppColors.coolgray,
        foregroundColor: AppColors.darkgray,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              value,
              style: AppTextStyles.body.copyWith(color: AppColors.darkgray),
            ),
          ),
          const CustomIcon(
            icon: Icons.keyboard_arrow_down_rounded,
            color: AppColors.darkgray,
            size: 24,
          ),
        ],
      ),
    );
  }
}
