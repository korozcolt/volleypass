/// Notificador de estado de autenticación.
///
/// StateNotifier que maneja la lógica de estado de autenticación.
library;

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:device_info_plus/device_info_plus.dart';
import '../../../../core/usecases/usecase.dart';
import '../../../../core/utils/app_logger.dart';
import '../../domain/usecases/login_usecase.dart';
import '../../domain/usecases/get_current_user_usecase.dart';
import '../../domain/usecases/logout_usecase.dart';
import '../state/auth_state.dart';
import 'dart:io' show Platform;

class AuthNotifier extends StateNotifier<AuthState> {
  final LoginUseCase _loginUseCase;
  final GetCurrentUserUseCase _getCurrentUserUseCase;
  final LogoutUseCase _logoutUseCase;

  AuthNotifier({
    required LoginUseCase loginUseCase,
    required GetCurrentUserUseCase getCurrentUserUseCase,
    required LogoutUseCase logoutUseCase,
  })  : _loginUseCase = loginUseCase,
        _getCurrentUserUseCase = getCurrentUserUseCase,
        _logoutUseCase = logoutUseCase,
        super(const AuthState.initial());

  /// Realiza el login
  Future<void> login(String email, String password) async {
    try {
      state = const AuthState.loading();
      AppLogger.info('AuthNotifier: Starting login for $email');

      final deviceName = await _getDeviceName();

      final result = await _loginUseCase(LoginParams(
        email: email.trim(),
        password: password,
        deviceName: deviceName,
      ));

      result.fold(
        (failure) {
          AppLogger.error('AuthNotifier: Login failed - ${failure.message}');
          state = AuthState.error(failure.message);
        },
        (user) {
          AppLogger.info('AuthNotifier: Login successful for ${user.email}');
          state = AuthState.authenticated(user);
        },
      );
    } catch (e, stackTrace) {
      AppLogger.error(
        'AuthNotifier: Unexpected error during login',
        error: e,
        stackTrace: stackTrace,
      );
      state = AuthState.error('Error inesperado durante el login');
    }
  }

  /// Verifica el estado de autenticación actual
  Future<void> checkAuthStatus() async {
    try {
      AppLogger.debug('AuthNotifier: Checking auth status');

      final result = await _getCurrentUserUseCase(const NoParams());

      result.fold(
        (failure) {
          AppLogger.debug('AuthNotifier: Not authenticated - ${failure.message}');
          state = const AuthState.unauthenticated();
        },
        (user) {
          AppLogger.info('AuthNotifier: Authenticated as ${user.email}');
          state = AuthState.authenticated(user);
        },
      );
    } catch (e, stackTrace) {
      AppLogger.error(
        'AuthNotifier: Error checking auth status',
        error: e,
        stackTrace: stackTrace,
      );
      state = const AuthState.unauthenticated();
    }
  }

  /// Cierra la sesión
  Future<void> logout() async {
    try {
      state = const AuthState.loading();
      AppLogger.info('AuthNotifier: Logging out');

      final result = await _logoutUseCase(const NoParams());

      result.fold(
        (failure) {
          AppLogger.error('AuthNotifier: Logout failed - ${failure.message}');
          // Aún así, ir a unauthenticated
          state = const AuthState.unauthenticated();
        },
        (_) {
          AppLogger.info('AuthNotifier: Logout successful');
          state = const AuthState.unauthenticated();
        },
      );
    } catch (e, stackTrace) {
      AppLogger.error(
        'AuthNotifier: Unexpected error during logout',
        error: e,
        stackTrace: stackTrace,
      );
      state = const AuthState.unauthenticated();
    }
  }

  /// Obtiene el nombre del dispositivo
  Future<String> _getDeviceName() async {
    try {
      final deviceInfo = DeviceInfoPlugin();

      if (Platform.isAndroid) {
        final androidInfo = await deviceInfo.androidInfo;
        return '${androidInfo.manufacturer} ${androidInfo.model}';
      } else if (Platform.isIOS) {
        final iosInfo = await deviceInfo.iosInfo;
        return '${iosInfo.name} (${iosInfo.model})';
      } else {
        return 'Unknown Device';
      }
    } catch (e) {
      AppLogger.warning('AuthNotifier: Error getting device name', error: e);
      return 'Mobile Device';
    }
  }
}
