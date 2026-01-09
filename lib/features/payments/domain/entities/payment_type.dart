/// Tipos posibles de pago.
library;

enum PaymentType {
  /// Mensualidad
  monthlyFee,

  /// Inscripción
  registration,

  /// Torneo
  tournament,

  /// Multa
  fine,

  /// Federación
  federation,

  /// Club a Liga
  clubToLeague,

  /// Jugador a Club
  playerToClub;

  /// Convierte el enum a string para el API
  String toJson() {
    switch (this) {
      case PaymentType.monthlyFee:
        return 'monthly_fee';
      case PaymentType.registration:
        return 'registration';
      case PaymentType.tournament:
        return 'tournament';
      case PaymentType.fine:
        return 'fine';
      case PaymentType.federation:
        return 'federation';
      case PaymentType.clubToLeague:
        return 'club_to_league';
      case PaymentType.playerToClub:
        return 'player_to_club';
    }
  }

  /// Crea el enum desde string del API
  static PaymentType fromJson(String json) {
    switch (json) {
      case 'monthly_fee':
        return PaymentType.monthlyFee;
      case 'registration':
        return PaymentType.registration;
      case 'tournament':
        return PaymentType.tournament;
      case 'fine':
        return PaymentType.fine;
      case 'federation':
        return PaymentType.federation;
      case 'club_to_league':
        return PaymentType.clubToLeague;
      case 'player_to_club':
        return PaymentType.playerToClub;
      default:
        throw ArgumentError('Tipo de pago inválido: $json');
    }
  }

  /// Nombre amigable para mostrar en UI
  String get displayName {
    switch (this) {
      case PaymentType.monthlyFee:
        return 'Mensualidad';
      case PaymentType.registration:
        return 'Inscripción';
      case PaymentType.tournament:
        return 'Torneo';
      case PaymentType.fine:
        return 'Multa';
      case PaymentType.federation:
        return 'Federación';
      case PaymentType.clubToLeague:
        return 'Club a Liga';
      case PaymentType.playerToClub:
        return 'Jugador a Club';
    }
  }

  /// Icono sugerido para el tipo de pago
  String get iconName {
    switch (this) {
      case PaymentType.monthlyFee:
        return 'calendar_month';
      case PaymentType.registration:
        return 'person_add';
      case PaymentType.tournament:
        return 'emoji_events';
      case PaymentType.fine:
        return 'warning';
      case PaymentType.federation:
        return 'card_membership';
      case PaymentType.clubToLeague:
      case PaymentType.playerToClub:
        return 'payments';
    }
  }
}
