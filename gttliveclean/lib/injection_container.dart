import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:gttliveclean/features/vehicle_tracking/data/datasources/vehicle_tracking_remote_data_source.dart';
import 'package:gttliveclean/features/vehicle_tracking/data/repositories/vehicle_tracking_repository_impl.dart';
import 'package:gttliveclean/features/vehicle_tracking/domain/repositories/vehicle_tracking_repository.dart';
import 'package:gttliveclean/features/vehicle_tracking/domain/usecases/get_vehicle_positions.dart';
import 'package:gttliveclean/features/vehicle_tracking/presentation/cubit/vehicle_tracking_cubit.dart';


final sl = GetIt.instance; // sl sta per Service Locator

void init() {
  // Cubit / Bloc
  sl.registerFactory(() => VehicleTrackingCubit(getVehiclePositions: sl()));
  // Repository
  sl.registerLazySingleton<VehicleTrackingRepository>(() => VehicleTrackingRepositoryImpl(remoteDataSource: sl()));

  // Data sources
  sl.registerLazySingleton<VehicleTrackingRemoteDataSource>(() => VehicleTrackingRemoteDataSourceImpl(client: sl()));

  // External
  sl.registerLazySingleton(() => http.Client());

  // Use cases
  sl.registerLazySingleton(() => GetVehiclePositions(sl()));
  
}
