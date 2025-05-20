import 'package:flutter/material.dart';
import 'package:studia/core/theme/app_colors.dart';
import 'package:studia/core/theme/app_text_styles.dart';

enum AppButtonSize { small, regular }

enum AppButtonWidth { fit, fill }

enum AppButtonColor { orange, gray }

enum AppButtonType { primary, secondary, outlined, transparent }

class CustomButton extends StatelessWidget {
  final AppButtonType type;
  final VoidCallback? onPressed;
  final AppButtonSize size;
  final String? text;
  final Widget? leading;
  final Widget? trailing;
  final AppButtonColor color;
  final AppButtonWidth width;
  final bool isDisabled;

  const CustomButton({
    super.key,
    required this.onPressed,
    this.color = AppButtonColor.orange,
    this.type = AppButtonType.primary,
    this.size = AppButtonSize.regular,
    this.leading,
    this.trailing,
    this.width = AppButtonWidth.fit,
    this.text,
    this.isDisabled = false,
  });

  @override
  Widget build(BuildContext context) {
    dynamic bgColor;
    dynamic txtColor;
    dynamic borderColor;

    final double height;
    final EdgeInsets buttonPadding;
    final TextStyle textStyle;

    switch (type) {
      case AppButtonType.primary:
        bgColor =
            color == AppButtonColor.orange
                ? AppColors.orange
                : AppColors.darkgray;
        txtColor =
            color == AppButtonColor.orange ? AppColors.snow : AppColors.snow;
        borderColor = null;

        break;
      case AppButtonType.secondary:
        bgColor =
            color == AppButtonColor.orange
                ? AppColors.lightorange
                : AppColors.coolgray;
        txtColor =
            color == AppButtonColor.orange
                ? AppColors.powerorange
                : AppColors.darkgray;
        borderColor = null;

        break;
      case AppButtonType.outlined:
        bgColor = null;
        txtColor =
            color == AppButtonColor.orange
                ? AppColors.orange
                : AppColors.darkgray;
        borderColor =
            color == AppButtonColor.orange ? AppColors.orange : AppColors.gray;

        break;
      case AppButtonType.transparent:
        bgColor = AppColors.snow.withOpacity(0);
        txtColor =
            color == AppButtonColor.orange
                ? AppColors.orange
                : AppColors.darkgray;
        borderColor = null;
        break;
    }

    switch (size) {
      case AppButtonSize.small:
        buttonPadding = const EdgeInsets.symmetric(horizontal: 8);
        height = 36;
        textStyle = AppTextStyles.body.copyWith(color: txtColor);
        break;
      case AppButtonSize.regular:
        buttonPadding = const EdgeInsets.symmetric(horizontal: 12);
        height = 48;
        textStyle = AppTextStyles.subheading.copyWith(color: txtColor);
        break;
    }

    final finalPadding = buttonPadding;

    final child = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (leading != null) ...[leading!],
        if (text != null) ...[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(text!, style: textStyle),
          ),
        ],
        if (trailing != null) ...[trailing!],
      ],
    );

    if (isDisabled) {
      bgColor = bgColor?.withOpacity(0.7);
      txtColor = txtColor?.withOpacity(0.7);
      borderColor = borderColor?.withOpacity(0.7);
    }

    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        minimumSize: Size(
          width == AppButtonWidth.fit ? 0 : double.infinity,
          height,
        ),
        backgroundColor: bgColor,
        foregroundColor: txtColor,
        padding: finalPadding,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(height / 2),
          side: BorderSide(
            color: borderColor ?? Colors.transparent,
            width: borderColor != null ? 1 : 0,
          ),
        ),
        elevation: 0,
        disabledBackgroundColor:
            bgColor != null ? bgColor!.withOpacity(0.7) : AppColors.snow,
        disabledForegroundColor: txtColor.withOpacity(0.7),
      ),
      child: child,
    );
  }
}

class CustomElevatedButton extends StatelessWidget {
  final String? text;
  final Icon? icon;
  final VoidCallback onPressed;
  final AppButtonColor color;
  final AppButtonSize size;
  final AppButtonWidth width;
  final bool active;

  const CustomElevatedButton({
    Key? key,
    this.text,
    this.icon,
    required this.onPressed,
    this.color = AppButtonColor.orange,
    this.size = AppButtonSize.regular,
    this.width = AppButtonWidth.fit,
    this.active = true,
  });

  @override
  Widget build(BuildContext context) {
    final bgColor =
        color == AppButtonColor.orange
            ? AppColors.powerorange
            : AppColors.coolgray;
    final txtColor =
        color == AppButtonColor.orange ? AppColors.snow : AppColors.darkgray;
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: bgColor,
        foregroundColor: txtColor,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        elevation: 0,
        minimumSize: Size(double.infinity, 48),
        disabledBackgroundColor: bgColor.withOpacity(0.7),
        disabledForegroundColor: txtColor.withOpacity(0.7),
      ),
      onPressed: active ? onPressed : null,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (icon != null) ...[icon!, const SizedBox(width: 0)],
          if (text != null) ...[
            Text(
              text!,
              style: AppTextStyles.subheading.copyWith(color: txtColor),
              textAlign: icon != null ? TextAlign.start : TextAlign.center,
            ),
          ],
        ],
      ),
    );
  }
}
