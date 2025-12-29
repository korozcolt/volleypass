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

  /// Obtiene las iniciales del usuario
  String get initials {
    final parts = fullName.split(' ');
    if (parts.length >= 2) {
      return '${parts[0][0]}${parts[1][0]}'.toUpperCase();
    } else if (parts.isNotEmpty) {
      return parts[0].substring(0, parts[0].length > 1 ? 2 : 1).toUpperCase();
    }
    return 'U';
  }

  /// Obtiene el rol principal del usuario
  String get primaryRole {
    if (roles.isEmpty) return 'Usuario';
    return roles.first;
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
