import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:studia/core/core.dart';
import 'package:studia/core/data/datasources/local/drift/database.dart';

enum StandardBoxType { progress, done, disabled, minimized }

class StandardBox extends StatefulWidget {
  final StandardBoxType type;
  final Standards standard;
  final Standards? prerequisite;
  final double performance;
  final bool isMinimized;
  final void Function() onTapViewInfo;
  final void Function() onTapPlay;

  const StandardBox(
    this.standard, {
    super.key,
    required this.type,
    required this.isMinimized,
    required this.onTapViewInfo,
    required this.onTapPlay,
    this.prerequisite,
    required this.performance,
  });

  @override
  State<StandardBox> createState() => _StandardBoxState();
}

class _StandardBoxState extends State<StandardBox> {
  bool isExpanded = true;

  @override
  Widget build(BuildContext context) {
    final progressBar =
        widget.prerequisite == null
            ? [
              Container(
                width: double.infinity,
                height: 16,
                child: CustomProgress(
                  progress: widget.performance,
                  color: AppColors.orange,
                  size: ProgressBarSize.small,
                ),
              ),
            ]
            : [];

    final viewButton =
        widget.prerequisite == null
            ? [
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: CustomButton(
                      onPressed: () => widget.onTapViewInfo(),
                      type: AppButtonType.transparent,
                      text: 'View Info',
                    ),
                  ),
                  Expanded(
                    child: CustomButton(
                      onPressed: () => widget.onTapPlay(),
                      type: AppButtonType.primary,
                      text: 'Play',
                    ),
                  ),
                ],
              ),
            ]
            : [];

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: isExpanded ? AppColors.snow : AppColors.orange,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.orange),
      ),
      child: switch (isExpanded) {
        true => Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: () {
                setState(() {
                  isExpanded = !isExpanded;
                });
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          widget.standard.standard,
                          style: AppTextStyles.subheading,
                        ),
                      ),
                      CustomIcon(
                        icon: Icons.keyboard_arrow_down_rounded,
                        size: 24,
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Text(
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                    widget.standard.description ?? '',
                    style: AppTextStyles.body.copyWith(
                      color: AppColors.darkgray,
                    ),
                  ),
                  const SizedBox(height: 12),
                  ...progressBar,
                ],
              ),
            ),
            ...viewButton,
          ],
        ),
        false => Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: InkWell(
                onTap: () {
                  setState(() {
                    isExpanded = !isExpanded;
                  });
                },
                child: Text(
                  widget.standard.standard,
                  style: AppTextStyles.subheading.copyWith(
                    color: AppColors.snow,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 12),
            CustomButton(
              onPressed: () => widget.onTapViewInfo(),
              type: AppButtonType.outlined,
              color: AppButtonColor.gray,
              leading: CustomIcon(
                icon: Icons.notes_rounded,
                size: 24,
                color: AppColors.snow,
              ),
            ),
            const SizedBox(width: 12),
            CustomButton(
              onPressed: () => widget.onTapPlay(),
              type: AppButtonType.secondary,
              color: AppButtonColor.orange,
              leading: CustomIcon(
                icon: Icons.keyboard_arrow_right_rounded,
                size: 24,
                color: AppColors.orange,
              ),
            ),
          ],
        ),
      },
    );
  }
}
