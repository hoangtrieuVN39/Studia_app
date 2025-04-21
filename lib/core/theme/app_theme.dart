import 'package:flutter/material.dart';
import 'package:studia/core/theme/app_colors.dart';
import 'package:studia/core/theme/app_text_styles.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.powerorange,
        primary: AppColors.powerorange,
        onPrimary: AppColors.textOnPrimary,
        secondary: AppColors.lightorange,
        onSecondary: AppColors.textOnPrimary,
        error: AppColors.error,
        background: AppColors.backgroundColor,
        surface: AppColors.surfaceColor,
      ),
      scaffoldBackgroundColor: AppColors.backgroundColor,
      cardColor: AppColors.cardColor,
      dividerColor: AppColors.divider,
      disabledColor: AppColors.disabled,

      // Text Theme
      textTheme: TextTheme(
        displayLarge: AppTextStyles.h1,
        displayMedium: AppTextStyles.h2,
        displaySmall: AppTextStyles.h3,
        headlineMedium: AppTextStyles.h4,
        titleLarge: AppTextStyles.subheading,
        titleMedium: AppTextStyles.body,
        bodyLarge: AppTextStyles.body,
        bodyMedium: AppTextStyles.body,
        bodySmall: AppTextStyles.caption,
        labelSmall: AppTextStyles.microcopy,
      ),

      // App Bar Theme
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.powerorange,
        foregroundColor: AppColors.textOnPrimary,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: AppTextStyles.h4.copyWith(
          color: AppColors.textOnPrimary,
        ),
      ),

      // Button Themes
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.powerorange,
          foregroundColor: AppColors.textOnPrimary,
          elevation: 2,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
          minimumSize: const Size(88, 48),
        ),
      ),

      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.powerorange,
          side: const BorderSide(color: AppColors.powerorange, width: 1.5),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
          minimumSize: const Size(88, 48),
        ),
      ),

      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: AppColors.powerorange,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
        ),
      ),

      // Card Theme
      cardTheme: CardTheme(
        color: AppColors.cardColor,
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        margin: const EdgeInsets.all(8),
      ),

      // Input Decoration Theme
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.surfaceColor,
        contentPadding: const EdgeInsets.symmetric(
          vertical: 16,
          horizontal: 16,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: AppColors.divider),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: AppColors.divider),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: AppColors.powerorange, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: AppColors.error, width: 1),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: AppColors.error, width: 2),
        ),
        labelStyle: AppTextStyles.body.copyWith(color: AppColors.textSecondary),
        hintStyle: AppTextStyles.body.copyWith(color: AppColors.textSecondary),
        errorStyle: AppTextStyles.caption.copyWith(color: AppColors.error),
      ),

      // Checkbox Theme
      checkboxTheme: CheckboxThemeData(
        fillColor: MaterialStateProperty.resolveWith<Color>((states) {
          if (states.contains(MaterialState.disabled)) {
            return AppColors.disabled;
          }
          return AppColors.powerorange;
        }),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      ),

      // Switch Theme
      switchTheme: SwitchThemeData(
        thumbColor: MaterialStateProperty.resolveWith<Color>((states) {
          if (states.contains(MaterialState.disabled)) {
            return AppColors.disabled;
          }
          if (states.contains(MaterialState.selected)) {
            return AppColors.powerorange;
          }
          return AppColors.surfaceColor;
        }),
        trackColor: MaterialStateProperty.resolveWith<Color>((states) {
          if (states.contains(MaterialState.disabled)) {
            return AppColors.disabled.withOpacity(0.5);
          }
          if (states.contains(MaterialState.selected)) {
            return AppColors.powerorange.withOpacity(0.5);
          }
          return AppColors.divider;
        }),
      ),

      // Dialog Theme
      dialogTheme: DialogTheme(
        backgroundColor: AppColors.surfaceColor,
        elevation: 8,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        titleTextStyle: AppTextStyles.h4,
        contentTextStyle: AppTextStyles.body,
      ),

      // Bottom Sheet Theme
      bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: AppColors.surfaceColor,
        elevation: 8,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
      ),
    );
  }

  static ThemeData get darkTheme {
    // Define dark theme here (similar to the light theme with darker colors)
    // For simplicity, I'm just returning the light theme for now
    return lightTheme;
  }
}
