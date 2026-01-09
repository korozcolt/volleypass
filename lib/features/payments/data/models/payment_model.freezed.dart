// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payment_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PaymentModel _$PaymentModelFromJson(Map<String, dynamic> json) {
  return _PaymentModel.fromJson(json);
}

/// @nodoc
mixin _$PaymentModel {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'player_id')
  int get playerId => throw _privateConstructorUsedError;
  @JsonKey(name: 'player_name')
  String get playerName => throw _privateConstructorUsedError;
  @JsonKey(name: 'club_id')
  int get clubId => throw _privateConstructorUsedError;
  @JsonKey(name: 'club_name')
  String get clubName => throw _privateConstructorUsedError;
  @JsonKey(name: 'league_id')
  int? get leagueId => throw _privateConstructorUsedError;
  @JsonKey(name: 'league_name')
  String? get leagueName => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  double get amount => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'due_date')
  String get dueDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'verified_at')
  String? get verifiedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'verified_by')
  int? get verifiedBy => throw _privateConstructorUsedError;
  @JsonKey(name: 'verifier_name')
  String? get verifierName => throw _privateConstructorUsedError;
  @JsonKey(name: 'rejection_notes')
  String? get rejectionNotes => throw _privateConstructorUsedError;
  @JsonKey(name: 'payment_proof_url')
  String? get paymentProofUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  String get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  String get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PaymentModelCopyWith<PaymentModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentModelCopyWith<$Res> {
  factory $PaymentModelCopyWith(
          PaymentModel value, $Res Function(PaymentModel) then) =
      _$PaymentModelCopyWithImpl<$Res, PaymentModel>;
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'player_id') int playerId,
      @JsonKey(name: 'player_name') String playerName,
      @JsonKey(name: 'club_id') int clubId,
      @JsonKey(name: 'club_name') String clubName,
      @JsonKey(name: 'league_id') int? leagueId,
      @JsonKey(name: 'league_name') String? leagueName,
      String type,
      String status,
      double amount,
      String description,
      @JsonKey(name: 'due_date') String dueDate,
      @JsonKey(name: 'verified_at') String? verifiedAt,
      @JsonKey(name: 'verified_by') int? verifiedBy,
      @JsonKey(name: 'verifier_name') String? verifierName,
      @JsonKey(name: 'rejection_notes') String? rejectionNotes,
      @JsonKey(name: 'payment_proof_url') String? paymentProofUrl,
      @JsonKey(name: 'created_at') String createdAt,
      @JsonKey(name: 'updated_at') String updatedAt});
}

/// @nodoc
class _$PaymentModelCopyWithImpl<$Res, $Val extends PaymentModel>
    implements $PaymentModelCopyWith<$Res> {
  _$PaymentModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? playerId = null,
    Object? playerName = null,
    Object? clubId = null,
    Object? clubName = null,
    Object? leagueId = freezed,
    Object? leagueName = freezed,
    Object? type = null,
    Object? status = null,
    Object? amount = null,
    Object? description = null,
    Object? dueDate = null,
    Object? verifiedAt = freezed,
    Object? verifiedBy = freezed,
    Object? verifierName = freezed,
    Object? rejectionNotes = freezed,
    Object? paymentProofUrl = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      playerId: null == playerId
          ? _value.playerId
          : playerId // ignore: cast_nullable_to_non_nullable
              as int,
      playerName: null == playerName
          ? _value.playerName
          : playerName // ignore: cast_nullable_to_non_nullable
              as String,
      clubId: null == clubId
          ? _value.clubId
          : clubId // ignore: cast_nullable_to_non_nullable
              as int,
      clubName: null == clubName
          ? _value.clubName
          : clubName // ignore: cast_nullable_to_non_nullable
              as String,
      leagueId: freezed == leagueId
          ? _value.leagueId
          : leagueId // ignore: cast_nullable_to_non_nullable
              as int?,
      leagueName: freezed == leagueName
          ? _value.leagueName
          : leagueName // ignore: cast_nullable_to_non_nullable
              as String?,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      dueDate: null == dueDate
          ? _value.dueDate
          : dueDate // ignore: cast_nullable_to_non_nullable
              as String,
      verifiedAt: freezed == verifiedAt
          ? _value.verifiedAt
          : verifiedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      verifiedBy: freezed == verifiedBy
          ? _value.verifiedBy
          : verifiedBy // ignore: cast_nullable_to_non_nullable
              as int?,
      verifierName: freezed == verifierName
          ? _value.verifierName
          : verifierName // ignore: cast_nullable_to_non_nullable
              as String?,
      rejectionNotes: freezed == rejectionNotes
          ? _value.rejectionNotes
          : rejectionNotes // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentProofUrl: freezed == paymentProofUrl
          ? _value.paymentProofUrl
          : paymentProofUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PaymentModelImplCopyWith<$Res>
    implements $PaymentModelCopyWith<$Res> {
  factory _$$PaymentModelImplCopyWith(
          _$PaymentModelImpl value, $Res Function(_$PaymentModelImpl) then) =
      __$$PaymentModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'player_id') int playerId,
      @JsonKey(name: 'player_name') String playerName,
      @JsonKey(name: 'club_id') int clubId,
      @JsonKey(name: 'club_name') String clubName,
      @JsonKey(name: 'league_id') int? leagueId,
      @JsonKey(name: 'league_name') String? leagueName,
      String type,
      String status,
      double amount,
      String description,
      @JsonKey(name: 'due_date') String dueDate,
      @JsonKey(name: 'verified_at') String? verifiedAt,
      @JsonKey(name: 'verified_by') int? verifiedBy,
      @JsonKey(name: 'verifier_name') String? verifierName,
      @JsonKey(name: 'rejection_notes') String? rejectionNotes,
      @JsonKey(name: 'payment_proof_url') String? paymentProofUrl,
      @JsonKey(name: 'created_at') String createdAt,
      @JsonKey(name: 'updated_at') String updatedAt});
}

