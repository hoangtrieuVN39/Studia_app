import 'package:flutter/material.dart';
import 'package:studia/core/core.dart';

class CustomTextField extends StatefulWidget {
  final String? label;
  final String hint;
  final Function(String) onChanged;
  final String? initialValue;

  CustomTextField({
    this.label,
    required this.hint,
    required this.onChanged,
    this.initialValue,
  });

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.initialValue);
  }

  @override
  void didUpdateWidget(CustomTextField oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.initialValue != oldWidget.initialValue) {
      if (_controller.text != widget.initialValue) {
        _controller.text = widget.initialValue ?? '';
      }
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.label != null) ...[
          Text(widget.label!, style: AppTextStyles.h3),
          const SizedBox(height: 8),
        ],
        TextField(
          controller: _controller,
          onChanged: widget.onChanged,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: widget.hint,
            hintStyle: AppTextStyles.body.copyWith(
              color: AppColors.darkgray.withOpacity(0.5),
            ),
            fillColor: AppColors.coolgray,
            filled: true,
          ),
          style: AppTextStyles.body.copyWith(color: AppColors.darkgray),
        ),
      ],
    );
  }
}
