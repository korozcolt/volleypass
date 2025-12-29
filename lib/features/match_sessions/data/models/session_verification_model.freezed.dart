// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'session_verification_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SessionVerificationModel _$SessionVerificationModelFromJson(
    Map<String, dynamic> json) {
  return _SessionVerificationModel.fromJson(json);
}

/// @nodoc
mixin _$SessionVerificationModel {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'session_id')
  int get sessionId => throw _privateConstructorUsedError;
  @JsonKey(name: 'player_name')
  String get playerName => throw _privateConstructorUsedError;
  @JsonKey(name: 'card_number')
  String get cardNumber => throw _privateConstructorUsedError;
  String get team => throw _privateConstructorUsedError;
  String get result => throw _privateConstructorUsedError;
  @JsonKey(name: 'verified_at')
  String get verifiedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'restriction_reason')
  String? get restrictionReason => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SessionVerificationModelCopyWith<SessionVerificationModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SessionVerificationModelCopyWith<$Res> {
  factory $SessionVerificationModelCopyWith(SessionVerificationModel value,
          $Res Function(SessionVerificationModel) then) =
      _$SessionVerificationModelCopyWithImpl<$Res, SessionVerificationModel>;
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'session_id') int sessionId,
      @JsonKey(name: 'player_name') String playerName,
      @JsonKey(name: 'card_number') String cardNumber,
      String team,
      String result,
      @JsonKey(name: 'verified_at') String verifiedAt,
      @JsonKey(name: 'restriction_reason') String? restrictionReason});
}

/// @nodoc
class _$SessionVerificationModelCopyWithImpl<$Res,
        $Val extends SessionVerificationModel>
    implements $SessionVerificationModelCopyWith<$Res> {
  _$SessionVerificationModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? sessionId = null,
    Object? playerName = null,
    Object? cardNumber = null,
    Object? team = null,
    Object? result = null,
    Object? verifiedAt = null,
    Object? restrictionReason = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      sessionId: null == sessionId
          ? _value.sessionId
          : sessionId // ignore: cast_nullable_to_non_nullable
              as int,
      playerName: null == playerName
          ? _value.playerName
          : playerName // ignore: cast_nullable_to_non_nullable
              as String,
      cardNumber: null == cardNumber
          ? _value.cardNumber
          : cardNumber // ignore: cast_nullable_to_non_nullable
              as String,
      team: null == team
          ? _value.team
          : team // ignore: cast_nullable_to_non_nullable
              as String,
      result: null == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as String,
      verifiedAt: null == verifiedAt
          ? _value.verifiedAt
          : verifiedAt // ignore: cast_nullable_to_non_nullable
              as String,
      restrictionReason: freezed == restrictionReason
          ? _value.restrictionReason
          : restrictionReason // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SessionVerificationModelImplCopyWith<$Res>
    implements $SessionVerificationModelCopyWith<$Res> {
  factory _$$SessionVerificationModelImplCopyWith(
          _$SessionVerificationModelImpl value,
          $Res Function(_$SessionVerificationModelImpl) then) =
      __$$SessionVerificationModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'session_id') int sessionId,
      @JsonKey(name: 'player_name') String playerName,
      @JsonKey(name: 'card_number') String cardNumber,
      String team,
      String result,
      @JsonKey(name: 'verified_at') String verifiedAt,
      @JsonKey(name: 'restriction_reason') String? restrictionReason});
}

