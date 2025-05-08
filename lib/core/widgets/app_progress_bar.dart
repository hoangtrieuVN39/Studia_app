import 'package:flutter/material.dart';
import 'package:studia/core/core.dart';

class CustomProgressBar extends StatelessWidget {
  final double progress;
  final Color color;
  final ProgressBarSize size;

  const CustomProgressBar({
    super.key,
    required this.progress,
    required this.color,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.centerLeft,
      children: [
        Positioned(
          left: 0,
          right: 0,
          child: Container(
            height: size == ProgressBarSize.small ? 8 : 16,
            decoration: BoxDecoration(
              color: AppColors.coolgray,
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
        Positioned(
          left: 0,
          child: Container(
            width: MediaQuery.of(context).size.width * progress,
            height: size == ProgressBarSize.small ? 8 : 16,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
      ],
    );
  }
}

enum ProgressBarSize { small, regular }

class CustomProgress extends StatelessWidget {
  final double progress;
  final Color color;
  final ProgressBarSize size;

  static const _LowMark = 0.33;
  static const _HighMark = 0.66;

  const CustomProgress({
    super.key,
    required this.progress,
    required this.color,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    Color barColor = switch (progress) {
      < _LowMark => AppColors.negative,
      > _HighMark => AppColors.positive,
      _ => AppColors.notice,
    };

    Color textColor = switch (progress) {
      < _LowMark => AppColors.negativeDark,
      > _HighMark => AppColors.positiveDark,
      _ => AppColors.noticeDark,
    };

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      spacing: 8,
      children: [
        Expanded(
          child: CustomProgressBar(
            progress: progress,
            color: barColor,
            size: size,
          ),
        ),
        Text(
          '${(progress * 100).toInt()}%',
          style: AppTextStyles.body.copyWith(color: textColor),
        ),
      ],
    );
  }
}
