import 'package:flutter/material.dart';
import 'package:studia/core/theme/app_colors.dart';
import 'package:studia/core/theme/app_text_styles.dart';

enum AppButtonSize { small, regular }

enum AppButtonWidth { fit, fill }

enum AppButtonColor { orange, gray }

enum AppButtonType { primary, secondary, outlined, text }

class AppButton extends StatelessWidget {
  final AppButtonType type;
  final VoidCallback? onPressed;
  final bool isLoading;
  final AppButtonSize size;
  final String? text;
  final Widget? leading;
  final Widget? trailing;
  final AppButtonColor color;
  final AppButtonWidth width;

  const AppButton({
    Key? key,
    required this.onPressed,
    this.color = AppButtonColor.orange,
    this.type = AppButtonType.primary,
    this.isLoading = false,
    this.size = AppButtonSize.regular,
    this.leading,
    this.trailing,
    this.width = AppButtonWidth.fit,
    this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bgColor =
        color == AppButtonColor.orange
            ? AppColors.powerorange
            : AppColors.coolgray;
    final txtColor =
        color == AppButtonColor.orange ? AppColors.snow : AppColors.darkgray;

    final double height;
    final EdgeInsets buttonPadding;
    final TextStyle textStyle;

    switch (size) {
      case AppButtonSize.small:
        height = 36;
        buttonPadding = const EdgeInsets.symmetric(horizontal: 16);
        textStyle = AppTextStyles.body.copyWith(color: txtColor);
        break;
      case AppButtonSize.regular:
        height = 48;
        buttonPadding = const EdgeInsets.symmetric(horizontal: 24);
        textStyle = AppTextStyles.subheading.copyWith(color: txtColor);
        break;
    }

    final finalPadding = buttonPadding;

    final child = Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (isLoading)
          SizedBox(
            width: 20,
            height: 20,
            child: CircularProgressIndicator(
              strokeWidth: 2,
              valueColor: AlwaysStoppedAnimation<Color>(txtColor),
            ),
          )
        else ...[
          if (leading != null) ...[leading!, const SizedBox(width: 8)],
          if (text != null) ...[Text(text!, style: textStyle)],
          if (trailing != null) ...[const SizedBox(width: 8), trailing!],
        ],
      ],
    );

    return SizedBox(
      height: height,
      width: width == AppButtonWidth.fit ? null : double.infinity,
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: bgColor,
          foregroundColor: txtColor,
          padding: finalPadding,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(height / 2)),
          ),
          elevation: 0,
          disabledBackgroundColor: bgColor.withOpacity(0.7),
          disabledForegroundColor: txtColor.withOpacity(0.7),
        ),
        child: child,
      ),
    );
  }
}
