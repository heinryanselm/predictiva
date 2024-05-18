import 'package:flutter/material.dart';

import '../../resources/app_strings.dart';

class AppTextTheme {
  AppTextTheme._();
  static TextTheme baseTextTheme(TextTheme base) {
    return base
        .copyWith(
          headlineLarge: base.headlineLarge?.copyWith(
            fontWeight: FontWeight.bold,
          ),
          headlineMedium: base.headlineMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
          headlineSmall: base.headlineSmall?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        )
        .apply(
          fontFamily: AppStrings.fontFamily,
        );
  }
}
