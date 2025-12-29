// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tournament_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TournamentModel _$TournamentModelFromJson(Map<String, dynamic> json) {
  return _TournamentModel.fromJson(json);
}

/// @nodoc
mixin _$TournamentModel {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get slug => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  String get format => throw _privateConstructorUsedError;
  String get category => throw _privateConstructorUsedError;
  String get gender => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'start_date')
  String get startDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'end_date')
  String? get endDate => throw _privateConstructorUsedError;
  String? get venue => throw _privateConstructorUsedError;
  @JsonKey(name: 'max_teams')
  int get maxTeams => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_teams')
  int get totalTeams => throw _privateConstructorUsedError;
  @JsonKey(name: 'team_count')
  int get teamCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_registration_open')
  bool get isRegistrationOpen => throw _privateConstructorUsedError;
  @JsonKey(name: 'logo_url')
  String? get logoUrl => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TournamentModelCopyWith<TournamentModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TournamentModelCopyWith<$Res> {
  factory $TournamentModelCopyWith(
          TournamentModel value, $Res Function(TournamentModel) then) =
      _$TournamentModelCopyWithImpl<$Res, TournamentModel>;
  @useResult
  $Res call(
      {int id,
      String name,
      String slug,
      String? description,
      String type,
      String format,
      String category,
      String gender,
      String status,
      @JsonKey(name: 'start_date') String startDate,
      @JsonKey(name: 'end_date') String? endDate,
      String? venue,
      @JsonKey(name: 'max_teams') int maxTeams,
      @JsonKey(name: 'total_teams') int totalTeams,
      @JsonKey(name: 'team_count') int teamCount,
      @JsonKey(name: 'is_registration_open') bool isRegistrationOpen,
      @JsonKey(name: 'logo_url') String? logoUrl});
}

/// @nodoc
class _$TournamentModelCopyWithImpl<$Res, $Val extends TournamentModel>
    implements $TournamentModelCopyWith<$Res> {
  _$TournamentModelCopyWithImpl(this._value, this._then);

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
    Object? description = freezed,
    Object? type = null,
    Object? format = null,
    Object? category = null,
    Object? gender = null,
    Object? status = null,
    Object? startDate = null,
    Object? endDate = freezed,
    Object? venue = freezed,
    Object? maxTeams = null,
    Object? totalTeams = null,
    Object? teamCount = null,
    Object? isRegistrationOpen = null,
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
      slug: null == slug
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      format: null == format
          ? _value.format
          : format // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      gender: null == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
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
      venue: freezed == venue
          ? _value.venue
          : venue // ignore: cast_nullable_to_non_nullable
              as String?,
      maxTeams: null == maxTeams
          ? _value.maxTeams
          : maxTeams // ignore: cast_nullable_to_non_nullable
              as int,
      totalTeams: null == totalTeams
          ? _value.totalTeams
          : totalTeams // ignore: cast_nullable_to_non_nullable
              as int,
      teamCount: null == teamCount
          ? _value.teamCount
          : teamCount // ignore: cast_nullable_to_non_nullable
              as int,
      isRegistrationOpen: null == isRegistrationOpen
          ? _value.isRegistrationOpen
          : isRegistrationOpen // ignore: cast_nullable_to_non_nullable
              as bool,
      logoUrl: freezed == logoUrl
          ? _value.logoUrl
          : logoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TournamentModelImplCopyWith<$Res>
    implements $TournamentModelCopyWith<$Res> {
  factory _$$TournamentModelImplCopyWith(_$TournamentModelImpl value,
          $Res Function(_$TournamentModelImpl) then) =
      __$$TournamentModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      String slug,
      String? description,
      String type,
      String format,
      String category,
      String gender,
      String status,
      @JsonKey(name: 'start_date') String startDate,
      @JsonKey(name: 'end_date') String? endDate,
      String? venue,
      @JsonKey(name: 'max_teams') int maxTeams,
      @JsonKey(name: 'total_teams') int totalTeams,
      @JsonKey(name: 'team_count') int teamCount,
      @JsonKey(name: 'is_registration_open') bool isRegistrationOpen,
      @JsonKey(name: 'logo_url') String? logoUrl});
}

