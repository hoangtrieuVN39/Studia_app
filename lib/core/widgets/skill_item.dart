import 'package:flutter/material.dart';
import 'package:studia/core/core.dart';
import 'package:studia/core/data/datasources/local/drift/database.dart';

class SkillItem extends StatelessWidget {
  final Skills skill;
  final Domains? domain;
  final double? progress;
  final Function(Skills) onPressed;
  final SkillItemWidth width;

  const SkillItem({
    super.key,
    required this.skill,
    this.domain,
    this.progress,
    this.width = SkillItemWidth.fill,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onPressed(skill),
      child: Container(
        padding: EdgeInsets.all(16),
        width: width == SkillItemWidth.fit ? null : double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: AppColors.gray),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (domain != null) ...[
              CustomIconChip(
                text: domain!.domain_name,
                onPressed: () {},
                chipColor: CustomChipColor.gray,
                chipSize: CustomChipSize.small,
                chipWidth: CustomChipWidth.fit,
              ),
              SizedBox(height: 8),
            ],
            Text(skill.skill_name, style: AppTextStyles.subheading),
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

enum SkillItemWidth { fit, fill }
