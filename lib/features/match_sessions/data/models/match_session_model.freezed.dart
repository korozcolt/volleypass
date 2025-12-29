// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'match_session_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MatchSessionModel _$MatchSessionModelFromJson(Map<String, dynamic> json) {
  return _MatchSessionModel.fromJson(json);
}

/// @nodoc
mixin _$MatchSessionModel {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'match_id')
  int get matchId => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_id')
  int get userId => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'started_at')
  String get startedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'paused_at')
  String? get pausedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'completed_at')
  String? get completedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_verifications')
  int get totalVerifications => throw _privateConstructorUsedError;
  @JsonKey(name: 'home_team_verifications')
  int get homeTeamVerifications => throw _privateConstructorUsedError;
  @JsonKey(name: 'away_team_verifications')
  int get awayTeamVerifications => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MatchSessionModelCopyWith<MatchSessionModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MatchSessionModelCopyWith<$Res> {
  factory $MatchSessionModelCopyWith(
          MatchSessionModel value, $Res Function(MatchSessionModel) then) =
      _$MatchSessionModelCopyWithImpl<$Res, MatchSessionModel>;
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'match_id') int matchId,
      @JsonKey(name: 'user_id') int userId,
      String status,
      @JsonKey(name: 'started_at') String startedAt,
      @JsonKey(name: 'paused_at') String? pausedAt,
      @JsonKey(name: 'completed_at') String? completedAt,
      @JsonKey(name: 'total_verifications') int totalVerifications,
      @JsonKey(name: 'home_team_verifications') int homeTeamVerifications,
      @JsonKey(name: 'away_team_verifications') int awayTeamVerifications,
      String? notes});
}

/// @nodoc
class _$MatchSessionModelCopyWithImpl<$Res, $Val extends MatchSessionModel>
    implements $MatchSessionModelCopyWith<$Res> {
  _$MatchSessionModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? matchId = null,
    Object? userId = null,
    Object? status = null,
    Object? startedAt = null,
    Object? pausedAt = freezed,
    Object? completedAt = freezed,
    Object? totalVerifications = null,
    Object? homeTeamVerifications = null,
    Object? awayTeamVerifications = null,
    Object? notes = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      matchId: null == matchId
          ? _value.matchId
          : matchId // ignore: cast_nullable_to_non_nullable
              as int,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      startedAt: null == startedAt
          ? _value.startedAt
          : startedAt // ignore: cast_nullable_to_non_nullable
              as String,
      pausedAt: freezed == pausedAt
          ? _value.pausedAt
          : pausedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      completedAt: freezed == completedAt
          ? _value.completedAt
          : completedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      totalVerifications: null == totalVerifications
          ? _value.totalVerifications
          : totalVerifications // ignore: cast_nullable_to_non_nullable
              as int,
      homeTeamVerifications: null == homeTeamVerifications
          ? _value.homeTeamVerifications
          : homeTeamVerifications // ignore: cast_nullable_to_non_nullable
              as int,
      awayTeamVerifications: null == awayTeamVerifications
          ? _value.awayTeamVerifications
          : awayTeamVerifications // ignore: cast_nullable_to_non_nullable
              as int,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MatchSessionModelImplCopyWith<$Res>
    implements $MatchSessionModelCopyWith<$Res> {
  factory _$$MatchSessionModelImplCopyWith(_$MatchSessionModelImpl value,
          $Res Function(_$MatchSessionModelImpl) then) =
      __$$MatchSessionModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'match_id') int matchId,
      @JsonKey(name: 'user_id') int userId,
      String status,
      @JsonKey(name: 'started_at') String startedAt,
      @JsonKey(name: 'paused_at') String? pausedAt,
      @JsonKey(name: 'completed_at') String? completedAt,
      @JsonKey(name: 'total_verifications') int totalVerifications,
      @JsonKey(name: 'home_team_verifications') int homeTeamVerifications,
      @JsonKey(name: 'away_team_verifications') int awayTeamVerifications,
      String? notes});
}

