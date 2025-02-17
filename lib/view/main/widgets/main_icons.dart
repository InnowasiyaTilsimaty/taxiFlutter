import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../configs/assets.dart';
import '../../../view_model/order/order_view_model.dart';
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
  }

  @override
  Widget build(BuildContext context) {
    final orderViewModel = context.watch<OrderViewModel>();
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
                onPressed: () {},
                icon: SvgPicture.asset(Assets.myLocation),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                right: 20,
                bottom: orderViewModel.isBottomSheetVisible ? 0 : 111,
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
                  onPressed: context.read<OrderViewModel>().toggleBottomSheet,
                  icon: SvgPicture.asset(Assets.x),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
