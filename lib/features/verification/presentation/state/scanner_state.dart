/// Estados del scanner de QR.
///
/// Define todos los posibles estados del scanner de códigos QR.
library;

import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/player.dart';
import '../../domain/entities/verification.dart';

part 'scanner_state.freezed.dart';

@freezed
class ScannerState with _$ScannerState {
  /// Estado inicial
  const factory ScannerState.initial() = _Initial;

  /// Cámara cargando
  const factory ScannerState.cameraLoading() = _CameraLoading;

  /// Cámara lista para escanear
  const factory ScannerState.cameraReady() = _CameraReady;

  /// Escaneando QR
  const factory ScannerState.scanning() = _Scanning;

  /// Procesando verificación
  const factory ScannerState.processing() = _Processing;

  /// Verificación exitosa
  const factory ScannerState.success({
    required Verification verification,
    required Player player,
  }) = _Success;

  /// Error durante el escaneo o verificación
  const factory ScannerState.error({
    required String message,
  }) = _Error;
}
