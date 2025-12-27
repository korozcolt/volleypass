/// Información de conectividad de red.
///
/// Verifica si hay conexión a internet disponible.
library;

import 'package:connectivity_plus/connectivity_plus.dart';
import '../utils/app_logger.dart';

abstract class NetworkInfo {
  Future<bool> get isConnected;
  Stream<ConnectivityResult> get onConnectivityChanged;
}

class NetworkInfoImpl implements NetworkInfo {
  final Connectivity _connectivity;

  NetworkInfoImpl(this._connectivity);

  @override
  Future<bool> get isConnected async {
    try {
      final result = await _connectivity.checkConnectivity();
      final connected = result != ConnectivityResult.none;
      AppLogger.debug('NetworkInfo: Connected = $connected');
      return connected;
    } catch (e) {
      AppLogger.error('NetworkInfo: Error checking connectivity', error: e);
      return false;
    }
  }

  @override
  Stream<ConnectivityResult> get onConnectivityChanged {
    return _connectivity.onConnectivityChanged;
  }
}
