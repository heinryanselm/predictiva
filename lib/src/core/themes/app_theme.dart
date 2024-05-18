import 'package:flutter/material.dart';
import 'package:predictiva/src/core/resources/app_colors.dart';
import 'package:predictiva/src/core/themes/text/app_text_theme.dart';

import 'scheme/app_scheme.dart';

class AppTheme {
  AppTheme._();
  static ThemeData get get {
    final baseTheme = ThemeData.dark().copyWith(
      colorScheme: AppScheme.colors,
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      scaffoldBackgroundColor: AppScheme.colors.surface,
      cardTheme: CardTheme(
        color: AppScheme.colors.surface,
        elevation: 0,
        margin: const EdgeInsets.all(0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      dividerColor: AppColors.divider,
    );
    return baseTheme.copyWith(
      visualDensity: VisualDensity.adaptivePlatformDensity,
      textTheme: AppTextTheme.baseTextTheme(baseTheme.textTheme),
      datePickerTheme: baseTheme.datePickerTheme.copyWith(
        backgroundColor: Colors.white54,
        // backgroundColor: AppScheme.colors.onSecondary,
        inputDecorationTheme: InputDecorationTheme(
          border: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.divider,
              width: 1,
            ),
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.divider,
              width: 1,
            ),
          ),
          labelStyle: baseTheme.textTheme.bodyMedium?.copyWith(
            color: AppColors.white,
          ),
          hintStyle: baseTheme.textTheme.bodyMedium?.copyWith(
            color: AppColors.white.withOpacity(0.5),
          ),
        ),
      ),
    );
  }
}
