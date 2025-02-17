import 'package:flutter/material.dart';

import 'app_colors.dart';

final class TextStylesEx extends ThemeExtension<TextStylesEx> {
  final TextStyle? bodyLargeEx;

  const TextStylesEx({
    this.bodyLargeEx,
  });

  @override
  TextStylesEx copyWith({
    TextStyle? bodyLargeEx,
  }) {
    return TextStylesEx(
      bodyLargeEx: bodyLargeEx ?? this.bodyLargeEx,
    );
  }

  @override
  TextStylesEx lerp(ThemeExtension<TextStylesEx>? other, double t) {
    if (other is! TextStylesEx) {
      return this;
    }
    return TextStylesEx(
      bodyLargeEx: bodyLargeEx,
    );
  }
}


const textStyleLight = TextStylesEx(
  bodyLargeEx: TextStyle(
    fontSize: 15,
    color: AppColors.white,
    fontWeight: FontWeight.w600,
  ),
);
