/// Provider de conectividad.
///
/// Detecta cambios en la conectividad de red y dispara auto-sync
/// cuando se recupera la conexión.
library;

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../utils/app_logger.dart';

/// Estado de conectividad
class ConnectivityStatus {
  final bool isOnline;
  final ConnectivityResult result;

  const ConnectivityStatus({required this.isOnline, required this.result});

  @override
  String toString() =>
      'ConnectivityStatus(isOnline: $isOnline, result: $result)';
}

/// Provider que escucha cambios en la conectividad
final connectivityStreamProvider = StreamProvider.autoDispose<ConnectivityStatus>((
  ref,
) {
  final connectivity = Connectivity();

  return connectivity.onConnectivityChanged.asyncMap((result) async {
    // Verificar si realmente hay conexión
    final isOnline = result != ConnectivityResult.none;

    AppLogger.info(
      'ConnectivityProvider: Connectivity changed - $result (online: $isOnline)',
    );

    return ConnectivityStatus(isOnline: isOnline, result: result);
  });
});

/// Provider que retorna el estado actual de conectividad
final connectivityStatusProvider = Provider<ConnectivityStatus>((ref) {
  final connectivityAsync = ref.watch(connectivityStreamProvider);

  return connectivityAsync.when(
    data: (status) => status,
    loading: () => const ConnectivityStatus(
      isOnline: true, // Asumir online mientras carga
      result: ConnectivityResult.wifi,
    ),
    error: (_, __) => const ConnectivityStatus(
      isOnline: false,
      result: ConnectivityResult.none,
    ),
  );
});

/// Provider booleano simple para saber si hay conexión
final isOnlineProvider = Provider<bool>((ref) {
  final status = ref.watch(connectivityStatusProvider);
  return status.isOnline;
});
