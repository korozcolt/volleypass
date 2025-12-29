/// Respuesta base del dashboard.
library;

import 'package:equatable/equatable.dart';

abstract class DashboardResponse extends Equatable {
  final String role;
  final DateTime timestamp;

  const DashboardResponse({
    required this.role,
    required this.timestamp,
  });

  @override
  List<Object?> get props => [role, timestamp];
}
