import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../configs/assets.dart';
import '../../../view_model/view_model.dart';
import 'widgets.dart';

class MainIcons extends StatefulWidget {
  const MainIcons({super.key});

  @override
  State<MainIcons> createState() => _MainIconsState();
}

class _MainIconsState extends State<MainIcons> {
  @override
  void initState() {
    super.initState();
    context.read<OrderViewModel>().init();
    context.read<MakeOrderViewModel>().init();
    context.read<OrderInProgressViewModel>().init();
  }

  @override
  Widget build(BuildContext context) {
    final makeOrderViewModel = context.watch<MakeOrderViewModel>();
    final orderViewModel = context.watch<OrderViewModel>();
    final orderInProgressViewModel = context.watch<OrderInProgressViewModel>();
    final mapViewModel = context.watch<MapViewModel>();

    return Positioned(
      bottom: 0,
      right: 0,
      left: 0,
      child: SizedBox(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          spacing: 16,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: IconButton(
                onPressed: mapViewModel.currentPosition,
                icon: SvgPicture.asset(Assets.myLocation),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                right: 20,
                bottom:
                    orderViewModel.isBottomSheetVisible || makeOrderViewModel.isBottomSheetVisible
                        ? 0
                        : orderInProgressViewModel.isBottomSheetVisible
                            ? orderInProgressViewModel.sheetController.position.pixels + 16
                            : 111,
              ),
              child: IconButton(
                onPressed: () {
                  showDialog<void>(
                    context: context,
                    builder: (context) => const AlertContactsDialog(),
                  );
                },
                icon: SvgPicture.asset(Assets.call),
              ),
            ),
            if (orderViewModel.bottomPadding &&
                orderViewModel.sheetController.position.pixels > 100)
              AnimatedPadding(
                duration: const Duration(milliseconds: 100),
                padding: EdgeInsets.only(
                  right: 20,
                  bottom: orderViewModel.bottomPadding
                      ? orderViewModel.sheetController.position.pixels + 16
                      : 0,
                ),
                child: IconButton(
                  onPressed: context.read<OrderViewModel>().closeBottomSheet,
                  icon: SvgPicture.asset(Assets.x),
                ),
              ),
            if (makeOrderViewModel.isBottomSheetVisible)
              AnimatedPadding(
                duration: const Duration(milliseconds: 100),
                padding: EdgeInsets.only(
                  right: 20,
                  bottom: makeOrderViewModel.sheetController.position.pixels + 16,
                ),
                child: IconButton(
                  onPressed: () => context.read<MakeOrderViewModel>().closeBottomSheet(context),
                  icon: SvgPicture.asset(Assets.arrowLeft),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
