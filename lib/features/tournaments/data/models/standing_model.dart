/// Model de Tabla de Posiciones con Freezed.
library;

import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/standing.dart';

part 'standing_model.freezed.dart';
part 'standing_model.g.dart';

@freezed
class StandingModel with _$StandingModel {
  const StandingModel._();

  const factory StandingModel({
    required int position,
    @JsonKey(name: 'team_id') required int teamId,
    @JsonKey(name: 'team_name') required String teamName,
    @JsonKey(name: 'team_logo') String? teamLogo,
    @JsonKey(name: 'matches_played') required int matchesPlayed,
    required int wins,
    required int losses,
    required int points,
    @JsonKey(name: 'sets_for') required int setsFor,
    @JsonKey(name: 'sets_against') required int setsAgainst,
    @JsonKey(name: 'set_difference') required int setDifference,
    @JsonKey(name: 'points_for') required int pointsFor,
    @JsonKey(name: 'points_against') required int pointsAgainst,
  }) = _StandingModel;

  factory StandingModel.fromJson(Map<String, dynamic> json) =>
      _$StandingModelFromJson(json);

  Standing toEntity() {
    return Standing(
      position: position,
      teamId: teamId,
      teamName: teamName,
      teamLogo: teamLogo,
      matchesPlayed: matchesPlayed,
      wins: wins,
      losses: losses,
      points: points,
      setsFor: setsFor,
      setsAgainst: setsAgainst,
      setDifference: setDifference,
      pointsFor: pointsFor,
      pointsAgainst: pointsAgainst,
    );
  }
}

@freezed
class StandingsResponseModel with _$StandingsResponseModel {
  const StandingsResponseModel._();

  const factory StandingsResponseModel({
    required TournamentInfoModel tournament,
    required List<StandingModel> standings,
    @JsonKey(name: 'updated_at') required String updatedAt,
  }) = _StandingsResponseModel;

  factory StandingsResponseModel.fromJson(Map<String, dynamic> json) =>
      _$StandingsResponseModelFromJson(json);

  StandingsResponse toEntity() {
    return StandingsResponse(
      tournament: tournament.toEntity(),
      standings: standings.map((s) => s.toEntity()).toList(),
      updatedAt: DateTime.parse(updatedAt),
    );
  }
}

@freezed
class TournamentInfoModel with _$TournamentInfoModel {
  const TournamentInfoModel._();

  const factory TournamentInfoModel({
    required int id,
    required String name,
  }) = _TournamentInfoModel;

  factory TournamentInfoModel.fromJson(Map<String, dynamic> json) =>
      _$TournamentInfoModelFromJson(json);

  TournamentInfo toEntity() {
    return TournamentInfo(
      id: id,
      name: name,
    );
  }
}
