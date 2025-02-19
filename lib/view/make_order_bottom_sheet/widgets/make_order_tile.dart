import 'package:flutter/material.dart';

import '../../../configs/assets.dart';
import '../../../configs/theme/app_colors.dart';
import 'alert_comment_dialog.dart';

class MakeOrderTile extends StatelessWidget {
  const MakeOrderTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 8,
      children: [
        _MakeOrderTile(
          onTap: () => showDialog<void>(
            context: context,
            builder: (context) => const AlertCommentDialog(),
          ),
          title: 'Teswir',
          icon: Assets.comment,
        ),
        _MakeOrderTile(
          onTap: () {},
          title: 'Sargydyň wagty',
          icon: Assets.calendar,
        ),
      ],
    );
  }
}

class _MakeOrderTile extends StatelessWidget {
  final String title;
  final String icon;
  final VoidCallback onTap;

  const _MakeOrderTile({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Material(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: ListTile(
          onTap: onTap,
          title: Text(
            title,
            style: textTheme.titleMedium,
          ),
          contentPadding: const EdgeInsets.only(left: 10),
          dense: true,
          minTileHeight: 38,
          leading: SvgPicture.asset(icon),
          tileColor: AppColors.backgroundGray,
          shape: RoundedRectangleBorder(
            side: const BorderSide(color: AppColors.gray),
            borderRadius: BorderRadius.circular(10),
          ),
          trailing: IconButton(
            icon: SvgPicture.asset(Assets.chevronRight),
            onPressed: onTap,
          ),
        ),
      ),
    );
  }
}
