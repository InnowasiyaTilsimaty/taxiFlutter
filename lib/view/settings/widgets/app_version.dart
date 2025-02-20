import 'package:flutter/material.dart';

import '../../../configs/theme/app_theme.dart';

class AppVersion extends StatelessWidget {
  const AppVersion({super.key});

  @override
  Widget build(BuildContext context) {
    final textThemeEx = context.textThemeEx;

    return Text(
      'Taksist v4.06',
      textAlign: TextAlign.center,
      style: textThemeEx.bodySmallEx,
    );
  }
}
