import 'package:flutter/material.dart';

import 'app_colors.dart';

final class TextStylesEx extends ThemeExtension<TextStylesEx> {
  final TextStyle? bodyLargeEx;
  final TextStyle? titleSmallEx;
  final TextStyle? labelSmallEx;
  final TextStyle? errorTextMedium;

  const TextStylesEx({
    this.bodyLargeEx,
    this.titleSmallEx,
    this.labelSmallEx,
    this.errorTextMedium,
  });

  @override
  TextStylesEx copyWith({
    TextStyle? bodyLargeEx,
    TextStyle? titleSmallEx,
    TextStyle? labelSmallEx,
    TextStyle? errorTextMedium,
  }) {
    return TextStylesEx(
      bodyLargeEx: bodyLargeEx ?? this.bodyLargeEx,
      titleSmallEx: titleSmallEx ?? this.titleSmallEx,
      labelSmallEx: labelSmallEx ?? this.labelSmallEx,
      errorTextMedium: errorTextMedium ?? this.errorTextMedium,
    );
  }

  @override
  TextStylesEx lerp(ThemeExtension<TextStylesEx>? other, double t) {
    if (other is! TextStylesEx) {
      return this;
    }
    return TextStylesEx(
      bodyLargeEx: bodyLargeEx,
      titleSmallEx: titleSmallEx,
      labelSmallEx: labelSmallEx,
      errorTextMedium: errorTextMedium,
    );
  }
}


const textStyleLight = TextStylesEx(
  bodyLargeEx: TextStyle(
    fontSize: 15,
    color: AppColors.white,
    fontWeight: FontWeight.w600,
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
);
