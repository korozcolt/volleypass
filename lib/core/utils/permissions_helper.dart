/// Helper para verificar permisos y abilities.
///
/// Proporciona métodos para verificar si un usuario tiene permisos específicos.
library;

import '../../features/auth/domain/entities/user.dart';

class PermissionsHelper {
  /// Verifica si el usuario tiene una ability específica
  static bool hasAbility(User user, String ability) {
    // SuperAdmin tiene acceso a todo
    if (user.abilities.contains('*')) {
      return true;
    }

    // Verificar ability específica
    return user.abilities.contains(ability);
  }

  /// Verifica si el usuario tiene al menos una de las abilities especificadas
  static bool hasAnyAbility(User user, List<String> abilities) {
    // SuperAdmin tiene acceso a todo
    if (user.abilities.contains('*')) {
      return true;
    }

    // Verificar si tiene al menos una ability
    return abilities.any((ability) => user.abilities.contains(ability));
  }

  /// Verifica si el usuario tiene todas las abilities especificadas
  static bool hasAllAbilities(User user, List<String> abilities) {
    // SuperAdmin tiene acceso a todo
    if (user.abilities.contains('*')) {
      return true;
    }

    // Verificar que tenga todas las abilities
    return abilities.every((ability) => user.abilities.contains(ability));
  }

  /// Verifica si el usuario tiene un rol específico
  static bool hasRole(User user, String role) {
    return user.roles.contains(role);
  }

  /// Verifica si el usuario tiene al menos uno de los roles especificados
  static bool hasAnyRole(User user, List<String> roles) {
    return roles.any((role) => user.roles.contains(role));
  }

  /// Verifica si el usuario es SuperAdmin
  static bool isSuperAdmin(User user) {
    return user.roles.contains('SuperAdmin') || user.abilities.contains('*');
  }

  /// Verifica si el usuario es administrador (SuperAdmin o LeagueAdmin)
  static bool isAdmin(User user) {
    return hasAnyRole(user, ['SuperAdmin', 'LeagueAdmin']);
  }

  /// Verifica si el usuario puede verificar QR
  static bool canVerifyQR(User user) {
    return hasAnyAbility(user, ['verify:qr', 'verify:batch']);
  }

  /// Verifica si el usuario puede gestionar partidos
  static bool canManageMatches(User user) {
    return hasAbility(user, 'manage:matches');
  }

  /// Verifica si el usuario puede ver estadísticas
  static bool canViewStats(User user) {
    return hasAnyAbility(user, ['view:stats', 'view:own-stats']);
  }

  /// Verifica si el usuario puede gestionar eventos
  static bool canManageEvents(User user) {
    return hasAbility(user, 'manage:events');
  }

  /// Verifica si el usuario puede gestionar club
  static bool canManageClub(User user) {
    return hasAbility(user, 'manage:club');
  }

  /// Verifica si el usuario puede agregar sanciones
  static bool canAddSanctions(User user) {
    return hasAbility(user, 'add:sanctions');
  }

  /// Verifica si el usuario puede ver su equipo
  static bool canViewTeam(User user) {
    return hasAnyAbility(user, ['view:team', 'view:players']);
  }

  /// Verifica si el usuario puede modificar planillas (crear, pausar, completar)
  /// Solo árbitros pueden modificar planillas
  static bool canModifySessions(User user) {
    return hasRole(user, 'Referee');
  }

  /// Verifica si el usuario puede ver planillas
  /// Coaches, directores de club, admins y árbitros pueden ver
  static bool canViewSessions(User user) {
    return hasAnyRole(user, [
      'Referee',
      'Coach',
      'ClubAdmin',
      'LeagueAdmin',
      'SuperAdmin',
    ]);
  }
}
