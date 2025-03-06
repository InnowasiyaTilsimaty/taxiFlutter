import 'package:flutter/material.dart';
import 'package:maplibre_gl/maplibre_gl.dart';
import '../../../configs/assets.dart';
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
    final chooseLocationOnMapViewModel = context.watch<ChooseLocationOnMapViewModel>();

    return mapViewModel.locationLoading
        ? const Center(child: CircularProgressIndicator())
        : Stack(
            children: [
              MapLibreMap(
                styleString: 'http://belgi.com.tm:8060/styles/bright/style.json',
                initialCameraPosition: CameraPosition(
                  target: LatLng(
                    mapViewModel.locationData?.latitude ?? 0,
                    mapViewModel.locationData?.longitude ?? 0,
                  ),
                  zoom: 15,
                ),
                onMapCreated: (controller) async => mapViewModel.onMapCreated(controller),
                onCameraIdle: () async {
                  final bounds = await mapViewModel.mapController?.getVisibleRegion();
                  if (bounds != null) {
                    await chooseLocationOnMapViewModel.getCameraPositionAddress(bounds);
                  }
                },
                onStyleLoadedCallback: () async => mapViewModel.onMapStyleLoaded(),
                annotationOrder: const <AnnotationType>[
                  AnnotationType.circle,
                  AnnotationType.symbol,
                ],
                compassEnabled: false,
                myLocationEnabled: true,
              ),
              if (chooseLocationOnMapViewModel.isBottomSheetVisible)
                Center(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Image.asset(
                        Assets.marker,
                        height: 42,
                      ),
                      Positioned(
                        top: 4,
                        child: Text(
                          chooseLocationOnMapViewModel.markerId.toString(),
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          );
  }
}
