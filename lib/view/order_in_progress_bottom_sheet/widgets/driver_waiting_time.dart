import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../view_model/view_model.dart';

class DriverWaitingTime extends StatefulWidget {
  const DriverWaitingTime({super.key});

  @override
  State<DriverWaitingTime> createState() => _DriverWaitingTimeState();
}

class _DriverWaitingTimeState extends State<DriverWaitingTime> {

  @override
  void dispose() {
    super.dispose();
    context.read<OrderInProgressViewModel>().dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final orderInProgressViewModel =
        context.watch<OrderInProgressViewModel>();
    return Text(
      orderInProgressViewModel.start,
      style: textTheme.displayLarge,
    );
  }
}
