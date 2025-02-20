import 'package:flutter/material.dart';

import '../../../configs/assets.dart';
import '../../../configs/theme/app_colors.dart';
import '../../../configs/theme/app_theme.dart';
import 'widgets.dart';

class OrderCard extends StatelessWidget {
  const OrderCard({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final textThemeEx = context.textThemeEx;

    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.backgroundGray,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          const OrderHeader(
            title: 'ID 54561',
            subtitle: '02.02.2025 23:02',
          ),
          const Divider(),
          ListTile(
            minTileHeight: 48,
            leading: SvgPicture.asset(Assets.location),
            title: Text(
              'Mati kösaýew(Mopra,2024)',
              style: textTheme.headlineSmall,
            ),
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.fromLTRB(14, 2, 16, 10),
            child: Row(
              spacing: 8,
              children: [
                IconButton(
                  onPressed: () {},
                  style: IconButton.styleFrom(
                    maximumSize: const Size(38, 38),
                    minimumSize: const Size(38, 38),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  icon: SvgPicture.asset(Assets.arrowRepeat),
                ),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.red,
                      maximumSize: const Size(double.infinity, 38),
                      minimumSize: const Size(double.infinity, 38),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text(
                      'Şikaýat etmek',
                      style: textThemeEx.bodyLargeEx,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
