// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'verification_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

VerificationModel _$VerificationModelFromJson(Map<String, dynamic> json) {
  return _VerificationModel.fromJson(json);
}

/// @nodoc
mixin _$VerificationModel {
  int get id => throw _privateConstructorUsedError;
  String get result => throw _privateConstructorUsedError;
  @JsonKey(name: 'restriction_reason')
  String? get restrictionReason => throw _privateConstructorUsedError;
  @JsonKey(name: 'verified_at')
  String get verifiedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'session_id')
  int? get sessionId => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_offline')
  bool get isOffline => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VerificationModelCopyWith<VerificationModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VerificationModelCopyWith<$Res> {
  factory $VerificationModelCopyWith(
          VerificationModel value, $Res Function(VerificationModel) then) =
      _$VerificationModelCopyWithImpl<$Res, VerificationModel>;
  @useResult
  $Res call(
      {int id,
      String result,
      @JsonKey(name: 'restriction_reason') String? restrictionReason,
      @JsonKey(name: 'verified_at') String verifiedAt,
      @JsonKey(name: 'session_id') int? sessionId,
      @JsonKey(name: 'is_offline') bool isOffline});
}

/// @nodoc
class _$VerificationModelCopyWithImpl<$Res, $Val extends VerificationModel>
    implements $VerificationModelCopyWith<$Res> {
  _$VerificationModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? result = null,
    Object? restrictionReason = freezed,
    Object? verifiedAt = null,
    Object? sessionId = freezed,
    Object? isOffline = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      result: null == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as String,
      restrictionReason: freezed == restrictionReason
          ? _value.restrictionReason
          : restrictionReason // ignore: cast_nullable_to_non_nullable
              as String?,
      verifiedAt: null == verifiedAt
          ? _value.verifiedAt
          : verifiedAt // ignore: cast_nullable_to_non_nullable
              as String,
      sessionId: freezed == sessionId
          ? _value.sessionId
          : sessionId // ignore: cast_nullable_to_non_nullable
              as int?,
      isOffline: null == isOffline
          ? _value.isOffline
          : isOffline // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VerificationModelImplCopyWith<$Res>
    implements $VerificationModelCopyWith<$Res> {
  factory _$$VerificationModelImplCopyWith(_$VerificationModelImpl value,
          $Res Function(_$VerificationModelImpl) then) =
      __$$VerificationModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String result,
      @JsonKey(name: 'restriction_reason') String? restrictionReason,
      @JsonKey(name: 'verified_at') String verifiedAt,
      @JsonKey(name: 'session_id') int? sessionId,
      @JsonKey(name: 'is_offline') bool isOffline});
}

/// @nodoc
class __$$VerificationModelImplCopyWithImpl<$Res>
    extends _$VerificationModelCopyWithImpl<$Res, _$VerificationModelImpl>
    implements _$$VerificationModelImplCopyWith<$Res> {
  __$$VerificationModelImplCopyWithImpl(_$VerificationModelImpl _value,
      $Res Function(_$VerificationModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? result = null,
    Object? restrictionReason = freezed,
    Object? verifiedAt = null,
    Object? sessionId = freezed,
    Object? isOffline = null,
  }) {
    return _then(_$VerificationModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      result: null == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as String,
      restrictionReason: freezed == restrictionReason
          ? _value.restrictionReason
          : restrictionReason // ignore: cast_nullable_to_non_nullable
              as String?,
      verifiedAt: null == verifiedAt
          ? _value.verifiedAt
          : verifiedAt // ignore: cast_nullable_to_non_nullable
              as String,
      sessionId: freezed == sessionId
          ? _value.sessionId
          : sessionId // ignore: cast_nullable_to_non_nullable
              as int?,
      isOffline: null == isOffline
          ? _value.isOffline
          : isOffline // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VerificationModelImpl extends _VerificationModel {
  const _$VerificationModelImpl(
      {required this.id,
      required this.result,
      @JsonKey(name: 'restriction_reason') this.restrictionReason,
      @JsonKey(name: 'verified_at') required this.verifiedAt,
      @JsonKey(name: 'session_id') this.sessionId,
      @JsonKey(name: 'is_offline') this.isOffline = false})
      : super._();

  factory _$VerificationModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$VerificationModelImplFromJson(json);

  @override
  final int id;
  @override
  final String result;
  @override
  @JsonKey(name: 'restriction_reason')
  final String? restrictionReason;
  @override
  @JsonKey(name: 'verified_at')
  final String verifiedAt;
  @override
  @JsonKey(name: 'session_id')
  final int? sessionId;
  @override
  @JsonKey(name: 'is_offline')
  final bool isOffline;

  @override
  String toString() {
    return 'VerificationModel(id: $id, result: $result, restrictionReason: $restrictionReason, verifiedAt: $verifiedAt, sessionId: $sessionId, isOffline: $isOffline)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VerificationModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.result, result) || other.result == result) &&
            (identical(other.restrictionReason, restrictionReason) ||
                other.restrictionReason == restrictionReason) &&
            (identical(other.verifiedAt, verifiedAt) ||
                other.verifiedAt == verifiedAt) &&
            (identical(other.sessionId, sessionId) ||
                other.sessionId == sessionId) &&
            (identical(other.isOffline, isOffline) ||
                other.isOffline == isOffline));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, result, restrictionReason,
      verifiedAt, sessionId, isOffline);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$VerificationModelImplCopyWith<_$VerificationModelImpl> get copyWith =>
      __$$VerificationModelImplCopyWithImpl<_$VerificationModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VerificationModelImplToJson(
      this,
    );
  }
}

abstract class _VerificationModel extends VerificationModel {
  const factory _VerificationModel(
          {required final int id,
          required final String result,
          @JsonKey(name: 'restriction_reason') final String? restrictionReason,
          @JsonKey(name: 'verified_at') required final String verifiedAt,
          @JsonKey(name: 'session_id') final int? sessionId,
          @JsonKey(name: 'is_offline') final bool isOffline}) =
      _$VerificationModelImpl;
  const _VerificationModel._() : super._();

  factory _VerificationModel.fromJson(Map<String, dynamic> json) =
      _$VerificationModelImpl.fromJson;

  @override
  int get id;
  @override
  String get result;
  @override
  @JsonKey(name: 'restriction_reason')
  String? get restrictionReason;
  @override
  @JsonKey(name: 'verified_at')
  String get verifiedAt;
  @override
  @JsonKey(name: 'session_id')
  int? get sessionId;
  @override
  @JsonKey(name: 'is_offline')
  bool get isOffline;
  @override
  @JsonKey(ignore: true)
  _$$VerificationModelImplCopyWith<_$VerificationModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