/// @nodoc
class __$$MatchSessionModelImplCopyWithImpl<$Res>
    extends _$MatchSessionModelCopyWithImpl<$Res, _$MatchSessionModelImpl>
    implements _$$MatchSessionModelImplCopyWith<$Res> {
  __$$MatchSessionModelImplCopyWithImpl(_$MatchSessionModelImpl _value,
      $Res Function(_$MatchSessionModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? matchId = null,
    Object? userId = null,
    Object? status = null,
    Object? startedAt = null,
    Object? pausedAt = freezed,
    Object? completedAt = freezed,
    Object? totalVerifications = null,
    Object? homeTeamVerifications = null,
    Object? awayTeamVerifications = null,
    Object? notes = freezed,
  }) {
    return _then(_$MatchSessionModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      matchId: null == matchId
          ? _value.matchId
          : matchId // ignore: cast_nullable_to_non_nullable
              as int,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      startedAt: null == startedAt
          ? _value.startedAt
          : startedAt // ignore: cast_nullable_to_non_nullable
              as String,
      pausedAt: freezed == pausedAt
          ? _value.pausedAt
          : pausedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      completedAt: freezed == completedAt
          ? _value.completedAt
          : completedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      totalVerifications: null == totalVerifications
          ? _value.totalVerifications
          : totalVerifications // ignore: cast_nullable_to_non_nullable
              as int,
      homeTeamVerifications: null == homeTeamVerifications
          ? _value.homeTeamVerifications
          : homeTeamVerifications // ignore: cast_nullable_to_non_nullable
              as int,
      awayTeamVerifications: null == awayTeamVerifications
          ? _value.awayTeamVerifications
          : awayTeamVerifications // ignore: cast_nullable_to_non_nullable
              as int,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MatchSessionModelImpl extends _MatchSessionModel {
  const _$MatchSessionModelImpl(
      {required this.id,
      @JsonKey(name: 'match_id') required this.matchId,
      @JsonKey(name: 'user_id') required this.userId,
      required this.status,
      @JsonKey(name: 'started_at') required this.startedAt,
      @JsonKey(name: 'paused_at') this.pausedAt,
      @JsonKey(name: 'completed_at') this.completedAt,
      @JsonKey(name: 'total_verifications') this.totalVerifications = 0,
      @JsonKey(name: 'home_team_verifications') this.homeTeamVerifications = 0,
      @JsonKey(name: 'away_team_verifications') this.awayTeamVerifications = 0,
      this.notes})
      : super._();

  factory _$MatchSessionModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$MatchSessionModelImplFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'match_id')
  final int matchId;
  @override
  @JsonKey(name: 'user_id')
  final int userId;
  @override
  final String status;
  @override
  @JsonKey(name: 'started_at')
  final String startedAt;
  @override
  @JsonKey(name: 'paused_at')
  final String? pausedAt;
  @override
  @JsonKey(name: 'completed_at')
  final String? completedAt;
  @override
  @JsonKey(name: 'total_verifications')
  final int totalVerifications;
  @override
  @JsonKey(name: 'home_team_verifications')
  final int homeTeamVerifications;
  @override
  @JsonKey(name: 'away_team_verifications')
  final int awayTeamVerifications;
  @override
  final String? notes;

  @override
  String toString() {
    return 'MatchSessionModel(id: $id, matchId: $matchId, userId: $userId, status: $status, startedAt: $startedAt, pausedAt: $pausedAt, completedAt: $completedAt, totalVerifications: $totalVerifications, homeTeamVerifications: $homeTeamVerifications, awayTeamVerifications: $awayTeamVerifications, notes: $notes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MatchSessionModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.matchId, matchId) || other.matchId == matchId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.startedAt, startedAt) ||
                other.startedAt == startedAt) &&
            (identical(other.pausedAt, pausedAt) ||
                other.pausedAt == pausedAt) &&
            (identical(other.completedAt, completedAt) ||
                other.completedAt == completedAt) &&
            (identical(other.totalVerifications, totalVerifications) ||
                other.totalVerifications == totalVerifications) &&
            (identical(other.homeTeamVerifications, homeTeamVerifications) ||
                other.homeTeamVerifications == homeTeamVerifications) &&
            (identical(other.awayTeamVerifications, awayTeamVerifications) ||
                other.awayTeamVerifications == awayTeamVerifications) &&
            (identical(other.notes, notes) || other.notes == notes));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      matchId,
      userId,
      status,
      startedAt,
      pausedAt,
      completedAt,
      totalVerifications,
      homeTeamVerifications,
      awayTeamVerifications,
      notes);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MatchSessionModelImplCopyWith<_$MatchSessionModelImpl> get copyWith =>
      __$$MatchSessionModelImplCopyWithImpl<_$MatchSessionModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MatchSessionModelImplToJson(
      this,
    );
  }
}

abstract class _MatchSessionModel extends MatchSessionModel {
  const factory _MatchSessionModel(
      {required final int id,
      @JsonKey(name: 'match_id') required final int matchId,
      @JsonKey(name: 'user_id') required final int userId,
      required final String status,
      @JsonKey(name: 'started_at') required final String startedAt,
      @JsonKey(name: 'paused_at') final String? pausedAt,
      @JsonKey(name: 'completed_at') final String? completedAt,
      @JsonKey(name: 'total_verifications') final int totalVerifications,
      @JsonKey(name: 'home_team_verifications') final int homeTeamVerifications,
      @JsonKey(name: 'away_team_verifications') final int awayTeamVerifications,
      final String? notes}) = _$MatchSessionModelImpl;
  const _MatchSessionModel._() : super._();

  factory _MatchSessionModel.fromJson(Map<String, dynamic> json) =
      _$MatchSessionModelImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'match_id')
  int get matchId;
  @override
  @JsonKey(name: 'user_id')
  int get userId;
  @override
  String get status;
  @override
  @JsonKey(name: 'started_at')
  String get startedAt;
  @override
  @JsonKey(name: 'paused_at')
  String? get pausedAt;
  @override
  @JsonKey(name: 'completed_at')
  String? get completedAt;
  @override
  @JsonKey(name: 'total_verifications')
  int get totalVerifications;
  @override
  @JsonKey(name: 'home_team_verifications')
  int get homeTeamVerifications;
  @override
  @JsonKey(name: 'away_team_verifications')
  int get awayTeamVerifications;
  @override
  String? get notes;
  @override
  @JsonKey(ignore: true)
  _$$MatchSessionModelImplCopyWith<_$MatchSessionModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
