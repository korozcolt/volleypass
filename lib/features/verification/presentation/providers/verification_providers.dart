/// Providers para el módulo de verificación.
///
/// Define todos los providers de Riverpod para inyección de dependencias
/// en el módulo de verificación.
library;

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/network/api_client.dart';
import '../../../../core/storage/offline_storage.dart';
import '../../data/datasources/verification_local_datasource.dart';
import '../../data/datasources/verification_remote_datasource.dart';
import '../../data/repositories/verification_repository_impl.dart';
import '../../domain/repositories/verification_repository.dart';
import '../../domain/usecases/get_verification_history_usecase.dart';
import '../../domain/usecases/sync_pending_verifications_usecase.dart';
import '../../domain/usecases/verify_qr_usecase.dart';
import '../state/scanner_state.dart';
import 'scanner_notifier.dart';

// ============================================================================
// DATASOURCES
// ============================================================================

/// Provider del remote datasource
final verificationRemoteDataSourceProvider =
    Provider<VerificationRemoteDataSource>((ref) {
  final apiClient = ref.watch(apiClientProvider);
  return VerificationRemoteDataSourceImpl(apiClient);
});

/// Provider del local datasource
final verificationLocalDataSourceProvider =
    Provider<VerificationLocalDataSource>((ref) {
  final offlineStorage = ref.watch(offlineStorageProvider);
  return VerificationLocalDataSourceImpl(offlineStorage);
});

// ============================================================================
// REPOSITORY
// ============================================================================

/// Provider del repositorio de verificación
final verificationRepositoryProvider = Provider<VerificationRepository>((ref) {
  final remoteDataSource = ref.watch(verificationRemoteDataSourceProvider);
  final localDataSource = ref.watch(verificationLocalDataSourceProvider);

  return VerificationRepositoryImpl(
    remoteDataSource: remoteDataSource,
    localDataSource: localDataSource,
    connectivity: Connectivity(),
  );
});

// ============================================================================
// USE CASES
// ============================================================================

/// Provider del caso de uso de verificación de QR
final verifyQRUseCaseProvider = Provider<VerifyQRUseCase>((ref) {
  final repository = ref.watch(verificationRepositoryProvider);
  return VerifyQRUseCase(repository);
});

/// Provider del caso de uso de historial de verificaciones
final getVerificationHistoryUseCaseProvider =
    Provider<GetVerificationHistoryUseCase>((ref) {
  final repository = ref.watch(verificationRepositoryProvider);
  return GetVerificationHistoryUseCase(repository);
});

/// Provider del caso de uso de sincronización
final syncPendingVerificationsUseCaseProvider =
    Provider<SyncPendingVerificationsUseCase>((ref) {
  final repository = ref.watch(verificationRepositoryProvider);
  return SyncPendingVerificationsUseCase(repository);
});

// ============================================================================
// STATE NOTIFIERS
// ============================================================================

/// Provider del state notifier del scanner
final scannerStateProvider =
    StateNotifierProvider<ScannerNotifier, ScannerState>((ref) {
  final verifyQRUseCase = ref.watch(verifyQRUseCaseProvider);
  return ScannerNotifier(verifyQRUseCase);
});

// ============================================================================
// CORE PROVIDERS (Referencias a providers existentes)
// ============================================================================

/// Provider del ApiClient (debe estar definido en core)
final apiClientProvider = Provider<ApiClient>((ref) {
  throw UnimplementedError(
    'apiClientProvider must be overridden in main.dart',
  );
});

/// Provider del OfflineStorage (debe estar definido en core)
final offlineStorageProvider = Provider<OfflineStorage>((ref) {
  throw UnimplementedError(
    'offlineStorageProvider must be overridden in main.dart',
  );
});
