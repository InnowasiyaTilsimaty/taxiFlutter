import 'dart:ui';

import 'package:flutter/material.dart';
import '../../../configs/assets.dart';
import '../../../configs/theme/app_colors.dart';
import '../../../configs/theme/app_theme.dart';

class AlertCommentDialog extends StatelessWidget {
  const AlertCommentDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final textThemeEx = context.textThemeEx;

    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
      child: AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
        ),
        backgroundColor: AppColors.white,
        contentPadding: const EdgeInsets.symmetric(horizontal: 14),
        insetPadding: const EdgeInsets.symmetric(horizontal: 15),
        titlePadding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 6,
        ),
        actionsPadding: const EdgeInsets.all(14),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(width: 24),
            Text(
              'Teswir ýazmak',
              style: textTheme.labelMedium,
            ),
            IconButton(
              style: IconButton.styleFrom(
                minimumSize: const Size(24, 24),
                backgroundColor: AppColors.red,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: SvgPicture.asset(Assets.x),
            ),
          ],
        ),
        content: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            spacing: 8,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Bellik...',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                maxLines: 4,
                minLines: 4,
              ),
              Text(
                '0/250',
                style: textThemeEx.labelSmallEx,
              ),
            ],
          ),
        ),
        actions: <Widget>[
          ElevatedButton(
            child: Text(
              'Dowam etmek',
              style: textThemeEx.bodyLargeEx,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }
}
