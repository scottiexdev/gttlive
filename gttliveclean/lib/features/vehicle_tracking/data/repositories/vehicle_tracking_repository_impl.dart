import '../../domain/entities/vehicle_position.dart';
import '../../domain/repositories/vehicle_tracking_repository.dart';
import '../datasources/vehicle_tracking_remote_data_source.dart';
import '../models/vehicle_position_model.dart';

class VehicleTrackingRepositoryImpl implements VehicleTrackingRepository {
  final VehicleTrackingRemoteDataSource remoteDataSource;

  VehicleTrackingRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<VehiclePosition>> getVehiclePositions(String routeId) async {
    try {
      final List<VehiclePositionModel> vehiclePositions = await remoteDataSource.getVehiclePositions(routeId);
      return vehiclePositions.map((model) => VehiclePosition(
        id: model.id,
        latitude: model.latitude,
        longitude: model.longitude,
        routeId: model.routeId,
      )).toList();
    } catch (e) {
      // Qui dovresti gestire l'errore, come lanciare un'eccezione specifica o un Failure
      throw Exception('Error fetching vehicle positions');
    }
  }
}
