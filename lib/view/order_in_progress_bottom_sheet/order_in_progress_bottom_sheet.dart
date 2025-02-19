import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sheet/sheet.dart';

import '../../../configs/theme/app_colors.dart';
import '../../../view_model/view_model.dart';
import '../../configs/theme/app_theme.dart';
import 'widgets/widgets.dart';

class OrderInProgressBottomSheet extends StatelessWidget {
  const OrderInProgressBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final textThemeEx = context.textThemeEx;

    return Sheet(
      backgroundColor: Colors.transparent,
      physics: const NeverDraggableSheetPhysics(),
      controller: context.read<OrderInProgressViewModel>().sheetController,
      child: DecoratedBox(
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
          padding: const EdgeInsets.fromLTRB(20, 18, 20, 35),
          child: Column(
            spacing: 12,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Siziň sargydyňyz kabul edilýär',
                style: textTheme.labelMedium,
                textAlign: TextAlign.center,
              ),
              const DriverInfo(),
              const DriverWaitingTime(),
              OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: AppColors.red),
                ),
                child: Text(
                  'Sargydy ýatyrmak',
                  style: textThemeEx.errorTextMedium,
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  context
                      .read<OrderInProgressViewModel>()
                      .closeBottomSheet(context);
                },
                child: Text(
                  'Täze sargyt etmek',
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
