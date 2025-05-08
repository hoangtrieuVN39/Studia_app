import 'package:flutter/material.dart';
import 'package:studia/core/core.dart';

class CustomAppBar {
  static AppBar build(
    BuildContext context,
    String title, {
    Widget? leading,
    Widget? actions,
  }) {
    return AppBar(
      toolbarHeight: 64,
      backgroundColor: AppColors.snow,
      elevation: 0,
      leadingWidth: 80,
      leading: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: leading,
      ),
      actionsPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      title: ShaderMask(
        shaderCallback:
            (bounds) => const LinearGradient(
              colors: [AppColors.powerorange, AppColors.orange, AppColors.snow],
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
            ).createShader(bounds),
        child: Text(
          title,
          style: AppTextStyles.h2.copyWith(color: AppColors.snow),
        ),
      ),
      actions: actions != null ? [actions] : null,
    );
  }
}
