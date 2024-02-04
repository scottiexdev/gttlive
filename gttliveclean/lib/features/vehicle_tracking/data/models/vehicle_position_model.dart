class VehiclePositionModel {
  final String id;
  final double latitude;
  final double longitude;
  final String routeId;

  VehiclePositionModel({
    required this.id,
    required this.latitude,
    required this.longitude,
    required this.routeId,
  });

  factory VehiclePositionModel.fromJson(Map<String, dynamic> json) {
    return VehiclePositionModel(
      id: json['id'],
      latitude: json['latitude'],
      longitude: json['longitude'],
      routeId: json['routeId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'latitude': latitude,
      'longitude': longitude,
      'routeId': routeId,
    };
  }
}
