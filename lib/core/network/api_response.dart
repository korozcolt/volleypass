/// Modelo de respuesta de la API.
///
/// Wrapper type-safe para las respuestas de la API de VolleyPass.
/// Todas las respuestas siguen el formato estándar de la API.
library;

import 'package:dio/dio.dart';

/// Respuesta genérica de la API
class ApiResponse<T> {
  final bool success;
  final T? data;
  final String? message;
  final Map<String, dynamic>? meta;
  final Map<String, dynamic>? errors;

  const ApiResponse({
    required this.success,
    this.data,
    this.message,
    this.meta,
    this.errors,
  });

  /// Crea ApiResponse desde Response de Dio
  factory ApiResponse.fromResponse(
    Response response, {
    T Function(dynamic)? fromJson,
  }) {
    final jsonData = response.data as Map<String, dynamic>?;

    if (jsonData == null) {
      return ApiResponse<T>(
        success: response.statusCode == 200 || response.statusCode == 201,
        message: 'Empty response',
      );
    }

    T? parsedData;

    // Si hay fromJson, usarlo para parsear data
    if (fromJson != null && jsonData['data'] != null) {
      try {
        parsedData = fromJson(jsonData['data']);
      } catch (e) {
        throw FormatException('Error parsing API response data: $e');
      }
    } else if (jsonData['data'] != null) {
      // Si no hay fromJson, intentar cast directo
      parsedData = jsonData['data'] as T?;
    }

    // Determinar success basado en statusCode si no viene en JSON
    final bool isSuccess = jsonData['success'] as bool? ??
        (response.statusCode != null && response.statusCode! >= 200 && response.statusCode! < 300);

    // Extraer mensaje de error si existe
    final String? responseMessage = jsonData['message'] as String? ??
        jsonData['error'] as String?;

    return ApiResponse<T>(
      success: isSuccess,
      data: parsedData,
      message: responseMessage,
      meta: jsonData['meta'] as Map<String, dynamic>?,
      errors: jsonData['errors'] as Map<String, dynamic>?,
    );
  }

  /// Crea ApiResponse de éxito
  factory ApiResponse.success({T? data, String? message}) {
    return ApiResponse<T>(
      success: true,
      data: data,
      message: message,
    );
  }

  /// Crea ApiResponse de error
  factory ApiResponse.error({String? message, Map<String, dynamic>? errors}) {
    return ApiResponse<T>(
      success: false,
      message: message,
      errors: errors,
    );
  }

  /// Verifica si la respuesta es exitosa
  bool get isSuccess => success;

  /// Verifica si la respuesta es error
  bool get isError => !success;

  /// Obtiene data o lanza excepción si es null
  T get dataOrThrow {
    if (data == null) {
      throw StateError('ApiResponse data is null');
    }
    return data!;
  }

  @override
  String toString() => 'ApiResponse(success: $success, message: $message, hasData: ${data != null})';
}

/// Respuesta paginada de la API
class PaginatedApiResponse<T> {
  final bool success;
  final List<T> data;
  final String? message;
  final PaginationMeta pagination;

  const PaginatedApiResponse({
    required this.success,
    required this.data,
    required this.pagination,
    this.message,
  });

  /// Crea PaginatedApiResponse desde Response de Dio
  factory PaginatedApiResponse.fromResponse(
    Response response, {
    required T Function(Map<String, dynamic>) fromJson,
  }) {
    final jsonData = response.data as Map<String, dynamic>;
    final responseData = jsonData['data'] as Map<String, dynamic>;

    final dataList = (responseData['data'] as List)
        .map((item) => fromJson(item as Map<String, dynamic>))
        .toList();

    return PaginatedApiResponse<T>(
      success: jsonData['success'] as bool? ?? true,
      data: dataList,
      message: jsonData['message'] as String?,
      pagination: PaginationMeta.fromJson(responseData),
    );
  }

  /// Verifica si hay más páginas
  bool get hasMore => pagination.hasMore;

  /// Página actual
  int get currentPage => pagination.currentPage;

  /// Total de items
  int get total => pagination.total;
}

/// Metadatos de paginación
class PaginationMeta {
  final int currentPage;
  final int lastPage;
  final int perPage;
  final int total;
  final int from;
  final int to;

  const PaginationMeta({
    required this.currentPage,
    required this.lastPage,
    required this.perPage,
    required this.total,
    required this.from,
    required this.to,
  });

  factory PaginationMeta.fromJson(Map<String, dynamic> json) {
    return PaginationMeta(
      currentPage: json['current_page'] as int,
      lastPage: json['last_page'] as int,
      perPage: json['per_page'] as int,
      total: json['total'] as int,
      from: json['from'] as int? ?? 0,
      to: json['to'] as int? ?? 0,
    );
  }

  /// Verifica si hay más páginas
  bool get hasMore => currentPage < lastPage;

  /// Siguiente página
  int? get nextPage => hasMore ? currentPage + 1 : null;

  /// Página anterior
  int? get previousPage => currentPage > 1 ? currentPage - 1 : null;
}
