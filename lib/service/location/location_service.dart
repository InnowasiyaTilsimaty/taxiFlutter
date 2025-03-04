import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:location/location.dart';
import 'package:maplibre_gl/maplibre_gl.dart';

final class LocationService {
  final location = Location();

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

  Future<String> getAddressFromCoordinates(double lat, double lon) async {
    final url = 'https://nominatim.openstreetmap.org/reverse?format=json&lat=$lat&lon=$lon';
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data['display_name'] as String;
    } else {
      return 'Error fetching address';
    }
  }

  Future<List<LatLng>> fetchRoute(List<LatLng> points) async {
    final coordsString = points.map((p) => '${p.longitude},${p.latitude}').join(';');
    final url =
        'http://router.project-osrm.org/route/v1/driving/$coordsString?overview=full&geometries=geojson';

    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final coordinates = data['routes'][0]['geometry']['coordinates'] as List;
      return coordinates.map((point) => LatLng(point[1] as double, point[0] as double)).toList();
    } else {
      throw Exception('Error fetching route');
    }
  }
}
