import 'package:flutter/material.dart';
import 'package:sheet/sheet.dart';

import '../../configs/snack_bar.dart';
import '../../model/model.dart';
import '../../repository/repository.dart';
import '../../service/service.dart';
import '../view_model.dart';

class MakeOrderViewModel extends ChangeNotifier {
  final OrderRepository orderRepository;

  MakeOrderViewModel({required this.orderRepository});

  final locService = LocationService();
  final SheetController _sheetController = SheetController();

  List<TextEditingController> addressControllers = [
    TextEditingController(),
    TextEditingController(),
  ];
  final commentController = TextEditingController();

  SheetController get sheetController => _sheetController;

  bool _isBottomSheetVisible = false;

  bool get isBottomSheetVisible => _isBottomSheetVisible;
  bool _inProgress = false;

  bool get inProgress => _inProgress;

  void init() {
    _sheetController.addListener(notifyListeners);
  }

  void addAddressController() {
    addressControllers.add(TextEditingController());

    notifyListeners();
  }

  Future<void> removeAddressController(BuildContext context, int index) async {
    if (index == 0) {
      closeBottomSheet(context);
    } else {
      addressControllers.removeAt(index);
      notifyListeners();
    }
    await context.read<MapViewModel>().deleteMarker(index + 1);
    await context.read<MapViewModel>().drawRoad();
  }

  void openBottomSheet(BuildContext context) {
    context.read<OrderViewModel>().closeBottomSheet(context);
    context.read<MapViewModel>().drawRoad();
    _sheetController.animateTo(
      500,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
    _isBottomSheetVisible = true;
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
        if (openOrderBottomSheet) {
          clearAddressControllers();
          context.read<OrderViewModel>().openBottomSheet(context);
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

  Future<void> getAddressFromCoordinates(BuildContext context) async {
    final locationData = context.read<MapViewModel>().locationData;
    final place = await locService.getAddressFromCoordinates(
      locationData?.latitude ?? 0,
      locationData?.longitude ?? 0,
    );
    if (place.isNotEmpty) {
      addressControllers[0].text = place;
    }
  }

  Future<void> createOrder(BuildContext context) async {
    if (inProgress) return;
    if (addressControllers[0].text.isEmpty || addressControllers[1].text.isEmpty) return;
    _inProgress = true;
    notifyListeners();
    final points = context.read<MapViewModel>().symbolExists.values;
    final coordinates = points.map((e) => e.options.geometry).toList(growable: false);

    try {
      await orderRepository.createOrder(
        CreateOrderModel(
          pickupLatitude: coordinates.first?.latitude.toString() ?? '',
          pickupLongitude: coordinates.first?.longitude.toString() ?? '',
          dropOffLatitude: coordinates.last?.latitude.toString() ?? '',
          dropOffLongitude: coordinates.last?.longitude.toString() ?? '',
          estimatedFare: '20',
          comment: commentController.text,
          dateBook: DateTime.now().toString(),
        ),
      );
      if (context.mounted) {
        context.read<OrderInProgressViewModel>().openBottomSheet(context);
        closeBottomSheet(context, openOrderBottomSheet: false);
      }
    } catch (e) {
      showErrorSnackBar(e.toString());
    }
    _inProgress = false;
    notifyListeners();
  }

  void closeCommentAlert(BuildContext context) {
    commentController.clear();
    Navigator.of(context).pop();
  }

  @override
  void dispose() {
    _sheetController.dispose();
    super.dispose();
  }
}
