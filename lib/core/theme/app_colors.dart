import 'package:flutter/material.dart';

class AppColors {
  // Primary brand colors
  static const Color powerorange = Color(0xFFFF5001);
  static const Color lightorange = Color(0xFFF67011);

  // Neutral colors
  static const Color snow = Color(0xFFFBFBFB);
  static const Color coolgray = Color(0xFFEEEEEE);
  static const Color darkgray = Color(0xFF262626);
  static const Color void_ = Color(0xFF16151A);

  // Semantic colors - Base
  static const Color negative = Color(0xFFEA3829); // Error/Delete
  static const Color notice = Color(0xFFF68524); // Warning/Alert
  static const Color positive = Color(0xFF00BA60); // Success/Confirm

  // Accent colors
  static const Color blue = Color(0xFF1C65CB);
  static const Color pink = Color(0xFFFF58AF);

  // Semantic colors - Variations
  static const Color negativeDark = Color(
    0xFFC81E11,
  ); // Calculated: negative with 50% black overlay
  static const Color negativeLight = Color(
    0xFFF59C94,
  ); // Calculated: negative with 50% white overlay

  static const Color noticeDark = Color(
    0xFFC56B1D,
  ); // Calculated: notice with 20% black overlay
  static const Color noticeLight = Color(
    0xFFF9A459,
  ); // Calculated: notice with 20% white overlay

  static const Color positiveDark = Color(
    0xFF005D30,
  ); // Calculated: positive with 50% black overlay
  static const Color positiveLight = Color(
    0xFF80DDAF,
  ); // Calculated: positive with 50% white overlay

  // Accent color variations
  static const Color blueDark = Color(
    0xFF1651A2,
  ); // Calculated: blue with 20% black overlay
  static const Color blueLight = Color(
    0xFF4983D5,
  ); // Calculated: blue with 20% white overlay

  static const Color pinkDark = Color(
    0xFFCC468B,
  ); // Calculated: pink with 20% black overlay
  static const Color pinkLight = Color(
    0xFFFF7BC1,
  ); // Calculated: pink with 20% white overlay

  // Text colors (using existing naming but with new values)
  static const Color textPrimary = darkgray;
  static const Color textSecondary = Color(
    0xFF757575,
  ); // Preserved from previous
  static const Color textOnPrimary = snow;

  // Status colors (using existing naming but with new values)
  static const Color success = positive;
  static const Color error = negative;
  static const Color warning = notice;
  static const Color info = blue;

  // Other utility colors (preserved from previous)
  static const Color divider = coolgray;
  static const Color disabled = Color(0xFFBDBDBD); // Preserved from previous
  static const Color overlay = Color(0x80000000); // Preserved from previous

  // Surface/Background colors (using existing naming but with new values)
  static const Color backgroundColor = snow;
  static const Color surfaceColor = snow;
  static const Color cardColor = snow;

  // Helper method to create material color
  static MaterialColor createMaterialColor(Color color) {
    final strengths = <double>[.05, .1, .2, .3, .4, .5, .6, .7, .8, .9];
    final swatch = <int, Color>{};
    final int r = color.red, g = color.green, b = color.blue;

    for (final strength in strengths) {
      final double ds = 0.5 - strength;
      swatch[(strength * 1000).round()] = Color.fromRGBO(
        r + ((ds < 0 ? r : (255 - r)) * ds).round(),
        g + ((ds < 0 ? g : (255 - g)) * ds).round(),
        b + ((ds < 0 ? b : (255 - b)) * ds).round(),
        1,
      );
    }
    return MaterialColor(color.value, swatch);
  }

  // Brand color as a material color
  static final MaterialColor primarySwatch = createMaterialColor(powerorange);
}
