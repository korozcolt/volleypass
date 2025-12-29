/// Caso de uso: Verificar QR de jugador.
///
/// Maneja la lógica de negocio para la verificación de códigos QR de carnets.
library;

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/verification_request.dart';
import '../repositories/verification_repository.dart';

class VerifyQRUseCase implements UseCase<VerificationResultData, VerifyQRParams> {
  final VerificationRepository _repository;

  /// Regex para validar códigos QR (64 caracteres hexadecimales)
  static final RegExp _qrCodeRegex = RegExp(r'^[a-fA-F0-9]{64}$');

  VerifyQRUseCase(this._repository);

  @override
  Future<Either<Failure, VerificationResultData>> call(VerifyQRParams params) async {
    // Validación de formato QR
    if (!_isValidQRCode(params.qrCode)) {
      return const Left(
        ValidationFailure('Código QR inválido. Debe tener 64 caracteres hexadecimales.'),
      );
    }

    // Crear request
    final request = VerificationRequest(
      qrCode: params.qrCode,
      matchSessionId: params.matchSessionId,
      deviceInfo: params.deviceInfo,
      location: params.location,
    );

    // Delegar al repositorio
    return await _repository.verifyQR(request);
  }

  /// Valida formato de código QR
  bool _isValidQRCode(String qrCode) {
    return _qrCodeRegex.hasMatch(qrCode);
  }
}

/// Parámetros para la verificación de QR
class VerifyQRParams extends Equatable {
  final String qrCode;
  final int? matchSessionId;
  final String? deviceInfo;
  final Location? location;

  const VerifyQRParams({
    required this.qrCode,
    this.matchSessionId,
    this.deviceInfo,
    this.location,
  });

  @override
  List<Object?> get props => [qrCode, matchSessionId, deviceInfo, location];
}
