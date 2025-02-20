import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

class SettingsAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const SettingsAppBar({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return AppBar(
      title: Text(
        title,
        style: textTheme.titleLarge,
      ),
      leading: const BackButton(
        style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(
            Colors.transparent,
          ),
          iconColor: WidgetStatePropertyAll(AppColors.black),
        ),
      ),
      centerTitle: true,
      bottom: const PreferredSize(
        preferredSize: Size(double.infinity, 1),
        child: Divider(color: AppColors.gray),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
