/// Notifier para el estado del scanner QR.
///
/// Maneja la lógica de escaneo y verificación de códigos QR.
library;

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:io';
import '../../../../core/utils/app_logger.dart';
import '../../domain/usecases/verify_qr_usecase.dart';
import '../state/scanner_state.dart';

class ScannerNotifier extends StateNotifier<ScannerState> {
  final VerifyQRUseCase _verifyQRUseCase;
  bool _isProcessing = false;

  /// Regex para validar códigos QR (64 caracteres hexadecimales)
  static final RegExp _qrCodeRegex = RegExp(r'^[a-fA-F0-9]{64}$');

  ScannerNotifier(this._verifyQRUseCase) : super(const ScannerState.initial());

  /// Inicializa la cámara
  void initCamera() {
    AppLogger.info('ScannerNotifier: Initializing camera');
    state = const ScannerState.cameraLoading();

    // Simular delay de inicialización
    Future.delayed(const Duration(milliseconds: 500), () {
      if (!mounted) return;
      state = const ScannerState.cameraReady();
      AppLogger.info('ScannerNotifier: Camera ready');
    });
  }

  /// Callback cuando se escanea un QR
  Future<void> onQRScanned(String qrCode, {int? matchSessionId}) async {
    // Prevenir múltiples escaneos simultáneos
    if (_isProcessing) {
      AppLogger.debug('ScannerNotifier: Already processing, ignoring scan');
      return;
    }

    AppLogger.info('ScannerNotifier: QR scanned: ${qrCode.substring(0, 8)}...');

    // Validar formato
    if (!_qrCodeRegex.hasMatch(qrCode)) {
      AppLogger.warning('ScannerNotifier: Invalid QR format');
      state = const ScannerState.error(
        message: 'Código QR inválido. Debe tener 64 caracteres hexadecimales.',
      );
      // Volver a ready después de 2 segundos
      Future.delayed(const Duration(seconds: 2), () {
        if (!mounted) return;
        state = const ScannerState.cameraReady();
      });
      return;
    }

    _isProcessing = true;
    state = const ScannerState.processing();

    try {
      // Obtener información del dispositivo
      final deviceInfo = await _getDeviceInfo();

      // Crear parámetros de verificación
      final params = VerifyQRParams(
        qrCode: qrCode,
        matchSessionId: matchSessionId,
        deviceInfo: deviceInfo,
        location: null, // TODO: Implementar geolocalización si es necesario
      );

      // Ejecutar caso de uso
      final result = await _verifyQRUseCase(params);

      if (!mounted) return;

      result.fold(
        (failure) {
          AppLogger.error(
            'ScannerNotifier: Verification failed',
            error: failure.message,
          );
          state = ScannerState.error(message: failure.message);

          // Volver a ready después de 3 segundos
          Future.delayed(const Duration(seconds: 3), () {
            if (!mounted) return;
            state = const ScannerState.cameraReady();
            _isProcessing = false;
          });
        },
        (resultData) {
          AppLogger.info(
            'ScannerNotifier: Verification successful - ${resultData.verification.result}',
          );
          state = ScannerState.success(
            verification: resultData.verification,
            player: resultData.player,
          );
          _isProcessing = false;
        },
      );
    } catch (e, stackTrace) {
      AppLogger.error(
        'ScannerNotifier: Unexpected error',
        error: e,
        stackTrace: stackTrace,
      );

      if (!mounted) return;

      state = const ScannerState.error(
        message: 'Error inesperado durante la verificación',
      );

      // Volver a ready después de 3 segundos
      Future.delayed(const Duration(seconds: 3), () {
        if (!mounted) return;
        state = const ScannerState.cameraReady();
        _isProcessing = false;
      });
    }
  }

  /// Reinicia el scanner
  void resetScanner() {
    AppLogger.info('ScannerNotifier: Resetting scanner');
    _isProcessing = false;
    state = const ScannerState.cameraReady();
  }

  /// Obtiene información del dispositivo
  Future<String> _getDeviceInfo() async {
    try {
      final deviceInfoPlugin = DeviceInfoPlugin();

      if (Platform.isAndroid) {
        final androidInfo = await deviceInfoPlugin.androidInfo;
        return '${androidInfo.brand} ${androidInfo.model}';
      } else if (Platform.isIOS) {
        final iosInfo = await deviceInfoPlugin.iosInfo;
        return '${iosInfo.name} ${iosInfo.model}';
      } else {
        return 'Unknown Device';
      }
    } catch (e) {
      AppLogger.error('ScannerNotifier: Error getting device info', error: e);
      return 'Unknown Device';
    }
  }

  @override
  void dispose() {
    AppLogger.info('ScannerNotifier: Disposing');
    super.dispose();
  }
}
