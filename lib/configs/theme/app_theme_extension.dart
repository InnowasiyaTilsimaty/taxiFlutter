import 'package:flutter/material.dart';

import 'app_colors.dart';

final class TextStylesEx extends ThemeExtension<TextStylesEx> {
  final TextStyle? bodyLargeEx;
  final TextStyle? titleMediumEx;
  final TextStyle? titleSmallEx;
  final TextStyle? labelSmallEx;
  final TextStyle? errorTextMedium;
  final TextStyle? errorTextSmall;
  final TextStyle? bodySmallEx;

  const TextStylesEx({
    this.bodyLargeEx,
    this.titleMediumEx,
    this.titleSmallEx,
    this.labelSmallEx,
    this.errorTextMedium,
    this.errorTextSmall,
    this.bodySmallEx,
  });

  @override
  TextStylesEx copyWith({
    TextStyle? bodyLargeEx,
    TextStyle? titleMediumEx,
    TextStyle? titleSmallEx,
    TextStyle? labelSmallEx,
    TextStyle? errorTextMedium,
    TextStyle? errorTextSmall,
    TextStyle? bodySmallEx,
  }) {
    return TextStylesEx(
      bodyLargeEx: bodyLargeEx ?? this.bodyLargeEx,
      titleMediumEx: titleMediumEx ?? this.titleMediumEx,
      titleSmallEx: titleSmallEx ?? this.titleSmallEx,
      labelSmallEx: labelSmallEx ?? this.labelSmallEx,
      errorTextMedium: errorTextMedium ?? this.errorTextMedium,
      errorTextSmall: errorTextSmall ?? this.errorTextSmall,
      bodySmallEx: bodySmallEx ?? this.bodySmallEx,
    );
  }

  @override
  TextStylesEx lerp(ThemeExtension<TextStylesEx>? other, double t) {
    if (other is! TextStylesEx) {
      return this;
    }
    return TextStylesEx(
      bodyLargeEx: bodyLargeEx,
      titleMediumEx: titleMediumEx,
      titleSmallEx: titleSmallEx,
      labelSmallEx: labelSmallEx,
      errorTextMedium: errorTextMedium,
      errorTextSmall: errorTextSmall,
      bodySmallEx: bodySmallEx,
    );
  }
}


const textStyleLight = TextStylesEx(
  bodyLargeEx: TextStyle(
    fontSize: 15,
    color: AppColors.white,
    fontWeight: FontWeight.w600,
  ),
  titleMediumEx: TextStyle(
    fontSize: 14,
    color: AppColors.white,
    fontWeight: FontWeight.w700,
  ),
  titleSmallEx: TextStyle(
    fontSize: 12,
    color: AppColors.black,
    fontWeight: FontWeight.w400,
  ),
  labelSmallEx: TextStyle(
    fontSize: 10,
    color: AppColors.black,
    fontWeight: FontWeight.w500,
  ),
  errorTextMedium: TextStyle(
    fontSize: 16,
    color: AppColors.red,
    fontWeight: FontWeight.w400,
  ),
  errorTextSmall: TextStyle(
    fontSize: 12,
    color: AppColors.red,
    fontWeight: FontWeight.w400,
  ),
  bodySmallEx: TextStyle(
    fontSize: 10,
    color: AppColors.black,
    fontWeight: FontWeight.w300,
  ),
);
