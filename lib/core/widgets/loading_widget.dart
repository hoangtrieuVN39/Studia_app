import 'package:flutter/material.dart';
import 'package:studia/core/theme/app_colors.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.snow,
      child: Center(
        child: CircularProgressIndicator(
          backgroundColor: AppColors.snow,
          color: AppColors.orange,
        ),
      ),
    );
  }
}
