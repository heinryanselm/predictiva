import 'package:flutter/material.dart';
import 'package:predictiva/src/core/resources/app_colors.dart';

class AppScheme {
  AppScheme._();
  static final colors = ColorScheme.fromSeed(
    seedColor: AppColors.primary,
    secondary: AppColors.secondary,
    onSecondary: AppColors.onSecondary,
    surface: AppColors.primary,
    error: AppColors.red,
  );
}
