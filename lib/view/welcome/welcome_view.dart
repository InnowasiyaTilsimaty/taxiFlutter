import 'package:flutter/material.dart';

import '../../configs/assets.dart';
import '../../configs/theme/app_colors.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final themeTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 37, vertical: 35),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Expanded(child: SizedBox(height: 10)),
            Expanded(
              child: Text(
                'Hoş geldiñiz!',
                style: themeTheme.displayMedium,
              ),
            ),
            DecoratedBox(
              decoration: BoxDecoration(
                color: AppColors.lightGray,
                borderRadius: BorderRadius.circular(5),
                border: Border.all(color: AppColors.mediumGray),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 6),
                child: Row(
                  spacing: 15,
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(Assets.tmFlag, width: 40, height: 25),
                    Image.asset(Assets.ruFlag, width: 40, height: 25),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 33),
            ElevatedButton(
              onPressed: () {},
              child: Text(
                'Içeri gir',
                style: themeTheme.bodyMedium,
              ),
            ),
            const SizedBox(height: 14),
            OutlinedButton(
              onPressed: () {},
              child: Text(
                'Agza bol',
                style: themeTheme.labelLarge,
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
