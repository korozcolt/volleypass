/// Notifier para la gestión de pagos del club (ClubAdmin).
library;

import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/entities/payment.dart';
import '../../domain/usecases/get_club_payments_usecase.dart';
import '../../domain/usecases/verify_payment_usecase.dart';
import '../state/payment_state.dart';

/// Notifier para la lista de pagos del club
class ClubPaymentListNotifier extends StateNotifier<PaymentListState> {
  final GetClubPaymentsUseCase _getClubPaymentsUseCase;

  ClubPaymentListNotifier(this._getClubPaymentsUseCase)
      : super(const PaymentListState.initial());

  // Cache de pagos cargados
  final List<Payment> _allPayments = [];
  int _currentPage = 1;
  bool _hasMore = true;
  String? _currentStatusFilter;

  /// Carga la lista inicial de pagos del club
  Future<void> loadPayments({String? status}) async {
    _currentStatusFilter = status;
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

  /// Filtra por estado
  Future<void> filterByStatus(String? status) async {
    _currentStatusFilter = status;
    await loadPayments(status: status);
  }

  /// Obtiene pagos del repositorio
  Future<void> _fetchPayments() async {
    final params = GetClubPaymentsParams(
      status: _currentStatusFilter,
      page: _currentPage,
    );

    final result = await _getClubPaymentsUseCase(params);

    result.fold(
      (failure) {
        state = PaymentListState.error(failure.message);
      },
      (payments) {
        if (payments.isEmpty) {
          _hasMore = false;
        }

        _allPayments.addAll(payments);

        state = PaymentListState.loaded(
          payments: _allPayments,
          hasMore: _hasMore && payments.isNotEmpty,
          currentPage: _currentPage,
        );
      },
    );
  }

  /// Actualiza un pago en la lista (útil después de verificar/rechazar)
  void updatePayment(Payment updatedPayment) {
    final index = _allPayments.indexWhere((p) => p.id == updatedPayment.id);
    if (index != -1) {
      _allPayments[index] = updatedPayment;

      state = PaymentListState.loaded(
        payments: _allPayments,
        hasMore: _hasMore,
        currentPage: _currentPage,
      );
    }
  }

  /// Remueve un pago de la lista (después de verificación si está filtrado)
  void removePayment(int paymentId) {
    _allPayments.removeWhere((p) => p.id == paymentId);

    state = PaymentListState.loaded(
      payments: _allPayments,
      hasMore: _hasMore,
      currentPage: _currentPage,
    );
  }
}

/// Notifier para verificar/rechazar pagos
class VerifyPaymentNotifier extends StateNotifier<VerifyPaymentState> {
  final ApprovePaymentUseCase _approvePaymentUseCase;
  final RejectPaymentUseCase _rejectPaymentUseCase;

  VerifyPaymentNotifier(
    this._approvePaymentUseCase,
    this._rejectPaymentUseCase,
  ) : super(const VerifyPaymentState.initial());

  /// Aprueba un pago
  Future<void> approvePayment(int paymentId) async {
    state = const VerifyPaymentState.processing();

    final result = await _approvePaymentUseCase(paymentId);

    result.fold(
      (failure) {
        state = VerifyPaymentState.error(failure.message);
      },
      (message) {
        state = VerifyPaymentState.success(message);
      },
    );
  }

  /// Rechaza un pago
  Future<void> rejectPayment(int paymentId, String notes) async {
    state = const VerifyPaymentState.processing();

    final params = RejectPaymentParams(
      paymentId: paymentId,
      notes: notes,
    );

    final result = await _rejectPaymentUseCase(params);

    result.fold(
      (failure) {
        state = VerifyPaymentState.error(failure.message);
      },
      (message) {
        state = VerifyPaymentState.success(message);
      },
    );
  }

  /// Reinicia el estado
  void reset() {
    state = const VerifyPaymentState.initial();
  }
}
