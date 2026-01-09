/// Notifier para la gestión de pagos.
library;

import 'dart:io';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/entities/payment.dart';
import '../../domain/usecases/get_payments_usecase.dart';
import '../../domain/usecases/upload_proof_usecase.dart';
import '../state/payment_state.dart';

/// Notifier para la lista de pagos del jugador
class PaymentListNotifier extends StateNotifier<PaymentListState> {
  final GetPaymentsUseCase _getPaymentsUseCase;

  PaymentListNotifier(this._getPaymentsUseCase)
      : super(const PaymentListState.initial());

  // Cache de pagos cargados
  final List<Payment> _allPayments = [];
  int _currentPage = 1;
  bool _hasMore = true;
  PaymentFilters _currentFilters = const PaymentFilters();

  /// Carga la lista inicial de pagos
  Future<void> loadPayments({PaymentFilters? filters}) async {
    if (filters != null) {
      _currentFilters = filters;
    }

    state = const PaymentListState.loading();
    _allPayments.clear();
    _currentPage = 1;
    _hasMore = true;

    await _fetchPayments();
  }

  /// Carga más pagos (paginación)
  Future<void> loadMore() async {
    if (!_hasMore) return;

    final currentState = state;
    // Verificar que el estado actual sea loaded antes de cargar más
    currentState.maybeWhen(
      loaded: (_, __, ___) {
        _currentPage++;
        _fetchPayments();
      },
      orElse: () {},
    );
  }

  /// Refresca la lista de pagos
  Future<void> refresh() async {
    _allPayments.clear();
    _currentPage = 1;
    _hasMore = true;
    await _fetchPayments();
  }

  /// Aplica filtros a la lista
  Future<void> applyFilters(PaymentFilters filters) async {
    _currentFilters = filters;
    await loadPayments(filters: filters);
  }

  /// Limpia filtros
  Future<void> clearFilters() async {
    _currentFilters = const PaymentFilters();
    await loadPayments();
  }

  /// Obtiene pagos del repositorio
  Future<void> _fetchPayments() async {
    final params = GetPaymentsParams(
      status: _currentFilters.status,
      type: _currentFilters.type,
      page: _currentPage,
    );

    final result = await _getPaymentsUseCase(params);

    result.fold(
      (failure) {
        state = PaymentListState.error(failure.message);
      },
      (payments) {
        if (payments.isEmpty) {
          _hasMore = false;
        }

        _allPayments.addAll(payments);

        // Aplicar filtro de vencidos si está activo
        final filteredPayments = _currentFilters.showOnlyOverdue
            ? _allPayments.where((p) => p.isOverdue).toList()
            : _allPayments;

        state = PaymentListState.loaded(
          payments: filteredPayments,
          hasMore: _hasMore && payments.isNotEmpty,
          currentPage: _currentPage,
        );
      },
    );
  }

  /// Actualiza un pago en la lista (útil después de subir comprobante)
  void updatePayment(Payment updatedPayment) {
    final index = _allPayments.indexWhere((p) => p.id == updatedPayment.id);
    if (index != -1) {
      _allPayments[index] = updatedPayment;

      final filteredPayments = _currentFilters.showOnlyOverdue
          ? _allPayments.where((p) => p.isOverdue).toList()
          : _allPayments;

      state = PaymentListState.loaded(
        payments: filteredPayments,
        hasMore: _hasMore,
        currentPage: _currentPage,
      );
    }
  }
}

/// Notifier para subir comprobante de pago
class UploadProofNotifier extends StateNotifier<UploadProofState> {
  final UploadProofUseCase _uploadProofUseCase;

  UploadProofNotifier(this._uploadProofUseCase)
      : super(const UploadProofState.initial());

  /// Sube un comprobante de pago
  Future<void> uploadProof(int paymentId, File file) async {
    state = const UploadProofState.uploading(progress: 0.5);

    final params = UploadProofParams(
      paymentId: paymentId,
      file: file,
    );

    final result = await _uploadProofUseCase(params);

    result.fold(
      (failure) {
        state = UploadProofState.error(failure.message);
      },
      (message) {
        state = UploadProofState.success(message);
      },
    );
  }

  /// Reinicia el estado
  void reset() {
    state = const UploadProofState.initial();
  }
}
