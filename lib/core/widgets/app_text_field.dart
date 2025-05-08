import 'package:flutter/material.dart';
import 'package:studia/core/core.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final String hint;
  final Function(String) onChanged;

  CustomTextField({
    required this.label,
    required this.hint,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: AppTextStyles.h3),
        const SizedBox(height: 8),
        TextField(
          onChanged: onChanged,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: hint,
            hintStyle: AppTextStyles.body.copyWith(
              color: AppColors.darkgray.withOpacity(0.5),
            ),
            fillColor: AppColors.coolgray,
            filled: true,
          ),
          style: AppTextStyles.body.copyWith(color: AppColors.darkgray),
        ),
      ],
    );
  }
}
