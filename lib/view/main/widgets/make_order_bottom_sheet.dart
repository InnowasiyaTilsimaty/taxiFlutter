import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sheet/sheet.dart';

import '../../../configs/assets.dart';
import '../../../configs/components/car_type_card.dart';
import '../../../configs/components/make_order_text_field.dart';
import '../../../configs/extension.dart';
import '../../../configs/theme/app_colors.dart';
import '../../../view_model/view_model.dart';

class MakeOrderBottomSheet extends StatelessWidget {
  const MakeOrderBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final viewModel = context.watch<MakeOrderViewModel>();

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
              AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                height: viewModel.addressControllers.length > 2 ? 140 : 115,
                child: ListView(
                  physics: const ScrollPhysics(),
                  children: [
                    Column(
                      spacing: 12,
                      children: [
                        ...viewModel.addressControllers.mapIndexed(
                          (controller, index) => MakeOrderTextField(
                            controller: controller,
                            index: index,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const CarTypeCard(),
              const SizedBox(height: 12),
              const MakeOrderTile(
                title: 'Teswir',
                icon: Assets.comment,
              ),
              const SizedBox(height: 8),
              const MakeOrderTile(
                title: 'Sargydyň wagty',
                icon: Assets.calendar,
              ),
              const SizedBox(height: 12),
              ElevatedButton(
                onPressed: () => context
                    .read<MakeOrderViewModel>()
                    .closeBottomSheet(context),
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

class MakeOrderTile extends StatelessWidget {
  final String title;
  final String icon;
  const MakeOrderTile({
    super.key,
    required this.title,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Material(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: ListTile(
          onTap: () {},
          title: Text(
            title,
            style: textTheme.titleMedium,
          ),
          contentPadding: const EdgeInsets.only(left: 10),
          dense: true,
          minTileHeight: 38,
          leading: SvgPicture.asset(icon),
          tileColor: AppColors.backgroundGray,
          shape: RoundedRectangleBorder(
            side: const BorderSide(color: AppColors.gray),
            borderRadius: BorderRadius.circular(10),
          ),
          trailing: IconButton(
            icon: SvgPicture.asset(Assets.chevronRight),
            onPressed: () {},
          ),
        ),
      ),
    );
  }
}
