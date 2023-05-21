import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mapbox_gl/mapbox_gl.dart';

class HeatMapRideData{
  String heatmap_id;
  Timestamp timestamp;
  int passenger_count;
  GeoPoint location;
  int route_id;

  HeatMapRideData({
    required this.heatmap_id,
    required this.timestamp,
    required this.passenger_count,
    required this.location,
    required this.route_id
  });

  factory HeatMapRideData.fromSnapshot(QueryDocumentSnapshot<Object?> snapshot) {
    Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;

    String heatmap_id = data['heatmap_id'];
    Timestamp timestamp = data['timestamp'];
    int passenger_count = data['passenger_ride'];
    GeoPoint location = data['location'];
    int route_id = data['route_id'];

    return HeatMapRideData(
        heatmap_id: heatmap_id,
        timestamp: timestamp,
        passenger_count: passenger_count,
        location: location,
        route_id: route_id
    );
  }
}

class HeatMapEntity {
  HeatMapRideData heatmap;
  Circle data;

  HeatMapEntity({
    required this.heatmap,
    required this.data,
  });
}