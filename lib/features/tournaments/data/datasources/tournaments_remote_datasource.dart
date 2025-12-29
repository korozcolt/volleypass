/// Remote datasource para torneos públicos.
library;

import 'package:dio/dio.dart';
import '../../../../core/network/api_client.dart';
import '../../../../core/constants/api_endpoints.dart';
import '../../../../core/error/api_exception.dart';
import '../models/tournament_model.dart';
import '../models/tournament_detail_model.dart';
import '../models/standing_model.dart';

abstract class TournamentsRemoteDataSource {
  Future<List<TournamentModel>> getTournaments({
    String? status,
    String? type,
    String? category,
    String? gender,
    int page = 1,
  });

  Future<TournamentDetailModel> getTournamentById(int id);

  Future<StandingsResponseModel> getTournamentStandings(int tournamentId);
}

class TournamentsRemoteDataSourceImpl implements TournamentsRemoteDataSource {
  final ApiClient apiClient;

  TournamentsRemoteDataSourceImpl(this.apiClient);

  @override
  Future<List<TournamentModel>> getTournaments({
    String? status,
    String? type,
    String? category,
    String? gender,
    int page = 1,
  }) async {
    try {
      final queryParameters = <String, dynamic>{
        'page': page,
        if (status != null) 'status': status,
        if (type != null) 'type': type,
        if (category != null) 'category': category,
        if (gender != null) 'gender': gender,
      };

      final response = await apiClient.get(
        ApiEndpoints.publicTournaments,
        queryParameters: queryParameters,
      );

      if (response.data == null || response.data['data'] == null) {
        throw ApiException(
          message: 'No se recibió respuesta del servidor',
          statusCode: response.statusCode ?? 500,
        );
      }

      final data = response.data['data']['data'] as List;
      return data
          .map((json) => TournamentModel.fromJson(json as Map<String, dynamic>))
          .toList();
    } on DioException catch (e) {
      throw ApiException(
        message: e.response?.data?['message'] ?? 'Error al obtener torneos',
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
  Future<TournamentDetailModel> getTournamentById(int id) async {
    try {
      final response = await apiClient.get(
        '${ApiEndpoints.publicTournaments}/$id',
      );

      if (response.data == null || response.data['data'] == null) {
        throw ApiException(
          message: 'No se recibió respuesta del servidor',
          statusCode: response.statusCode ?? 500,
        );
      }

      return TournamentDetailModel.fromJson(
        response.data['data'] as Map<String, dynamic>,
      );
    } on DioException catch (e) {
      if (e.response?.statusCode == 404) {
        throw ApiException(
          message: 'Torneo no encontrado',
          statusCode: 404,
        );
      }

      throw ApiException(
        message: e.response?.data?['message'] ?? 'Error al obtener torneo',
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
  Future<StandingsResponseModel> getTournamentStandings(
    int tournamentId,
  ) async {
    try {
      final response = await apiClient.get(
        '${ApiEndpoints.publicTournaments}/$tournamentId/standings',
      );

      if (response.data == null || response.data['data'] == null) {
        throw ApiException(
          message: 'No se recibió respuesta del servidor',
          statusCode: response.statusCode ?? 500,
        );
      }

      return StandingsResponseModel.fromJson(
        response.data['data'] as Map<String, dynamic>,
      );
    } on DioException catch (e) {
      if (e.response?.statusCode == 404) {
        throw ApiException(
          message: 'Tabla de posiciones no encontrada',
          statusCode: 404,
        );
      }

      throw ApiException(
        message:
            e.response?.data?['message'] ?? 'Error al obtener tabla de posiciones',
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
