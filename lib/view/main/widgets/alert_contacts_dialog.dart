import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../configs/assets.dart';
import '../../../configs/theme/app_colors.dart';
import '../../../configs/theme/app_theme.dart';
import '../../../view_model/view_model.dart';

class AlertContactsDialog extends StatelessWidget {
  const AlertContactsDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final textThemeEx = context.textThemeEx;
    final settingsViewModel = context.read<SettingsViewModel>();

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
              'Operatora bilen habarlaşmak',
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
            spacing: 6,
            mainAxisSize: MainAxisSize.min,
            children: [
              ContactTile(
                title: '+993 64 92 93 40',
                onTap: () => settingsViewModel.makePhoneCall('+99364929340'),
              ),
              ContactTile(
                title: '+993 64 92 93 40',
                onTap: () => settingsViewModel.makePhoneCall('+99364929340'),
              ),
              ContactTile(
                title: '+993 64 92 93 40',
                onTap: () => settingsViewModel.makePhoneCall('+99364929340'),
              ),
            ],
          ),
        ),
        actions: <Widget>[
          ElevatedButton(
            child: Text(
              'Jaň etmek',
              style: textThemeEx.bodyLargeEx,
            ),
            onPressed: () => settingsViewModel.makePhoneCall('+99364929340'),
          ),
        ],
      ),
    );
  }
}

class ContactTile extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const ContactTile({
    super.key,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return ListTile(
      onTap: onTap,
      title: Text(
        title,
        style: textTheme.titleMedium,
      ),
      contentPadding: const EdgeInsets.only(left: 10),
      dense: true,
      minTileHeight: 38,
      tileColor: AppColors.backgroundGray,
      shape: RoundedRectangleBorder(
        side: const BorderSide(color: AppColors.gray),
        borderRadius: BorderRadius.circular(10),
      ),
      trailing: IconButton(
        style: IconButton.styleFrom(
          backgroundColor: AppColors.primary,
          padding: const EdgeInsets.all(4),
          minimumSize: const Size(24, 24),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
          ),
        ),
        icon: SvgPicture.asset(
          Assets.call,
          height: 16,
        ),
        onPressed: onTap,
      ),
    );
  }
}
