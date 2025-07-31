import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapModel {
  final LatLng initialPosition;
  final Set<Marker> markers;
  final Set<Polyline> polylines;

  MapModel({
    required this.initialPosition,
    this.markers = const {},
    this.polylines = const {},
  });

  MapModel copyWith({
    LatLng? initialPosition,
    Set<Marker>? markers,
    Set<Polyline>? polylines,
  }) {
    return MapModel(
      initialPosition: initialPosition ?? this.initialPosition,
      markers: markers ?? this.markers,
      polylines: polylines ?? this.polylines,
    );
  }
}
