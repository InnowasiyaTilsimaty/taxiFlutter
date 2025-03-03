import 'package:flutter/material.dart';
import 'package:sheet/sheet.dart';

import '../../../configs/assets.dart';
import '../../../configs/theme/app_colors.dart';
import '../../../view_model/view_model.dart';

class OrderBottomSheet extends StatelessWidget {
  const OrderBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final makeOrderViewModel = context.watch<MakeOrderViewModel>();
    final chooseLocationOnMapViewModel = context.read<ChooseLocationOnMapViewModel>();

    return Sheet(
      backgroundColor: Colors.transparent,
      physics: const NeverDraggableSheetPhysics(),
      controller: context.read<OrderViewModel>().sheetController,
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
                      controller: makeOrderViewModel.addressControllers[0],
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
                    onPressed: () => chooseLocationOnMapViewModel.openBottomSheet(context, 1),
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
                      controller: makeOrderViewModel.addressControllers.length > 1
                          ? makeOrderViewModel.addressControllers[1]
                          : null,
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
                    onPressed: () => chooseLocationOnMapViewModel.openBottomSheet(context, 2),
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
                onPressed: () => context.read<MakeOrderViewModel>().openBottomSheet(context),
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
