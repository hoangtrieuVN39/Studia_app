import 'package:flutter/material.dart';
import 'package:studia/core/core.dart';
import 'package:studia/core/data/datasources/local/drift/database.dart';
import 'package:studia/features/information/domain/usecases/fetch_standard_details.dart';

class StandardItem extends StatefulWidget {
  final Standards standard;
  final Function(Standards) onPressed;
  final StandardItemWidth width;
  final double? progress;
  final bool showDescription;
  final List<StandardDetails>? substandards;

  const StandardItem({
    super.key,
    required this.standard,
    this.width = StandardItemWidth.fill,
    required this.onPressed,
    this.progress,
    this.showDescription = false,
    this.substandards,
  });

  @override
  State<StandardItem> createState() => _StandardItemState();
}

class _StandardItemState extends State<StandardItem> {
  bool _isExpanded = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => widget.onPressed(widget.standard),
      child: Container(
        padding: EdgeInsets.all(16),
        width: widget.width == StandardItemWidth.fit ? null : double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: AppColors.gray),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.standard.standard, style: AppTextStyles.subheading),
            if (widget.progress != null) ...[
              SizedBox(height: 12),
              CustomProgress(
                progress: widget.progress!,
                size: ProgressBarSize.small,
              ),
            ],
            if (widget.showDescription) ...[
              SizedBox(height: 12),
              Text(widget.standard.description!, style: AppTextStyles.body),
            ],
            if (widget.substandards != null &&
                widget.substandards!.isNotEmpty) ...[
              SizedBox(height: 12),
              CustomButton(
                onPressed: () {
                  setState(() {
                    _isExpanded = !_isExpanded;
                  });
                },
                text: '${widget.substandards!.length} Sub-standards',
                leading: Icon(
                  Icons.keyboard_arrow_down,
                  color: AppColors.darkgray,
                ),
                type: AppButtonType.transparent,
                color: AppButtonColor.gray,
                width: AppButtonWidth.fit,
              ),
            ],
            if (_isExpanded) ...[
              ...widget.substandards!.map(
                (substandard) => Column(
                  children: [
                    StandardItem(
                      standard: substandard.standard!,
                      onPressed: (standard) {
                        widget.onPressed.call(standard);
                      },
                      width: widget.width,
                      progress: substandard.progress,
                    ),
                    SizedBox(height: 12),
                  ],
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

enum StandardItemWidth { fit, fill }
