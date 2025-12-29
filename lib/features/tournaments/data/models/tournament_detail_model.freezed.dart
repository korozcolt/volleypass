// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tournament_detail_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TournamentDetailModel _$TournamentDetailModelFromJson(
    Map<String, dynamic> json) {
  return _TournamentDetailModel.fromJson(json);
}

/// @nodoc
mixin _$TournamentDetailModel {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get slug => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'start_date')
  String get startDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'end_date')
  String? get endDate => throw _privateConstructorUsedError;
  TournamentLeagueModel get league => throw _privateConstructorUsedError;
  List<TournamentTeamModel> get teams => throw _privateConstructorUsedError;
  List<TournamentMatchModel> get matches => throw _privateConstructorUsedError;
  TournamentStatisticsModel get statistics =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TournamentDetailModelCopyWith<TournamentDetailModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TournamentDetailModelCopyWith<$Res> {
  factory $TournamentDetailModelCopyWith(TournamentDetailModel value,
          $Res Function(TournamentDetailModel) then) =
      _$TournamentDetailModelCopyWithImpl<$Res, TournamentDetailModel>;
  @useResult
  $Res call(
      {int id,
      String name,
      String slug,
      String type,
      String status,
      @JsonKey(name: 'start_date') String startDate,
      @JsonKey(name: 'end_date') String? endDate,
      TournamentLeagueModel league,
      List<TournamentTeamModel> teams,
      List<TournamentMatchModel> matches,
      TournamentStatisticsModel statistics});

  $TournamentLeagueModelCopyWith<$Res> get league;
  $TournamentStatisticsModelCopyWith<$Res> get statistics;
}

