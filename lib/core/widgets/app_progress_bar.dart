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
    double barHeight = switch (size) {
      ProgressBarSize.small => 8,
      ProgressBarSize.regular => 16,
    };
    return Container(
      height: barHeight,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: AppColors.coolgray,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Align(
        alignment: Alignment.centerLeft,
        child: FractionallySizedBox(
          widthFactor: progress.clamp(0.0, 1.0),
          child: Container(
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
      ),
    );
  }
}

enum ProgressBarSize { small, regular }

class CustomProgress extends StatelessWidget {
  final double progress;
  final ProgressBarSize size;
  final bool showPercentage;

  static const _LowMark = 0.33;
  static const _HighMark = 0.66;

  const CustomProgress({
    super.key,
    required this.progress,
    required this.size,
    this.showPercentage = false,
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
      children: [
        Expanded(
          child: CustomProgressBar(
            progress: progress,
            color: barColor,
            size: size,
          ),
        ),
        if (showPercentage) ...[
          SizedBox(width: size == ProgressBarSize.small ? 8 : 16),
          Text(
            '${(progress * 100).toInt()}%',
            style:
                size == ProgressBarSize.small
                    ? AppTextStyles.body.copyWith(color: textColor)
                    : AppTextStyles.h4.copyWith(color: textColor),
          ),
        ],
      ],
    );
  }
}