/// @nodoc
class __$$PaymentModelImplCopyWithImpl<$Res>
    extends _$PaymentModelCopyWithImpl<$Res, _$PaymentModelImpl>
    implements _$$PaymentModelImplCopyWith<$Res> {
  __$$PaymentModelImplCopyWithImpl(
      _$PaymentModelImpl _value, $Res Function(_$PaymentModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? playerId = null,
    Object? playerName = null,
    Object? clubId = null,
    Object? clubName = null,
    Object? leagueId = freezed,
    Object? leagueName = freezed,
    Object? type = null,
    Object? status = null,
    Object? amount = null,
    Object? description = null,
    Object? dueDate = null,
    Object? verifiedAt = freezed,
    Object? verifiedBy = freezed,
    Object? verifierName = freezed,
    Object? rejectionNotes = freezed,
    Object? paymentProofUrl = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$PaymentModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      playerId: null == playerId
          ? _value.playerId
          : playerId // ignore: cast_nullable_to_non_nullable
              as int,
      playerName: null == playerName
          ? _value.playerName
          : playerName // ignore: cast_nullable_to_non_nullable
              as String,
      clubId: null == clubId
          ? _value.clubId
          : clubId // ignore: cast_nullable_to_non_nullable
              as int,
      clubName: null == clubName
          ? _value.clubName
          : clubName // ignore: cast_nullable_to_non_nullable
              as String,
      leagueId: freezed == leagueId
          ? _value.leagueId
          : leagueId // ignore: cast_nullable_to_non_nullable
              as int?,
      leagueName: freezed == leagueName
          ? _value.leagueName
          : leagueName // ignore: cast_nullable_to_non_nullable
              as String?,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      dueDate: null == dueDate
          ? _value.dueDate
          : dueDate // ignore: cast_nullable_to_non_nullable
              as String,
      verifiedAt: freezed == verifiedAt
          ? _value.verifiedAt
          : verifiedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      verifiedBy: freezed == verifiedBy
          ? _value.verifiedBy
          : verifiedBy // ignore: cast_nullable_to_non_nullable
              as int?,
      verifierName: freezed == verifierName
          ? _value.verifierName
          : verifierName // ignore: cast_nullable_to_non_nullable
              as String?,
      rejectionNotes: freezed == rejectionNotes
          ? _value.rejectionNotes
          : rejectionNotes // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentProofUrl: freezed == paymentProofUrl
          ? _value.paymentProofUrl
          : paymentProofUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PaymentModelImpl implements _PaymentModel {
  const _$PaymentModelImpl(
      {required this.id,
      @JsonKey(name: 'player_id') required this.playerId,
      @JsonKey(name: 'player_name') required this.playerName,
      @JsonKey(name: 'club_id') required this.clubId,
      @JsonKey(name: 'club_name') required this.clubName,
      @JsonKey(name: 'league_id') this.leagueId,
      @JsonKey(name: 'league_name') this.leagueName,
      required this.type,
      required this.status,
      required this.amount,
      required this.description,
      @JsonKey(name: 'due_date') required this.dueDate,
      @JsonKey(name: 'verified_at') this.verifiedAt,
      @JsonKey(name: 'verified_by') this.verifiedBy,
      @JsonKey(name: 'verifier_name') this.verifierName,
      @JsonKey(name: 'rejection_notes') this.rejectionNotes,
      @JsonKey(name: 'payment_proof_url') this.paymentProofUrl,
      @JsonKey(name: 'created_at') required this.createdAt,
      @JsonKey(name: 'updated_at') required this.updatedAt});

  factory _$PaymentModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PaymentModelImplFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'player_id')
  final int playerId;
  @override
  @JsonKey(name: 'player_name')
  final String playerName;
  @override
  @JsonKey(name: 'club_id')
  final int clubId;
  @override
  @JsonKey(name: 'club_name')
  final String clubName;
  @override
  @JsonKey(name: 'league_id')
  final int? leagueId;
  @override
  @JsonKey(name: 'league_name')
  final String? leagueName;
  @override
  final String type;
  @override
  final String status;
  @override
  final double amount;
  @override
  final String description;
  @override
  @JsonKey(name: 'due_date')
  final String dueDate;
  @override
  @JsonKey(name: 'verified_at')
  final String? verifiedAt;
  @override
  @JsonKey(name: 'verified_by')
  final int? verifiedBy;
  @override
  @JsonKey(name: 'verifier_name')
  final String? verifierName;
  @override
  @JsonKey(name: 'rejection_notes')
  final String? rejectionNotes;
  @override
  @JsonKey(name: 'payment_proof_url')
  final String? paymentProofUrl;
  @override
  @JsonKey(name: 'created_at')
  final String createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final String updatedAt;

  @override
  String toString() {
    return 'PaymentModel(id: $id, playerId: $playerId, playerName: $playerName, clubId: $clubId, clubName: $clubName, leagueId: $leagueId, leagueName: $leagueName, type: $type, status: $status, amount: $amount, description: $description, dueDate: $dueDate, verifiedAt: $verifiedAt, verifiedBy: $verifiedBy, verifierName: $verifierName, rejectionNotes: $rejectionNotes, paymentProofUrl: $paymentProofUrl, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaymentModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.playerId, playerId) ||
                other.playerId == playerId) &&
            (identical(other.playerName, playerName) ||
                other.playerName == playerName) &&
            (identical(other.clubId, clubId) || other.clubId == clubId) &&
            (identical(other.clubName, clubName) ||
                other.clubName == clubName) &&
            (identical(other.leagueId, leagueId) ||
                other.leagueId == leagueId) &&
            (identical(other.leagueName, leagueName) ||
                other.leagueName == leagueName) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.dueDate, dueDate) || other.dueDate == dueDate) &&
            (identical(other.verifiedAt, verifiedAt) ||
                other.verifiedAt == verifiedAt) &&
            (identical(other.verifiedBy, verifiedBy) ||
                other.verifiedBy == verifiedBy) &&
            (identical(other.verifierName, verifierName) ||
                other.verifierName == verifierName) &&
            (identical(other.rejectionNotes, rejectionNotes) ||
                other.rejectionNotes == rejectionNotes) &&
            (identical(other.paymentProofUrl, paymentProofUrl) ||
                other.paymentProofUrl == paymentProofUrl) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        playerId,
        playerName,
        clubId,
        clubName,
        leagueId,
        leagueName,
        type,
        status,
        amount,
        description,
        dueDate,
        verifiedAt,
        verifiedBy,
        verifierName,
        rejectionNotes,
        paymentProofUrl,
        createdAt,
        updatedAt
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PaymentModelImplCopyWith<_$PaymentModelImpl> get copyWith =>
      __$$PaymentModelImplCopyWithImpl<_$PaymentModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PaymentModelImplToJson(
      this,
    );
  }
}

