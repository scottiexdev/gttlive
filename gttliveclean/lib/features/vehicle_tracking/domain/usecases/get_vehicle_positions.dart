

import 'package:gttliveclean/core/error/failures.dart';
import 'package:gttliveclean/core/usercase/usercase.dart';
import 'package:gttliveclean/features/vehicle_tracking/domain/entities/vehicle_position.dart';
import 'package:gttliveclean/features/vehicle_tracking/domain/repositories/vehicle_tracking_repository.dart';
import 'package:dartz/dartz.dart';

class GetVehiclePositions extends UseCase<List<VehiclePosition>, Params> {
  final VehicleTrackingRepository repository;

  GetVehiclePositions(this.repository);

  @override
  Future<Either<Failure, List<VehiclePosition>>> call(Params params) async {
    return await repository.getVehiclePositions(params.routeId).then((positions) => Right(positions));
  }
}

class Params {
  final String routeId;

  Params({required this.routeId});
}
