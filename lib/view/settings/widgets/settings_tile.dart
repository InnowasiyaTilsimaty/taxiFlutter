import 'package:flutter/material.dart';

import '../../../configs/assets.dart';
import '../../../configs/theme/app_colors.dart';

class SettingsTile extends StatelessWidget {
  const SettingsTile({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.backgroundGray,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          ListTile(
            onTap: (){},
            leading: SvgPicture.asset(Assets.refresh),
            title: Text(
              'Sargytlar',
              style: textTheme.labelLarge,
            ),
            trailing: SvgPicture.asset(Assets.chevronRight),
          ),
          const Divider(),
          ListTile(
            onTap: (){},
            leading: SvgPicture.asset(Assets.notification),
            title: Text(
              'Bildirişler ',
              style: textTheme.labelLarge,
            ),
            trailing: SvgPicture.asset(Assets.chevronRight),
          ),
          const Divider(),
          ListTile(
            onTap: (){},
            leading: SvgPicture.asset(Assets.document),
            title: Text(
              'Ulanyş düzgünleri',
              style: textTheme.labelLarge,
            ),
            trailing: SvgPicture.asset(Assets.chevronRight),
          ),
        ],
      ),
    );
  }
}
