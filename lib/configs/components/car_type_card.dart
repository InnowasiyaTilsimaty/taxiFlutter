import 'package:flutter/material.dart';

import '../assets.dart';
import '../theme/app_colors.dart';

class CarTypeCard extends StatelessWidget {
  const CarTypeCard({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 12,
      ),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: AppColors.backgroundGray,
          border: Border.all(color: AppColors.primary),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(11, 4, 11, 3),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                Assets.standartCar,
                width: 37,
                height: 26,
              ),
              Text(
                'Standart',
                style: textTheme.labelSmall,
              ),
              const SizedBox(height: 10),
              Text(
                '20.0 TMT',
                style: textTheme.titleSmall,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
