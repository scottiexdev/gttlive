import 'package:gttliveclean/features/vehicle_tracking/domain/entities/entities.dart';

abstract class VehicleTrackingState {}

class VehicleTrackingInitial extends VehicleTrackingState {}

class VehicleTrackingLoading extends VehicleTrackingState {}

class VehicleTrackingLoaded extends VehicleTrackingState {
  final List<VehiclePosition> positions;

  VehicleTrackingLoaded({required this.positions});
}

class VehicleTrackingError extends VehicleTrackingState {
  final String message;

  VehicleTrackingError({required this.message});
}
