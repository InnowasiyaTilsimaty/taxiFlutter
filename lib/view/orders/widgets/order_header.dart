import 'package:flutter/material.dart';

import '../../../configs/theme/app_colors.dart';
import '../../../configs/theme/app_theme.dart';

class OrderHeader extends StatelessWidget {
  final String title;
  final String subtitle;

  const OrderHeader({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final textThemeEx = context.textThemeEx;

    return ListTile(
      minTileHeight: 37,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      contentPadding: const EdgeInsets.fromLTRB(16, 4, 16, 0),
      title: Text(
        title,
        style: textThemeEx.titleSmallEx,
      ),
      subtitle: Text(
        subtitle,
        style: textTheme.titleLarge,
      ),
      trailing: DecoratedBox(
        decoration: BoxDecoration(
          color: AppColors.pinkSoft,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4.5),
          child: Text(
            'Ýatyryldy',
            style: textThemeEx.errorTextSmall,
          ),
        ),
      ),
    );
  }
}
