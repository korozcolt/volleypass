/// Implementación del repositorio de autenticación.
///
/// Coordina las operaciones entre el datasource remoto (API)
/// y el datasource local (caché/storage).
library;

import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/error/api_exception.dart';
import '../../../../core/network/network_info.dart';
import '../../../../core/utils/app_logger.dart';
import '../../domain/entities/user.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_remote_datasource.dart';
import '../datasources/auth_local_datasource.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource _remoteDataSource;
  final AuthLocalDataSource _localDataSource;
  final NetworkInfo _networkInfo;

  AuthRepositoryImpl({
    required AuthRemoteDataSource remoteDataSource,
    required AuthLocalDataSource localDataSource,
    required NetworkInfo networkInfo,
  })  : _remoteDataSource = remoteDataSource,
        _localDataSource = localDataSource,
        _networkInfo = networkInfo;

  @override
  Future<Either<Failure, User>> login({
    required String email,
    required String password,
    required String deviceName,
  }) async {
    try {
      // Verificar conectividad
      if (!await _networkInfo.isConnected) {
        AppLogger.warning('AuthRepository: No internet connection for login');
        return const Left(NetworkFailure('Sin conexión a internet'));
      }

      // Llamar API
      AppLogger.info('AuthRepository: Calling remote login');
      final response = await _remoteDataSource.login(
        email: email,
        password: password,
        deviceName: deviceName,
      );

      // Guardar token
      await _localDataSource.saveToken(response.token);
      AppLogger.debug('AuthRepository: Token saved');

      // Guardar fecha de expiración
      final expiryDate = DateTime.now().add(
        Duration(seconds: response.expiresIn),
      );
      await _localDataSource.saveTokenExpiry(expiryDate);
      AppLogger.debug('AuthRepository: Token expiry saved');

      // Guardar usuario en caché
      await _localDataSource.saveUser(response.user);
      AppLogger.debug('AuthRepository: User cached');

      // Retornar entidad
      final userEntity = response.user.toEntity();
      AppLogger.info('AuthRepository: Login successful for user ${userEntity.email}');
      return Right(userEntity);
    } on ApiException catch (e) {
      AppLogger.error('AuthRepository: API error during login', error: e);
      return Left(ApiFailure(e.message, code: e.statusCode));
    } catch (e, stackTrace) {
      AppLogger.error(
        'AuthRepository: Unexpected error during login',
        error: e,
        stackTrace: stackTrace,
      );
      return Left(UnexpectedFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, User>> getCurrentUser() async {
    try {
      // Intentar obtener de caché primero
      AppLogger.debug('AuthRepository: Checking cached user');
      final cachedUser = await _localDataSource.getCachedUser();

      if (cachedUser != null) {
        AppLogger.debug('AuthRepository: Returning cached user');
        return Right(cachedUser.toEntity());
      }

      // Si no hay caché, obtener de API
      AppLogger.debug('AuthRepository: No cached user, fetching from API');

      if (!await _networkInfo.isConnected) {
        AppLogger.warning('AuthRepository: No internet and no cached user');
        return const Left(NetworkFailure('Sin conexión y sin datos en caché'));
      }

      final userModel = await _remoteDataSource.getCurrentUser();

      // Guardar en caché
      await _localDataSource.saveUser(userModel);
      AppLogger.debug('AuthRepository: User fetched and cached');

      return Right(userModel.toEntity());
    } on ApiException catch (e) {
      AppLogger.error('AuthRepository: API error getting current user', error: e);

      // Si es 401, limpiar datos locales
      if (e.statusCode == 401) {
        AppLogger.warning('AuthRepository: Unauthorized, clearing local data');
        await _localDataSource.clearAll();
      }

      return Left(ApiFailure(e.message, code: e.statusCode));
    } catch (e, stackTrace) {
      AppLogger.error(
        'AuthRepository: Unexpected error getting current user',
        error: e,
        stackTrace: stackTrace,
      );
      return Left(UnexpectedFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> logout() async {
    try {
      AppLogger.info('AuthRepository: Logging out');

      // Intentar llamar al API (no crítico si falla)
      if (await _networkInfo.isConnected) {
        try {
          await _remoteDataSource.logout();
          AppLogger.debug('AuthRepository: API logout successful');
        } catch (e) {
          AppLogger.warning('AuthRepository: API logout failed, continuing with local cleanup', error: e);
          // No retornar error, continuar con limpieza local
        }
      }

      // Limpiar datos locales (crítico)
      await _localDataSource.clearAll();
      AppLogger.info('AuthRepository: Local data cleared, logout complete');

      return const Right(null);
    } catch (e, stackTrace) {
      AppLogger.error(
        'AuthRepository: Error during logout',
        error: e,
        stackTrace: stackTrace,
      );
      return Left(CacheFailure('Error al cerrar sesión localmente'));
    }
  }

  @override
  Future<Either<Failure, void>> logoutAll() async {
    try {
      AppLogger.info('AuthRepository: Logging out from all devices');

      if (!await _networkInfo.isConnected) {
        return const Left(NetworkFailure('Sin conexión a internet'));
      }

      // Llamar API para revocar todos los tokens
      await _remoteDataSource.logoutAll();

      // Limpiar datos locales
      await _localDataSource.clearAll();

      AppLogger.info('AuthRepository: Logout all complete');
      return const Right(null);
    } on ApiException catch (e) {
      AppLogger.error('AuthRepository: API error during logout all', error: e);
      return Left(ApiFailure(e.message, code: e.statusCode));
    } catch (e, stackTrace) {
      AppLogger.error(
        'AuthRepository: Unexpected error during logout all',
        error: e,
        stackTrace: stackTrace,
      );
      return Left(UnexpectedFailure(e.toString()));
    }
  }

  @override
  Future<bool> isAuthenticated() async {
    try {
      final token = await _localDataSource.getToken();
      final isAuth = token != null;
      AppLogger.debug('AuthRepository: Is authenticated = $isAuth');
      return isAuth;
    } catch (e) {
      AppLogger.error('AuthRepository: Error checking auth status', error: e);
      return false;
    }
  }
}