abstract class _PaymentModel implements PaymentModel {
  const factory _PaymentModel(
          {required final int id,
          @JsonKey(name: 'player_id') required final int playerId,
          @JsonKey(name: 'player_name') required final String playerName,
          @JsonKey(name: 'club_id') required final int clubId,
          @JsonKey(name: 'club_name') required final String clubName,
          @JsonKey(name: 'league_id') final int? leagueId,
          @JsonKey(name: 'league_name') final String? leagueName,
          required final String type,
          required final String status,
          required final double amount,
          required final String description,
          @JsonKey(name: 'due_date') required final String dueDate,
          @JsonKey(name: 'verified_at') final String? verifiedAt,
          @JsonKey(name: 'verified_by') final int? verifiedBy,
          @JsonKey(name: 'verifier_name') final String? verifierName,
          @JsonKey(name: 'rejection_notes') final String? rejectionNotes,
          @JsonKey(name: 'payment_proof_url') final String? paymentProofUrl,
          @JsonKey(name: 'created_at') required final String createdAt,
          @JsonKey(name: 'updated_at') required final String updatedAt}) =
      _$PaymentModelImpl;

  factory _PaymentModel.fromJson(Map<String, dynamic> json) =
      _$PaymentModelImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'player_id')
  int get playerId;
  @override
  @JsonKey(name: 'player_name')
  String get playerName;
  @override
  @JsonKey(name: 'club_id')
  int get clubId;
  @override
  @JsonKey(name: 'club_name')
  String get clubName;
  @override
  @JsonKey(name: 'league_id')
  int? get leagueId;
  @override
  @JsonKey(name: 'league_name')
  String? get leagueName;
  @override
  String get type;
  @override
  String get status;
  @override
  double get amount;
  @override
  String get description;
  @override
  @JsonKey(name: 'due_date')
  String get dueDate;
  @override
  @JsonKey(name: 'verified_at')
  String? get verifiedAt;
  @override
  @JsonKey(name: 'verified_by')
  int? get verifiedBy;
  @override
  @JsonKey(name: 'verifier_name')
  String? get verifierName;
  @override
  @JsonKey(name: 'rejection_notes')
  String? get rejectionNotes;
  @override
  @JsonKey(name: 'payment_proof_url')
  String? get paymentProofUrl;
  @override
  @JsonKey(name: 'created_at')
  String get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  String get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$PaymentModelImplCopyWith<_$PaymentModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PaymentListResponse _$PaymentListResponseFromJson(Map<String, dynamic> json) {
  return _PaymentListResponse.fromJson(json);
}

