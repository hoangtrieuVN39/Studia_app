import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTextStyles {
  // Typeface: SF Pro
  // These styles are based on the Studia typography system defined in Figma

  // H1 - Major page titles, hero text, prominent section headings
  static const TextStyle h1 = TextStyle(
    fontFamily: 'SF Pro',
    fontSize: 64,
    fontWeight: FontWeight.w500, // 700
    color: AppColors.textPrimary,
    letterSpacing: 0, // 0 spacing
    height: 1, // Line height
  );

  // H2 - Secondary titles, section subheadings, important labels
  static const TextStyle h2 = TextStyle(
    fontFamily: 'SF Pro',
    fontSize: 32,
    fontWeight: FontWeight.w500, // 400 Regular
    color: AppColors.textPrimary,
    letterSpacing: 0,
    height: 1,
  );

  // H3 - Tertiary titles, sub-section headings, break up long blocks of text
  static const TextStyle h3 = TextStyle(
    fontFamily: 'SF Pro',
    fontSize: 24,
    fontWeight: FontWeight.w400, // Semi-Bold
    color: AppColors.textPrimary,
    letterSpacing: 0,
    height: 1,
  );

  // H4 - Smaller section titles, call-to-action buttons
  static const TextStyle h4 = TextStyle(
    fontFamily: 'SF Pro',
    fontSize: 18,
    fontWeight: FontWeight.w600, // Medium
    color: AppColors.textPrimary,
    letterSpacing: 0,
    height: 1,
  );

  // Subheading - Smaller section titles, call-to-action buttons
  static const TextStyle subheading = TextStyle(
    fontFamily: 'SF Pro',
    fontSize: 16,
    fontWeight: FontWeight.w600, // Medium
    color: AppColors.textPrimary,
    letterSpacing: 0,
    height: 1,
  );

  // Body - Main content text, product descriptions, blog posts
  static const TextStyle body = TextStyle(
    fontFamily: 'SF Pro',
    fontSize: 14,
    fontWeight: FontWeight.w400, // Regular
    color: AppColors.textPrimary,
    letterSpacing: 0.15, // Letter spacing 0.15
    height: 1,
  );

  // Caption - Small labels, footnotes, image captions, disclaimers
  static const TextStyle caption = TextStyle(
    fontFamily: 'SF Pro',
    fontSize: 12,
    fontWeight: FontWeight.w500, // Regular
    color: AppColors.textSecondary,
    letterSpacing: 0.25, // Letter spacing 0.25
    height: 1,
  );

  // Microcopy - Fine print, legal notices, minor text elements
  static const TextStyle microcopy = TextStyle(
    fontFamily: 'SF Pro',
    fontSize: 10,
    fontWeight: FontWeight.w300, // Light
    color: AppColors.textSecondary,
    letterSpacing: 0.25, // Letter spacing 0.25
    height: 1,
  );

  // Helper methods for common modifications
  static TextStyle withColor(TextStyle style, Color color) {
    return style.copyWith(color: color);
  }

  static TextStyle withWeight(TextStyle style, FontWeight weight) {
    return style.copyWith(fontWeight: weight);
  }
}
