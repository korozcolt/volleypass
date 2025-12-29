// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'session_detail_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SessionDetailResponseModel _$SessionDetailResponseModelFromJson(
    Map<String, dynamic> json) {
  return _SessionDetailResponseModel.fromJson(json);
}

/// @nodoc
mixin _$SessionDetailResponseModel {
  MatchSessionModel get session => throw _privateConstructorUsedError;
  AvailableMatchModel get match => throw _privateConstructorUsedError;
  List<SessionVerificationModel> get verifications =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SessionDetailResponseModelCopyWith<SessionDetailResponseModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SessionDetailResponseModelCopyWith<$Res> {
  factory $SessionDetailResponseModelCopyWith(SessionDetailResponseModel value,
          $Res Function(SessionDetailResponseModel) then) =
      _$SessionDetailResponseModelCopyWithImpl<$Res,
          SessionDetailResponseModel>;
  @useResult
  $Res call(
      {MatchSessionModel session,
      AvailableMatchModel match,
      List<SessionVerificationModel> verifications});

  $MatchSessionModelCopyWith<$Res> get session;
  $AvailableMatchModelCopyWith<$Res> get match;
}

/// @nodoc
class _$SessionDetailResponseModelCopyWithImpl<$Res,
        $Val extends SessionDetailResponseModel>
    implements $SessionDetailResponseModelCopyWith<$Res> {
  _$SessionDetailResponseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? session = null,
    Object? match = null,
    Object? verifications = null,
  }) {
    return _then(_value.copyWith(
      session: null == session
          ? _value.session
          : session // ignore: cast_nullable_to_non_nullable
              as MatchSessionModel,
      match: null == match
          ? _value.match
          : match // ignore: cast_nullable_to_non_nullable
              as AvailableMatchModel,
      verifications: null == verifications
          ? _value.verifications
          : verifications // ignore: cast_nullable_to_non_nullable
              as List<SessionVerificationModel>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $MatchSessionModelCopyWith<$Res> get session {
    return $MatchSessionModelCopyWith<$Res>(_value.session, (value) {
      return _then(_value.copyWith(session: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $AvailableMatchModelCopyWith<$Res> get match {
    return $AvailableMatchModelCopyWith<$Res>(_value.match, (value) {
      return _then(_value.copyWith(match: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SessionDetailResponseModelImplCopyWith<$Res>
    implements $SessionDetailResponseModelCopyWith<$Res> {
  factory _$$SessionDetailResponseModelImplCopyWith(
          _$SessionDetailResponseModelImpl value,
          $Res Function(_$SessionDetailResponseModelImpl) then) =
      __$$SessionDetailResponseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {MatchSessionModel session,
      AvailableMatchModel match,
      List<SessionVerificationModel> verifications});

  @override
  $MatchSessionModelCopyWith<$Res> get session;
  @override
  $AvailableMatchModelCopyWith<$Res> get match;
}

/// @nodoc
class __$$SessionDetailResponseModelImplCopyWithImpl<$Res>
    extends _$SessionDetailResponseModelCopyWithImpl<$Res,
        _$SessionDetailResponseModelImpl>
    implements _$$SessionDetailResponseModelImplCopyWith<$Res> {
  __$$SessionDetailResponseModelImplCopyWithImpl(
      _$SessionDetailResponseModelImpl _value,
      $Res Function(_$SessionDetailResponseModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? session = null,
    Object? match = null,
    Object? verifications = null,
  }) {
    return _then(_$SessionDetailResponseModelImpl(
      session: null == session
          ? _value.session
          : session // ignore: cast_nullable_to_non_nullable
              as MatchSessionModel,
      match: null == match
          ? _value.match
          : match // ignore: cast_nullable_to_non_nullable
              as AvailableMatchModel,
      verifications: null == verifications
          ? _value._verifications
          : verifications // ignore: cast_nullable_to_non_nullable
              as List<SessionVerificationModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SessionDetailResponseModelImpl extends _SessionDetailResponseModel {
  const _$SessionDetailResponseModelImpl(
      {required this.session,
      required this.match,
      required final List<SessionVerificationModel> verifications})
      : _verifications = verifications,
        super._();

  factory _$SessionDetailResponseModelImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$SessionDetailResponseModelImplFromJson(json);

  @override
  final MatchSessionModel session;
  @override
  final AvailableMatchModel match;
  final List<SessionVerificationModel> _verifications;
  @override
  List<SessionVerificationModel> get verifications {
    if (_verifications is EqualUnmodifiableListView) return _verifications;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_verifications);
  }

  @override
  String toString() {
    return 'SessionDetailResponseModel(session: $session, match: $match, verifications: $verifications)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SessionDetailResponseModelImpl &&
            (identical(other.session, session) || other.session == session) &&
            (identical(other.match, match) || other.match == match) &&
            const DeepCollectionEquality()
                .equals(other._verifications, _verifications));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, session, match,
      const DeepCollectionEquality().hash(_verifications));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SessionDetailResponseModelImplCopyWith<_$SessionDetailResponseModelImpl>
      get copyWith => __$$SessionDetailResponseModelImplCopyWithImpl<
          _$SessionDetailResponseModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SessionDetailResponseModelImplToJson(
      this,
    );
  }
}

abstract class _SessionDetailResponseModel extends SessionDetailResponseModel {
  const factory _SessionDetailResponseModel(
          {required final MatchSessionModel session,
          required final AvailableMatchModel match,
          required final List<SessionVerificationModel> verifications}) =
      _$SessionDetailResponseModelImpl;
  const _SessionDetailResponseModel._() : super._();

  factory _SessionDetailResponseModel.fromJson(Map<String, dynamic> json) =
      _$SessionDetailResponseModelImpl.fromJson;

  @override
  MatchSessionModel get session;
  @override
  AvailableMatchModel get match;
  @override
  List<SessionVerificationModel> get verifications;
  @override
  @JsonKey(ignore: true)
  _$$SessionDetailResponseModelImplCopyWith<_$SessionDetailResponseModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
