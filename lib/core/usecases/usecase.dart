/// Caso de uso base.
///
/// Define la estructura básica de un caso de uso en Clean Architecture.
library;

import 'package:dartz/dartz.dart';
import '../error/failures.dart';

/// Interface base para casos de uso con parámetros
abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

/// Clase para indicar que un UseCase no requiere parámetros
class NoParams {
  const NoParams();
}
