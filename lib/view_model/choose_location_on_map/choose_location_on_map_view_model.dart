import 'package:flutter/material.dart';
import 'package:maplibre_gl/maplibre_gl.dart';
import 'package:sheet/sheet.dart';

import '../../service/service.dart';
import '../view_model.dart';

class ChooseLocationOnMapViewModel extends ChangeNotifier {
  final locService = LocationService();
  double cameraLat = 0;
  double cameraLng = 0;
  int markerId = 1;

  final SheetController _sheetController = SheetController();

  SheetController get sheetController => _sheetController;

  final selectedController = TextEditingController();
  bool _isBottomSheetVisible = false;

  bool get isBottomSheetVisible => _isBottomSheetVisible;

  void init() {
    _sheetController.addListener(notifyListeners);
  }

  void openBottomSheet(BuildContext context, int markerId) {
    this.markerId = markerId;
    context.read<OrderViewModel>().closeBottomSheet(context);
    context.read<MakeOrderViewModel>().closeBottomSheet(context);
    context.read<MapViewModel>().deleteMarker(markerId);

    _sheetController.animateTo(
      400,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
    _isBottomSheetVisible = true;
  }

  Future<void> getCameraPositionAddress(LatLngBounds coordinates) async {
    final north = coordinates.northeast;
    final south = coordinates.southwest;

    cameraLat = (north.latitude + south.latitude) / 2;
    cameraLng = (north.longitude + south.longitude) / 2;
    final placeMarks = await locService.getAddressFromCoordinates(cameraLat, cameraLng);
    if (placeMarks.isNotEmpty) {
      selectedController.text = placeMarks;
    }
  }

  void closeBottomSheet(
    BuildContext context, {
    bool isCoordinatesSelected = false,
  }) {
    final currentLatLng = context.read<MapViewModel>().locationData;
    context.read<OrderViewModel>().openBottomSheet(
          context,
          isCoordinatesSelected: isCoordinatesSelected,
        );
    if (!isCoordinatesSelected) {
      context.read<MapViewModel>().createMarker(
            markerId,
            LatLng(
              currentLatLng?.latitude ?? 0,
              currentLatLng?.longitude ?? 0,
            ),
          );
    }
    _sheetController.animateTo(
      0,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
    _isBottomSheetVisible = false;
  }

  void chooseButton(BuildContext context) {
    closeBottomSheet(context, isCoordinatesSelected: true);
    final index = markerId - 1;
    context.read<MakeOrderViewModel>().addressControllers[index].text = selectedController.text;
    context.read<MapViewModel>().createMarker(markerId, LatLng(cameraLat, cameraLng));
  }
}
