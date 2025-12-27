/// Repositorio de autenticación (interface).
///
/// Define el contrato para las operaciones de autenticación.
/// Esta es una abstracción que será implementada en la capa de datos.
library;

import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/user.dart';

abstract class AuthRepository {
  /// Realiza login con email y contraseña
  ///
  /// Retorna [User] si es exitoso o [Failure] si falla
  Future<Either<Failure, User>> login({
    required String email,
    required String password,
    required String deviceName,
  });

  /// Obtiene el usuario actualmente autenticado
  ///
  /// Retorna [User] si hay sesión activa o [Failure] si no hay sesión
  Future<Either<Failure, User>> getCurrentUser();

  /// Cierra la sesión del usuario actual
  ///
  /// Retorna [void] si es exitoso o [Failure] si falla
  Future<Either<Failure, void>> logout();

  /// Cierra sesión en todos los dispositivos
  ///
  /// Retorna [void] si es exitoso o [Failure] si falla
  Future<Either<Failure, void>> logoutAll();

  /// Verifica si el usuario está autenticado
  ///
  /// Retorna [true] si hay un token válido, [false] si no
  Future<bool> isAuthenticated();
}
