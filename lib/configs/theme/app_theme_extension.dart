import 'package:flutter/material.dart';

import 'app_colors.dart';

final class TextStylesEx extends ThemeExtension<TextStylesEx> {
  final TextStyle? bodyLargeEx;
  final TextStyle? labelSmallEx;

  const TextStylesEx({
    this.bodyLargeEx,
    this.labelSmallEx,
  });

  @override
  TextStylesEx copyWith({
    TextStyle? bodyLargeEx,
    TextStyle? labelSmallEx,
  }) {
    return TextStylesEx(
      bodyLargeEx: bodyLargeEx ?? this.bodyLargeEx,
      labelSmallEx: labelSmallEx ?? this.labelSmallEx,
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
);
