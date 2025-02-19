import 'package:flutter/material.dart';
import 'package:maplibre_gl/maplibre_gl.dart';
import 'package:provider/provider.dart';
import '../../../view_model/view_model.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  @override
  void initState() {
    context.read<MapViewModel>().init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final mapViewModel = context.watch<MapViewModel>();

    return mapViewModel.locationLoading
        ? const Center(child: CircularProgressIndicator())
        : MapLibreMap(
            styleString: 'http://belgi.com.tm:8060/styles/bright/style.json',
            initialCameraPosition: CameraPosition(
              target: LatLng(
                mapViewModel.locationData?.latitude ?? 0,
                mapViewModel.locationData?.longitude ?? 0,
              ),
              zoom: 15,
            ),
            onMapCreated: (controller) =>
                mapViewModel.mapController = controller,
            onStyleLoadedCallback: () async {
              await mapViewModel.mapController?.addCircle(
                CircleOptions(
                  geometry: LatLng(
                    mapViewModel.locationData?.latitude ?? 0,
                    mapViewModel.locationData?.longitude ?? 0,
                  ),
                  circleRadius: 83.5,
                  circleColor: '#DCDFFF',
                  circleOpacity: 0.5,
                ),
              );
              await mapViewModel.mapController?.addSymbol(
                SymbolOptions(
                  geometry: LatLng(
                    mapViewModel.locationData?.latitude ?? 0,
                    mapViewModel.locationData?.longitude ?? 0,
                  ),
                  iconImage: 'assets/icons/current-position.png',
                  iconSize: 1,
                ),
              );
            },
            annotationOrder: const <AnnotationType>[
              AnnotationType.circle,
              AnnotationType.symbol,
            ],
            compassEnabled: false,
          );
  }
}
