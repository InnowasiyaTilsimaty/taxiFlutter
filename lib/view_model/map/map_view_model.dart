import 'dart:async';

import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:maplibre_gl/maplibre_gl.dart';

import '../../configs/assets.dart';
import '../../service/service.dart';

class MapViewModel extends ChangeNotifier {
  StreamSubscription<LocationData>? locationSub;
  final Map<String, Symbol> _symbolExists = {};
  final _locationService = LocationService();
  MapLibreMapController? mapController;
  SymbolManager? _symbolManager;
  LineManager? _lineManager;
  LocationData? locationData;

  bool get locationLoading => locationData?.longitude == null && locationData?.latitude == null;
  Map<String, Symbol> get symbolExists => _symbolExists;

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

    if (_symbolExists.containsKey(symbolId)) {
      await _symbolManager?.set(Symbol(symbolId, options));
    } else {
      await _symbolManager?.add(Symbol(symbolId, options));
      _symbolExists[symbolId] = Symbol(symbolId, options);
    }
  }

  Future<void> onMapCreated(MapLibreMapController controller) async {
    mapController = controller;
  }

  Future<void> onMapStyleLoaded() async {
    if (mapController != null) {
      _symbolManager = SymbolManager(mapController!);
      _lineManager = LineManager(mapController!);
    }
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
    await deleteRoad();
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

  Future<void> drawRoad() async {
    final coordinates = _symbolExists.values
        .map(
          (e) => e.options.geometry ?? const LatLng(0, 0),
        )
        .toList();
    final routes = await _locationService.fetchRoute(coordinates);

    await _lineManager?.add(
      Line(
        '1',
        LineOptions(
          geometry: routes,
          lineColor: '#2F57D3',
          lineWidth: 4,
          lineOpacity: 1,
        ),
      ),
    );
  }

  Future<void> deleteRoad() async {
    await _lineManager?.remove(
      Line(
        '1',
        LineOptions.defaultOptions,
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
