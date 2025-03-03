import 'package:flutter/material.dart';
import 'package:maplibre_gl/maplibre_gl.dart';
import 'package:sheet/sheet.dart';

import '../view_model.dart';

class OrderViewModel extends ChangeNotifier {
  final SheetController _sheetController = SheetController();

  SheetController get sheetController => _sheetController;

  bool _isBottomSheetVisible = false;

  bool get isBottomSheetVisible => _isBottomSheetVisible;

  bool get bottomPadding => _sheetController.hasClients && _isBottomSheetVisible;

  void init() {
    _sheetController.addListener(notifyListeners);
  }

  Future<void> openBottomSheet(
    BuildContext context, {
    bool isCoordinatesSelected = false,
  }) async {
    final currentLatLng = context.read<MapViewModel>().locationData;
    if (!isCoordinatesSelected) {
      await context.read<MapViewModel>().deleteAllMarkers();
      await context.read<MapViewModel>().createMarker(
            1,
            LatLng(
              currentLatLng?.latitude ?? 0,
              currentLatLng?.longitude ?? 0,
            ),
          );
      await context.read<MakeOrderViewModel>().getAddressFromCoordinates(context);
    }

    await _sheetController.animateTo(
      400,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
    _isBottomSheetVisible = true;
  }

  void closeBottomSheet(BuildContext context) {
    _sheetController.animateTo(
      0,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
    _isBottomSheetVisible = false;
    notifyListeners();
  }

  void cancelOrder(BuildContext context) {
    context.read<MapViewModel>().deleteAllMarkers();
    context.read<MakeOrderViewModel>().clearAddressControllers();
    closeBottomSheet(context);
  }

  @override
  void dispose() {
    _sheetController.dispose();
    super.dispose();
  }
}
