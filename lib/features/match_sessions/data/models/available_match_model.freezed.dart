// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'available_match_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AvailableMatchModel _$AvailableMatchModelFromJson(Map<String, dynamic> json) {
  return _AvailableMatchModel.fromJson(json);
}

/// @nodoc
mixin _$AvailableMatchModel {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'home_team')
  String get homeTeam => throw _privateConstructorUsedError;
  @JsonKey(name: 'away_team')
  String get awayTeam => throw _privateConstructorUsedError;
  @JsonKey(name: 'scheduled_at')
  String get scheduledAt => throw _privateConstructorUsedError;
  String get venue => throw _privateConstructorUsedError;
  @JsonKey(name: 'tournament_name')
  String get tournamentName => throw _privateConstructorUsedError;
  @JsonKey(name: 'tournament_logo')
  String? get tournamentLogo => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AvailableMatchModelCopyWith<AvailableMatchModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AvailableMatchModelCopyWith<$Res> {
  factory $AvailableMatchModelCopyWith(
          AvailableMatchModel value, $Res Function(AvailableMatchModel) then) =
      _$AvailableMatchModelCopyWithImpl<$Res, AvailableMatchModel>;
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'home_team') String homeTeam,
      @JsonKey(name: 'away_team') String awayTeam,
      @JsonKey(name: 'scheduled_at') String scheduledAt,
      String venue,
      @JsonKey(name: 'tournament_name') String tournamentName,
      @JsonKey(name: 'tournament_logo') String? tournamentLogo,
      String status});
}

/// @nodoc
class _$AvailableMatchModelCopyWithImpl<$Res, $Val extends AvailableMatchModel>
    implements $AvailableMatchModelCopyWith<$Res> {
  _$AvailableMatchModelCopyWithImpl(this._value, this._then);

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
    Object? venue = null,
    Object? tournamentName = null,
    Object? tournamentLogo = freezed,
    Object? status = null,
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
      venue: null == venue
          ? _value.venue
          : venue // ignore: cast_nullable_to_non_nullable
              as String,
      tournamentName: null == tournamentName
          ? _value.tournamentName
          : tournamentName // ignore: cast_nullable_to_non_nullable
              as String,
      tournamentLogo: freezed == tournamentLogo
          ? _value.tournamentLogo
          : tournamentLogo // ignore: cast_nullable_to_non_nullable
              as String?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AvailableMatchModelImplCopyWith<$Res>
    implements $AvailableMatchModelCopyWith<$Res> {
  factory _$$AvailableMatchModelImplCopyWith(_$AvailableMatchModelImpl value,
          $Res Function(_$AvailableMatchModelImpl) then) =
      __$$AvailableMatchModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'home_team') String homeTeam,
      @JsonKey(name: 'away_team') String awayTeam,
      @JsonKey(name: 'scheduled_at') String scheduledAt,
      String venue,
      @JsonKey(name: 'tournament_name') String tournamentName,
      @JsonKey(name: 'tournament_logo') String? tournamentLogo,
      String status});
}

/// @nodoc
class __$$AvailableMatchModelImplCopyWithImpl<$Res>
    extends _$AvailableMatchModelCopyWithImpl<$Res, _$AvailableMatchModelImpl>
    implements _$$AvailableMatchModelImplCopyWith<$Res> {
  __$$AvailableMatchModelImplCopyWithImpl(_$AvailableMatchModelImpl _value,
      $Res Function(_$AvailableMatchModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? homeTeam = null,
    Object? awayTeam = null,
    Object? scheduledAt = null,
    Object? venue = null,
    Object? tournamentName = null,
    Object? tournamentLogo = freezed,
    Object? status = null,
  }) {
    return _then(_$AvailableMatchModelImpl(
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
      venue: null == venue
          ? _value.venue
          : venue // ignore: cast_nullable_to_non_nullable
              as String,
      tournamentName: null == tournamentName
          ? _value.tournamentName
          : tournamentName // ignore: cast_nullable_to_non_nullable
              as String,
      tournamentLogo: freezed == tournamentLogo
          ? _value.tournamentLogo
          : tournamentLogo // ignore: cast_nullable_to_non_nullable
              as String?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AvailableMatchModelImpl extends _AvailableMatchModel {
  const _$AvailableMatchModelImpl(
      {required this.id,
      @JsonKey(name: 'home_team') required this.homeTeam,
      @JsonKey(name: 'away_team') required this.awayTeam,
      @JsonKey(name: 'scheduled_at') required this.scheduledAt,
      required this.venue,
      @JsonKey(name: 'tournament_name') required this.tournamentName,
      @JsonKey(name: 'tournament_logo') this.tournamentLogo,
      required this.status})
      : super._();

  factory _$AvailableMatchModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AvailableMatchModelImplFromJson(json);

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
  final String venue;
  @override
  @JsonKey(name: 'tournament_name')
  final String tournamentName;
  @override
  @JsonKey(name: 'tournament_logo')
  final String? tournamentLogo;
  @override
  final String status;

  @override
  String toString() {
    return 'AvailableMatchModel(id: $id, homeTeam: $homeTeam, awayTeam: $awayTeam, scheduledAt: $scheduledAt, venue: $venue, tournamentName: $tournamentName, tournamentLogo: $tournamentLogo, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AvailableMatchModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.homeTeam, homeTeam) ||
                other.homeTeam == homeTeam) &&
            (identical(other.awayTeam, awayTeam) ||
                other.awayTeam == awayTeam) &&
            (identical(other.scheduledAt, scheduledAt) ||
                other.scheduledAt == scheduledAt) &&
            (identical(other.venue, venue) || other.venue == venue) &&
            (identical(other.tournamentName, tournamentName) ||
                other.tournamentName == tournamentName) &&
            (identical(other.tournamentLogo, tournamentLogo) ||
                other.tournamentLogo == tournamentLogo) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, homeTeam, awayTeam,
      scheduledAt, venue, tournamentName, tournamentLogo, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AvailableMatchModelImplCopyWith<_$AvailableMatchModelImpl> get copyWith =>
      __$$AvailableMatchModelImplCopyWithImpl<_$AvailableMatchModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AvailableMatchModelImplToJson(
      this,
    );
  }
}

abstract class _AvailableMatchModel extends AvailableMatchModel {
  const factory _AvailableMatchModel(
      {required final int id,
      @JsonKey(name: 'home_team') required final String homeTeam,
      @JsonKey(name: 'away_team') required final String awayTeam,
      @JsonKey(name: 'scheduled_at') required final String scheduledAt,
      required final String venue,
      @JsonKey(name: 'tournament_name') required final String tournamentName,
      @JsonKey(name: 'tournament_logo') final String? tournamentLogo,
      required final String status}) = _$AvailableMatchModelImpl;
  const _AvailableMatchModel._() : super._();

  factory _AvailableMatchModel.fromJson(Map<String, dynamic> json) =
      _$AvailableMatchModelImpl.fromJson;

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
  String get venue;
  @override
  @JsonKey(name: 'tournament_name')
  String get tournamentName;
  @override
  @JsonKey(name: 'tournament_logo')
  String? get tournamentLogo;
  @override
  String get status;
  @override
  @JsonKey(ignore: true)
  _$$AvailableMatchModelImplCopyWith<_$AvailableMatchModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
