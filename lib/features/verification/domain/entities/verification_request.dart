/// Request para verificación de QR.
///
/// Entity que encapsula los datos necesarios para realizar una
/// verificación de jugador mediante código QR.
library;

import 'package:equatable/equatable.dart';

/// Ubicación geográfica
class Location extends Equatable {
  final double latitude;
  final double longitude;

  const Location({
    required this.latitude,
    required this.longitude,
  });

  /// Convierte a JSON para la API
  Map<String, dynamic> toJson() {
    return {
      'latitude': latitude,
      'longitude': longitude,
    };
  }

  @override
  List<Object?> get props => [latitude, longitude];

  @override
  String toString() => 'Location(lat: $latitude, lng: $longitude)';
}

class VerificationRequest extends Equatable {
  final String qrCode;
  final int? matchSessionId;
  final String? deviceInfo;
  final Location? location;

  const VerificationRequest({
    required this.qrCode,
    this.matchSessionId,
    this.deviceInfo,
    this.location,
  });

  /// Convierte a JSON para la API
  Map<String, dynamic> toJson() {
    return {
      'qr_code': qrCode,
      if (matchSessionId != null) 'match_session_id': matchSessionId,
      if (deviceInfo != null) 'device_info': deviceInfo,
      if (location != null) 'location': location!.toJson(),
    };
  }

  @override
  List<Object?> get props => [
        qrCode,
        matchSessionId,
        deviceInfo,
        location,
      ];

  @override
  String toString() {
    return 'VerificationRequest(qrCode: ${qrCode.substring(0, 8)}..., sessionId: $matchSessionId)';
  }
}
