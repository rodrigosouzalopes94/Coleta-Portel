import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeController {
  GoogleMapController? _mapController;

  void setMapController(GoogleMapController controller) {
    _mapController = controller;
  }

  void moveTo(LatLng position, {double zoom = 14}) {
    _mapController?.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(target: position, zoom: zoom),
      ),
    );
  }

  void dispose() {
    _mapController?.dispose();
  }
}
