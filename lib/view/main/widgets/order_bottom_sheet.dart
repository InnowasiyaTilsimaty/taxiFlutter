import 'package:flutter/material.dart';

import '../../../configs/assets.dart';
import '../../../configs/theme/app_colors.dart';

class OrderBottomSheet extends StatelessWidget {
  const OrderBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 8,
            color: AppColors.black.withValues(alpha: 0.25),
          ),
        ],
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(30),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 35),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Sargyt etmek',
              style: textTheme.labelMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 18),
            Row(
              spacing: 10,
              children: [
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Salgyňyz...',
                      prefixIcon: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: SvgPicture.asset(Assets.location),
                      ),
                      prefixIconConstraints: const BoxConstraints(
                        minWidth: 24,
                        minHeight: 24,
                      ),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(48, 48),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(11),
                    ),
                  ),
                  icon: SvgPicture.asset(Assets.maps),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              spacing: 10,
              children: [
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Nirä gitmeli',
                      prefixIcon: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: SvgPicture.asset(Assets.finishFlag),
                      ),
                      prefixIconConstraints: const BoxConstraints(
                        minWidth: 24,
                        minHeight: 24,
                      ),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(48, 48),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(11),
                    ),
                  ),
                  icon: SvgPicture.asset(Assets.maps),
                ),
              ],
            ),
            const SizedBox(height: 18),
            ElevatedButton(
              onPressed: () {},
              child: Text(
                'Dowam etmek',
                style: textTheme.bodyMedium,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
