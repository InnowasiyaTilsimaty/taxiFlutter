import 'dart:async';

import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:maplibre_gl/maplibre_gl.dart';

class MapViewModel extends ChangeNotifier {
  MapLibreMapController? mapController;
  LocationData? locationData;
  final location = Location();
  StreamSubscription<LocationData>? locationSub;

  bool get locationLoading => locationData?.longitude == null && locationData?.latitude == null;

  Future<void> locationService() async {
    bool _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }
  }

  Future<void> requestPermission() async {
    PermissionStatus? _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }
  }

  void getLocation(LocationData data) {
    if (locationData?.longitude == null && locationData?.latitude == null) {
      notifyListeners();
    }
    locationData = data;
  }

  void init() {
    requestPermission();
    locationService();

    locationSub = location.onLocationChanged.listen(getLocation);
  }

  void currentPosition() {
    mapController?.moveCamera(
      CameraUpdate.newLatLng(
        LatLng(locationData!.latitude!, locationData!.longitude!),
      ),
    );
  }

  @override
  void dispose() {
    locationSub?.cancel();
    super.dispose();
  }
}
