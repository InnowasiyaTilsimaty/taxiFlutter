import 'package:flutter/material.dart';
import 'package:sheet/sheet.dart';

class OrderViewModel extends ChangeNotifier {
  final SheetController _sheetController = SheetController();

  SheetController get sheetController => _sheetController;

  bool _isBottomSheetVisible = false;

  bool get isBottomSheetVisible => _isBottomSheetVisible;

  bool get bottomPadding => _sheetController.hasClients && _isBottomSheetVisible;

  void init() {
    _sheetController.addListener(notifyListeners);
  }

  void toggleBottomSheet() {
    if (_isBottomSheetVisible) {
      _sheetController.animateTo(
        0,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      _sheetController.animateTo(
        400,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
    _isBottomSheetVisible = !_isBottomSheetVisible;
  }

  @override
  void dispose() {
    _sheetController.dispose();
    super.dispose();
  }
}
