/// Formateadores de datos.
///
/// Funciones para formatear fechas, números, texto, etc.
library;

import 'package:intl/intl.dart';
import '../constants/app_constants.dart';

class Formatters {
  Formatters._();

  // ============================================================================
  // DATE FORMATTERS
  // ============================================================================

  /// Formatea fecha para mostrar (dd/MM/yyyy)
  static String formatDate(DateTime date) {
    return DateFormat(AppConstants.dateFormatDisplay).format(date);
  }

  /// Formatea fecha y hora para mostrar (dd/MM/yyyy HH:mm)
  static String formatDateTime(DateTime dateTime) {
    return DateFormat(AppConstants.dateTimeFormatDisplay).format(dateTime);
  }

  /// Formatea solo hora (HH:mm)
  static String formatTime(DateTime dateTime) {
    return DateFormat(AppConstants.timeFormatDisplay).format(dateTime);
  }

  /// Formatea fecha para enviar a API (yyyy-MM-dd)
  static String formatDateForApi(DateTime date) {
    return DateFormat(AppConstants.dateFormatApi).format(date);
  }

  /// Formatea fecha y hora para enviar a API (ISO 8601)
  static String formatDateTimeForApi(DateTime dateTime) {
    return dateTime.toUtc().toIso8601String();
  }

  /// Parsea fecha desde string
  static DateTime? parseDate(String? dateString) {
    if (dateString == null || dateString.isEmpty) return null;

    try {
      return DateTime.parse(dateString);
    } catch (e) {
      return null;
    }
  }

  /// Formatea fecha relativa (hace 2 horas, hace 3 días, etc.)
  static String formatRelativeTime(DateTime dateTime) {
    final now = DateTime.now();
    final difference = now.difference(dateTime);

    if (difference.inSeconds < 60) {
      return 'Hace ${difference.inSeconds} segundos';
    } else if (difference.inMinutes < 60) {
      return 'Hace ${difference.inMinutes} ${difference.inMinutes == 1 ? 'minuto' : 'minutos'}';
    } else if (difference.inHours < 24) {
      return 'Hace ${difference.inHours} ${difference.inHours == 1 ? 'hora' : 'horas'}';
    } else if (difference.inDays < 7) {
      return 'Hace ${difference.inDays} ${difference.inDays == 1 ? 'día' : 'días'}';
    } else if (difference.inDays < 30) {
      final weeks = (difference.inDays / 7).floor();
      return 'Hace $weeks ${weeks == 1 ? 'semana' : 'semanas'}';
    } else if (difference.inDays < 365) {
      final months = (difference.inDays / 30).floor();
      return 'Hace $months ${months == 1 ? 'mes' : 'meses'}';
    } else {
      final years = (difference.inDays / 365).floor();
      return 'Hace $years ${years == 1 ? 'año' : 'años'}';
    }
  }

  /// Calcula edad desde fecha de nacimiento
  static int calculateAge(DateTime birthDate) {
    final now = DateTime.now();
    int age = now.year - birthDate.year;

    if (now.month < birthDate.month ||
        (now.month == birthDate.month && now.day < birthDate.day)) {
      age--;
    }

    return age;
  }

  // ============================================================================
  // NUMBER FORMATTERS
  // ============================================================================

  /// Formatea número con separadores de miles
  static String formatNumber(num number) {
    return NumberFormat('#,##0', 'es').format(number);
  }

  /// Formatea número decimal
  static String formatDecimal(num number, {int decimals = 2}) {
    return NumberFormat('#,##0.${'0' * decimals}', 'es').format(number);
  }

  /// Formatea porcentaje
  static String formatPercentage(num value, {int decimals = 1}) {
    return '${formatDecimal(value * 100, decimals: decimals)}%';
  }

  /// Formatea moneda (COP)
  static String formatCurrency(num amount) {
    return NumberFormat.currency(
      locale: 'es_CO',
      symbol: '\$',
      decimalDigits: 0,
    ).format(amount);
  }

