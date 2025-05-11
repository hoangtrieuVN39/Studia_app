import 'package:flutter/material.dart';
import 'package:studia/core/core.dart';

class CustomDialog {
  static void show(
    BuildContext context, {
    IconData? icon,
    String? title,
    String? description,
    List<CustomButton>? buttons,
  }) {
    showDialog(
      context: context,
      builder:
          (context) => SimpleDialog(
            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
            alignment: Alignment.center,
            children: [
              if (icon != null)
                Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: AppColors.lightorange,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(icon, size: 32, color: AppColors.powerorange),
                ),
              SizedBox(height: 16),
              if (title != null)
                Text(
                  title,
                  style: AppTextStyles.h3,
                  textAlign: TextAlign.center,
                ),

              if (description != null) ...[
                SizedBox(height: 8),
                Text(
                  description,
                  style: AppTextStyles.body,
                  textAlign: TextAlign.center,
                ),
              ],

              if (buttons != null) ...[
                SizedBox(height: 16),
                Row(children: buttons.map((e) => Expanded(child: e)).toList()),
              ],
            ],
          ),
    );
  }
}
