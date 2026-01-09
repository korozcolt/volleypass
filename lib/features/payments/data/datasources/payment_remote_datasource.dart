/// Datasource remoto para pagos.
library;

import 'dart:io';
import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';
import '../../../../core/network/api_client.dart';
import '../../../../core/constants/api_endpoints.dart';
import '../../../../core/error/api_exception.dart';
import '../models/payment_model.dart';

abstract class PaymentRemoteDataSource {
  /// Obtener lista de pagos del jugador
  ///
  /// [status] - Filtrar por estado (opcional)
  /// [type] - Filtrar por tipo (opcional)
  /// [page] - Número de página
  Future<PaymentListResponse> getPayments({
    String? status,
    String? type,
    int page = 1,
  });

  /// Obtener detalle de un pago
  Future<PaymentResponse> getPaymentDetail(int paymentId);

  /// Subir comprobante de pago
  ///
  /// [paymentId] - ID del pago
  /// [file] - Archivo del comprobante (imagen o PDF)
  Future<UploadProofResponse> uploadProof(int paymentId, File file);

  /// Obtener pagos del club (para ClubAdmin/Coach)
  ///
  /// [status] - Filtrar por estado
  /// [page] - Número de página
  Future<PaymentListResponse> getClubPayments({
    String? status,
    int page = 1,
  });

  /// Verificar (aprobar/rechazar) pago del club
  ///
  /// [paymentId] - ID del pago
  /// [action] - "approve" o "reject"
  /// [notes] - Notas (requerido si se rechaza)
  Future<VerifyPaymentResponse> verifyPayment(
    int paymentId,
    String action,
    String? notes,
  );

  /// Obtener estadísticas de pagos del club
  Future<ClubPaymentStatistics> getClubPaymentStatistics();
}

class PaymentRemoteDataSourceImpl implements PaymentRemoteDataSource {
  final ApiClient apiClient;

  PaymentRemoteDataSourceImpl(this.apiClient);

  @override
  Future<PaymentListResponse> getPayments({
    String? status,
    String? type,
    int page = 1,
  }) async {
    try {
      final queryParams = <String, dynamic>{
        'page': page,
        if (status != null) 'status': status,
        if (type != null) 'type': type,
      };

      final response = await apiClient.get(
        ApiEndpoints.payments,
        queryParameters: queryParams,
      );

      if (response.data == null) {
        throw ApiException(
          message: 'No se recibió respuesta del servidor',
          statusCode: response.statusCode ?? 500,
        );
      }

      return PaymentListResponse.fromJson(
        response.data as Map<String, dynamic>,
      );
    } on DioException catch (e) {
      throw ApiException(
        message: e.response?.data?['message'] ?? 'Error al obtener pagos',
        statusCode: e.response?.statusCode ?? 500,
      );
    } catch (e) {
      throw ApiException(
        message: 'Error inesperado: $e',
        statusCode: 500,
      );
    }
  }

  @override
  Future<PaymentResponse> getPaymentDetail(int paymentId) async {
    try {
      final response = await apiClient.get(
        ApiEndpoints.paymentDetail(paymentId),
      );

      if (response.data == null) {
        throw ApiException(
          message: 'No se recibió respuesta del servidor',
          statusCode: response.statusCode ?? 500,
        );
      }

      return PaymentResponse.fromJson(
        response.data as Map<String, dynamic>,
      );
    } on DioException catch (e) {
      throw ApiException(
        message: e.response?.data?['message'] ?? 'Error al obtener el pago',
        statusCode: e.response?.statusCode ?? 500,
      );
    } catch (e) {
      throw ApiException(
        message: 'Error inesperado: $e',
        statusCode: 500,
      );
    }
  }