  // ============================================================================
  // TEXT FORMATTERS
  // ============================================================================

  /// Capitaliza primera letra
  static String capitalize(String text) {
    if (text.isEmpty) return text;
    return text[0].toUpperCase() + text.substring(1).toLowerCase();
  }

  /// Capitaliza cada palabra
  static String capitalizeWords(String text) {
    if (text.isEmpty) return text;
    return text.split(' ').map((word) => capitalize(word)).join(' ');
  }

  /// Trunca texto si es muy largo
  static String truncate(String text, int maxLength, {String suffix = '...'}) {
    if (text.length <= maxLength) return text;
    return '${text.substring(0, maxLength - suffix.length)}$suffix';
  }

  /// Formatea número de teléfono
  static String formatPhone(String phone) {
    // Eliminar caracteres no numéricos
    final digits = phone.replaceAll(RegExp(r'[^\d]'), '');

    // Formato: +57 300 123 4567
    if (digits.length == 10) {
      return '+57 ${digits.substring(0, 3)} ${digits.substring(3, 6)} ${digits.substring(6)}';
    } else if (digits.length == 12 && digits.startsWith('57')) {
      return '+${digits.substring(0, 2)} ${digits.substring(2, 5)} ${digits.substring(5, 8)} ${digits.substring(8)}';
    }

    return phone;
  }

  // ============================================================================
  // CARD NUMBER FORMATTERS
  // ============================================================================

  /// Formatea número de carnet (VP2024001)
  static String formatCardNumber(String cardNumber) {
    return cardNumber.toUpperCase();
  }

  /// Oculta parte del número de carnet para privacidad
  static String maskCardNumber(String cardNumber) {
    if (cardNumber.length <= 4) return cardNumber;
    final visiblePart = cardNumber.substring(cardNumber.length - 4);
    final maskedPart = '*' * (cardNumber.length - 4);
    return '$maskedPart$visiblePart';
  }

  // ============================================================================
  // DURATION FORMATTERS
  // ============================================================================

  /// Formatea duración en minutos a HH:mm
  static String formatDuration(int minutes) {
    final hours = minutes ~/ 60;
    final mins = minutes % 60;

    if (hours > 0) {
      return '${hours}h ${mins}m';
    } else {
      return '${mins}m';
    }
  }

  /// Formatea duración en segundos a MM:SS
  static String formatDurationSeconds(int seconds) {
    final mins = seconds ~/ 60;
    final secs = seconds % 60;
    return '${mins.toString().padLeft(2, '0')}:${secs.toString().padLeft(2, '0')}';
  }

  // ============================================================================
  // FILE SIZE FORMATTERS
  // ============================================================================

  /// Formatea tamaño de archivo
  static String formatFileSize(int bytes) {
    const units = ['B', 'KB', 'MB', 'GB', 'TB'];
    var size = bytes.toDouble();
    var unitIndex = 0;

    while (size >= 1024 && unitIndex < units.length - 1) {
      size /= 1024;
      unitIndex++;
    }

    return '${size.toStringAsFixed(2)} ${units[unitIndex]}';
  }

  // ============================================================================
  // ENUM FORMATTERS
  // ============================================================================

  /// Formatea enum a string legible
  static String formatEnum(Enum value) {
    return value.name.split('_').map((word) => capitalize(word)).join(' ');
  }

  // ============================================================================
  // LIST FORMATTERS
  // ============================================================================

  /// Formatea lista como string separado por comas
  static String formatList(List<String> items, {String separator = ', '}) {
    return items.join(separator);
  }

  /// Formatea lista con "y" al final
  static String formatListWithAnd(List<String> items) {
    if (items.isEmpty) return '';
    if (items.length == 1) return items[0];
    if (items.length == 2) return '${items[0]} y ${items[1]}';

    final allButLast = items.sublist(0, items.length - 1);
    final last = items.last;
    return '${allButLast.join(', ')} y $last';
  }
}
