import 'package:flutter/material.dart';
import 'package:studia/core/core.dart';
import 'package:studia/core/data/datasources/local/drift/database.dart';

class LevelItem extends StatelessWidget {
  final Levels level;
  final double? progress;
  final LevelItemWidth width;
  final Function(Levels) onPressed;

  const LevelItem({
    super.key,
    required this.level,
    this.progress,
    this.width = LevelItemWidth.fill,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onPressed(level),
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: AppColors.gray),
        ),
        width: width == LevelItemWidth.fit ? null : double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(level.level_name, style: AppTextStyles.subheading),

            if (progress != null) ...[
              SizedBox(height: 12),
              CustomProgress(progress: progress!, size: ProgressBarSize.small),
            ],
          ],
        ),
      ),
    );
  }
}

enum LevelItemWidth { fit, fill }
