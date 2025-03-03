import 'package:flutter/material.dart';
import 'package:sheet/sheet.dart';

import '../../../configs/assets.dart';
import '../../../configs/theme/app_colors.dart';
import '../../../view_model/view_model.dart';

class ChooseLocationOnMapBottomSheet extends StatelessWidget {
  const ChooseLocationOnMapBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final chooseLocationOnMapViewModel = context.watch<ChooseLocationOnMapViewModel>();
    final chooseLocationOnMapViewModelRead = context.read<ChooseLocationOnMapViewModel>();
    return Sheet(
      backgroundColor: Colors.transparent,
      physics: const NeverDraggableSheetPhysics(),
      controller: chooseLocationOnMapViewModelRead.sheetController,
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
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 35),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Nokadyñyzy saylañ',
                style: textTheme.labelMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 18),
              TextFormField(
                controller: chooseLocationOnMapViewModel.selectedController,
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
              const SizedBox(height: 18),
              ElevatedButton(
                onPressed: () => chooseLocationOnMapViewModelRead.chooseButton(context),
                child: Text(
                  'Saylamak',
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
