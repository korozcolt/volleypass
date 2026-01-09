/// Providers para el módulo de pagos.
library;

import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../auth/presentation/providers/auth_providers.dart';
import '../../data/datasources/payment_remote_datasource.dart';
import '../../data/repositories/payment_repository_impl.dart';
import '../../domain/repositories/payment_repository.dart';
import '../../domain/usecases/get_payments_usecase.dart';
import '../../domain/usecases/upload_proof_usecase.dart';
import '../../domain/usecases/get_club_payments_usecase.dart';
import '../../domain/usecases/verify_payment_usecase.dart';
import '../notifiers/payment_notifier.dart';
import '../notifiers/club_payment_notifier.dart';
import '../state/payment_state.dart';

// ============================================================================
// DATA LAYER PROVIDERS
// ============================================================================

/// Provider para el data source remoto de pagos
final paymentRemoteDataSourceProvider = Provider<PaymentRemoteDataSource>((ref) {
  final apiClient = ref.watch(apiClientProvider);
  return PaymentRemoteDataSourceImpl(apiClient);
});

/// Provider para el repositorio de pagos
final paymentRepositoryProvider = Provider<PaymentRepository>((ref) {
  final remoteDataSource = ref.watch(paymentRemoteDataSourceProvider);
  return PaymentRepositoryImpl(remoteDataSource: remoteDataSource);
});

// ============================================================================
// DOMAIN LAYER PROVIDERS (Use Cases)
// ============================================================================

/// Provider para el caso de uso de obtener pagos
final getPaymentsUseCaseProvider = Provider<GetPaymentsUseCase>((ref) {
  final repository = ref.watch(paymentRepositoryProvider);
  return GetPaymentsUseCase(repository);
});

/// Provider para el caso de uso de subir comprobante
final uploadProofUseCaseProvider = Provider<UploadProofUseCase>((ref) {
  final repository = ref.watch(paymentRepositoryProvider);
  return UploadProofUseCase(repository);
});

/// Provider para el caso de uso de obtener pagos del club
final getClubPaymentsUseCaseProvider = Provider<GetClubPaymentsUseCase>((ref) {
  final repository = ref.watch(paymentRepositoryProvider);
  return GetClubPaymentsUseCase(repository);
});

/// Provider para el caso de uso de aprobar pagos
final approvePaymentUseCaseProvider = Provider<ApprovePaymentUseCase>((ref) {
  final repository = ref.watch(paymentRepositoryProvider);
  return ApprovePaymentUseCase(repository);
});

/// Provider para el caso de uso de rechazar pagos
final rejectPaymentUseCaseProvider = Provider<RejectPaymentUseCase>((ref) {
  final repository = ref.watch(paymentRepositoryProvider);
  return RejectPaymentUseCase(repository);
});

// ============================================================================
// PRESENTATION LAYER PROVIDERS (State Notifiers)
// ============================================================================

/// Provider para el notifier de lista de pagos
final paymentListNotifierProvider =
    StateNotifierProvider<PaymentListNotifier, PaymentListState>((ref) {
  final getPaymentsUseCase = ref.watch(getPaymentsUseCaseProvider);
  return PaymentListNotifier(getPaymentsUseCase);
});

/// Provider para el notifier de subida de comprobante
final uploadProofNotifierProvider =
    StateNotifierProvider<UploadProofNotifier, UploadProofState>((ref) {
  final uploadProofUseCase = ref.watch(uploadProofUseCaseProvider);
  return UploadProofNotifier(uploadProofUseCase);
});

/// Provider para los filtros actuales de pagos
final paymentFiltersProvider = StateProvider<PaymentFilters>((ref) {
  return const PaymentFilters();
});

// ============================================================================
// CLUB ADMIN PROVIDERS
// ============================================================================

/// Provider para el notifier de lista de pagos del club
final clubPaymentListNotifierProvider =
    StateNotifierProvider<ClubPaymentListNotifier, PaymentListState>((ref) {
  final getClubPaymentsUseCase = ref.watch(getClubPaymentsUseCaseProvider);
  return ClubPaymentListNotifier(getClubPaymentsUseCase);
});

/// Provider para el notifier de verificación de pagos
final verifyPaymentNotifierProvider =
    StateNotifierProvider<VerifyPaymentNotifier, VerifyPaymentState>((ref) {
  final approvePaymentUseCase = ref.watch(approvePaymentUseCaseProvider);
  final rejectPaymentUseCase = ref.watch(rejectPaymentUseCaseProvider);
  return VerifyPaymentNotifier(approvePaymentUseCase, rejectPaymentUseCase);
});

/// Provider para el filtro de estado de pagos del club
final clubPaymentStatusFilterProvider = StateProvider<String?>((ref) {
  return null; // null = todos los estados
});
