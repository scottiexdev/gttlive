import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/vehicle_position_model.dart';

abstract class VehicleTrackingRemoteDataSource {
  Future<List<VehiclePositionModel>> getVehiclePositions(String routeId);
}

class VehicleTrackingRemoteDataSourceImpl implements VehicleTrackingRemoteDataSource {
  final http.Client client;

  VehicleTrackingRemoteDataSourceImpl({required this.client});

  @override
  Future<List<VehiclePositionModel>> getVehiclePositions(String routeId) async {
    final response = await client.get(
      Uri.parse('https://example.com/api/vehicles?routeId=$routeId'),
      headers: {
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      final List<dynamic> jsonList = json.decode(response.body);
      return jsonList.map((jsonItem) => VehiclePositionModel.fromJson(jsonItem)).toList();
    } else {
      throw Exception('Failed to load vehicle positions');
    }
  }
}
