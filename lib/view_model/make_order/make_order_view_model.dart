import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sheet/sheet.dart';

import '../view_model.dart';

class MakeOrderViewModel extends ChangeNotifier {
  final SheetController _sheetController = SheetController();

  List<TextEditingController> addressControllers = [
    TextEditingController(),
    TextEditingController(),
  ];

  SheetController get sheetController => _sheetController;

  bool _isBottomSheetVisible = false;

  bool get isBottomSheetVisible => _isBottomSheetVisible;

  void init() {
    _sheetController.addListener(notifyListeners);
  }

  void addAddressController() {
    addressControllers.add(TextEditingController());

    notifyListeners();
  }

  void removeAddressController(BuildContext context, int index) {
    if (index == 0) {
      closeBottomSheet(context);
    } else {
      addressControllers.removeAt(index);
      notifyListeners();
    }
  }

  void openBottomSheet(BuildContext context) {
    context.read<OrderViewModel>().closeBottomSheet();
    _sheetController.animateTo(
      500,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
    _isBottomSheetVisible = true;
  }

  void continueOrder(BuildContext context) {
    context.read<OrderInProgressViewModel>().openBottomSheet(context);
    closeBottomSheet(context, openOrderBottomSheet: false);
  }

  void closeBottomSheet(BuildContext context, {bool openOrderBottomSheet = true}) {
    if (_isBottomSheetVisible) {
      _sheetController
          .animateTo(
        0,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      )
          .then((_) {
        clearAddressControllers();
        if (openOrderBottomSheet) {
          context.read<OrderViewModel>().openBottomSheet();
        }
        _isBottomSheetVisible = false;
      });
    }
  }

  void clearAddressControllers() {
    addressControllers = [
      TextEditingController(),
      TextEditingController(),
    ];
    notifyListeners();
  }

  @override
  void dispose() {
    _sheetController.dispose();
    super.dispose();
  }
}