/// @nodoc
class __$$SessionVerificationModelImplCopyWithImpl<$Res>
    extends _$SessionVerificationModelCopyWithImpl<$Res,
        _$SessionVerificationModelImpl>
    implements _$$SessionVerificationModelImplCopyWith<$Res> {
  __$$SessionVerificationModelImplCopyWithImpl(
      _$SessionVerificationModelImpl _value,
      $Res Function(_$SessionVerificationModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? sessionId = null,
    Object? playerName = null,
    Object? cardNumber = null,
    Object? team = null,
    Object? result = null,
    Object? verifiedAt = null,
    Object? restrictionReason = freezed,
  }) {
    return _then(_$SessionVerificationModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      sessionId: null == sessionId
          ? _value.sessionId
          : sessionId // ignore: cast_nullable_to_non_nullable
              as int,
      playerName: null == playerName
          ? _value.playerName
          : playerName // ignore: cast_nullable_to_non_nullable
              as String,
      cardNumber: null == cardNumber
          ? _value.cardNumber
          : cardNumber // ignore: cast_nullable_to_non_nullable
              as String,
      team: null == team
          ? _value.team
          : team // ignore: cast_nullable_to_non_nullable
              as String,
      result: null == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as String,
      verifiedAt: null == verifiedAt
          ? _value.verifiedAt
          : verifiedAt // ignore: cast_nullable_to_non_nullable
              as String,
      restrictionReason: freezed == restrictionReason
          ? _value.restrictionReason
          : restrictionReason // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SessionVerificationModelImpl extends _SessionVerificationModel {
  const _$SessionVerificationModelImpl(
      {required this.id,
      @JsonKey(name: 'session_id') required this.sessionId,
      @JsonKey(name: 'player_name') required this.playerName,
      @JsonKey(name: 'card_number') required this.cardNumber,
      required this.team,
      required this.result,
      @JsonKey(name: 'verified_at') required this.verifiedAt,
      @JsonKey(name: 'restriction_reason') this.restrictionReason})
      : super._();

  factory _$SessionVerificationModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SessionVerificationModelImplFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'session_id')
  final int sessionId;
  @override
  @JsonKey(name: 'player_name')
  final String playerName;
  @override
  @JsonKey(name: 'card_number')
  final String cardNumber;
  @override
  final String team;
  @override
  final String result;
  @override
  @JsonKey(name: 'verified_at')
  final String verifiedAt;
  @override
  @JsonKey(name: 'restriction_reason')
  final String? restrictionReason;

  @override
  String toString() {
    return 'SessionVerificationModel(id: $id, sessionId: $sessionId, playerName: $playerName, cardNumber: $cardNumber, team: $team, result: $result, verifiedAt: $verifiedAt, restrictionReason: $restrictionReason)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SessionVerificationModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.sessionId, sessionId) ||
                other.sessionId == sessionId) &&
            (identical(other.playerName, playerName) ||
                other.playerName == playerName) &&
            (identical(other.cardNumber, cardNumber) ||
                other.cardNumber == cardNumber) &&
            (identical(other.team, team) || other.team == team) &&
            (identical(other.result, result) || other.result == result) &&
            (identical(other.verifiedAt, verifiedAt) ||
                other.verifiedAt == verifiedAt) &&
            (identical(other.restrictionReason, restrictionReason) ||
                other.restrictionReason == restrictionReason));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, sessionId, playerName,
      cardNumber, team, result, verifiedAt, restrictionReason);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SessionVerificationModelImplCopyWith<_$SessionVerificationModelImpl>
      get copyWith => __$$SessionVerificationModelImplCopyWithImpl<
          _$SessionVerificationModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SessionVerificationModelImplToJson(
      this,
    );
  }
}

abstract class _SessionVerificationModel extends SessionVerificationModel {
  const factory _SessionVerificationModel(
      {required final int id,
      @JsonKey(name: 'session_id') required final int sessionId,
      @JsonKey(name: 'player_name') required final String playerName,
      @JsonKey(name: 'card_number') required final String cardNumber,
      required final String team,
      required final String result,
      @JsonKey(name: 'verified_at') required final String verifiedAt,
      @JsonKey(name: 'restriction_reason')
      final String? restrictionReason}) = _$SessionVerificationModelImpl;
  const _SessionVerificationModel._() : super._();

  factory _SessionVerificationModel.fromJson(Map<String, dynamic> json) =
      _$SessionVerificationModelImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'session_id')
  int get sessionId;
  @override
  @JsonKey(name: 'player_name')
  String get playerName;
  @override
  @JsonKey(name: 'card_number')
  String get cardNumber;
  @override
  String get team;
  @override
  String get result;
  @override
  @JsonKey(name: 'verified_at')
  String get verifiedAt;
  @override
  @JsonKey(name: 'restriction_reason')
  String? get restrictionReason;
  @override
  @JsonKey(ignore: true)
  _$$SessionVerificationModelImplCopyWith<_$SessionVerificationModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