/// @nodoc
class _$TournamentDetailModelCopyWithImpl<$Res,
        $Val extends TournamentDetailModel>
    implements $TournamentDetailModelCopyWith<$Res> {
  _$TournamentDetailModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? slug = null,
    Object? type = null,
    Object? status = null,
    Object? startDate = null,
    Object? endDate = freezed,
    Object? league = null,
    Object? teams = null,
    Object? matches = null,
    Object? statistics = null,
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
      slug: null == slug
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as String,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as String?,
      league: null == league
          ? _value.league
          : league // ignore: cast_nullable_to_non_nullable
              as TournamentLeagueModel,
      teams: null == teams
          ? _value.teams
          : teams // ignore: cast_nullable_to_non_nullable
              as List<TournamentTeamModel>,
      matches: null == matches
          ? _value.matches
          : matches // ignore: cast_nullable_to_non_nullable
              as List<TournamentMatchModel>,
      statistics: null == statistics
          ? _value.statistics
          : statistics // ignore: cast_nullable_to_non_nullable
              as TournamentStatisticsModel,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $TournamentLeagueModelCopyWith<$Res> get league {
    return $TournamentLeagueModelCopyWith<$Res>(_value.league, (value) {
      return _then(_value.copyWith(league: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $TournamentStatisticsModelCopyWith<$Res> get statistics {
    return $TournamentStatisticsModelCopyWith<$Res>(_value.statistics, (value) {
      return _then(_value.copyWith(statistics: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$TournamentDetailModelImplCopyWith<$Res>
    implements $TournamentDetailModelCopyWith<$Res> {
  factory _$$TournamentDetailModelImplCopyWith(
          _$TournamentDetailModelImpl value,
          $Res Function(_$TournamentDetailModelImpl) then) =
      __$$TournamentDetailModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      String slug,
      String type,
      String status,
      @JsonKey(name: 'start_date') String startDate,
      @JsonKey(name: 'end_date') String? endDate,
      TournamentLeagueModel league,
      List<TournamentTeamModel> teams,
      List<TournamentMatchModel> matches,
      TournamentStatisticsModel statistics});

  @override
  $TournamentLeagueModelCopyWith<$Res> get league;
  @override
  $TournamentStatisticsModelCopyWith<$Res> get statistics;
}

/// @nodoc
class __$$TournamentDetailModelImplCopyWithImpl<$Res>
    extends _$TournamentDetailModelCopyWithImpl<$Res,
        _$TournamentDetailModelImpl>
    implements _$$TournamentDetailModelImplCopyWith<$Res> {
  __$$TournamentDetailModelImplCopyWithImpl(_$TournamentDetailModelImpl _value,
      $Res Function(_$TournamentDetailModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? slug = null,
    Object? type = null,
    Object? status = null,
    Object? startDate = null,
    Object? endDate = freezed,
    Object? league = null,
    Object? teams = null,
    Object? matches = null,
    Object? statistics = null,
  }) {
    return _then(_$TournamentDetailModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      slug: null == slug
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as String,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as String?,
      league: null == league
          ? _value.league
          : league // ignore: cast_nullable_to_non_nullable
              as TournamentLeagueModel,
      teams: null == teams
          ? _value._teams
          : teams // ignore: cast_nullable_to_non_nullable
              as List<TournamentTeamModel>,
      matches: null == matches
          ? _value._matches
          : matches // ignore: cast_nullable_to_non_nullable
              as List<TournamentMatchModel>,
      statistics: null == statistics
          ? _value.statistics
          : statistics // ignore: cast_nullable_to_non_nullable
              as TournamentStatisticsModel,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TournamentDetailModelImpl extends _TournamentDetailModel {
  const _$TournamentDetailModelImpl(
      {required this.id,
      required this.name,
      required this.slug,
      required this.type,
      required this.status,
      @JsonKey(name: 'start_date') required this.startDate,
      @JsonKey(name: 'end_date') this.endDate,
      required this.league,
      required final List<TournamentTeamModel> teams,
      required final List<TournamentMatchModel> matches,
      required this.statistics})
      : _teams = teams,
        _matches = matches,
        super._();

  factory _$TournamentDetailModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$TournamentDetailModelImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String slug;
  @override
  final String type;
  @override
  final String status;
  @override
  @JsonKey(name: 'start_date')
  final String startDate;
  @override
  @JsonKey(name: 'end_date')
  final String? endDate;
  @override
  final TournamentLeagueModel league;
  final List<TournamentTeamModel> _teams;
  @override
  List<TournamentTeamModel> get teams {
    if (_teams is EqualUnmodifiableListView) return _teams;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_teams);
  }

  final List<TournamentMatchModel> _matches;
  @override
  List<TournamentMatchModel> get matches {
    if (_matches is EqualUnmodifiableListView) return _matches;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_matches);
  }

  @override
  final TournamentStatisticsModel statistics;

  @override
  String toString() {
    return 'TournamentDetailModel(id: $id, name: $name, slug: $slug, type: $type, status: $status, startDate: $startDate, endDate: $endDate, league: $league, teams: $teams, matches: $matches, statistics: $statistics)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TournamentDetailModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.slug, slug) || other.slug == slug) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.league, league) || other.league == league) &&
            const DeepCollectionEquality().equals(other._teams, _teams) &&
            const DeepCollectionEquality().equals(other._matches, _matches) &&
            (identical(other.statistics, statistics) ||
                other.statistics == statistics));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      slug,
      type,
      status,
      startDate,
      endDate,
      league,
      const DeepCollectionEquality().hash(_teams),
      const DeepCollectionEquality().hash(_matches),
      statistics);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TournamentDetailModelImplCopyWith<_$TournamentDetailModelImpl>
      get copyWith => __$$TournamentDetailModelImplCopyWithImpl<
          _$TournamentDetailModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TournamentDetailModelImplToJson(
      this,
    );
  }
}

abstract class _TournamentDetailModel extends TournamentDetailModel {
  const factory _TournamentDetailModel(
          {required final int id,
          required final String name,
          required final String slug,
          required final String type,
          required final String status,
          @JsonKey(name: 'start_date') required final String startDate,
          @JsonKey(name: 'end_date') final String? endDate,
          required final TournamentLeagueModel league,
          required final List<TournamentTeamModel> teams,
          required final List<TournamentMatchModel> matches,
          required final TournamentStatisticsModel statistics}) =
      _$TournamentDetailModelImpl;
  const _TournamentDetailModel._() : super._();

  factory _TournamentDetailModel.fromJson(Map<String, dynamic> json) =
      _$TournamentDetailModelImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String get slug;
  @override
  String get type;
  @override
  String get status;
  @override
  @JsonKey(name: 'start_date')
  String get startDate;
  @override
  @JsonKey(name: 'end_date')
  String? get endDate;
  @override
  TournamentLeagueModel get league;
  @override
  List<TournamentTeamModel> get teams;
  @override
  List<TournamentMatchModel> get matches;
  @override
  TournamentStatisticsModel get statistics;
  @override
  @JsonKey(ignore: true)
  _$$TournamentDetailModelImplCopyWith<_$TournamentDetailModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

TournamentLeagueModel _$TournamentLeagueModelFromJson(
    Map<String, dynamic> json) {
  return _TournamentLeagueModel.fromJson(json);
}

/// @nodoc
mixin _$TournamentLeagueModel {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'logo_url')
  String? get logoUrl => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TournamentLeagueModelCopyWith<TournamentLeagueModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TournamentLeagueModelCopyWith<$Res> {
  factory $TournamentLeagueModelCopyWith(TournamentLeagueModel value,
          $Res Function(TournamentLeagueModel) then) =
      _$TournamentLeagueModelCopyWithImpl<$Res, TournamentLeagueModel>;
  @useResult
  $Res call({int id, String name, @JsonKey(name: 'logo_url') String? logoUrl});
}

/// @nodoc
class _$TournamentLeagueModelCopyWithImpl<$Res,
        $Val extends TournamentLeagueModel>
    implements $TournamentLeagueModelCopyWith<$Res> {
  _$TournamentLeagueModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? logoUrl = freezed,
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
      logoUrl: freezed == logoUrl
          ? _value.logoUrl
          : logoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TournamentLeagueModelImplCopyWith<$Res>
    implements $TournamentLeagueModelCopyWith<$Res> {
  factory _$$TournamentLeagueModelImplCopyWith(
          _$TournamentLeagueModelImpl value,
          $Res Function(_$TournamentLeagueModelImpl) then) =
      __$$TournamentLeagueModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String name, @JsonKey(name: 'logo_url') String? logoUrl});
}

/// @nodoc
class __$$TournamentLeagueModelImplCopyWithImpl<$Res>
    extends _$TournamentLeagueModelCopyWithImpl<$Res,
        _$TournamentLeagueModelImpl>
    implements _$$TournamentLeagueModelImplCopyWith<$Res> {
  __$$TournamentLeagueModelImplCopyWithImpl(_$TournamentLeagueModelImpl _value,
      $Res Function(_$TournamentLeagueModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? logoUrl = freezed,
  }) {
    return _then(_$TournamentLeagueModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      logoUrl: freezed == logoUrl
          ? _value.logoUrl
          : logoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TournamentLeagueModelImpl extends _TournamentLeagueModel {
  const _$TournamentLeagueModelImpl(
      {required this.id,
      required this.name,
      @JsonKey(name: 'logo_url') this.logoUrl})
      : super._();

  factory _$TournamentLeagueModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$TournamentLeagueModelImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  @JsonKey(name: 'logo_url')
  final String? logoUrl;

  @override
  String toString() {
    return 'TournamentLeagueModel(id: $id, name: $name, logoUrl: $logoUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TournamentLeagueModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.logoUrl, logoUrl) || other.logoUrl == logoUrl));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, logoUrl);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TournamentLeagueModelImplCopyWith<_$TournamentLeagueModelImpl>
      get copyWith => __$$TournamentLeagueModelImplCopyWithImpl<
          _$TournamentLeagueModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TournamentLeagueModelImplToJson(
      this,
    );
  }
}

abstract class _TournamentLeagueModel extends TournamentLeagueModel {
  const factory _TournamentLeagueModel(
          {required final int id,
          required final String name,
          @JsonKey(name: 'logo_url') final String? logoUrl}) =
      _$TournamentLeagueModelImpl;
  const _TournamentLeagueModel._() : super._();

  factory _TournamentLeagueModel.fromJson(Map<String, dynamic> json) =
      _$TournamentLeagueModelImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  @JsonKey(name: 'logo_url')
  String? get logoUrl;
  @override
  @JsonKey(ignore: true)
  _$$TournamentLeagueModelImplCopyWith<_$TournamentLeagueModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

TournamentTeamModel _$TournamentTeamModelFromJson(Map<String, dynamic> json) {
  return _TournamentTeamModel.fromJson(json);
}

/// @nodoc
mixin _$TournamentTeamModel {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get logo => throw _privateConstructorUsedError;
  String get club => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TournamentTeamModelCopyWith<TournamentTeamModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TournamentTeamModelCopyWith<$Res> {
  factory $TournamentTeamModelCopyWith(
          TournamentTeamModel value, $Res Function(TournamentTeamModel) then) =
      _$TournamentTeamModelCopyWithImpl<$Res, TournamentTeamModel>;
  @useResult
  $Res call({int id, String name, String? logo, String club});
}

/// @nodoc
class _$TournamentTeamModelCopyWithImpl<$Res, $Val extends TournamentTeamModel>
    implements $TournamentTeamModelCopyWith<$Res> {
  _$TournamentTeamModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? logo = freezed,
    Object? club = null,
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
      logo: freezed == logo
          ? _value.logo
          : logo // ignore: cast_nullable_to_non_nullable
              as String?,
      club: null == club
          ? _value.club
          : club // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TournamentTeamModelImplCopyWith<$Res>
    implements $TournamentTeamModelCopyWith<$Res> {
  factory _$$TournamentTeamModelImplCopyWith(_$TournamentTeamModelImpl value,
          $Res Function(_$TournamentTeamModelImpl) then) =
      __$$TournamentTeamModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String name, String? logo, String club});
}

/// @nodoc
class __$$TournamentTeamModelImplCopyWithImpl<$Res>
    extends _$TournamentTeamModelCopyWithImpl<$Res, _$TournamentTeamModelImpl>
    implements _$$TournamentTeamModelImplCopyWith<$Res> {
  __$$TournamentTeamModelImplCopyWithImpl(_$TournamentTeamModelImpl _value,
      $Res Function(_$TournamentTeamModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? logo = freezed,
    Object? club = null,
  }) {
    return _then(_$TournamentTeamModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      logo: freezed == logo
          ? _value.logo
          : logo // ignore: cast_nullable_to_non_nullable
              as String?,
      club: null == club
          ? _value.club
          : club // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TournamentTeamModelImpl extends _TournamentTeamModel {
  const _$TournamentTeamModelImpl(
      {required this.id, required this.name, this.logo, required this.club})
      : super._();

  factory _$TournamentTeamModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$TournamentTeamModelImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String? logo;
  @override
  final String club;

  @override
  String toString() {
    return 'TournamentTeamModel(id: $id, name: $name, logo: $logo, club: $club)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TournamentTeamModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.logo, logo) || other.logo == logo) &&
            (identical(other.club, club) || other.club == club));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, logo, club);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TournamentTeamModelImplCopyWith<_$TournamentTeamModelImpl> get copyWith =>
      __$$TournamentTeamModelImplCopyWithImpl<_$TournamentTeamModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TournamentTeamModelImplToJson(
      this,
    );
  }
}

abstract class _TournamentTeamModel extends TournamentTeamModel {
  const factory _TournamentTeamModel(
      {required final int id,
      required final String name,
      final String? logo,
      required final String club}) = _$TournamentTeamModelImpl;
  const _TournamentTeamModel._() : super._();

  factory _TournamentTeamModel.fromJson(Map<String, dynamic> json) =
      _$TournamentTeamModelImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String? get logo;
  @override
  String get club;
  @override
  @JsonKey(ignore: true)
  _$$TournamentTeamModelImplCopyWith<_$TournamentTeamModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TournamentMatchModel _$TournamentMatchModelFromJson(Map<String, dynamic> json) {
  return _TournamentMatchModel.fromJson(json);
}

/// @nodoc
mixin _$TournamentMatchModel {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'home_team')
  String get homeTeam => throw _privateConstructorUsedError;
  @JsonKey(name: 'away_team')
  String get awayTeam => throw _privateConstructorUsedError;
  @JsonKey(name: 'scheduled_at')
  String get scheduledAt => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'home_score')
  int? get homeScore => throw _privateConstructorUsedError;
  @JsonKey(name: 'away_score')
  int? get awayScore => throw _privateConstructorUsedError;
  String? get venue => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TournamentMatchModelCopyWith<TournamentMatchModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TournamentMatchModelCopyWith<$Res> {
  factory $TournamentMatchModelCopyWith(TournamentMatchModel value,
          $Res Function(TournamentMatchModel) then) =
      _$TournamentMatchModelCopyWithImpl<$Res, TournamentMatchModel>;
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'home_team') String homeTeam,
      @JsonKey(name: 'away_team') String awayTeam,
      @JsonKey(name: 'scheduled_at') String scheduledAt,
      String status,
      @JsonKey(name: 'home_score') int? homeScore,
      @JsonKey(name: 'away_score') int? awayScore,
      String? venue});
}

/// @nodoc
class _$TournamentMatchModelCopyWithImpl<$Res,
        $Val extends TournamentMatchModel>
    implements $TournamentMatchModelCopyWith<$Res> {
  _$TournamentMatchModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? homeTeam = null,
    Object? awayTeam = null,
    Object? scheduledAt = null,
    Object? status = null,
    Object? homeScore = freezed,
    Object? awayScore = freezed,
    Object? venue = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      homeTeam: null == homeTeam
          ? _value.homeTeam
          : homeTeam // ignore: cast_nullable_to_non_nullable
              as String,
      awayTeam: null == awayTeam
          ? _value.awayTeam
          : awayTeam // ignore: cast_nullable_to_non_nullable
              as String,
      scheduledAt: null == scheduledAt
          ? _value.scheduledAt
          : scheduledAt // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      homeScore: freezed == homeScore
          ? _value.homeScore
          : homeScore // ignore: cast_nullable_to_non_nullable
              as int?,
      awayScore: freezed == awayScore
          ? _value.awayScore
          : awayScore // ignore: cast_nullable_to_non_nullable
              as int?,
      venue: freezed == venue
          ? _value.venue
          : venue // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TournamentMatchModelImplCopyWith<$Res>
    implements $TournamentMatchModelCopyWith<$Res> {
  factory _$$TournamentMatchModelImplCopyWith(_$TournamentMatchModelImpl value,
          $Res Function(_$TournamentMatchModelImpl) then) =
      __$$TournamentMatchModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'home_team') String homeTeam,
      @JsonKey(name: 'away_team') String awayTeam,
      @JsonKey(name: 'scheduled_at') String scheduledAt,
      String status,
      @JsonKey(name: 'home_score') int? homeScore,
      @JsonKey(name: 'away_score') int? awayScore,
      String? venue});
}

/// @nodoc
class __$$TournamentMatchModelImplCopyWithImpl<$Res>
    extends _$TournamentMatchModelCopyWithImpl<$Res, _$TournamentMatchModelImpl>
    implements _$$TournamentMatchModelImplCopyWith<$Res> {
  __$$TournamentMatchModelImplCopyWithImpl(_$TournamentMatchModelImpl _value,
      $Res Function(_$TournamentMatchModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? homeTeam = null,
    Object? awayTeam = null,
    Object? scheduledAt = null,
    Object? status = null,
    Object? homeScore = freezed,
    Object? awayScore = freezed,
    Object? venue = freezed,
  }) {
    return _then(_$TournamentMatchModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      homeTeam: null == homeTeam
          ? _value.homeTeam
          : homeTeam // ignore: cast_nullable_to_non_nullable
              as String,
      awayTeam: null == awayTeam
          ? _value.awayTeam
          : awayTeam // ignore: cast_nullable_to_non_nullable
              as String,
      scheduledAt: null == scheduledAt
          ? _value.scheduledAt
          : scheduledAt // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      homeScore: freezed == homeScore
          ? _value.homeScore
          : homeScore // ignore: cast_nullable_to_non_nullable
              as int?,
      awayScore: freezed == awayScore
          ? _value.awayScore
          : awayScore // ignore: cast_nullable_to_non_nullable
              as int?,
      venue: freezed == venue
          ? _value.venue
          : venue // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TournamentMatchModelImpl extends _TournamentMatchModel {
  const _$TournamentMatchModelImpl(
      {required this.id,
      @JsonKey(name: 'home_team') required this.homeTeam,
      @JsonKey(name: 'away_team') required this.awayTeam,
      @JsonKey(name: 'scheduled_at') required this.scheduledAt,
      required this.status,
      @JsonKey(name: 'home_score') this.homeScore,
      @JsonKey(name: 'away_score') this.awayScore,
      this.venue})
      : super._();

  factory _$TournamentMatchModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$TournamentMatchModelImplFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'home_team')
  final String homeTeam;
  @override
  @JsonKey(name: 'away_team')
  final String awayTeam;
  @override
  @JsonKey(name: 'scheduled_at')
  final String scheduledAt;
  @override
  final String status;
  @override
  @JsonKey(name: 'home_score')
  final int? homeScore;
  @override
  @JsonKey(name: 'away_score')
  final int? awayScore;
  @override
  final String? venue;

  @override
  String toString() {
    return 'TournamentMatchModel(id: $id, homeTeam: $homeTeam, awayTeam: $awayTeam, scheduledAt: $scheduledAt, status: $status, homeScore: $homeScore, awayScore: $awayScore, venue: $venue)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TournamentMatchModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.homeTeam, homeTeam) ||
                other.homeTeam == homeTeam) &&
            (identical(other.awayTeam, awayTeam) ||
                other.awayTeam == awayTeam) &&
            (identical(other.scheduledAt, scheduledAt) ||
                other.scheduledAt == scheduledAt) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.homeScore, homeScore) ||
                other.homeScore == homeScore) &&
            (identical(other.awayScore, awayScore) ||
                other.awayScore == awayScore) &&
            (identical(other.venue, venue) || other.venue == venue));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, homeTeam, awayTeam,
      scheduledAt, status, homeScore, awayScore, venue);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TournamentMatchModelImplCopyWith<_$TournamentMatchModelImpl>
      get copyWith =>
          __$$TournamentMatchModelImplCopyWithImpl<_$TournamentMatchModelImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TournamentMatchModelImplToJson(
      this,
    );
  }
}

abstract class _TournamentMatchModel extends TournamentMatchModel {
  const factory _TournamentMatchModel(
      {required final int id,
      @JsonKey(name: 'home_team') required final String homeTeam,
      @JsonKey(name: 'away_team') required final String awayTeam,
      @JsonKey(name: 'scheduled_at') required final String scheduledAt,
      required final String status,
      @JsonKey(name: 'home_score') final int? homeScore,
      @JsonKey(name: 'away_score') final int? awayScore,
      final String? venue}) = _$TournamentMatchModelImpl;
  const _TournamentMatchModel._() : super._();

  factory _TournamentMatchModel.fromJson(Map<String, dynamic> json) =
      _$TournamentMatchModelImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'home_team')
  String get homeTeam;
  @override
  @JsonKey(name: 'away_team')
  String get awayTeam;
  @override
  @JsonKey(name: 'scheduled_at')
  String get scheduledAt;
  @override
  String get status;
  @override
  @JsonKey(name: 'home_score')
  int? get homeScore;
  @override
  @JsonKey(name: 'away_score')
  int? get awayScore;
  @override
  String? get venue;
  @override
  @JsonKey(ignore: true)
  _$$TournamentMatchModelImplCopyWith<_$TournamentMatchModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

TournamentStatisticsModel _$TournamentStatisticsModelFromJson(
    Map<String, dynamic> json) {
  return _TournamentStatisticsModel.fromJson(json);
}

/// @nodoc
mixin _$TournamentStatisticsModel {
  @JsonKey(name: 'total_teams')
  int get totalTeams => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_matches')
  int get totalMatches => throw _privateConstructorUsedError;
  @JsonKey(name: 'completed_matches')
  int get completedMatches => throw _privateConstructorUsedError;
  @JsonKey(name: 'pending_matches')
  int get pendingMatches => throw _privateConstructorUsedError;
  @JsonKey(name: 'in_progress_matches')
  int get inProgressMatches => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TournamentStatisticsModelCopyWith<TournamentStatisticsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TournamentStatisticsModelCopyWith<$Res> {
  factory $TournamentStatisticsModelCopyWith(TournamentStatisticsModel value,
          $Res Function(TournamentStatisticsModel) then) =
      _$TournamentStatisticsModelCopyWithImpl<$Res, TournamentStatisticsModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'total_teams') int totalTeams,
      @JsonKey(name: 'total_matches') int totalMatches,
      @JsonKey(name: 'completed_matches') int completedMatches,
      @JsonKey(name: 'pending_matches') int pendingMatches,
      @JsonKey(name: 'in_progress_matches') int inProgressMatches});
}

/// @nodoc
class _$TournamentStatisticsModelCopyWithImpl<$Res,
        $Val extends TournamentStatisticsModel>
    implements $TournamentStatisticsModelCopyWith<$Res> {
  _$TournamentStatisticsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalTeams = null,
    Object? totalMatches = null,
    Object? completedMatches = null,
    Object? pendingMatches = null,
    Object? inProgressMatches = null,
  }) {
    return _then(_value.copyWith(
      totalTeams: null == totalTeams
          ? _value.totalTeams
          : totalTeams // ignore: cast_nullable_to_non_nullable
              as int,
      totalMatches: null == totalMatches
          ? _value.totalMatches
          : totalMatches // ignore: cast_nullable_to_non_nullable
              as int,
      completedMatches: null == completedMatches
          ? _value.completedMatches
          : completedMatches // ignore: cast_nullable_to_non_nullable
              as int,
      pendingMatches: null == pendingMatches
          ? _value.pendingMatches
          : pendingMatches // ignore: cast_nullable_to_non_nullable
              as int,
      inProgressMatches: null == inProgressMatches
          ? _value.inProgressMatches
          : inProgressMatches // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TournamentStatisticsModelImplCopyWith<$Res>
    implements $TournamentStatisticsModelCopyWith<$Res> {
  factory _$$TournamentStatisticsModelImplCopyWith(
          _$TournamentStatisticsModelImpl value,
          $Res Function(_$TournamentStatisticsModelImpl) then) =
      __$$TournamentStatisticsModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'total_teams') int totalTeams,
      @JsonKey(name: 'total_matches') int totalMatches,
      @JsonKey(name: 'completed_matches') int completedMatches,
      @JsonKey(name: 'pending_matches') int pendingMatches,
      @JsonKey(name: 'in_progress_matches') int inProgressMatches});
}

