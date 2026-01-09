/// Modelos de pago con Freezed.
library;

import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/payment.dart';
import '../../domain/entities/payment_status.dart';
import '../../domain/entities/payment_type.dart';

part 'payment_model.freezed.dart';
part 'payment_model.g.dart';

/// Modelo de pago
@freezed
class PaymentModel with _$PaymentModel {
  const factory PaymentModel({
    required int id,
    @JsonKey(name: 'player_id') required int playerId,
    @JsonKey(name: 'player_name') required String playerName,
    @JsonKey(name: 'club_id') required int clubId,
    @JsonKey(name: 'club_name') required String clubName,
    @JsonKey(name: 'league_id') int? leagueId,
    @JsonKey(name: 'league_name') String? leagueName,
    required String type,
    required String status,
    required double amount,
    required String description,
    @JsonKey(name: 'due_date') required String dueDate,
    @JsonKey(name: 'verified_at') String? verifiedAt,
    @JsonKey(name: 'verified_by') int? verifiedBy,
    @JsonKey(name: 'verifier_name') String? verifierName,
    @JsonKey(name: 'rejection_notes') String? rejectionNotes,
    @JsonKey(name: 'payment_proof_url') String? paymentProofUrl,
    @JsonKey(name: 'created_at') required String createdAt,
    @JsonKey(name: 'updated_at') required String updatedAt,
  }) = _PaymentModel;

  factory PaymentModel.fromJson(Map<String, dynamic> json) =>
      _$PaymentModelFromJson(json);
}

/// Extension para convertir a entidad
extension PaymentModelX on PaymentModel {
  Payment toEntity() => Payment(
    id: id,
    playerId: playerId,
    playerName: playerName,
    clubId: clubId,
    clubName: clubName,
    leagueId: leagueId,
    leagueName: leagueName,
    type: PaymentType.fromJson(type),
    status: PaymentStatus.fromJson(status),
    amount: amount,
    description: description,
    dueDate: DateTime.parse(dueDate),
    verifiedAt: verifiedAt != null ? DateTime.parse(verifiedAt!) : null,
    verifiedBy: verifiedBy,
    verifierName: verifierName,
    rejectionNotes: rejectionNotes,
    paymentProofUrl: paymentProofUrl,
    createdAt: DateTime.parse(createdAt),
    updatedAt: DateTime.parse(updatedAt),
  );
}

/// Respuesta de lista de pagos
@freezed
class PaymentListResponse with _$PaymentListResponse {
  const factory PaymentListResponse({
    required bool success,
    required List<PaymentModel> data,
    required PaginationMeta meta,
    String? message,
  }) = _PaymentListResponse;

  factory PaymentListResponse.fromJson(Map<String, dynamic> json) =>
      _$PaymentListResponseFromJson(json);
}

/// Respuesta de un solo pago
@freezed
class PaymentResponse with _$PaymentResponse {
  const factory PaymentResponse({
    required bool success,
    required PaymentModel data,
    String? message,
  }) = _PaymentResponse;

  factory PaymentResponse.fromJson(Map<String, dynamic> json) =>
      _$PaymentResponseFromJson(json);
}

/// Metadatos de paginación
@freezed
class PaginationMeta with _$PaginationMeta {
  const factory PaginationMeta({
    @JsonKey(name: 'current_page') required int currentPage,
    @JsonKey(name: 'last_page') required int lastPage,
    @JsonKey(name: 'per_page') required int perPage,
    required int total,
    int? from,
    int? to,
  }) = _PaginationMeta;

  factory PaginationMeta.fromJson(Map<String, dynamic> json) =>
      _$PaginationMetaFromJson(json);
}

/// Respuesta de subida de comprobante
@freezed
class UploadProofResponse with _$UploadProofResponse {
  const factory UploadProofResponse({
    required bool success,
    required String message,
    @JsonKey(name: 'payment_proof_url') String? paymentProofUrl,
  }) = _UploadProofResponse;

  factory UploadProofResponse.fromJson(Map<String, dynamic> json) =>
      _$UploadProofResponseFromJson(json);
}

/// Request para verificar/rechazar pago
@freezed
class VerifyPaymentRequest with _$VerifyPaymentRequest {
  const factory VerifyPaymentRequest({
    required String action, // "approve" o "reject"
    String? notes, // Requerido si action = "reject"
  }) = _VerifyPaymentRequest;

  factory VerifyPaymentRequest.fromJson(Map<String, dynamic> json) =>
      _$VerifyPaymentRequestFromJson(json);

  @override
  Map<String, dynamic> toJson() => {
    'action': action,
    if (notes != null) 'notes': notes,
  };
}

/// Respuesta de verificación de pago
@freezed
class VerifyPaymentResponse with _$VerifyPaymentResponse {
  const factory VerifyPaymentResponse({
    required bool success,
    required String message,
    PaymentModel? data,
  }) = _VerifyPaymentResponse;

  factory VerifyPaymentResponse.fromJson(Map<String, dynamic> json) =>
      _$VerifyPaymentResponseFromJson(json);
}

/// Estadísticas de pagos del club
@freezed
class ClubPaymentStatistics with _$ClubPaymentStatistics {
  const factory ClubPaymentStatistics({
    required bool success,
    required ClubPaymentStatsData data,
  }) = _ClubPaymentStatistics;

  factory ClubPaymentStatistics.fromJson(Map<String, dynamic> json) =>
      _$ClubPaymentStatisticsFromJson(json);
}

@freezed
class ClubPaymentStatsData with _$ClubPaymentStatsData {
  const factory ClubPaymentStatsData({
    @JsonKey(name: 'total_pending') required int totalPending,
    @JsonKey(name: 'total_under_verification')
    required int totalUnderVerification,
    @JsonKey(name: 'total_verified') required int totalVerified,
    @JsonKey(name: 'total_overdue') required int totalOverdue,
    @JsonKey(name: 'pending_amount') required double pendingAmount,
    @JsonKey(name: 'verified_amount') required double verifiedAmount,
  }) = _ClubPaymentStatsData;

  factory ClubPaymentStatsData.fromJson(Map<String, dynamic> json) =>
      _$ClubPaymentStatsDataFromJson(json);
}
