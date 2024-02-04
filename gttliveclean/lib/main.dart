import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:gttliveclean/features/vehicle_tracking/presentation/cubit/vehicle_tracking_cubit.dart';
import 'package:gttliveclean/injection_container.dart';
import 'injection_container.dart' as di; // Importa il service locator
import 'features/vehicle_tracking/presentation/pages/vehicle_tracking_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized(); // Assicurati che i widget binding siano inizializzati
  di.init(); // Inizializza le dipendenze con GetIt
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<VehicleTrackingCubit>(
      create: (context) => GetIt.instance<VehicleTrackingCubit>(),
      child: MaterialApp(
        title: 'Vehicle Tracking App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: VehicleTrackingPage(),
      ),
    );
  }
}