import 'package:flutter/material.dart';

import '../../../configs/assets.dart';
import '../../../configs/routes/routes.dart';
import '../../../configs/theme/app_colors.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MainAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: false,
      titleSpacing: 20,
      title: SvgPicture.asset(Assets.logoSmall, height: 30),
      actions: [
        InkWell(
          onTap: () => Navigator.pushNamed(
            context,
            RouteNames.settings,
          ),
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: AppColors.backgroundGray,
              border: Border.all(color: AppColors.gray),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: SvgPicture.asset(Assets.menuBurger),
            ),
          ),
        ),
        const SizedBox(width: 20),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
