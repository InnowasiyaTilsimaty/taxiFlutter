import 'dart:async';

import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:maplibre_gl/maplibre_gl.dart';

import '../../configs/assets.dart';
import '../../service/service.dart';

class MapViewModel extends ChangeNotifier {
  StreamSubscription<LocationData>? locationSub;
  final Map<String, bool> _symbolExists = {};
  MapLibreMapController? mapController;
  SymbolManager? _symbolManager;
  LocationData? locationData;
  final _locationService = LocationService();

  bool get locationLoading => locationData?.longitude == null && locationData?.latitude == null;

  void init() {
    _locationService.requestPermission();
    _locationService.locationService();

    locationSub = _locationService.location.onLocationChanged.listen(
      (event) {
        locationData = event;
        notifyListeners();
      },
    );
  }

  void moveToCurrentPosition() {
    mapController?.moveCamera(
      CameraUpdate.newLatLng(
        LatLng(
          locationData?.latitude ?? 0,
          locationData?.longitude ?? 0,
        ),
      ),
    );
  }

  Future<void> createMarker(int markerCount, LatLng currentLatLng) async {
    final String symbolId = '$markerCount';

    final offset = markerCount * 0.0001;
    final adjustedLatLng = LatLng(
      currentLatLng.latitude + offset,
      currentLatLng.longitude + offset,
    );

    final options = SymbolOptions(
      geometry: adjustedLatLng,
      iconImage: Assets.marker,
      iconSize: 0.2,
      textField: '$markerCount',
      textOffset: const Offset(0, -0.4),
      textColor: '#ffffff',
      zIndex: markerCount,
    );

    if (_symbolExists[symbolId] == true) {
      await _symbolManager?.set(Symbol(symbolId, options));
    } else {
      await _symbolManager?.add(Symbol(symbolId, options));
      _symbolExists[symbolId] = true;
    }
  }

  Future<void> onMapCreated(MapLibreMapController controller) async {
    mapController = controller;
    _symbolManager = SymbolManager(controller);
    await _symbolManager?.setIconAllowOverlap(true);
    await _symbolManager?.setTextAllowOverlap(true);
    await addCircle();
    await addMarker();
  }

  Future<void> deleteMarker(int symbolId) async {
    await _symbolManager?.remove(
      Symbol(
        symbolId.toString(),
        SymbolOptions.defaultOptions,
      ),
    );
    _symbolExists.remove(symbolId.toString());
  }

  Future<void> deleteAllMarkers() async {
    for (final element in _symbolExists.keys) {
      await _symbolManager?.remove(
        Symbol(
          element,
          SymbolOptions.defaultOptions,
        ),
      );
    }
    _symbolExists.clear();
  }

  Future<void> addCircle() async {
    await mapController?.addCircle(
      CircleOptions(
        geometry: LatLng(
          locationData?.latitude ?? 0,
          locationData?.longitude ?? 0,
        ),
        circleRadius: 83.5,
        circleColor: '#DCDFFF',
        circleOpacity: 0.5,
      ),
    );
  }

  Future<void> addMarker() async {
    await _symbolManager?.add(
      Symbol(
        'current',
        SymbolOptions(
          geometry: LatLng(
            locationData?.latitude ?? 0,
            locationData?.longitude ?? 0,
          ),
          iconImage: Assets.currentPosition,
          iconSize: 1,
          zIndex: 0,
        ),
      ),
    );
  }

  @override
  void dispose() {
    locationSub?.cancel();
    _symbolManager?.dispose();
    mapController?.dispose();
    _symbolExists.clear();
    super.dispose();
  }
}
