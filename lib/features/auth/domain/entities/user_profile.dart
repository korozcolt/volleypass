/// Perfil de usuario (información adicional).
///
/// Entity pura de dominio que representa el perfil extendido de un usuario.
library;

import 'package:equatable/equatable.dart';

class UserProfile extends Equatable {
  final String? avatarUrl;
  final String? phone;

  const UserProfile({
    this.avatarUrl,
    this.phone,
  });

  @override
  List<Object?> get props => [avatarUrl, phone];

  @override
  String toString() {
    return 'UserProfile(avatarUrl: $avatarUrl, phone: $phone)';
  }
}
