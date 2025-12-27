/// Usuario autenticado de la aplicación.
///
/// Entity pura de dominio que representa un usuario del sistema.
/// Contiene la información básica del usuario y sus permisos.
library;

import 'package:equatable/equatable.dart';
import 'user_profile.dart';

class User extends Equatable {
  final int id;
  final String name;
  final String email;
  final String? firstName;
  final String? lastName;
  final List<String> roles;
  final List<String> abilities;
  final UserProfile? profile;

  const User({
    required this.id,
    required this.name,
    required this.email,
    this.firstName,
    this.lastName,
    required this.roles,
    required this.abilities,
    this.profile,
  });

  /// Verifica si el usuario tiene un rol específico
  bool hasRole(String role) => roles.contains(role);

  /// Verifica si el usuario tiene una habilidad específica
  bool hasAbility(String ability) => abilities.contains(ability);

  /// Verifica si el usuario es verificador
  bool get isVerifier => hasRole('Verifier');

  /// Verifica si el usuario es administrador
  bool get isAdmin => hasRole('Admin');

  /// Obtiene el nombre completo del usuario
  String get fullName {
    if (firstName != null && lastName != null) {
      return '$firstName $lastName';
    }
    return name;
  }

  @override
  List<Object?> get props => [
        id,
        name,
        email,
        firstName,
        lastName,
        roles,
        abilities,
        profile,
      ];

  @override
  String toString() {
    return 'User(id: $id, name: $name, email: $email, roles: $roles)';
  }
}
