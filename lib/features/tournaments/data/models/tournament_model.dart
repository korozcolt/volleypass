/// Model de Torneo con Freezed para JSON serialization.
library;

import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/tournament.dart';

part 'tournament_model.freezed.dart';
part 'tournament_model.g.dart';

@freezed
class TournamentModel with _$TournamentModel {
  const TournamentModel._();

  const factory TournamentModel({
    required int id,
    required String name,
    required String slug,
    String? description,
    required String type,
    required String format,
    required String category,
    required String gender,
    required String status,
    @JsonKey(name: 'start_date') required String startDate,
    @JsonKey(name: 'end_date') String? endDate,
    String? venue,
    @JsonKey(name: 'max_teams') required int maxTeams,
    @JsonKey(name: 'total_teams') required int totalTeams,
    @JsonKey(name: 'team_count') required int teamCount,
    @JsonKey(name: 'is_registration_open') required bool isRegistrationOpen,
    @JsonKey(name: 'logo_url') String? logoUrl,
  }) = _TournamentModel;

  factory TournamentModel.fromJson(Map<String, dynamic> json) =>
      _$TournamentModelFromJson(json);

  Tournament toEntity() {
    return Tournament(
      id: id,
      name: name,
      slug: slug,
      description: description,
      type: type,
      format: format,
      category: category,
      gender: gender,
      status: status,
      startDate: DateTime.parse(startDate),
      endDate: endDate != null ? DateTime.parse(endDate!) : null,
      venue: venue,
      maxTeams: maxTeams,
      totalTeams: totalTeams,
      teamCount: teamCount,
      isRegistrationOpen: isRegistrationOpen,
      logoUrl: logoUrl,
    );
  }
}
