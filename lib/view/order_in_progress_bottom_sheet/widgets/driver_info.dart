import 'package:flutter/material.dart';

import '../../../configs/assets.dart';
import '../../../configs/theme/app_colors.dart';

class DriverInfo extends StatelessWidget {
  const DriverInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 12,
      children: [
        DriverInfoItem(
          title: 'Mersedes- Benz AMG GT (2012)',
          leading: Image.asset(Assets.standartCar, width: 37, height: 26),
        ),
        const DriverInfoItem(
          title: 'Mersedes- Benz AMG GT (2012)',
        ),
      ],
    );
  }
}

class DriverInfoItem extends StatelessWidget {
  final String title;
  final Widget? leading;
  const DriverInfoItem({
    super.key,
    required this.title,
    this.leading,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Material(
      color: Colors.transparent,
      child: ListTile(
        dense: true,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        tileColor: AppColors.backgroundGray,
        leading: leading,
        title: Text(
          title,
          style: textTheme.titleSmall,
        ),
      ),
    );
  }
}
