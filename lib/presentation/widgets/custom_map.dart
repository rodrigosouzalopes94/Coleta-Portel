import 'package:coleta_portel/data/models/map_model.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CustomMap extends StatelessWidget {
  final MapModel mapData;
  final void Function(GoogleMapController)? onMapCreated;
  final void Function(LatLng)? onTap;

  const CustomMap({
    super.key,
    required this.mapData,
    this.onMapCreated,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      onMapCreated: onMapCreated,
      initialCameraPosition: CameraPosition(
        target: mapData.initialPosition,
        zoom: 14.0,
      ),
      markers: mapData.markers,
      polylines: mapData.polylines,
      onTap: onTap,
      myLocationEnabled: true,
      myLocationButtonEnabled: true,
      mapType: MapType.normal,
    );
  }
}
