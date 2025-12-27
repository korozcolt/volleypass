/// Caso de uso: Login de usuario.
///
/// Maneja la lógica de negocio para el inicio de sesión.
library;

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../../../../core/constants/app_constants.dart';
import '../entities/user.dart';
import '../repositories/auth_repository.dart';

class LoginUseCase implements UseCase<User, LoginParams> {
  final AuthRepository _repository;

  LoginUseCase(this._repository);

  @override
  Future<Either<Failure, User>> call(LoginParams params) async {
    // Validación de email
    if (!_isValidEmail(params.email)) {
      return const Left(
        ValidationFailure('Email inválido (sin acentos permitidos)'),
      );
    }

    // Validación de contraseña
    if (params.password.length < AppConstants.minPasswordLength) {
      return Left(
        ValidationFailure(
          'La contraseña debe tener al menos ${AppConstants.minPasswordLength} caracteres',
        ),
      );
    }

    // Delegar al repositorio
    return await _repository.login(
      email: params.email,
      password: params.password,
      deviceName: params.deviceName,
    );
  }

  /// Valida formato de email
  bool _isValidEmail(String email) {
    return AppConstants.emailRegex.hasMatch(email);
  }
}

/// Parámetros para el login
class LoginParams extends Equatable {
  final String email;
  final String password;
  final String deviceName;

  const LoginParams({
    required this.email,
    required this.password,
    required this.deviceName,
  });

  @override
  List<Object> get props => [email, password, deviceName];
}
