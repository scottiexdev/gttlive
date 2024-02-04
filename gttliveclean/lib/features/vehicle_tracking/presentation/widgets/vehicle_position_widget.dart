import 'package:flutter/material.dart';
import 'package:gttliveclean/features/vehicle_tracking/domain/entities/entities.dart';

class VehiclePositionWidget extends StatelessWidget {
  final VehiclePosition position;

  VehiclePositionWidget({required this.position});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.directions_bus),
      title: Text('Vehicle ID: ${position.id}'),
      subtitle: Text('Position: ${position.latitude}, ${position.longitude}'),
    );
  }
}
