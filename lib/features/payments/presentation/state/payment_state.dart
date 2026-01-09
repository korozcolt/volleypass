/// Estado de la gestión de pagos.
library;

import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/payment.dart';

part 'payment_state.freezed.dart';

/// Estado para la lista de pagos
@freezed
class PaymentListState with _$PaymentListState {
  const factory PaymentListState.initial() = _Initial;
  const factory PaymentListState.loading() = _Loading;
  const factory PaymentListState.loaded({
    required List<Payment> payments,
    required bool hasMore,
    required int currentPage,
  }) = _Loaded;
  const factory PaymentListState.error(String message) = _Error;
}

/// Estado para un pago individual
@freezed
class PaymentDetailState with _$PaymentDetailState {
  const factory PaymentDetailState.initial() = _DetailInitial;
  const factory PaymentDetailState.loading() = _DetailLoading;
  const factory PaymentDetailState.loaded(Payment payment) = _DetailLoaded;
  const factory PaymentDetailState.error(String message) = _DetailError;
}

/// Estado para subir comprobante
@freezed
class UploadProofState with _$UploadProofState {
  const factory UploadProofState.initial() = _UploadInitial;
  const factory UploadProofState.uploading({@Default(0.0) double progress}) =
      _Uploading;
  const factory UploadProofState.success(String message) = _UploadSuccess;
  const factory UploadProofState.error(String message) = _UploadError;
}

/// Estado para verificar/rechazar pago (para clubs)
@freezed
class VerifyPaymentState with _$VerifyPaymentState {
  const factory VerifyPaymentState.initial() = _VerifyInitial;
  const factory VerifyPaymentState.processing() = _VerifyProcessing;
  const factory VerifyPaymentState.success(String message) = _VerifySuccess;
  const factory VerifyPaymentState.error(String message) = _VerifyError;
}

/// Filtros para la lista de pagos
@freezed
class PaymentFilters with _$PaymentFilters {
  const factory PaymentFilters({
    String? status,
    String? type,
    @Default(false) bool showOnlyOverdue,
  }) = _PaymentFilters;

  const PaymentFilters._();

  /// Verifica si hay filtros activos
  bool get hasActiveFilters =>
      status != null || type != null || showOnlyOverdue;

  /// Limpia todos los filtros
  PaymentFilters clearAll() => const PaymentFilters();

  /// Limpia el filtro de estado
  PaymentFilters clearStatus() => copyWith(status: null);

  /// Limpia el filtro de tipo
  PaymentFilters clearType() => copyWith(type: null);
}
