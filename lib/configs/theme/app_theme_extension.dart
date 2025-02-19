import 'package:flutter/material.dart';

import 'app_colors.dart';

final class TextStylesEx extends ThemeExtension<TextStylesEx> {
  final TextStyle? bodyLargeEx;
  final TextStyle? labelSmallEx;
  final TextStyle? errorTextMedium;

  const TextStylesEx({
    this.bodyLargeEx,
    this.labelSmallEx,
    this.errorTextMedium,
  });

  @override
  TextStylesEx copyWith({
    TextStyle? bodyLargeEx,
    TextStyle? labelSmallEx,
    TextStyle? errorTextMedium,
  }) {
    return TextStylesEx(
      bodyLargeEx: bodyLargeEx ?? this.bodyLargeEx,
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
