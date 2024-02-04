
import '../entities/entities.dart';

abstract class VehicleTrackingRepository {
  Future<List<VehiclePosition>> getVehiclePositions(String routeId);
}
