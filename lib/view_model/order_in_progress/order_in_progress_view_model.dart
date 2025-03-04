import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sheet/sheet.dart';

import '../../configs/snack_bar.dart';
import '../../configs/theme/app_colors.dart';
import '../view_model.dart';

class OrderInProgressViewModel extends ChangeNotifier {
  final SheetController _sheetController = SheetController();
  Timer? _timer;
  int _start = 50;

  String get start => '${_start ~/ 60}:${_start % 60}';

  SheetController get sheetController => _sheetController;

  bool _isBottomSheetVisible = false;

  bool get isBottomSheetVisible => _isBottomSheetVisible;

  void init() {
    _sheetController.addListener(notifyListeners);
  }

  void openBottomSheet(BuildContext context) {
    context.read<OrderViewModel>().closeBottomSheet(context);
    _sheetController.animateTo(
      400,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
    _isBottomSheetVisible = true;
    driverWaitingTime();
  }

  void closeBottomSheet(BuildContext context) {
    context.read<MapViewModel>().deleteAllMarkers();
    context.read<MakeOrderViewModel>().clearAddressControllers();
    _sheetController.animateTo(
      0,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
    _isBottomSheetVisible = false;
    _timer?.cancel();
    _start = 50;
    showSnackBar(
      'Sargyt ýatyryldy',
      backgroundColor: AppColors.customGray,
      margin: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 70,
      ),
    );
  }

  void driverWaitingTime() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (timer) {
        if (_start == 0) {
          timer.cancel();
        } else {
          _start--;
        }
        notifyListeners();
      },
    );
  }

  @override
  void dispose() {
    _sheetController.dispose();
    _timer?.cancel();
    super.dispose();
  }
}