/// @nodoc
class __$$TournamentStatisticsModelImplCopyWithImpl<$Res>
    extends _$TournamentStatisticsModelCopyWithImpl<$Res,
        _$TournamentStatisticsModelImpl>
    implements _$$TournamentStatisticsModelImplCopyWith<$Res> {
  __$$TournamentStatisticsModelImplCopyWithImpl(
      _$TournamentStatisticsModelImpl _value,
      $Res Function(_$TournamentStatisticsModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalTeams = null,
    Object? totalMatches = null,
    Object? completedMatches = null,
    Object? pendingMatches = null,
    Object? inProgressMatches = null,
  }) {
    return _then(_$TournamentStatisticsModelImpl(
      totalTeams: null == totalTeams
          ? _value.totalTeams
          : totalTeams // ignore: cast_nullable_to_non_nullable
              as int,
      totalMatches: null == totalMatches
          ? _value.totalMatches
          : totalMatches // ignore: cast_nullable_to_non_nullable
              as int,
      completedMatches: null == completedMatches
          ? _value.completedMatches
          : completedMatches // ignore: cast_nullable_to_non_nullable
              as int,
      pendingMatches: null == pendingMatches
          ? _value.pendingMatches
          : pendingMatches // ignore: cast_nullable_to_non_nullable
              as int,
      inProgressMatches: null == inProgressMatches
          ? _value.inProgressMatches
          : inProgressMatches // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TournamentStatisticsModelImpl extends _TournamentStatisticsModel {
  const _$TournamentStatisticsModelImpl(
      {@JsonKey(name: 'total_teams') required this.totalTeams,
      @JsonKey(name: 'total_matches') required this.totalMatches,
      @JsonKey(name: 'completed_matches') required this.completedMatches,
      @JsonKey(name: 'pending_matches') required this.pendingMatches,
      @JsonKey(name: 'in_progress_matches') required this.inProgressMatches})
      : super._();

  factory _$TournamentStatisticsModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$TournamentStatisticsModelImplFromJson(json);

  @override
  @JsonKey(name: 'total_teams')
  final int totalTeams;
  @override
  @JsonKey(name: 'total_matches')
  final int totalMatches;
  @override
  @JsonKey(name: 'completed_matches')
  final int completedMatches;
  @override
  @JsonKey(name: 'pending_matches')
  final int pendingMatches;
  @override
  @JsonKey(name: 'in_progress_matches')
  final int inProgressMatches;

  @override
  String toString() {
    return 'TournamentStatisticsModel(totalTeams: $totalTeams, totalMatches: $totalMatches, completedMatches: $completedMatches, pendingMatches: $pendingMatches, inProgressMatches: $inProgressMatches)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TournamentStatisticsModelImpl &&
            (identical(other.totalTeams, totalTeams) ||
                other.totalTeams == totalTeams) &&
            (identical(other.totalMatches, totalMatches) ||
                other.totalMatches == totalMatches) &&
            (identical(other.completedMatches, completedMatches) ||
                other.completedMatches == completedMatches) &&
            (identical(other.pendingMatches, pendingMatches) ||
                other.pendingMatches == pendingMatches) &&
            (identical(other.inProgressMatches, inProgressMatches) ||
                other.inProgressMatches == inProgressMatches));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, totalTeams, totalMatches,
      completedMatches, pendingMatches, inProgressMatches);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TournamentStatisticsModelImplCopyWith<_$TournamentStatisticsModelImpl>
      get copyWith => __$$TournamentStatisticsModelImplCopyWithImpl<
          _$TournamentStatisticsModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TournamentStatisticsModelImplToJson(
      this,
    );
  }
}

abstract class _TournamentStatisticsModel extends TournamentStatisticsModel {
  const factory _TournamentStatisticsModel(
      {@JsonKey(name: 'total_teams') required final int totalTeams,
      @JsonKey(name: 'total_matches') required final int totalMatches,
      @JsonKey(name: 'completed_matches') required final int completedMatches,
      @JsonKey(name: 'pending_matches') required final int pendingMatches,
      @JsonKey(name: 'in_progress_matches')
      required final int inProgressMatches}) = _$TournamentStatisticsModelImpl;
  const _TournamentStatisticsModel._() : super._();

  factory _TournamentStatisticsModel.fromJson(Map<String, dynamic> json) =
      _$TournamentStatisticsModelImpl.fromJson;

  @override
  @JsonKey(name: 'total_teams')
  int get totalTeams;
  @override
  @JsonKey(name: 'total_matches')
  int get totalMatches;
  @override
  @JsonKey(name: 'completed_matches')
  int get completedMatches;
  @override
  @JsonKey(name: 'pending_matches')
  int get pendingMatches;
  @override
  @JsonKey(name: 'in_progress_matches')
  int get inProgressMatches;
  @override
  @JsonKey(ignore: true)
  _$$TournamentStatisticsModelImplCopyWith<_$TournamentStatisticsModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