/// @nodoc
mixin _$PaymentListResponse {
  bool get success => throw _privateConstructorUsedError;
  List<PaymentModel> get data => throw _privateConstructorUsedError;
  PaginationMeta get meta => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PaymentListResponseCopyWith<PaymentListResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentListResponseCopyWith<$Res> {
  factory $PaymentListResponseCopyWith(
          PaymentListResponse value, $Res Function(PaymentListResponse) then) =
      _$PaymentListResponseCopyWithImpl<$Res, PaymentListResponse>;
  @useResult
  $Res call(
      {bool success,
      List<PaymentModel> data,
      PaginationMeta meta,
      String? message});

  $PaginationMetaCopyWith<$Res> get meta;
}

/// @nodoc
class _$PaymentListResponseCopyWithImpl<$Res, $Val extends PaymentListResponse>
    implements $PaymentListResponseCopyWith<$Res> {
  _$PaymentListResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? data = null,
    Object? meta = null,
    Object? message = freezed,
  }) {
    return _then(_value.copyWith(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<PaymentModel>,
      meta: null == meta
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as PaginationMeta,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PaginationMetaCopyWith<$Res> get meta {
    return $PaginationMetaCopyWith<$Res>(_value.meta, (value) {
      return _then(_value.copyWith(meta: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PaymentListResponseImplCopyWith<$Res>
    implements $PaymentListResponseCopyWith<$Res> {
  factory _$$PaymentListResponseImplCopyWith(_$PaymentListResponseImpl value,
          $Res Function(_$PaymentListResponseImpl) then) =
      __$$PaymentListResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool success,
      List<PaymentModel> data,
      PaginationMeta meta,
      String? message});

  @override
  $PaginationMetaCopyWith<$Res> get meta;
}

/// @nodoc
class __$$PaymentListResponseImplCopyWithImpl<$Res>
    extends _$PaymentListResponseCopyWithImpl<$Res, _$PaymentListResponseImpl>
    implements _$$PaymentListResponseImplCopyWith<$Res> {
  __$$PaymentListResponseImplCopyWithImpl(_$PaymentListResponseImpl _value,
      $Res Function(_$PaymentListResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? data = null,
    Object? meta = null,
    Object? message = freezed,
  }) {
    return _then(_$PaymentListResponseImpl(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<PaymentModel>,
      meta: null == meta
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as PaginationMeta,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PaymentListResponseImpl implements _PaymentListResponse {
  const _$PaymentListResponseImpl(
      {required this.success,
      required final List<PaymentModel> data,
      required this.meta,
      this.message})
      : _data = data;

  factory _$PaymentListResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$PaymentListResponseImplFromJson(json);

  @override
  final bool success;
  final List<PaymentModel> _data;
  @override
  List<PaymentModel> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  final PaginationMeta meta;
  @override
  final String? message;

  @override
  String toString() {
    return 'PaymentListResponse(success: $success, data: $data, meta: $meta, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaymentListResponseImpl &&
            (identical(other.success, success) || other.success == success) &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            (identical(other.meta, meta) || other.meta == meta) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, success,
      const DeepCollectionEquality().hash(_data), meta, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PaymentListResponseImplCopyWith<_$PaymentListResponseImpl> get copyWith =>
      __$$PaymentListResponseImplCopyWithImpl<_$PaymentListResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PaymentListResponseImplToJson(
      this,
    );
  }
}

abstract class _PaymentListResponse implements PaymentListResponse {
  const factory _PaymentListResponse(
      {required final bool success,
      required final List<PaymentModel> data,
      required final PaginationMeta meta,
      final String? message}) = _$PaymentListResponseImpl;

  factory _PaymentListResponse.fromJson(Map<String, dynamic> json) =
      _$PaymentListResponseImpl.fromJson;

  @override
  bool get success;
  @override
  List<PaymentModel> get data;
  @override
  PaginationMeta get meta;
  @override
  String? get message;
  @override
  @JsonKey(ignore: true)
  _$$PaymentListResponseImplCopyWith<_$PaymentListResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PaymentResponse _$PaymentResponseFromJson(Map<String, dynamic> json) {
  return _PaymentResponse.fromJson(json);
}

/// @nodoc
mixin _$PaymentResponse {
  bool get success => throw _privateConstructorUsedError;
  PaymentModel get data => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PaymentResponseCopyWith<PaymentResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentResponseCopyWith<$Res> {
  factory $PaymentResponseCopyWith(
          PaymentResponse value, $Res Function(PaymentResponse) then) =
      _$PaymentResponseCopyWithImpl<$Res, PaymentResponse>;
  @useResult
  $Res call({bool success, PaymentModel data, String? message});

  $PaymentModelCopyWith<$Res> get data;
}

/// @nodoc
class _$PaymentResponseCopyWithImpl<$Res, $Val extends PaymentResponse>
    implements $PaymentResponseCopyWith<$Res> {
  _$PaymentResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? data = null,
    Object? message = freezed,
  }) {
    return _then(_value.copyWith(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as PaymentModel,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PaymentModelCopyWith<$Res> get data {
    return $PaymentModelCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PaymentResponseImplCopyWith<$Res>
    implements $PaymentResponseCopyWith<$Res> {
  factory _$$PaymentResponseImplCopyWith(_$PaymentResponseImpl value,
          $Res Function(_$PaymentResponseImpl) then) =
      __$$PaymentResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool success, PaymentModel data, String? message});

  @override
  $PaymentModelCopyWith<$Res> get data;
}

/// @nodoc
class __$$PaymentResponseImplCopyWithImpl<$Res>
    extends _$PaymentResponseCopyWithImpl<$Res, _$PaymentResponseImpl>
    implements _$$PaymentResponseImplCopyWith<$Res> {
  __$$PaymentResponseImplCopyWithImpl(
      _$PaymentResponseImpl _value, $Res Function(_$PaymentResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? data = null,
    Object? message = freezed,
  }) {
    return _then(_$PaymentResponseImpl(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as PaymentModel,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PaymentResponseImpl implements _PaymentResponse {
  const _$PaymentResponseImpl(
      {required this.success, required this.data, this.message});

  factory _$PaymentResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$PaymentResponseImplFromJson(json);

  @override
  final bool success;
  @override
  final PaymentModel data;
  @override
  final String? message;

  @override
  String toString() {
    return 'PaymentResponse(success: $success, data: $data, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaymentResponseImpl &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.data, data) || other.data == data) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, success, data, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PaymentResponseImplCopyWith<_$PaymentResponseImpl> get copyWith =>
      __$$PaymentResponseImplCopyWithImpl<_$PaymentResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PaymentResponseImplToJson(
      this,
    );
  }
}

abstract class _PaymentResponse implements PaymentResponse {
  const factory _PaymentResponse(
      {required final bool success,
      required final PaymentModel data,
      final String? message}) = _$PaymentResponseImpl;

  factory _PaymentResponse.fromJson(Map<String, dynamic> json) =
      _$PaymentResponseImpl.fromJson;

  @override
  bool get success;
  @override
  PaymentModel get data;
  @override
  String? get message;
  @override
  @JsonKey(ignore: true)
  _$$PaymentResponseImplCopyWith<_$PaymentResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PaginationMeta _$PaginationMetaFromJson(Map<String, dynamic> json) {
  return _PaginationMeta.fromJson(json);
}

/// @nodoc
mixin _$PaginationMeta {
  @JsonKey(name: 'current_page')
  int get currentPage => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_page')
  int get lastPage => throw _privateConstructorUsedError;
  @JsonKey(name: 'per_page')
  int get perPage => throw _privateConstructorUsedError;
  int get total => throw _privateConstructorUsedError;
  int? get from => throw _privateConstructorUsedError;
  int? get to => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PaginationMetaCopyWith<PaginationMeta> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaginationMetaCopyWith<$Res> {
  factory $PaginationMetaCopyWith(
          PaginationMeta value, $Res Function(PaginationMeta) then) =
      _$PaginationMetaCopyWithImpl<$Res, PaginationMeta>;
  @useResult
  $Res call(
      {@JsonKey(name: 'current_page') int currentPage,
      @JsonKey(name: 'last_page') int lastPage,
      @JsonKey(name: 'per_page') int perPage,
      int total,
      int? from,
      int? to});
}

/// @nodoc
class _$PaginationMetaCopyWithImpl<$Res, $Val extends PaginationMeta>
    implements $PaginationMetaCopyWith<$Res> {
  _$PaginationMetaCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentPage = null,
    Object? lastPage = null,
    Object? perPage = null,
    Object? total = null,
    Object? from = freezed,
    Object? to = freezed,
  }) {
    return _then(_value.copyWith(
      currentPage: null == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      lastPage: null == lastPage
          ? _value.lastPage
          : lastPage // ignore: cast_nullable_to_non_nullable
              as int,
      perPage: null == perPage
          ? _value.perPage
          : perPage // ignore: cast_nullable_to_non_nullable
              as int,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      from: freezed == from
          ? _value.from
          : from // ignore: cast_nullable_to_non_nullable
              as int?,
      to: freezed == to
          ? _value.to
          : to // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PaginationMetaImplCopyWith<$Res>
    implements $PaginationMetaCopyWith<$Res> {
  factory _$$PaginationMetaImplCopyWith(_$PaginationMetaImpl value,
          $Res Function(_$PaginationMetaImpl) then) =
      __$$PaginationMetaImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'current_page') int currentPage,
      @JsonKey(name: 'last_page') int lastPage,
      @JsonKey(name: 'per_page') int perPage,
      int total,
      int? from,
      int? to});
}

/// @nodoc
class __$$PaginationMetaImplCopyWithImpl<$Res>
    extends _$PaginationMetaCopyWithImpl<$Res, _$PaginationMetaImpl>
    implements _$$PaginationMetaImplCopyWith<$Res> {
  __$$PaginationMetaImplCopyWithImpl(
      _$PaginationMetaImpl _value, $Res Function(_$PaginationMetaImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentPage = null,
    Object? lastPage = null,
    Object? perPage = null,
    Object? total = null,
    Object? from = freezed,
    Object? to = freezed,
  }) {
    return _then(_$PaginationMetaImpl(
      currentPage: null == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      lastPage: null == lastPage
          ? _value.lastPage
          : lastPage // ignore: cast_nullable_to_non_nullable
              as int,
      perPage: null == perPage
          ? _value.perPage
          : perPage // ignore: cast_nullable_to_non_nullable
              as int,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      from: freezed == from
          ? _value.from
          : from // ignore: cast_nullable_to_non_nullable
              as int?,
      to: freezed == to
          ? _value.to
          : to // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PaginationMetaImpl implements _PaginationMeta {
  const _$PaginationMetaImpl(
      {@JsonKey(name: 'current_page') required this.currentPage,
      @JsonKey(name: 'last_page') required this.lastPage,
      @JsonKey(name: 'per_page') required this.perPage,
      required this.total,
      this.from,
      this.to});

  factory _$PaginationMetaImpl.fromJson(Map<String, dynamic> json) =>
      _$$PaginationMetaImplFromJson(json);

  @override
  @JsonKey(name: 'current_page')
  final int currentPage;
  @override
  @JsonKey(name: 'last_page')
  final int lastPage;
  @override
  @JsonKey(name: 'per_page')
  final int perPage;
  @override
  final int total;
  @override
  final int? from;
  @override
  final int? to;

  @override
  String toString() {
    return 'PaginationMeta(currentPage: $currentPage, lastPage: $lastPage, perPage: $perPage, total: $total, from: $from, to: $to)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaginationMetaImpl &&
            (identical(other.currentPage, currentPage) ||
                other.currentPage == currentPage) &&
            (identical(other.lastPage, lastPage) ||
                other.lastPage == lastPage) &&
            (identical(other.perPage, perPage) || other.perPage == perPage) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.from, from) || other.from == from) &&
            (identical(other.to, to) || other.to == to));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, currentPage, lastPage, perPage, total, from, to);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PaginationMetaImplCopyWith<_$PaginationMetaImpl> get copyWith =>
      __$$PaginationMetaImplCopyWithImpl<_$PaginationMetaImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PaginationMetaImplToJson(
      this,
    );
  }
}

abstract class _PaginationMeta implements PaginationMeta {
  const factory _PaginationMeta(
      {@JsonKey(name: 'current_page') required final int currentPage,
      @JsonKey(name: 'last_page') required final int lastPage,
      @JsonKey(name: 'per_page') required final int perPage,
      required final int total,
      final int? from,
      final int? to}) = _$PaginationMetaImpl;

  factory _PaginationMeta.fromJson(Map<String, dynamic> json) =
      _$PaginationMetaImpl.fromJson;

  @override
  @JsonKey(name: 'current_page')
  int get currentPage;
  @override
  @JsonKey(name: 'last_page')
  int get lastPage;
  @override
  @JsonKey(name: 'per_page')
  int get perPage;
  @override
  int get total;
  @override
  int? get from;
  @override
  int? get to;
  @override
  @JsonKey(ignore: true)
  _$$PaginationMetaImplCopyWith<_$PaginationMetaImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

UploadProofResponse _$UploadProofResponseFromJson(Map<String, dynamic> json) {
  return _UploadProofResponse.fromJson(json);
}

/// @nodoc
mixin _$UploadProofResponse {
  bool get success => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  @JsonKey(name: 'payment_proof_url')
  String? get paymentProofUrl => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UploadProofResponseCopyWith<UploadProofResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UploadProofResponseCopyWith<$Res> {
  factory $UploadProofResponseCopyWith(
          UploadProofResponse value, $Res Function(UploadProofResponse) then) =
      _$UploadProofResponseCopyWithImpl<$Res, UploadProofResponse>;
  @useResult
  $Res call(
      {bool success,
      String message,
      @JsonKey(name: 'payment_proof_url') String? paymentProofUrl});
}

/// @nodoc
class _$UploadProofResponseCopyWithImpl<$Res, $Val extends UploadProofResponse>
    implements $UploadProofResponseCopyWith<$Res> {
  _$UploadProofResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? message = null,
    Object? paymentProofUrl = freezed,
  }) {
    return _then(_value.copyWith(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      paymentProofUrl: freezed == paymentProofUrl
          ? _value.paymentProofUrl
          : paymentProofUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UploadProofResponseImplCopyWith<$Res>
    implements $UploadProofResponseCopyWith<$Res> {
  factory _$$UploadProofResponseImplCopyWith(_$UploadProofResponseImpl value,
          $Res Function(_$UploadProofResponseImpl) then) =
      __$$UploadProofResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool success,
      String message,
      @JsonKey(name: 'payment_proof_url') String? paymentProofUrl});
}

/// @nodoc
class __$$UploadProofResponseImplCopyWithImpl<$Res>
    extends _$UploadProofResponseCopyWithImpl<$Res, _$UploadProofResponseImpl>
    implements _$$UploadProofResponseImplCopyWith<$Res> {
  __$$UploadProofResponseImplCopyWithImpl(_$UploadProofResponseImpl _value,
      $Res Function(_$UploadProofResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? message = null,
    Object? paymentProofUrl = freezed,
  }) {
    return _then(_$UploadProofResponseImpl(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      paymentProofUrl: freezed == paymentProofUrl
          ? _value.paymentProofUrl
          : paymentProofUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UploadProofResponseImpl implements _UploadProofResponse {
  const _$UploadProofResponseImpl(
      {required this.success,
      required this.message,
      @JsonKey(name: 'payment_proof_url') this.paymentProofUrl});

  factory _$UploadProofResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$UploadProofResponseImplFromJson(json);

  @override
  final bool success;
  @override
  final String message;
  @override
  @JsonKey(name: 'payment_proof_url')
  final String? paymentProofUrl;

  @override
  String toString() {
    return 'UploadProofResponse(success: $success, message: $message, paymentProofUrl: $paymentProofUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UploadProofResponseImpl &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.paymentProofUrl, paymentProofUrl) ||
                other.paymentProofUrl == paymentProofUrl));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, success, message, paymentProofUrl);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UploadProofResponseImplCopyWith<_$UploadProofResponseImpl> get copyWith =>
      __$$UploadProofResponseImplCopyWithImpl<_$UploadProofResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UploadProofResponseImplToJson(
      this,
    );
  }
}

abstract class _UploadProofResponse implements UploadProofResponse {
  const factory _UploadProofResponse(
          {required final bool success,
          required final String message,
          @JsonKey(name: 'payment_proof_url') final String? paymentProofUrl}) =
      _$UploadProofResponseImpl;

  factory _UploadProofResponse.fromJson(Map<String, dynamic> json) =
      _$UploadProofResponseImpl.fromJson;

  @override
  bool get success;
  @override
  String get message;
  @override
  @JsonKey(name: 'payment_proof_url')
  String? get paymentProofUrl;
  @override
  @JsonKey(ignore: true)
  _$$UploadProofResponseImplCopyWith<_$UploadProofResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

VerifyPaymentRequest _$VerifyPaymentRequestFromJson(Map<String, dynamic> json) {
  return _VerifyPaymentRequest.fromJson(json);
}

/// @nodoc
mixin _$VerifyPaymentRequest {
  String get action =>
      throw _privateConstructorUsedError; // "approve" o "reject"
  String? get notes => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VerifyPaymentRequestCopyWith<VerifyPaymentRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VerifyPaymentRequestCopyWith<$Res> {
  factory $VerifyPaymentRequestCopyWith(VerifyPaymentRequest value,
          $Res Function(VerifyPaymentRequest) then) =
      _$VerifyPaymentRequestCopyWithImpl<$Res, VerifyPaymentRequest>;
  @useResult
  $Res call({String action, String? notes});
}

/// @nodoc
class _$VerifyPaymentRequestCopyWithImpl<$Res,
        $Val extends VerifyPaymentRequest>
    implements $VerifyPaymentRequestCopyWith<$Res> {
  _$VerifyPaymentRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? action = null,
    Object? notes = freezed,
  }) {
    return _then(_value.copyWith(
      action: null == action
          ? _value.action
          : action // ignore: cast_nullable_to_non_nullable
              as String,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VerifyPaymentRequestImplCopyWith<$Res>
    implements $VerifyPaymentRequestCopyWith<$Res> {
  factory _$$VerifyPaymentRequestImplCopyWith(_$VerifyPaymentRequestImpl value,
          $Res Function(_$VerifyPaymentRequestImpl) then) =
      __$$VerifyPaymentRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String action, String? notes});
}

/// @nodoc
class __$$VerifyPaymentRequestImplCopyWithImpl<$Res>
    extends _$VerifyPaymentRequestCopyWithImpl<$Res, _$VerifyPaymentRequestImpl>
    implements _$$VerifyPaymentRequestImplCopyWith<$Res> {
  __$$VerifyPaymentRequestImplCopyWithImpl(_$VerifyPaymentRequestImpl _value,
      $Res Function(_$VerifyPaymentRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? action = null,
    Object? notes = freezed,
  }) {
    return _then(_$VerifyPaymentRequestImpl(
      action: null == action
          ? _value.action
          : action // ignore: cast_nullable_to_non_nullable
              as String,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VerifyPaymentRequestImpl implements _VerifyPaymentRequest {
  const _$VerifyPaymentRequestImpl({required this.action, this.notes});

  factory _$VerifyPaymentRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$VerifyPaymentRequestImplFromJson(json);

  @override
  final String action;
// "approve" o "reject"
  @override
  final String? notes;

  @override
  String toString() {
    return 'VerifyPaymentRequest(action: $action, notes: $notes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VerifyPaymentRequestImpl &&
            (identical(other.action, action) || other.action == action) &&
            (identical(other.notes, notes) || other.notes == notes));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, action, notes);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$VerifyPaymentRequestImplCopyWith<_$VerifyPaymentRequestImpl>
      get copyWith =>
          __$$VerifyPaymentRequestImplCopyWithImpl<_$VerifyPaymentRequestImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VerifyPaymentRequestImplToJson(
      this,
    );
  }
}

abstract class _VerifyPaymentRequest implements VerifyPaymentRequest {
  const factory _VerifyPaymentRequest(
      {required final String action,
      final String? notes}) = _$VerifyPaymentRequestImpl;

  factory _VerifyPaymentRequest.fromJson(Map<String, dynamic> json) =
      _$VerifyPaymentRequestImpl.fromJson;

  @override
  String get action;
  @override // "approve" o "reject"
  String? get notes;
  @override
  @JsonKey(ignore: true)
  _$$VerifyPaymentRequestImplCopyWith<_$VerifyPaymentRequestImpl>
      get copyWith => throw _privateConstructorUsedError;
}

VerifyPaymentResponse _$VerifyPaymentResponseFromJson(
    Map<String, dynamic> json) {
  return _VerifyPaymentResponse.fromJson(json);
}

/// @nodoc
mixin _$VerifyPaymentResponse {
  bool get success => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  PaymentModel? get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VerifyPaymentResponseCopyWith<VerifyPaymentResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VerifyPaymentResponseCopyWith<$Res> {
  factory $VerifyPaymentResponseCopyWith(VerifyPaymentResponse value,
          $Res Function(VerifyPaymentResponse) then) =
      _$VerifyPaymentResponseCopyWithImpl<$Res, VerifyPaymentResponse>;
  @useResult
  $Res call({bool success, String message, PaymentModel? data});

  $PaymentModelCopyWith<$Res>? get data;
}

/// @nodoc
class _$VerifyPaymentResponseCopyWithImpl<$Res,
        $Val extends VerifyPaymentResponse>
    implements $VerifyPaymentResponseCopyWith<$Res> {
  _$VerifyPaymentResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? message = null,
    Object? data = freezed,
  }) {
    return _then(_value.copyWith(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as PaymentModel?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PaymentModelCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $PaymentModelCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$VerifyPaymentResponseImplCopyWith<$Res>
    implements $VerifyPaymentResponseCopyWith<$Res> {
  factory _$$VerifyPaymentResponseImplCopyWith(
          _$VerifyPaymentResponseImpl value,
          $Res Function(_$VerifyPaymentResponseImpl) then) =
      __$$VerifyPaymentResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool success, String message, PaymentModel? data});

  @override
  $PaymentModelCopyWith<$Res>? get data;
}

/// @nodoc
class __$$VerifyPaymentResponseImplCopyWithImpl<$Res>
    extends _$VerifyPaymentResponseCopyWithImpl<$Res,
        _$VerifyPaymentResponseImpl>
    implements _$$VerifyPaymentResponseImplCopyWith<$Res> {
  __$$VerifyPaymentResponseImplCopyWithImpl(_$VerifyPaymentResponseImpl _value,
      $Res Function(_$VerifyPaymentResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? message = null,
    Object? data = freezed,
  }) {
    return _then(_$VerifyPaymentResponseImpl(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as PaymentModel?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VerifyPaymentResponseImpl implements _VerifyPaymentResponse {
  const _$VerifyPaymentResponseImpl(
      {required this.success, required this.message, this.data});

  factory _$VerifyPaymentResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$VerifyPaymentResponseImplFromJson(json);

  @override
  final bool success;
  @override
  final String message;
  @override
  final PaymentModel? data;

  @override
  String toString() {
    return 'VerifyPaymentResponse(success: $success, message: $message, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VerifyPaymentResponseImpl &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, success, message, data);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$VerifyPaymentResponseImplCopyWith<_$VerifyPaymentResponseImpl>
      get copyWith => __$$VerifyPaymentResponseImplCopyWithImpl<
          _$VerifyPaymentResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VerifyPaymentResponseImplToJson(
      this,
    );
  }
}

abstract class _VerifyPaymentResponse implements VerifyPaymentResponse {
  const factory _VerifyPaymentResponse(
      {required final bool success,
      required final String message,
      final PaymentModel? data}) = _$VerifyPaymentResponseImpl;

  factory _VerifyPaymentResponse.fromJson(Map<String, dynamic> json) =
      _$VerifyPaymentResponseImpl.fromJson;

  @override
  bool get success;
  @override
  String get message;
  @override
  PaymentModel? get data;
  @override
  @JsonKey(ignore: true)
  _$$VerifyPaymentResponseImplCopyWith<_$VerifyPaymentResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

ClubPaymentStatistics _$ClubPaymentStatisticsFromJson(
    Map<String, dynamic> json) {
  return _ClubPaymentStatistics.fromJson(json);
}

/// @nodoc
mixin _$ClubPaymentStatistics {
  bool get success => throw _privateConstructorUsedError;
  ClubPaymentStatsData get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ClubPaymentStatisticsCopyWith<ClubPaymentStatistics> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClubPaymentStatisticsCopyWith<$Res> {
  factory $ClubPaymentStatisticsCopyWith(ClubPaymentStatistics value,
          $Res Function(ClubPaymentStatistics) then) =
      _$ClubPaymentStatisticsCopyWithImpl<$Res, ClubPaymentStatistics>;
  @useResult
  $Res call({bool success, ClubPaymentStatsData data});

  $ClubPaymentStatsDataCopyWith<$Res> get data;
}

/// @nodoc
class _$ClubPaymentStatisticsCopyWithImpl<$Res,
        $Val extends ClubPaymentStatistics>
    implements $ClubPaymentStatisticsCopyWith<$Res> {
  _$ClubPaymentStatisticsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? data = null,
  }) {
    return _then(_value.copyWith(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as ClubPaymentStatsData,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ClubPaymentStatsDataCopyWith<$Res> get data {
    return $ClubPaymentStatsDataCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ClubPaymentStatisticsImplCopyWith<$Res>
    implements $ClubPaymentStatisticsCopyWith<$Res> {
  factory _$$ClubPaymentStatisticsImplCopyWith(
          _$ClubPaymentStatisticsImpl value,
          $Res Function(_$ClubPaymentStatisticsImpl) then) =
      __$$ClubPaymentStatisticsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool success, ClubPaymentStatsData data});

  @override
  $ClubPaymentStatsDataCopyWith<$Res> get data;
}

/// @nodoc
class __$$ClubPaymentStatisticsImplCopyWithImpl<$Res>
    extends _$ClubPaymentStatisticsCopyWithImpl<$Res,
        _$ClubPaymentStatisticsImpl>
    implements _$$ClubPaymentStatisticsImplCopyWith<$Res> {
  __$$ClubPaymentStatisticsImplCopyWithImpl(_$ClubPaymentStatisticsImpl _value,
      $Res Function(_$ClubPaymentStatisticsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? data = null,
  }) {
    return _then(_$ClubPaymentStatisticsImpl(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as ClubPaymentStatsData,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ClubPaymentStatisticsImpl implements _ClubPaymentStatistics {
  const _$ClubPaymentStatisticsImpl(
      {required this.success, required this.data});

  factory _$ClubPaymentStatisticsImpl.fromJson(Map<String, dynamic> json) =>
      _$$ClubPaymentStatisticsImplFromJson(json);

  @override
  final bool success;
  @override
  final ClubPaymentStatsData data;

  @override
  String toString() {
    return 'ClubPaymentStatistics(success: $success, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ClubPaymentStatisticsImpl &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, success, data);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ClubPaymentStatisticsImplCopyWith<_$ClubPaymentStatisticsImpl>
      get copyWith => __$$ClubPaymentStatisticsImplCopyWithImpl<
          _$ClubPaymentStatisticsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ClubPaymentStatisticsImplToJson(
      this,
    );
  }
}

abstract class _ClubPaymentStatistics implements ClubPaymentStatistics {
  const factory _ClubPaymentStatistics(
      {required final bool success,
      required final ClubPaymentStatsData data}) = _$ClubPaymentStatisticsImpl;

  factory _ClubPaymentStatistics.fromJson(Map<String, dynamic> json) =
      _$ClubPaymentStatisticsImpl.fromJson;

  @override
  bool get success;
  @override
  ClubPaymentStatsData get data;
  @override
  @JsonKey(ignore: true)
  _$$ClubPaymentStatisticsImplCopyWith<_$ClubPaymentStatisticsImpl>
      get copyWith => throw _privateConstructorUsedError;
}

ClubPaymentStatsData _$ClubPaymentStatsDataFromJson(Map<String, dynamic> json) {
  return _ClubPaymentStatsData.fromJson(json);
}

/// @nodoc
mixin _$ClubPaymentStatsData {
  @JsonKey(name: 'total_pending')
  int get totalPending => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_under_verification')
  int get totalUnderVerification => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_verified')
  int get totalVerified => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_overdue')
  int get totalOverdue => throw _privateConstructorUsedError;
  @JsonKey(name: 'pending_amount')
  double get pendingAmount => throw _privateConstructorUsedError;
  @JsonKey(name: 'verified_amount')
  double get verifiedAmount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ClubPaymentStatsDataCopyWith<ClubPaymentStatsData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClubPaymentStatsDataCopyWith<$Res> {
  factory $ClubPaymentStatsDataCopyWith(ClubPaymentStatsData value,
          $Res Function(ClubPaymentStatsData) then) =
      _$ClubPaymentStatsDataCopyWithImpl<$Res, ClubPaymentStatsData>;
  @useResult
  $Res call(
      {@JsonKey(name: 'total_pending') int totalPending,
      @JsonKey(name: 'total_under_verification') int totalUnderVerification,
      @JsonKey(name: 'total_verified') int totalVerified,
      @JsonKey(name: 'total_overdue') int totalOverdue,
      @JsonKey(name: 'pending_amount') double pendingAmount,
      @JsonKey(name: 'verified_amount') double verifiedAmount});
}

/// @nodoc
class _$ClubPaymentStatsDataCopyWithImpl<$Res,
        $Val extends ClubPaymentStatsData>
    implements $ClubPaymentStatsDataCopyWith<$Res> {
  _$ClubPaymentStatsDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalPending = null,
    Object? totalUnderVerification = null,
    Object? totalVerified = null,
    Object? totalOverdue = null,
    Object? pendingAmount = null,
    Object? verifiedAmount = null,
  }) {
    return _then(_value.copyWith(
      totalPending: null == totalPending
          ? _value.totalPending
          : totalPending // ignore: cast_nullable_to_non_nullable
              as int,
      totalUnderVerification: null == totalUnderVerification
          ? _value.totalUnderVerification
          : totalUnderVerification // ignore: cast_nullable_to_non_nullable
              as int,
      totalVerified: null == totalVerified
          ? _value.totalVerified
          : totalVerified // ignore: cast_nullable_to_non_nullable
              as int,
      totalOverdue: null == totalOverdue
          ? _value.totalOverdue
          : totalOverdue // ignore: cast_nullable_to_non_nullable
              as int,
      pendingAmount: null == pendingAmount
          ? _value.pendingAmount
          : pendingAmount // ignore: cast_nullable_to_non_nullable
              as double,
      verifiedAmount: null == verifiedAmount
          ? _value.verifiedAmount
          : verifiedAmount // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ClubPaymentStatsDataImplCopyWith<$Res>
    implements $ClubPaymentStatsDataCopyWith<$Res> {
  factory _$$ClubPaymentStatsDataImplCopyWith(_$ClubPaymentStatsDataImpl value,
          $Res Function(_$ClubPaymentStatsDataImpl) then) =
      __$$ClubPaymentStatsDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'total_pending') int totalPending,
      @JsonKey(name: 'total_under_verification') int totalUnderVerification,
      @JsonKey(name: 'total_verified') int totalVerified,
      @JsonKey(name: 'total_overdue') int totalOverdue,
      @JsonKey(name: 'pending_amount') double pendingAmount,
      @JsonKey(name: 'verified_amount') double verifiedAmount});
}

/// @nodoc
class __$$ClubPaymentStatsDataImplCopyWithImpl<$Res>
    extends _$ClubPaymentStatsDataCopyWithImpl<$Res, _$ClubPaymentStatsDataImpl>
    implements _$$ClubPaymentStatsDataImplCopyWith<$Res> {
  __$$ClubPaymentStatsDataImplCopyWithImpl(_$ClubPaymentStatsDataImpl _value,
      $Res Function(_$ClubPaymentStatsDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalPending = null,
    Object? totalUnderVerification = null,
    Object? totalVerified = null,
    Object? totalOverdue = null,
    Object? pendingAmount = null,
    Object? verifiedAmount = null,
  }) {
    return _then(_$ClubPaymentStatsDataImpl(
      totalPending: null == totalPending
          ? _value.totalPending
          : totalPending // ignore: cast_nullable_to_non_nullable
              as int,
      totalUnderVerification: null == totalUnderVerification
          ? _value.totalUnderVerification
          : totalUnderVerification // ignore: cast_nullable_to_non_nullable
              as int,
      totalVerified: null == totalVerified
          ? _value.totalVerified
          : totalVerified // ignore: cast_nullable_to_non_nullable
              as int,
      totalOverdue: null == totalOverdue
          ? _value.totalOverdue
          : totalOverdue // ignore: cast_nullable_to_non_nullable
              as int,
      pendingAmount: null == pendingAmount
          ? _value.pendingAmount
          : pendingAmount // ignore: cast_nullable_to_non_nullable
              as double,
      verifiedAmount: null == verifiedAmount
          ? _value.verifiedAmount
          : verifiedAmount // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ClubPaymentStatsDataImpl implements _ClubPaymentStatsData {
  const _$ClubPaymentStatsDataImpl(
      {@JsonKey(name: 'total_pending') required this.totalPending,
      @JsonKey(name: 'total_under_verification')
      required this.totalUnderVerification,
      @JsonKey(name: 'total_verified') required this.totalVerified,
      @JsonKey(name: 'total_overdue') required this.totalOverdue,
      @JsonKey(name: 'pending_amount') required this.pendingAmount,
      @JsonKey(name: 'verified_amount') required this.verifiedAmount});

  factory _$ClubPaymentStatsDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$ClubPaymentStatsDataImplFromJson(json);

  @override
  @JsonKey(name: 'total_pending')
  final int totalPending;
  @override
  @JsonKey(name: 'total_under_verification')
  final int totalUnderVerification;
  @override
  @JsonKey(name: 'total_verified')
  final int totalVerified;
  @override
  @JsonKey(name: 'total_overdue')
  final int totalOverdue;
  @override
  @JsonKey(name: 'pending_amount')
  final double pendingAmount;
  @override
  @JsonKey(name: 'verified_amount')
  final double verifiedAmount;

  @override
  String toString() {
    return 'ClubPaymentStatsData(totalPending: $totalPending, totalUnderVerification: $totalUnderVerification, totalVerified: $totalVerified, totalOverdue: $totalOverdue, pendingAmount: $pendingAmount, verifiedAmount: $verifiedAmount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ClubPaymentStatsDataImpl &&
            (identical(other.totalPending, totalPending) ||
                other.totalPending == totalPending) &&
            (identical(other.totalUnderVerification, totalUnderVerification) ||
                other.totalUnderVerification == totalUnderVerification) &&
            (identical(other.totalVerified, totalVerified) ||
                other.totalVerified == totalVerified) &&
            (identical(other.totalOverdue, totalOverdue) ||
                other.totalOverdue == totalOverdue) &&
            (identical(other.pendingAmount, pendingAmount) ||
                other.pendingAmount == pendingAmount) &&
            (identical(other.verifiedAmount, verifiedAmount) ||
                other.verifiedAmount == verifiedAmount));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      totalPending,
      totalUnderVerification,
      totalVerified,
      totalOverdue,
      pendingAmount,
      verifiedAmount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ClubPaymentStatsDataImplCopyWith<_$ClubPaymentStatsDataImpl>
      get copyWith =>
          __$$ClubPaymentStatsDataImplCopyWithImpl<_$ClubPaymentStatsDataImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ClubPaymentStatsDataImplToJson(
      this,
    );
  }
}

abstract class _ClubPaymentStatsData implements ClubPaymentStatsData {
  const factory _ClubPaymentStatsData(
      {@JsonKey(name: 'total_pending') required final int totalPending,
      @JsonKey(name: 'total_under_verification')
      required final int totalUnderVerification,
      @JsonKey(name: 'total_verified') required final int totalVerified,
      @JsonKey(name: 'total_overdue') required final int totalOverdue,
      @JsonKey(name: 'pending_amount') required final double pendingAmount,
      @JsonKey(name: 'verified_amount')
      required final double verifiedAmount}) = _$ClubPaymentStatsDataImpl;

  factory _ClubPaymentStatsData.fromJson(Map<String, dynamic> json) =
      _$ClubPaymentStatsDataImpl.fromJson;

  @override
  @JsonKey(name: 'total_pending')
  int get totalPending;
  @override
  @JsonKey(name: 'total_under_verification')
  int get totalUnderVerification;
  @override
  @JsonKey(name: 'total_verified')
  int get totalVerified;
  @override
  @JsonKey(name: 'total_overdue')
  int get totalOverdue;
  @override
  @JsonKey(name: 'pending_amount')
  double get pendingAmount;
  @override
  @JsonKey(name: 'verified_amount')
  double get verifiedAmount;
  @override
  @JsonKey(ignore: true)
  _$$ClubPaymentStatsDataImplCopyWith<_$ClubPaymentStatsDataImpl>
      get copyWith => throw _privateConstructorUsedError;
}
