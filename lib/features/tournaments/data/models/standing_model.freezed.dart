// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'standing_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

StandingModel _$StandingModelFromJson(Map<String, dynamic> json) {
  return _StandingModel.fromJson(json);
}

/// @nodoc
mixin _$StandingModel {
  int get position => throw _privateConstructorUsedError;
  @JsonKey(name: 'team_id')
  int get teamId => throw _privateConstructorUsedError;
  @JsonKey(name: 'team_name')
  String get teamName => throw _privateConstructorUsedError;
  @JsonKey(name: 'team_logo')
  String? get teamLogo => throw _privateConstructorUsedError;
  @JsonKey(name: 'matches_played')
  int get matchesPlayed => throw _privateConstructorUsedError;
  int get wins => throw _privateConstructorUsedError;
  int get losses => throw _privateConstructorUsedError;
  int get points => throw _privateConstructorUsedError;
  @JsonKey(name: 'sets_for')
  int get setsFor => throw _privateConstructorUsedError;
  @JsonKey(name: 'sets_against')
  int get setsAgainst => throw _privateConstructorUsedError;
  @JsonKey(name: 'set_difference')
  int get setDifference => throw _privateConstructorUsedError;
  @JsonKey(name: 'points_for')
  int get pointsFor => throw _privateConstructorUsedError;
  @JsonKey(name: 'points_against')
  int get pointsAgainst => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StandingModelCopyWith<StandingModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StandingModelCopyWith<$Res> {
  factory $StandingModelCopyWith(
          StandingModel value, $Res Function(StandingModel) then) =
      _$StandingModelCopyWithImpl<$Res, StandingModel>;
  @useResult
  $Res call(
      {int position,
      @JsonKey(name: 'team_id') int teamId,
      @JsonKey(name: 'team_name') String teamName,
      @JsonKey(name: 'team_logo') String? teamLogo,
      @JsonKey(name: 'matches_played') int matchesPlayed,
      int wins,
      int losses,
      int points,
      @JsonKey(name: 'sets_for') int setsFor,
      @JsonKey(name: 'sets_against') int setsAgainst,
      @JsonKey(name: 'set_difference') int setDifference,
      @JsonKey(name: 'points_for') int pointsFor,
      @JsonKey(name: 'points_against') int pointsAgainst});
}

/// @nodoc
class _$StandingModelCopyWithImpl<$Res, $Val extends StandingModel>
    implements $StandingModelCopyWith<$Res> {
  _$StandingModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? position = null,
    Object? teamId = null,
    Object? teamName = null,
    Object? teamLogo = freezed,
    Object? matchesPlayed = null,
    Object? wins = null,
    Object? losses = null,
    Object? points = null,
    Object? setsFor = null,
    Object? setsAgainst = null,
    Object? setDifference = null,
    Object? pointsFor = null,
    Object? pointsAgainst = null,
  }) {
    return _then(_value.copyWith(
      position: null == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as int,
      teamId: null == teamId
          ? _value.teamId
          : teamId // ignore: cast_nullable_to_non_nullable
              as int,
      teamName: null == teamName
          ? _value.teamName
          : teamName // ignore: cast_nullable_to_non_nullable
              as String,
      teamLogo: freezed == teamLogo
          ? _value.teamLogo
          : teamLogo // ignore: cast_nullable_to_non_nullable
              as String?,
      matchesPlayed: null == matchesPlayed
          ? _value.matchesPlayed
          : matchesPlayed // ignore: cast_nullable_to_non_nullable
              as int,
      wins: null == wins
          ? _value.wins
          : wins // ignore: cast_nullable_to_non_nullable
              as int,
      losses: null == losses
          ? _value.losses
          : losses // ignore: cast_nullable_to_non_nullable
              as int,
      points: null == points
          ? _value.points
          : points // ignore: cast_nullable_to_non_nullable
              as int,
      setsFor: null == setsFor
          ? _value.setsFor
          : setsFor // ignore: cast_nullable_to_non_nullable
              as int,
      setsAgainst: null == setsAgainst
          ? _value.setsAgainst
          : setsAgainst // ignore: cast_nullable_to_non_nullable
              as int,
      setDifference: null == setDifference
          ? _value.setDifference
          : setDifference // ignore: cast_nullable_to_non_nullable
              as int,
      pointsFor: null == pointsFor
          ? _value.pointsFor
          : pointsFor // ignore: cast_nullable_to_non_nullable
              as int,
      pointsAgainst: null == pointsAgainst
          ? _value.pointsAgainst
          : pointsAgainst // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StandingModelImplCopyWith<$Res>
    implements $StandingModelCopyWith<$Res> {
  factory _$$StandingModelImplCopyWith(
          _$StandingModelImpl value, $Res Function(_$StandingModelImpl) then) =
      __$$StandingModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int position,
      @JsonKey(name: 'team_id') int teamId,
      @JsonKey(name: 'team_name') String teamName,
      @JsonKey(name: 'team_logo') String? teamLogo,
      @JsonKey(name: 'matches_played') int matchesPlayed,
      int wins,
      int losses,
      int points,
      @JsonKey(name: 'sets_for') int setsFor,
      @JsonKey(name: 'sets_against') int setsAgainst,
      @JsonKey(name: 'set_difference') int setDifference,
      @JsonKey(name: 'points_for') int pointsFor,
      @JsonKey(name: 'points_against') int pointsAgainst});
}

/// @nodoc
class __$$StandingModelImplCopyWithImpl<$Res>
    extends _$StandingModelCopyWithImpl<$Res, _$StandingModelImpl>
    implements _$$StandingModelImplCopyWith<$Res> {
  __$$StandingModelImplCopyWithImpl(
      _$StandingModelImpl _value, $Res Function(_$StandingModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? position = null,
    Object? teamId = null,
    Object? teamName = null,
    Object? teamLogo = freezed,
    Object? matchesPlayed = null,
    Object? wins = null,
    Object? losses = null,
    Object? points = null,
    Object? setsFor = null,
    Object? setsAgainst = null,
    Object? setDifference = null,
    Object? pointsFor = null,
    Object? pointsAgainst = null,
  }) {
    return _then(_$StandingModelImpl(
      position: null == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as int,
      teamId: null == teamId
          ? _value.teamId
          : teamId // ignore: cast_nullable_to_non_nullable
              as int,
      teamName: null == teamName
          ? _value.teamName
          : teamName // ignore: cast_nullable_to_non_nullable
              as String,
      teamLogo: freezed == teamLogo
          ? _value.teamLogo
          : teamLogo // ignore: cast_nullable_to_non_nullable
              as String?,
      matchesPlayed: null == matchesPlayed
          ? _value.matchesPlayed
          : matchesPlayed // ignore: cast_nullable_to_non_nullable
              as int,
      wins: null == wins
          ? _value.wins
          : wins // ignore: cast_nullable_to_non_nullable
              as int,
      losses: null == losses
          ? _value.losses
          : losses // ignore: cast_nullable_to_non_nullable
              as int,
      points: null == points
          ? _value.points
          : points // ignore: cast_nullable_to_non_nullable
              as int,
      setsFor: null == setsFor
          ? _value.setsFor
          : setsFor // ignore: cast_nullable_to_non_nullable
              as int,
      setsAgainst: null == setsAgainst
          ? _value.setsAgainst
          : setsAgainst // ignore: cast_nullable_to_non_nullable
              as int,
      setDifference: null == setDifference
          ? _value.setDifference
          : setDifference // ignore: cast_nullable_to_non_nullable
              as int,
      pointsFor: null == pointsFor
          ? _value.pointsFor
          : pointsFor // ignore: cast_nullable_to_non_nullable
              as int,
      pointsAgainst: null == pointsAgainst
          ? _value.pointsAgainst
          : pointsAgainst // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StandingModelImpl extends _StandingModel {
  const _$StandingModelImpl(
      {required this.position,
      @JsonKey(name: 'team_id') required this.teamId,
      @JsonKey(name: 'team_name') required this.teamName,
      @JsonKey(name: 'team_logo') this.teamLogo,
      @JsonKey(name: 'matches_played') required this.matchesPlayed,
      required this.wins,
      required this.losses,
      required this.points,
      @JsonKey(name: 'sets_for') required this.setsFor,
      @JsonKey(name: 'sets_against') required this.setsAgainst,
      @JsonKey(name: 'set_difference') required this.setDifference,
      @JsonKey(name: 'points_for') required this.pointsFor,
      @JsonKey(name: 'points_against') required this.pointsAgainst})
      : super._();

  factory _$StandingModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$StandingModelImplFromJson(json);

  @override
  final int position;
  @override
  @JsonKey(name: 'team_id')
  final int teamId;
  @override
  @JsonKey(name: 'team_name')
  final String teamName;
  @override
  @JsonKey(name: 'team_logo')
  final String? teamLogo;
  @override
  @JsonKey(name: 'matches_played')
  final int matchesPlayed;
  @override
  final int wins;
  @override
  final int losses;
  @override
  final int points;
  @override
  @JsonKey(name: 'sets_for')
  final int setsFor;
  @override
  @JsonKey(name: 'sets_against')
  final int setsAgainst;
  @override
  @JsonKey(name: 'set_difference')
  final int setDifference;
  @override
  @JsonKey(name: 'points_for')
  final int pointsFor;
  @override
  @JsonKey(name: 'points_against')
  final int pointsAgainst;

  @override
  String toString() {
    return 'StandingModel(position: $position, teamId: $teamId, teamName: $teamName, teamLogo: $teamLogo, matchesPlayed: $matchesPlayed, wins: $wins, losses: $losses, points: $points, setsFor: $setsFor, setsAgainst: $setsAgainst, setDifference: $setDifference, pointsFor: $pointsFor, pointsAgainst: $pointsAgainst)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StandingModelImpl &&
            (identical(other.position, position) ||
                other.position == position) &&
            (identical(other.teamId, teamId) || other.teamId == teamId) &&
            (identical(other.teamName, teamName) ||
                other.teamName == teamName) &&
            (identical(other.teamLogo, teamLogo) ||
                other.teamLogo == teamLogo) &&
            (identical(other.matchesPlayed, matchesPlayed) ||
                other.matchesPlayed == matchesPlayed) &&
            (identical(other.wins, wins) || other.wins == wins) &&
            (identical(other.losses, losses) || other.losses == losses) &&
            (identical(other.points, points) || other.points == points) &&
            (identical(other.setsFor, setsFor) || other.setsFor == setsFor) &&
            (identical(other.setsAgainst, setsAgainst) ||
                other.setsAgainst == setsAgainst) &&
            (identical(other.setDifference, setDifference) ||
                other.setDifference == setDifference) &&
            (identical(other.pointsFor, pointsFor) ||
                other.pointsFor == pointsFor) &&
            (identical(other.pointsAgainst, pointsAgainst) ||
                other.pointsAgainst == pointsAgainst));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      position,
      teamId,
      teamName,
      teamLogo,
      matchesPlayed,
      wins,
      losses,
      points,
      setsFor,
      setsAgainst,
      setDifference,
      pointsFor,
      pointsAgainst);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StandingModelImplCopyWith<_$StandingModelImpl> get copyWith =>
      __$$StandingModelImplCopyWithImpl<_$StandingModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StandingModelImplToJson(
      this,
    );
  }
}

abstract class _StandingModel extends StandingModel {
  const factory _StandingModel(
          {required final int position,
          @JsonKey(name: 'team_id') required final int teamId,
          @JsonKey(name: 'team_name') required final String teamName,
          @JsonKey(name: 'team_logo') final String? teamLogo,
          @JsonKey(name: 'matches_played') required final int matchesPlayed,
          required final int wins,
          required final int losses,
          required final int points,
          @JsonKey(name: 'sets_for') required final int setsFor,
          @JsonKey(name: 'sets_against') required final int setsAgainst,
          @JsonKey(name: 'set_difference') required final int setDifference,
          @JsonKey(name: 'points_for') required final int pointsFor,
          @JsonKey(name: 'points_against') required final int pointsAgainst}) =
      _$StandingModelImpl;
  const _StandingModel._() : super._();

  factory _StandingModel.fromJson(Map<String, dynamic> json) =
      _$StandingModelImpl.fromJson;

  @override
  int get position;
  @override
  @JsonKey(name: 'team_id')
  int get teamId;
  @override
  @JsonKey(name: 'team_name')
  String get teamName;
  @override
  @JsonKey(name: 'team_logo')
  String? get teamLogo;
  @override
  @JsonKey(name: 'matches_played')
  int get matchesPlayed;
  @override
  int get wins;
  @override
  int get losses;
  @override
  int get points;
  @override
  @JsonKey(name: 'sets_for')
  int get setsFor;
  @override
  @JsonKey(name: 'sets_against')
  int get setsAgainst;
  @override
  @JsonKey(name: 'set_difference')
  int get setDifference;
  @override
  @JsonKey(name: 'points_for')
  int get pointsFor;
  @override
  @JsonKey(name: 'points_against')
  int get pointsAgainst;
  @override
  @JsonKey(ignore: true)
  _$$StandingModelImplCopyWith<_$StandingModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

StandingsResponseModel _$StandingsResponseModelFromJson(
    Map<String, dynamic> json) {
  return _StandingsResponseModel.fromJson(json);
}

/// @nodoc
mixin _$StandingsResponseModel {
  TournamentInfoModel get tournament => throw _privateConstructorUsedError;
  List<StandingModel> get standings => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  String get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StandingsResponseModelCopyWith<StandingsResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StandingsResponseModelCopyWith<$Res> {
  factory $StandingsResponseModelCopyWith(StandingsResponseModel value,
          $Res Function(StandingsResponseModel) then) =
      _$StandingsResponseModelCopyWithImpl<$Res, StandingsResponseModel>;
  @useResult
  $Res call(
      {TournamentInfoModel tournament,
      List<StandingModel> standings,
      @JsonKey(name: 'updated_at') String updatedAt});

  $TournamentInfoModelCopyWith<$Res> get tournament;
}

/// @nodoc
class _$StandingsResponseModelCopyWithImpl<$Res,
        $Val extends StandingsResponseModel>
    implements $StandingsResponseModelCopyWith<$Res> {
  _$StandingsResponseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tournament = null,
    Object? standings = null,
    Object? updatedAt = null,
  }) {
    return _then(_value.copyWith(
      tournament: null == tournament
          ? _value.tournament
          : tournament // ignore: cast_nullable_to_non_nullable
              as TournamentInfoModel,
      standings: null == standings
          ? _value.standings
          : standings // ignore: cast_nullable_to_non_nullable
              as List<StandingModel>,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $TournamentInfoModelCopyWith<$Res> get tournament {
    return $TournamentInfoModelCopyWith<$Res>(_value.tournament, (value) {
      return _then(_value.copyWith(tournament: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$StandingsResponseModelImplCopyWith<$Res>
    implements $StandingsResponseModelCopyWith<$Res> {
  factory _$$StandingsResponseModelImplCopyWith(
          _$StandingsResponseModelImpl value,
          $Res Function(_$StandingsResponseModelImpl) then) =
      __$$StandingsResponseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {TournamentInfoModel tournament,
      List<StandingModel> standings,
      @JsonKey(name: 'updated_at') String updatedAt});

  @override
  $TournamentInfoModelCopyWith<$Res> get tournament;
}

/// @nodoc
class __$$StandingsResponseModelImplCopyWithImpl<$Res>
    extends _$StandingsResponseModelCopyWithImpl<$Res,
        _$StandingsResponseModelImpl>
    implements _$$StandingsResponseModelImplCopyWith<$Res> {
  __$$StandingsResponseModelImplCopyWithImpl(
      _$StandingsResponseModelImpl _value,
      $Res Function(_$StandingsResponseModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tournament = null,
    Object? standings = null,
    Object? updatedAt = null,
  }) {
    return _then(_$StandingsResponseModelImpl(
      tournament: null == tournament
          ? _value.tournament
          : tournament // ignore: cast_nullable_to_non_nullable
              as TournamentInfoModel,
      standings: null == standings
          ? _value._standings
          : standings // ignore: cast_nullable_to_non_nullable
              as List<StandingModel>,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StandingsResponseModelImpl extends _StandingsResponseModel {
  const _$StandingsResponseModelImpl(
      {required this.tournament,
      required final List<StandingModel> standings,
      @JsonKey(name: 'updated_at') required this.updatedAt})
      : _standings = standings,
        super._();

  factory _$StandingsResponseModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$StandingsResponseModelImplFromJson(json);

  @override
  final TournamentInfoModel tournament;
  final List<StandingModel> _standings;
  @override
  List<StandingModel> get standings {
    if (_standings is EqualUnmodifiableListView) return _standings;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_standings);
  }

  @override
  @JsonKey(name: 'updated_at')
  final String updatedAt;

  @override
  String toString() {
    return 'StandingsResponseModel(tournament: $tournament, standings: $standings, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StandingsResponseModelImpl &&
            (identical(other.tournament, tournament) ||
                other.tournament == tournament) &&
            const DeepCollectionEquality()
                .equals(other._standings, _standings) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, tournament,
      const DeepCollectionEquality().hash(_standings), updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StandingsResponseModelImplCopyWith<_$StandingsResponseModelImpl>
      get copyWith => __$$StandingsResponseModelImplCopyWithImpl<
          _$StandingsResponseModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StandingsResponseModelImplToJson(
      this,
    );
  }
}

abstract class _StandingsResponseModel extends StandingsResponseModel {
  const factory _StandingsResponseModel(
          {required final TournamentInfoModel tournament,
          required final List<StandingModel> standings,
          @JsonKey(name: 'updated_at') required final String updatedAt}) =
      _$StandingsResponseModelImpl;
  const _StandingsResponseModel._() : super._();

  factory _StandingsResponseModel.fromJson(Map<String, dynamic> json) =
      _$StandingsResponseModelImpl.fromJson;

  @override
  TournamentInfoModel get tournament;
  @override
  List<StandingModel> get standings;
  @override
  @JsonKey(name: 'updated_at')
  String get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$StandingsResponseModelImplCopyWith<_$StandingsResponseModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

TournamentInfoModel _$TournamentInfoModelFromJson(Map<String, dynamic> json) {
  return _TournamentInfoModel.fromJson(json);
}

/// @nodoc
mixin _$TournamentInfoModel {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TournamentInfoModelCopyWith<TournamentInfoModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TournamentInfoModelCopyWith<$Res> {
  factory $TournamentInfoModelCopyWith(
          TournamentInfoModel value, $Res Function(TournamentInfoModel) then) =
      _$TournamentInfoModelCopyWithImpl<$Res, TournamentInfoModel>;
  @useResult
  $Res call({int id, String name});
}

/// @nodoc
class _$TournamentInfoModelCopyWithImpl<$Res, $Val extends TournamentInfoModel>
    implements $TournamentInfoModelCopyWith<$Res> {
  _$TournamentInfoModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TournamentInfoModelImplCopyWith<$Res>
    implements $TournamentInfoModelCopyWith<$Res> {
  factory _$$TournamentInfoModelImplCopyWith(_$TournamentInfoModelImpl value,
          $Res Function(_$TournamentInfoModelImpl) then) =
      __$$TournamentInfoModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String name});
}

/// @nodoc
class __$$TournamentInfoModelImplCopyWithImpl<$Res>
    extends _$TournamentInfoModelCopyWithImpl<$Res, _$TournamentInfoModelImpl>
    implements _$$TournamentInfoModelImplCopyWith<$Res> {
  __$$TournamentInfoModelImplCopyWithImpl(_$TournamentInfoModelImpl _value,
      $Res Function(_$TournamentInfoModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
  }) {
    return _then(_$TournamentInfoModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TournamentInfoModelImpl extends _TournamentInfoModel {
  const _$TournamentInfoModelImpl({required this.id, required this.name})
      : super._();

  factory _$TournamentInfoModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$TournamentInfoModelImplFromJson(json);

  @override
  final int id;
  @override
  final String name;

  @override
  String toString() {
    return 'TournamentInfoModel(id: $id, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TournamentInfoModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TournamentInfoModelImplCopyWith<_$TournamentInfoModelImpl> get copyWith =>
      __$$TournamentInfoModelImplCopyWithImpl<_$TournamentInfoModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TournamentInfoModelImplToJson(
      this,
    );
  }
}

abstract class _TournamentInfoModel extends TournamentInfoModel {
  const factory _TournamentInfoModel(
      {required final int id,
      required final String name}) = _$TournamentInfoModelImpl;
  const _TournamentInfoModel._() : super._();

  factory _TournamentInfoModel.fromJson(Map<String, dynamic> json) =
      _$TournamentInfoModelImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  @JsonKey(ignore: true)
  _$$TournamentInfoModelImplCopyWith<_$TournamentInfoModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