/// @nodoc
class __$$TournamentModelImplCopyWithImpl<$Res>
    extends _$TournamentModelCopyWithImpl<$Res, _$TournamentModelImpl>
    implements _$$TournamentModelImplCopyWith<$Res> {
  __$$TournamentModelImplCopyWithImpl(
      _$TournamentModelImpl _value, $Res Function(_$TournamentModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? slug = null,
    Object? description = freezed,
    Object? type = null,
    Object? format = null,
    Object? category = null,
    Object? gender = null,
    Object? status = null,
    Object? startDate = null,
    Object? endDate = freezed,
    Object? venue = freezed,
    Object? maxTeams = null,
    Object? totalTeams = null,
    Object? teamCount = null,
    Object? isRegistrationOpen = null,
    Object? logoUrl = freezed,
  }) {
    return _then(_$TournamentModelImpl(
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
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      format: null == format
          ? _value.format
          : format // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      gender: null == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
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
      venue: freezed == venue
          ? _value.venue
          : venue // ignore: cast_nullable_to_non_nullable
              as String?,
      maxTeams: null == maxTeams
          ? _value.maxTeams
          : maxTeams // ignore: cast_nullable_to_non_nullable
              as int,
      totalTeams: null == totalTeams
          ? _value.totalTeams
          : totalTeams // ignore: cast_nullable_to_non_nullable
              as int,
      teamCount: null == teamCount
          ? _value.teamCount
          : teamCount // ignore: cast_nullable_to_non_nullable
              as int,
      isRegistrationOpen: null == isRegistrationOpen
          ? _value.isRegistrationOpen
          : isRegistrationOpen // ignore: cast_nullable_to_non_nullable
              as bool,
      logoUrl: freezed == logoUrl
          ? _value.logoUrl
          : logoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TournamentModelImpl extends _TournamentModel {
  const _$TournamentModelImpl(
      {required this.id,
      required this.name,
      required this.slug,
      this.description,
      required this.type,
      required this.format,
      required this.category,
      required this.gender,
      required this.status,
      @JsonKey(name: 'start_date') required this.startDate,
      @JsonKey(name: 'end_date') this.endDate,
      this.venue,
      @JsonKey(name: 'max_teams') required this.maxTeams,
      @JsonKey(name: 'total_teams') required this.totalTeams,
      @JsonKey(name: 'team_count') required this.teamCount,
      @JsonKey(name: 'is_registration_open') required this.isRegistrationOpen,
      @JsonKey(name: 'logo_url') this.logoUrl})
      : super._();

  factory _$TournamentModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$TournamentModelImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String slug;
  @override
  final String? description;
  @override
  final String type;
  @override
  final String format;
  @override
  final String category;
  @override
  final String gender;
  @override
  final String status;
  @override
  @JsonKey(name: 'start_date')
  final String startDate;
  @override
  @JsonKey(name: 'end_date')
  final String? endDate;
  @override
  final String? venue;
  @override
  @JsonKey(name: 'max_teams')
  final int maxTeams;
  @override
  @JsonKey(name: 'total_teams')
  final int totalTeams;
  @override
  @JsonKey(name: 'team_count')
  final int teamCount;
  @override
  @JsonKey(name: 'is_registration_open')
  final bool isRegistrationOpen;
  @override
  @JsonKey(name: 'logo_url')
  final String? logoUrl;

  @override
  String toString() {
    return 'TournamentModel(id: $id, name: $name, slug: $slug, description: $description, type: $type, format: $format, category: $category, gender: $gender, status: $status, startDate: $startDate, endDate: $endDate, venue: $venue, maxTeams: $maxTeams, totalTeams: $totalTeams, teamCount: $teamCount, isRegistrationOpen: $isRegistrationOpen, logoUrl: $logoUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TournamentModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.slug, slug) || other.slug == slug) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.format, format) || other.format == format) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.venue, venue) || other.venue == venue) &&
            (identical(other.maxTeams, maxTeams) ||
                other.maxTeams == maxTeams) &&
            (identical(other.totalTeams, totalTeams) ||
                other.totalTeams == totalTeams) &&
            (identical(other.teamCount, teamCount) ||
                other.teamCount == teamCount) &&
            (identical(other.isRegistrationOpen, isRegistrationOpen) ||
                other.isRegistrationOpen == isRegistrationOpen) &&
            (identical(other.logoUrl, logoUrl) || other.logoUrl == logoUrl));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      slug,
      description,
      type,
      format,
      category,
      gender,
      status,
      startDate,
      endDate,
      venue,
      maxTeams,
      totalTeams,
      teamCount,
      isRegistrationOpen,
      logoUrl);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TournamentModelImplCopyWith<_$TournamentModelImpl> get copyWith =>
      __$$TournamentModelImplCopyWithImpl<_$TournamentModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TournamentModelImplToJson(
      this,
    );
  }
}

abstract class _TournamentModel extends TournamentModel {
  const factory _TournamentModel(
          {required final int id,
          required final String name,
          required final String slug,
          final String? description,
          required final String type,
          required final String format,
          required final String category,
          required final String gender,
          required final String status,
          @JsonKey(name: 'start_date') required final String startDate,
          @JsonKey(name: 'end_date') final String? endDate,
          final String? venue,
          @JsonKey(name: 'max_teams') required final int maxTeams,
          @JsonKey(name: 'total_teams') required final int totalTeams,
          @JsonKey(name: 'team_count') required final int teamCount,
          @JsonKey(name: 'is_registration_open')
          required final bool isRegistrationOpen,
          @JsonKey(name: 'logo_url') final String? logoUrl}) =
      _$TournamentModelImpl;
  const _TournamentModel._() : super._();

  factory _TournamentModel.fromJson(Map<String, dynamic> json) =
      _$TournamentModelImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String get slug;
  @override
  String? get description;
  @override
  String get type;
  @override
  String get format;
  @override
  String get category;
  @override
  String get gender;
  @override
  String get status;
  @override
  @JsonKey(name: 'start_date')
  String get startDate;
  @override
  @JsonKey(name: 'end_date')
  String? get endDate;
  @override
  String? get venue;
  @override
  @JsonKey(name: 'max_teams')
  int get maxTeams;
  @override
  @JsonKey(name: 'total_teams')
  int get totalTeams;
  @override
  @JsonKey(name: 'team_count')
  int get teamCount;
  @override
  @JsonKey(name: 'is_registration_open')
  bool get isRegistrationOpen;
  @override
  @JsonKey(name: 'logo_url')
  String? get logoUrl;
  @override
  @JsonKey(ignore: true)
  _$$TournamentModelImplCopyWith<_$TournamentModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
