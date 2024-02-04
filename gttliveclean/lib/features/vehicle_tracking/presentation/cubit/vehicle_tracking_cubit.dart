import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gttliveclean/features/vehicle_tracking/domain/usecases/get_vehicle_positions.dart';
import 'vehicle_tracking_state.dart';

class VehicleTrackingCubit extends Cubit<VehicleTrackingState> {
  final GetVehiclePositions getVehiclePositions;

  VehicleTrackingCubit({required this.getVehiclePositions}) : super(VehicleTrackingInitial());

  Future<void> fetchVehiclePositions(String routeId) async {
    emit(VehicleTrackingLoading());
    final failureOrPositions = await getVehiclePositions(Params(routeId: routeId));
    emit(failureOrPositions.fold(
      (failure) => VehicleTrackingError(message: failure.toString()),
      (positions) => VehicleTrackingLoaded(positions: positions),
    ));
  }
}
