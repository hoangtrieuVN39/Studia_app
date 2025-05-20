import 'package:flutter/material.dart';
import 'package:studia/core/core.dart';
import 'package:studia/core/data/datasources/local/drift/database.dart';

class DomainItem extends StatelessWidget {
  final Domains domain;
  final double? progress;
  final Function(Domains) onPressed;
  final DomainItemWidth width;

  const DomainItem({
    super.key,
    required this.domain,
    this.progress,
    required this.onPressed,
    this.width = DomainItemWidth.fill,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onPressed(domain),
      child: Container(
        padding: EdgeInsets.all(16),
        width: width == DomainItemWidth.fit ? null : double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: AppColors.gray),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(domain.domain_name, style: AppTextStyles.subheading),
            if (progress != null) SizedBox(height: 12),
            if (progress != null)
              CustomProgress(progress: progress!, size: ProgressBarSize.small),
          ],
        ),
      ),
    );
  }
}

enum DomainItemWidth { fill, fit }
