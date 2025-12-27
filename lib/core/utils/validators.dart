/// Validadores de formularios.
///
/// Funciones de validación reutilizables para toda la aplicación.
/// Siguen las especificaciones de la API.
library;

import '../constants/app_constants.dart';

class Validators {
  Validators._();

  /// Valida que un campo no esté vacío
  static String? required(String? value, {String fieldName = 'Campo'}) {
    if (value == null || value.trim().isEmpty) {
      return '$fieldName es requerido';
    }
    return null;
  }

  /// Valida email sin acentos (requerido por API)
  static String? email(String? value) {
    if (value == null || value.isEmpty) {
      return 'El email es requerido';
    }

    if (!AppConstants.emailRegex.hasMatch(value)) {
      return 'Email inválido (no se permiten acentos)';
    }

    return null;
  }

  /// Valida contraseña
  static String? password(String? value) {
    if (value == null || value.isEmpty) {
      return 'La contraseña es requerida';
    }

    if (value.length < AppConstants.minPasswordLength) {
      return 'La contraseña debe tener al menos ${AppConstants.minPasswordLength} caracteres';
    }

    return null;
  }

  /// Valida código QR (64 caracteres hexadecimales - SHA-256)
  static String? qrCode(String? value) {
    if (value == null || value.isEmpty) {
      return 'El código QR es requerido';
    }

    if (!AppConstants.qrCodeRegex.hasMatch(value)) {
      return 'Código QR inválido (debe ser 64 caracteres hexadecimales)';
    }

    return null;
  }

  /// Valida número de teléfono
  static String? phone(String? value, {bool required = false}) {
    if (value == null || value.isEmpty) {
      return required ? 'El teléfono es requerido' : null;
    }

    // Validación básica de teléfono (mínimo 7 dígitos)
    final phoneDigits = value.replaceAll(RegExp(r'[^\d]'), '');
    if (phoneDigits.length < 7) {
      return 'Teléfono inválido';
    }

    return null;
  }

  /// Valida longitud máxima
  static String? maxLength(String? value, int maxLength, {String fieldName = 'Campo'}) {
    if (value == null || value.isEmpty) {
      return null;
    }

    if (value.length > maxLength) {
      return '$fieldName debe tener máximo $maxLength caracteres';
    }

    return null;
  }

  /// Valida longitud mínima
  static String? minLength(String? value, int minLength, {String fieldName = 'Campo'}) {
    if (value == null || value.isEmpty) {
      return null;
    }

    if (value.length < minLength) {
      return '$fieldName debe tener mínimo $minLength caracteres';
    }

    return null;
  }

  /// Valida que sea un número
  static String? number(String? value, {bool required = false}) {
    if (value == null || value.isEmpty) {
      return required ? 'Este campo es requerido' : null;
    }

    if (int.tryParse(value) == null && double.tryParse(value) == null) {
      return 'Debe ser un número válido';
    }

    return null;
  }

  /// Valida que sea un número entero
  static String? integer(String? value, {bool required = false}) {
    if (value == null || value.isEmpty) {
      return required ? 'Este campo es requerido' : null;
    }

    if (int.tryParse(value) == null) {
      return 'Debe ser un número entero';
    }

    return null;
  }

  /// Valida rango de números
  static String? numberRange(
    String? value,
    num min,
    num max, {
    bool required = false,
  }) {
    if (value == null || value.isEmpty) {
      return required ? 'Este campo es requerido' : null;
    }

    final number = num.tryParse(value);
    if (number == null) {
      return 'Debe ser un número válido';
    }

    if (number < min || number > max) {
      return 'Debe estar entre $min y $max';
    }

    return null;
  }

  /// Valida URL
  static String? url(String? value, {bool required = false}) {
    if (value == null || value.isEmpty) {
      return required ? 'La URL es requerida' : null;
    }

    final urlPattern = RegExp(
      r'^https?:\/\/(www\.)?[-a-zA-Z0-9@:%._\+~#=]{1,256}\.[a-zA-Z0-9()]{1,6}\b([-a-zA-Z0-9()@:%_\+.~#?&//=]*)$',
    );

    if (!urlPattern.hasMatch(value)) {
      return 'URL inválida';
    }

    return null;
  }

  /// Combina múltiples validadores
  static String? Function(String?) combine(List<String? Function(String?)> validators) {
    return (String? value) {
      for (final validator in validators) {
        final result = validator(value);
        if (result != null) {
          return result;
        }
      }
      return null;
    };
  }

  /// Valida que dos campos coincidan (ej: confirmar contraseña)
  static String? match(String? value, String? otherValue, {String fieldName = 'Campo'}) {
    if (value != otherValue) {
      return '$fieldName no coincide';
    }
    return null;
  }

  /// Valida fecha en formato YYYY-MM-DD
  static String? date(String? value, {bool required = false}) {
    if (value == null || value.isEmpty) {
      return required ? 'La fecha es requerida' : null;
    }

    try {
      DateTime.parse(value);
      return null;
    } catch (e) {
      return 'Fecha inválida (formato: YYYY-MM-DD)';
    }
  }

  /// Valida que sea una fecha futura
  static String? futureDate(String? value, {bool required = false}) {
    final dateError = date(value, required: required);
    if (dateError != null) return dateError;

    if (value == null || value.isEmpty) return null;

    try {
      final date = DateTime.parse(value);
      if (date.isBefore(DateTime.now())) {
        return 'La fecha debe ser futura';
      }
      return null;
    } catch (e) {
      return 'Fecha inválida';
    }
  }

  /// Valida que sea una fecha pasada
  static String? pastDate(String? value, {bool required = false}) {
    final dateError = date(value, required: required);
    if (dateError != null) return dateError;

    if (value == null || value.isEmpty) return null;

    try {
      final date = DateTime.parse(value);
      if (date.isAfter(DateTime.now())) {
        return 'La fecha debe ser pasada';
      }
      return null;
    } catch (e) {
      return 'Fecha inválida';
    }
  }
}
