import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../configs/assets.dart';
import '../../view_model/view_model.dart';
import 'widgets/widgets.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  @override
  void dispose() {
    context.read<MakeOrderViewModel>().dispose();
    context.read<OrderViewModel>().dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MainAppBar(),
      body: Stack(
        children: [
          const MapScreen(),
          Positioned(
            bottom: 47,
            left: 20,
            right: 20,
            child: ElevatedButton.icon(
              onPressed: context.read<OrderViewModel>().openBottomSheet,
              icon: SvgPicture.asset(Assets.maps),
              label: const Text('Sargyt etmek'),
            ),
          ),
          const MainIcons(),
          const OrderBottomSheet(),
          const MakeOrderBottomSheet(),
          const OrderInProgressBottomSheet(),
        ],
      ),
    );
  }
}
