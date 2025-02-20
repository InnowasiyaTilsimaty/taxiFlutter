import 'package:flutter/material.dart';

import '../../../configs/theme/app_colors.dart';
import '../../../configs/theme/app_theme.dart';

class PhoneTile extends StatelessWidget {
  const PhoneTile({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final textThemeEx = context.textThemeEx;

    return ListTile(
      minTileHeight: 58,
      tileColor: AppColors.backgroundGray,
      title: Text(
        'Telefon',
        style: textThemeEx.titleSmallEx,
      ),
      subtitle: Text(
        '+993 64929340',
        style: textTheme.titleLarge,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
