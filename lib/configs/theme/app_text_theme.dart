import 'package:flutter/material.dart';

import 'app_colors.dart';

final class AppTextTheme {
  AppTextTheme._();

  static const TextTheme lightTextTheme = TextTheme(
    displayMedium: TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.w700,
      color: AppColors.black,
    ),
    bodyMedium: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      color: AppColors.white,
    ),
    labelLarge: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      color: AppColors.black,
    ),
  );
}
