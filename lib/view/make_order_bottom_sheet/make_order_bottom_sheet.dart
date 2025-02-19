import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sheet/sheet.dart';

import '../../configs/theme/app_colors.dart';
import '../../view_model/view_model.dart';
import 'widgets/widgets.dart';

class MakeOrderBottomSheet extends StatelessWidget {
  const MakeOrderBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Sheet(
      backgroundColor: Colors.transparent,
      physics: const NeverDraggableSheetPhysics(),
      controller: context.read<MakeOrderViewModel>().sheetController,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: AppColors.white,
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
          padding: const EdgeInsets.fromLTRB(10, 24, 10, 35),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                child: Text(
                  'Sargyt etmek',
                  style: textTheme.labelMedium,
                ),
              ),
              const SizedBox(height: 18),
              const MakeOrderTextField(),
              const CarTypeCard(),
              const SizedBox(height: 12),
              const MakeOrderTile(),
              const SizedBox(height: 12),
              ElevatedButton(
                onPressed: () =>
                    context.read<MakeOrderViewModel>().continueOrder(context),
                child: Text(
                  'Dowam etmek',
                  style: textTheme.bodyMedium,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
