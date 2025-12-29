// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'verification_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

VerificationResponseModel _$VerificationResponseModelFromJson(
    Map<String, dynamic> json) {
  return _VerificationResponseModel.fromJson(json);
}

/// @nodoc
mixin _$VerificationResponseModel {
  bool get success => throw _privateConstructorUsedError;
  VerificationModel get verification => throw _privateConstructorUsedError;
  PlayerModel get player => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VerificationResponseModelCopyWith<VerificationResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VerificationResponseModelCopyWith<$Res> {
  factory $VerificationResponseModelCopyWith(VerificationResponseModel value,
          $Res Function(VerificationResponseModel) then) =
      _$VerificationResponseModelCopyWithImpl<$Res, VerificationResponseModel>;
  @useResult
  $Res call({bool success, VerificationModel verification, PlayerModel player});

  $VerificationModelCopyWith<$Res> get verification;
  $PlayerModelCopyWith<$Res> get player;
}

/// @nodoc
class _$VerificationResponseModelCopyWithImpl<$Res,
        $Val extends VerificationResponseModel>
    implements $VerificationResponseModelCopyWith<$Res> {
  _$VerificationResponseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? verification = null,
    Object? player = null,
  }) {
    return _then(_value.copyWith(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      verification: null == verification
          ? _value.verification
          : verification // ignore: cast_nullable_to_non_nullable
              as VerificationModel,
      player: null == player
          ? _value.player
          : player // ignore: cast_nullable_to_non_nullable
              as PlayerModel,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $VerificationModelCopyWith<$Res> get verification {
    return $VerificationModelCopyWith<$Res>(_value.verification, (value) {
      return _then(_value.copyWith(verification: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $PlayerModelCopyWith<$Res> get player {
    return $PlayerModelCopyWith<$Res>(_value.player, (value) {
      return _then(_value.copyWith(player: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$VerificationResponseModelImplCopyWith<$Res>
    implements $VerificationResponseModelCopyWith<$Res> {
  factory _$$VerificationResponseModelImplCopyWith(
          _$VerificationResponseModelImpl value,
          $Res Function(_$VerificationResponseModelImpl) then) =
      __$$VerificationResponseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool success, VerificationModel verification, PlayerModel player});

  @override
  $VerificationModelCopyWith<$Res> get verification;
  @override
  $PlayerModelCopyWith<$Res> get player;
}

/// @nodoc
class __$$VerificationResponseModelImplCopyWithImpl<$Res>
    extends _$VerificationResponseModelCopyWithImpl<$Res,
        _$VerificationResponseModelImpl>
    implements _$$VerificationResponseModelImplCopyWith<$Res> {
  __$$VerificationResponseModelImplCopyWithImpl(
      _$VerificationResponseModelImpl _value,
      $Res Function(_$VerificationResponseModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? verification = null,
    Object? player = null,
  }) {
    return _then(_$VerificationResponseModelImpl(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      verification: null == verification
          ? _value.verification
          : verification // ignore: cast_nullable_to_non_nullable
              as VerificationModel,
      player: null == player
          ? _value.player
          : player // ignore: cast_nullable_to_non_nullable
              as PlayerModel,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VerificationResponseModelImpl extends _VerificationResponseModel {
  const _$VerificationResponseModelImpl(
      {required this.success, required this.verification, required this.player})
      : super._();

  factory _$VerificationResponseModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$VerificationResponseModelImplFromJson(json);

  @override
  final bool success;
  @override
  final VerificationModel verification;
  @override
  final PlayerModel player;

  @override
  String toString() {
    return 'VerificationResponseModel(success: $success, verification: $verification, player: $player)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VerificationResponseModelImpl &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.verification, verification) ||
                other.verification == verification) &&
            (identical(other.player, player) || other.player == player));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, success, verification, player);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$VerificationResponseModelImplCopyWith<_$VerificationResponseModelImpl>
      get copyWith => __$$VerificationResponseModelImplCopyWithImpl<
          _$VerificationResponseModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VerificationResponseModelImplToJson(
      this,
    );
  }
}

abstract class _VerificationResponseModel extends VerificationResponseModel {
  const factory _VerificationResponseModel(
      {required final bool success,
      required final VerificationModel verification,
      required final PlayerModel player}) = _$VerificationResponseModelImpl;
  const _VerificationResponseModel._() : super._();

  factory _VerificationResponseModel.fromJson(Map<String, dynamic> json) =
      _$VerificationResponseModelImpl.fromJson;

  @override
  bool get success;
  @override
  VerificationModel get verification;
  @override
  PlayerModel get player;
  @override
  @JsonKey(ignore: true)
  _$$VerificationResponseModelImplCopyWith<_$VerificationResponseModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
