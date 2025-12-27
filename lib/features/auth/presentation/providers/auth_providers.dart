/// Providers de autenticación.
///
/// Configura la inyección de dependencias para el módulo de autenticación.
library;

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import '../../../../core/network/api_client.dart';
import '../../../../core/network/network_info.dart';
import '../../../../core/storage/secure_storage.dart';
import '../../../../core/storage/preferences_storage.dart';
import '../../../../core/auth/token_storage.dart';
import '../../../../main.dart' show preferencesStorage;
import '../../data/datasources/auth_remote_datasource.dart';
import '../../data/datasources/auth_local_datasource.dart';
import '../../data/repositories/auth_repository_impl.dart';
import '../../domain/repositories/auth_repository.dart';
import '../../domain/usecases/login_usecase.dart';
import '../../domain/usecases/get_current_user_usecase.dart';
import '../../domain/usecases/logout_usecase.dart';
import '../state/auth_state.dart';
import 'auth_notifier.dart';

// ============================================================================
// CORE PROVIDERS
// ============================================================================

/// Provider de Connectivity
final connectivityProvider = Provider<Connectivity>((ref) {
  return Connectivity();
});

/// Provider de NetworkInfo
final networkInfoProvider = Provider<NetworkInfo>((ref) {
  return NetworkInfoImpl(ref.watch(connectivityProvider));
});

/// Provider de SecureStorage
final secureStorageProvider = Provider<SecureStorage>((ref) {
  return SecureStorage();
});

/// Provider de PreferencesStorage
final preferencesStorageProvider = Provider<PreferencesStorage>((ref) {
  // Usar la instancia global inicializada en main.dart
  return preferencesStorage;
});

/// Provider de TokenStorage
final tokenStorageProvider = Provider<TokenStorage>((ref) {
  return TokenStorage(
    secureStorage: ref.watch(secureStorageProvider),
    preferencesStorage: ref.watch(preferencesStorageProvider),
  );
});

/// Provider de ApiClient
final apiClientProvider = Provider<ApiClient>((ref) {
  return ApiClient(
    tokenStorage: ref.watch(tokenStorageProvider),
  );
});

// ============================================================================
// DATA LAYER PROVIDERS
// ============================================================================

/// Provider de AuthRemoteDataSource
final authRemoteDataSourceProvider = Provider<AuthRemoteDataSource>((ref) {
  return AuthRemoteDataSourceImpl(
    apiClient: ref.watch(apiClientProvider),
  );
});

/// Provider de AuthLocalDataSource
final authLocalDataSourceProvider = Provider<AuthLocalDataSource>((ref) {
  return AuthLocalDataSourceImpl(
    secureStorage: ref.watch(secureStorageProvider),
    preferencesStorage: ref.watch(preferencesStorageProvider),
  );
});

/// Provider de AuthRepository
final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepositoryImpl(
    remoteDataSource: ref.watch(authRemoteDataSourceProvider),
    localDataSource: ref.watch(authLocalDataSourceProvider),
    networkInfo: ref.watch(networkInfoProvider),
  );
});

// ============================================================================
// DOMAIN LAYER PROVIDERS (USE CASES)
// ============================================================================

/// Provider de LoginUseCase
final loginUseCaseProvider = Provider<LoginUseCase>((ref) {
  return LoginUseCase(ref.watch(authRepositoryProvider));
});

/// Provider de GetCurrentUserUseCase
final getCurrentUserUseCaseProvider = Provider<GetCurrentUserUseCase>((ref) {
  return GetCurrentUserUseCase(ref.watch(authRepositoryProvider));
});

/// Provider de LogoutUseCase
final logoutUseCaseProvider = Provider<LogoutUseCase>((ref) {
  return LogoutUseCase(ref.watch(authRepositoryProvider));
});

// ============================================================================
// PRESENTATION LAYER PROVIDERS
// ============================================================================

/// Provider de AuthNotifier (State Management)
final authStateProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  return AuthNotifier(
    loginUseCase: ref.watch(loginUseCaseProvider),
    getCurrentUserUseCase: ref.watch(getCurrentUserUseCaseProvider),
    logoutUseCase: ref.watch(logoutUseCaseProvider),
  );
});

/// Provider para verificar si está autenticado (computed)
final isAuthenticatedProvider = Provider<bool>((ref) {
  final authState = ref.watch(authStateProvider);
  return authState.maybeWhen(
    authenticated: (_) => true,
    orElse: () => false,
  );
});

/// Provider para obtener el usuario actual (computed)
final currentUserProvider = Provider((ref) {
  final authState = ref.watch(authStateProvider);
  return authState.whenOrNull(
    authenticated: (user) => user,
  );
});
