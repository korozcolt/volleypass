// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tournament_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TournamentModelImpl _$$TournamentModelImplFromJson(
        Map<String, dynamic> json) =>
    _$TournamentModelImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      slug: json['slug'] as String,
      description: json['description'] as String?,
      type: json['type'] as String,
      format: json['format'] as String,
      category: json['category'] as String,
      gender: json['gender'] as String,
      status: json['status'] as String,
      startDate: json['start_date'] as String,
      endDate: json['end_date'] as String?,
      venue: json['venue'] as String?,
      maxTeams: (json['max_teams'] as num).toInt(),
      totalTeams: (json['total_teams'] as num).toInt(),
      teamCount: (json['team_count'] as num).toInt(),
      isRegistrationOpen: json['is_registration_open'] as bool,
      logoUrl: json['logo_url'] as String?,
    );

Map<String, dynamic> _$$TournamentModelImplToJson(
        _$TournamentModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'slug': instance.slug,
      'description': instance.description,
      'type': instance.type,
      'format': instance.format,
      'category': instance.category,
      'gender': instance.gender,
      'status': instance.status,
      'start_date': instance.startDate,
      'end_date': instance.endDate,
      'venue': instance.venue,
      'max_teams': instance.maxTeams,
      'total_teams': instance.totalTeams,
      'team_count': instance.teamCount,
      'is_registration_open': instance.isRegistrationOpen,
      'logo_url': instance.logoUrl,
    };
