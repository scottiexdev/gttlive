import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gttliveclean/features/vehicle_tracking/presentation/cubit/vehicle_tracking_cubit.dart';
import 'package:gttliveclean/features/vehicle_tracking/presentation/cubit/vehicle_tracking_state.dart';

class VehicleTrackingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Accesso diretto al Cubit per invocare funzioni
    final vehicleTrackingCubit = context.read<VehicleTrackingCubit>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Vehicle Tracking'),
      ),
      body: Column(
        children: [
          // Qui potresti avere un DropdownButton o un altro widget per selezionare la linea
          Expanded(
            child: BlocBuilder<VehicleTrackingCubit, VehicleTrackingState>(
              builder: (context, state) {
                if (state is VehicleTrackingLoading) {
                  return const Center(child: const CircularProgressIndicator());
                } else if (state is VehicleTrackingLoaded) {
                  return ListView.builder(
                    itemCount: state.positions.length,
                    itemBuilder: (context, index) {
                      final position = state.positions[index];
                      // Utilizza i dati della posizione per costruire i tuoi widget
                      return ListTile(
                        leading: const Icon(Icons.directions_bus),
                        title: Text('Vehicle ID: ${position.id}'),
                        subtitle: Text('Position: ${position.latitude}, ${position.longitude}'),
                      );
                    },
                  );
                } else if (state is VehicleTrackingError) {
                  return Center(child: Text('Error: ${state.message}'));
                }
                // Stato iniziale o non gestito
                return const Center(child: Text('Select a route to start tracking'));
              },
            ),
          ),
        ],
      ),
    );
  }
}