  @override
  Future<UploadProofResponse> uploadProof(int paymentId, File file) async {
    try {
      // Determinar el tipo MIME del archivo
      final fileName = file.path.split('/').last;
      final extension = fileName.split('.').last.toLowerCase();

      MediaType? mediaType;
      if (extension == 'jpg' || extension == 'jpeg') {
        mediaType = MediaType('image', 'jpeg');
      } else if (extension == 'png') {
        mediaType = MediaType('image', 'png');
      } else if (extension == 'pdf') {
        mediaType = MediaType('application', 'pdf');
      }

      // Crear FormData con el archivo
      final formData = FormData.fromMap({
        'proof': await MultipartFile.fromFile(
          file.path,
          filename: fileName,
          contentType: mediaType,
        ),
      });

      final response = await apiClient.post(
        ApiEndpoints.paymentUploadProof(paymentId),
        data: formData,
      );

      if (response.data == null) {
        throw ApiException(
          message: 'No se recibió respuesta del servidor',
          statusCode: response.statusCode ?? 500,
        );
      }

      return UploadProofResponse.fromJson(
        response.data as Map<String, dynamic>,
      );
    } on DioException catch (e) {
      throw ApiException(
        message: e.response?.data?['message'] ?? 'Error al subir comprobante',
        statusCode: e.response?.statusCode ?? 500,
      );
    } catch (e) {
      throw ApiException(
        message: 'Error inesperado: $e',
        statusCode: 500,
      );
    }
  }

  @override
  Future<PaymentListResponse> getClubPayments({
    String? status,
    int page = 1,
  }) async {
    try {
      final queryParams = <String, dynamic>{
        'page': page,
        if (status != null) 'status': status,
      };

      final response = await apiClient.get(
        ApiEndpoints.clubPayments,
        queryParameters: queryParams,
      );

      if (response.data == null) {
        throw ApiException(
          message: 'No se recibió respuesta del servidor',
          statusCode: response.statusCode ?? 500,
        );
      }

      return PaymentListResponse.fromJson(
        response.data as Map<String, dynamic>,
      );
    } on DioException catch (e) {
      throw ApiException(
        message: e.response?.data?['message'] ??
            'Error al obtener pagos del club',
        statusCode: e.response?.statusCode ?? 500,
      );
    } catch (e) {
      throw ApiException(
        message: 'Error inesperado: $e',
        statusCode: 500,
      );
    }
  }

  @override
  Future<VerifyPaymentResponse> verifyPayment(
    int paymentId,
    String action,
    String? notes,
  ) async {
    try {
      final requestData = VerifyPaymentRequest(
        action: action,
        notes: notes,
      ).toJson();

      final response = await apiClient.put(
        ApiEndpoints.clubPaymentVerify(paymentId),
        data: requestData,
      );

      if (response.data == null) {
        throw ApiException(
          message: 'No se recibió respuesta del servidor',
          statusCode: response.statusCode ?? 500,
        );
      }

      return VerifyPaymentResponse.fromJson(
        response.data as Map<String, dynamic>,
      );
    } on DioException catch (e) {
      throw ApiException(
        message: e.response?.data?['message'] ?? 'Error al verificar pago',
        statusCode: e.response?.statusCode ?? 500,
      );
    } catch (e) {
      throw ApiException(
        message: 'Error inesperado: $e',
        statusCode: 500,
      );
    }
  }

  @override
  Future<ClubPaymentStatistics> getClubPaymentStatistics() async {
    try {
      final response = await apiClient.get(
        ApiEndpoints.clubPaymentsStatistics,
      );

      if (response.data == null) {
        throw ApiException(
          message: 'No se recibió respuesta del servidor',
          statusCode: response.statusCode ?? 500,
        );
      }

      return ClubPaymentStatistics.fromJson(
        response.data as Map<String, dynamic>,
      );
    } on DioException catch (e) {
      throw ApiException(
        message: e.response?.data?['message'] ??
            'Error al obtener estadísticas',
        statusCode: e.response?.statusCode ?? 500,
      );
    } catch (e) {
      throw ApiException(
        message: 'Error inesperado: $e',
        statusCode: 500,
      );
    }
  }
}
