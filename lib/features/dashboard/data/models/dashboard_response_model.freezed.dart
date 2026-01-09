// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dashboard_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DashboardResponseModel _$DashboardResponseModelFromJson(
    Map<String, dynamic> json) {
  return _DashboardResponseModel.fromJson(json);
}

/// @nodoc
mixin _$DashboardResponseModel {
  bool get success => throw _privateConstructorUsedError;
  String get role => throw _privateConstructorUsedError;
  Map<String, dynamic> get data => throw _privateConstructorUsedError;
  String get timestamp => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  @JsonKey(name: 'redirect_to')
  String? get redirectTo => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DashboardResponseModelCopyWith<DashboardResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DashboardResponseModelCopyWith<$Res> {
  factory $DashboardResponseModelCopyWith(DashboardResponseModel value,
          $Res Function(DashboardResponseModel) then) =
      _$DashboardResponseModelCopyWithImpl<$Res, DashboardResponseModel>;
  @useResult
  $Res call(
      {bool success,
      String role,
      Map<String, dynamic> data,
      String timestamp,
      String? message,
      @JsonKey(name: 'redirect_to') String? redirectTo});
}

/// @nodoc
class _$DashboardResponseModelCopyWithImpl<$Res,
        $Val extends DashboardResponseModel>
    implements $DashboardResponseModelCopyWith<$Res> {
  _$DashboardResponseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? role = null,
    Object? data = null,
    Object? timestamp = null,
    Object? message = freezed,
    Object? redirectTo = freezed,
  }) {
    return _then(_value.copyWith(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as String,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      redirectTo: freezed == redirectTo
          ? _value.redirectTo
          : redirectTo // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DashboardResponseModelImplCopyWith<$Res>
    implements $DashboardResponseModelCopyWith<$Res> {
  factory _$$DashboardResponseModelImplCopyWith(
          _$DashboardResponseModelImpl value,
          $Res Function(_$DashboardResponseModelImpl) then) =
      __$$DashboardResponseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool success,
      String role,
      Map<String, dynamic> data,
      String timestamp,
      String? message,
      @JsonKey(name: 'redirect_to') String? redirectTo});
}

/// @nodoc
class __$$DashboardResponseModelImplCopyWithImpl<$Res>
    extends _$DashboardResponseModelCopyWithImpl<$Res,
        _$DashboardResponseModelImpl>
    implements _$$DashboardResponseModelImplCopyWith<$Res> {
  __$$DashboardResponseModelImplCopyWithImpl(
      _$DashboardResponseModelImpl _value,
      $Res Function(_$DashboardResponseModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? role = null,
    Object? data = null,
    Object? timestamp = null,
    Object? message = freezed,
    Object? redirectTo = freezed,
  }) {
    return _then(_$DashboardResponseModelImpl(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as String,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      redirectTo: freezed == redirectTo
          ? _value.redirectTo
          : redirectTo // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DashboardResponseModelImpl implements _DashboardResponseModel {
  const _$DashboardResponseModelImpl(
      {required this.success,
      required this.role,
      required final Map<String, dynamic> data,
      required this.timestamp,
      this.message,
      @JsonKey(name: 'redirect_to') this.redirectTo})
      : _data = data;

  factory _$DashboardResponseModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$DashboardResponseModelImplFromJson(json);

  @override
  final bool success;
  @override
  final String role;
  final Map<String, dynamic> _data;
  @override
  Map<String, dynamic> get data {
    if (_data is EqualUnmodifiableMapView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_data);
  }

  @override
  final String timestamp;
  @override
  final String? message;
  @override
  @JsonKey(name: 'redirect_to')
  final String? redirectTo;

  @override
  String toString() {
    return 'DashboardResponseModel(success: $success, role: $role, data: $data, timestamp: $timestamp, message: $message, redirectTo: $redirectTo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DashboardResponseModelImpl &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.role, role) || other.role == role) &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.redirectTo, redirectTo) ||
                other.redirectTo == redirectTo));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      success,
      role,
      const DeepCollectionEquality().hash(_data),
      timestamp,
      message,
      redirectTo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DashboardResponseModelImplCopyWith<_$DashboardResponseModelImpl>
      get copyWith => __$$DashboardResponseModelImplCopyWithImpl<
          _$DashboardResponseModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DashboardResponseModelImplToJson(
      this,
    );
  }
}

abstract class _DashboardResponseModel implements DashboardResponseModel {
  const factory _DashboardResponseModel(
          {required final bool success,
          required final String role,
          required final Map<String, dynamic> data,
          required final String timestamp,
          final String? message,
          @JsonKey(name: 'redirect_to') final String? redirectTo}) =
      _$DashboardResponseModelImpl;

  factory _DashboardResponseModel.fromJson(Map<String, dynamic> json) =
      _$DashboardResponseModelImpl.fromJson;

  @override
  bool get success;
  @override
  String get role;
  @override
  Map<String, dynamic> get data;
  @override
  String get timestamp;
  @override
  String? get message;
  @override
  @JsonKey(name: 'redirect_to')
  String? get redirectTo;
  @override
  @JsonKey(ignore: true)
  _$$DashboardResponseModelImplCopyWith<_$DashboardResponseModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

SuperAdminDashboardModel _$SuperAdminDashboardModelFromJson(
    Map<String, dynamic> json) {
  return _SuperAdminDashboardModel.fromJson(json);
}

/// @nodoc
mixin _$SuperAdminDashboardModel {
  String get role => throw _privateConstructorUsedError;
  String get timestamp => throw _privateConstructorUsedError;
  UserMetricsModel get users => throw _privateConstructorUsedError;
  SubscriptionMetricsModel get subscriptions =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'system_metrics')
  SystemMetricsModel get systemMetrics => throw _privateConstructorUsedError;
  RevenueMetricsModel get revenue => throw _privateConstructorUsedError;
  @JsonKey(name: 'recent_activity')
  RecentActivityModel? get recentActivity => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SuperAdminDashboardModelCopyWith<SuperAdminDashboardModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SuperAdminDashboardModelCopyWith<$Res> {
  factory $SuperAdminDashboardModelCopyWith(SuperAdminDashboardModel value,
          $Res Function(SuperAdminDashboardModel) then) =
      _$SuperAdminDashboardModelCopyWithImpl<$Res, SuperAdminDashboardModel>;
  @useResult
  $Res call(
      {String role,
      String timestamp,
      UserMetricsModel users,
      SubscriptionMetricsModel subscriptions,
      @JsonKey(name: 'system_metrics') SystemMetricsModel systemMetrics,
      RevenueMetricsModel revenue,
      @JsonKey(name: 'recent_activity') RecentActivityModel? recentActivity});

  $UserMetricsModelCopyWith<$Res> get users;
  $SubscriptionMetricsModelCopyWith<$Res> get subscriptions;
  $SystemMetricsModelCopyWith<$Res> get systemMetrics;
  $RevenueMetricsModelCopyWith<$Res> get revenue;
  $RecentActivityModelCopyWith<$Res>? get recentActivity;
}

/// @nodoc
class _$SuperAdminDashboardModelCopyWithImpl<$Res,
        $Val extends SuperAdminDashboardModel>
    implements $SuperAdminDashboardModelCopyWith<$Res> {
  _$SuperAdminDashboardModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? role = null,
    Object? timestamp = null,
    Object? users = null,
    Object? subscriptions = null,
    Object? systemMetrics = null,
    Object? revenue = null,
    Object? recentActivity = freezed,
  }) {
    return _then(_value.copyWith(
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as String,
      users: null == users
          ? _value.users
          : users // ignore: cast_nullable_to_non_nullable
              as UserMetricsModel,
      subscriptions: null == subscriptions
          ? _value.subscriptions
          : subscriptions // ignore: cast_nullable_to_non_nullable
              as SubscriptionMetricsModel,
      systemMetrics: null == systemMetrics
          ? _value.systemMetrics
          : systemMetrics // ignore: cast_nullable_to_non_nullable
              as SystemMetricsModel,
      revenue: null == revenue
          ? _value.revenue
          : revenue // ignore: cast_nullable_to_non_nullable
              as RevenueMetricsModel,
      recentActivity: freezed == recentActivity
          ? _value.recentActivity
          : recentActivity // ignore: cast_nullable_to_non_nullable
              as RecentActivityModel?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserMetricsModelCopyWith<$Res> get users {
    return $UserMetricsModelCopyWith<$Res>(_value.users, (value) {
      return _then(_value.copyWith(users: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SubscriptionMetricsModelCopyWith<$Res> get subscriptions {
    return $SubscriptionMetricsModelCopyWith<$Res>(_value.subscriptions,
        (value) {
      return _then(_value.copyWith(subscriptions: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SystemMetricsModelCopyWith<$Res> get systemMetrics {
    return $SystemMetricsModelCopyWith<$Res>(_value.systemMetrics, (value) {
      return _then(_value.copyWith(systemMetrics: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $RevenueMetricsModelCopyWith<$Res> get revenue {
    return $RevenueMetricsModelCopyWith<$Res>(_value.revenue, (value) {
      return _then(_value.copyWith(revenue: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $RecentActivityModelCopyWith<$Res>? get recentActivity {
    if (_value.recentActivity == null) {
      return null;
    }

    return $RecentActivityModelCopyWith<$Res>(_value.recentActivity!, (value) {
      return _then(_value.copyWith(recentActivity: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SuperAdminDashboardModelImplCopyWith<$Res>
    implements $SuperAdminDashboardModelCopyWith<$Res> {
  factory _$$SuperAdminDashboardModelImplCopyWith(
          _$SuperAdminDashboardModelImpl value,
          $Res Function(_$SuperAdminDashboardModelImpl) then) =
      __$$SuperAdminDashboardModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String role,
      String timestamp,
      UserMetricsModel users,
      SubscriptionMetricsModel subscriptions,
      @JsonKey(name: 'system_metrics') SystemMetricsModel systemMetrics,
      RevenueMetricsModel revenue,
      @JsonKey(name: 'recent_activity') RecentActivityModel? recentActivity});

  @override
  $UserMetricsModelCopyWith<$Res> get users;
  @override
  $SubscriptionMetricsModelCopyWith<$Res> get subscriptions;
  @override
  $SystemMetricsModelCopyWith<$Res> get systemMetrics;
  @override
  $RevenueMetricsModelCopyWith<$Res> get revenue;
  @override
  $RecentActivityModelCopyWith<$Res>? get recentActivity;
}

/// @nodoc
class __$$SuperAdminDashboardModelImplCopyWithImpl<$Res>
    extends _$SuperAdminDashboardModelCopyWithImpl<$Res,
        _$SuperAdminDashboardModelImpl>
    implements _$$SuperAdminDashboardModelImplCopyWith<$Res> {
  __$$SuperAdminDashboardModelImplCopyWithImpl(
      _$SuperAdminDashboardModelImpl _value,
      $Res Function(_$SuperAdminDashboardModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? role = null,
    Object? timestamp = null,
    Object? users = null,
    Object? subscriptions = null,
    Object? systemMetrics = null,
    Object? revenue = null,
    Object? recentActivity = freezed,
  }) {
    return _then(_$SuperAdminDashboardModelImpl(
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as String,
      users: null == users
          ? _value.users
          : users // ignore: cast_nullable_to_non_nullable
              as UserMetricsModel,
      subscriptions: null == subscriptions
          ? _value.subscriptions
          : subscriptions // ignore: cast_nullable_to_non_nullable
              as SubscriptionMetricsModel,
      systemMetrics: null == systemMetrics
          ? _value.systemMetrics
          : systemMetrics // ignore: cast_nullable_to_non_nullable
              as SystemMetricsModel,
      revenue: null == revenue
          ? _value.revenue
          : revenue // ignore: cast_nullable_to_non_nullable
              as RevenueMetricsModel,
      recentActivity: freezed == recentActivity
          ? _value.recentActivity
          : recentActivity // ignore: cast_nullable_to_non_nullable
              as RecentActivityModel?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SuperAdminDashboardModelImpl implements _SuperAdminDashboardModel {
  const _$SuperAdminDashboardModelImpl(
      {required this.role,
      required this.timestamp,
      required this.users,
      required this.subscriptions,
      @JsonKey(name: 'system_metrics') required this.systemMetrics,
      required this.revenue,
      @JsonKey(name: 'recent_activity') this.recentActivity});

  factory _$SuperAdminDashboardModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SuperAdminDashboardModelImplFromJson(json);

  @override
  final String role;
  @override
  final String timestamp;
  @override
  final UserMetricsModel users;
  @override
  final SubscriptionMetricsModel subscriptions;
  @override
  @JsonKey(name: 'system_metrics')
  final SystemMetricsModel systemMetrics;
  @override
  final RevenueMetricsModel revenue;
  @override
  @JsonKey(name: 'recent_activity')
  final RecentActivityModel? recentActivity;

  @override
  String toString() {
    return 'SuperAdminDashboardModel(role: $role, timestamp: $timestamp, users: $users, subscriptions: $subscriptions, systemMetrics: $systemMetrics, revenue: $revenue, recentActivity: $recentActivity)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuperAdminDashboardModelImpl &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.users, users) || other.users == users) &&
            (identical(other.subscriptions, subscriptions) ||
                other.subscriptions == subscriptions) &&
            (identical(other.systemMetrics, systemMetrics) ||
                other.systemMetrics == systemMetrics) &&
            (identical(other.revenue, revenue) || other.revenue == revenue) &&
            (identical(other.recentActivity, recentActivity) ||
                other.recentActivity == recentActivity));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, role, timestamp, users,
      subscriptions, systemMetrics, revenue, recentActivity);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SuperAdminDashboardModelImplCopyWith<_$SuperAdminDashboardModelImpl>
      get copyWith => __$$SuperAdminDashboardModelImplCopyWithImpl<
          _$SuperAdminDashboardModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SuperAdminDashboardModelImplToJson(
      this,
    );
  }
}

abstract class _SuperAdminDashboardModel implements SuperAdminDashboardModel {
  const factory _SuperAdminDashboardModel(
          {required final String role,
          required final String timestamp,
          required final UserMetricsModel users,
          required final SubscriptionMetricsModel subscriptions,
          @JsonKey(name: 'system_metrics')
          required final SystemMetricsModel systemMetrics,
          required final RevenueMetricsModel revenue,
          @JsonKey(name: 'recent_activity')
          final RecentActivityModel? recentActivity}) =
      _$SuperAdminDashboardModelImpl;

  factory _SuperAdminDashboardModel.fromJson(Map<String, dynamic> json) =
      _$SuperAdminDashboardModelImpl.fromJson;

  @override
  String get role;
  @override
  String get timestamp;
  @override
  UserMetricsModel get users;
  @override
  SubscriptionMetricsModel get subscriptions;
  @override
  @JsonKey(name: 'system_metrics')
  SystemMetricsModel get systemMetrics;
  @override
  RevenueMetricsModel get revenue;
  @override
  @JsonKey(name: 'recent_activity')
  RecentActivityModel? get recentActivity;
  @override
  @JsonKey(ignore: true)
  _$$SuperAdminDashboardModelImplCopyWith<_$SuperAdminDashboardModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

UserMetricsModel _$UserMetricsModelFromJson(Map<String, dynamic> json) {
  return _UserMetricsModel.fromJson(json);
}

/// @nodoc
mixin _$UserMetricsModel {
  int get total => throw _privateConstructorUsedError;
  int get active => throw _privateConstructorUsedError;
  int get inactive => throw _privateConstructorUsedError;
  @JsonKey(name: 'new_last_30_days')
  int get newLast30Days => throw _privateConstructorUsedError;
  @JsonKey(name: 'by_role')
  Map<String, int> get byRole => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserMetricsModelCopyWith<UserMetricsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserMetricsModelCopyWith<$Res> {
  factory $UserMetricsModelCopyWith(
          UserMetricsModel value, $Res Function(UserMetricsModel) then) =
      _$UserMetricsModelCopyWithImpl<$Res, UserMetricsModel>;
  @useResult
  $Res call(
      {int total,
      int active,
      int inactive,
      @JsonKey(name: 'new_last_30_days') int newLast30Days,
      @JsonKey(name: 'by_role') Map<String, int> byRole});
}

/// @nodoc
class _$UserMetricsModelCopyWithImpl<$Res, $Val extends UserMetricsModel>
    implements $UserMetricsModelCopyWith<$Res> {
  _$UserMetricsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? total = null,
    Object? active = null,
    Object? inactive = null,
    Object? newLast30Days = null,
    Object? byRole = null,
  }) {
    return _then(_value.copyWith(
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      active: null == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as int,
      inactive: null == inactive
          ? _value.inactive
          : inactive // ignore: cast_nullable_to_non_nullable
              as int,
      newLast30Days: null == newLast30Days
          ? _value.newLast30Days
          : newLast30Days // ignore: cast_nullable_to_non_nullable
              as int,
      byRole: null == byRole
          ? _value.byRole
          : byRole // ignore: cast_nullable_to_non_nullable
              as Map<String, int>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserMetricsModelImplCopyWith<$Res>
    implements $UserMetricsModelCopyWith<$Res> {
  factory _$$UserMetricsModelImplCopyWith(_$UserMetricsModelImpl value,
          $Res Function(_$UserMetricsModelImpl) then) =
      __$$UserMetricsModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int total,
      int active,
      int inactive,
      @JsonKey(name: 'new_last_30_days') int newLast30Days,
      @JsonKey(name: 'by_role') Map<String, int> byRole});
}

/// @nodoc
class __$$UserMetricsModelImplCopyWithImpl<$Res>
    extends _$UserMetricsModelCopyWithImpl<$Res, _$UserMetricsModelImpl>
    implements _$$UserMetricsModelImplCopyWith<$Res> {
  __$$UserMetricsModelImplCopyWithImpl(_$UserMetricsModelImpl _value,
      $Res Function(_$UserMetricsModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? total = null,
    Object? active = null,
    Object? inactive = null,
    Object? newLast30Days = null,
    Object? byRole = null,
  }) {
    return _then(_$UserMetricsModelImpl(
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      active: null == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as int,
      inactive: null == inactive
          ? _value.inactive
          : inactive // ignore: cast_nullable_to_non_nullable
              as int,
      newLast30Days: null == newLast30Days
          ? _value.newLast30Days
          : newLast30Days // ignore: cast_nullable_to_non_nullable
              as int,
      byRole: null == byRole
          ? _value._byRole
          : byRole // ignore: cast_nullable_to_non_nullable
              as Map<String, int>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserMetricsModelImpl implements _UserMetricsModel {
  const _$UserMetricsModelImpl(
      {required this.total,
      required this.active,
      required this.inactive,
      @JsonKey(name: 'new_last_30_days') required this.newLast30Days,
      @JsonKey(name: 'by_role') required final Map<String, int> byRole})
      : _byRole = byRole;

  factory _$UserMetricsModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserMetricsModelImplFromJson(json);

  @override
  final int total;
  @override
  final int active;
  @override
  final int inactive;
  @override
  @JsonKey(name: 'new_last_30_days')
  final int newLast30Days;
  final Map<String, int> _byRole;
  @override
  @JsonKey(name: 'by_role')
  Map<String, int> get byRole {
    if (_byRole is EqualUnmodifiableMapView) return _byRole;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_byRole);
  }

  @override
  String toString() {
    return 'UserMetricsModel(total: $total, active: $active, inactive: $inactive, newLast30Days: $newLast30Days, byRole: $byRole)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserMetricsModelImpl &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.active, active) || other.active == active) &&
            (identical(other.inactive, inactive) ||
                other.inactive == inactive) &&
            (identical(other.newLast30Days, newLast30Days) ||
                other.newLast30Days == newLast30Days) &&
            const DeepCollectionEquality().equals(other._byRole, _byRole));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, total, active, inactive,
      newLast30Days, const DeepCollectionEquality().hash(_byRole));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserMetricsModelImplCopyWith<_$UserMetricsModelImpl> get copyWith =>
      __$$UserMetricsModelImplCopyWithImpl<_$UserMetricsModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserMetricsModelImplToJson(
      this,
    );
  }
}

abstract class _UserMetricsModel implements UserMetricsModel {
  const factory _UserMetricsModel(
          {required final int total,
          required final int active,
          required final int inactive,
          @JsonKey(name: 'new_last_30_days') required final int newLast30Days,
          @JsonKey(name: 'by_role') required final Map<String, int> byRole}) =
      _$UserMetricsModelImpl;

  factory _UserMetricsModel.fromJson(Map<String, dynamic> json) =
      _$UserMetricsModelImpl.fromJson;

  @override
  int get total;
  @override
  int get active;
  @override
  int get inactive;
  @override
  @JsonKey(name: 'new_last_30_days')
  int get newLast30Days;
  @override
  @JsonKey(name: 'by_role')
  Map<String, int> get byRole;
  @override
  @JsonKey(ignore: true)
  _$$UserMetricsModelImplCopyWith<_$UserMetricsModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SubscriptionMetricsModel _$SubscriptionMetricsModelFromJson(
    Map<String, dynamic> json) {
  return _SubscriptionMetricsModel.fromJson(json);
}

/// @nodoc
mixin _$SubscriptionMetricsModel {
  int get active => throw _privateConstructorUsedError;
  int get expired => throw _privateConstructorUsedError;
  @JsonKey(name: 'expiring_soon_7_days')
  int get expiringSoon7Days => throw _privateConstructorUsedError;
  @JsonKey(name: 'past_due')
  int get pastDue => throw _privateConstructorUsedError;
  int get suspended => throw _privateConstructorUsedError;
  int get total => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SubscriptionMetricsModelCopyWith<SubscriptionMetricsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubscriptionMetricsModelCopyWith<$Res> {
  factory $SubscriptionMetricsModelCopyWith(SubscriptionMetricsModel value,
          $Res Function(SubscriptionMetricsModel) then) =
      _$SubscriptionMetricsModelCopyWithImpl<$Res, SubscriptionMetricsModel>;
  @useResult
  $Res call(
      {int active,
      int expired,
      @JsonKey(name: 'expiring_soon_7_days') int expiringSoon7Days,
      @JsonKey(name: 'past_due') int pastDue,
      int suspended,
      int total});
}

/// @nodoc
class _$SubscriptionMetricsModelCopyWithImpl<$Res,
        $Val extends SubscriptionMetricsModel>
    implements $SubscriptionMetricsModelCopyWith<$Res> {
  _$SubscriptionMetricsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? active = null,
    Object? expired = null,
    Object? expiringSoon7Days = null,
    Object? pastDue = null,
    Object? suspended = null,
    Object? total = null,
  }) {
    return _then(_value.copyWith(
      active: null == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as int,
      expired: null == expired
          ? _value.expired
          : expired // ignore: cast_nullable_to_non_nullable
              as int,
      expiringSoon7Days: null == expiringSoon7Days
          ? _value.expiringSoon7Days
          : expiringSoon7Days // ignore: cast_nullable_to_non_nullable
              as int,
      pastDue: null == pastDue
          ? _value.pastDue
          : pastDue // ignore: cast_nullable_to_non_nullable
              as int,
      suspended: null == suspended
          ? _value.suspended
          : suspended // ignore: cast_nullable_to_non_nullable
              as int,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SubscriptionMetricsModelImplCopyWith<$Res>
    implements $SubscriptionMetricsModelCopyWith<$Res> {
  factory _$$SubscriptionMetricsModelImplCopyWith(
          _$SubscriptionMetricsModelImpl value,
          $Res Function(_$SubscriptionMetricsModelImpl) then) =
      __$$SubscriptionMetricsModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int active,
      int expired,
      @JsonKey(name: 'expiring_soon_7_days') int expiringSoon7Days,
      @JsonKey(name: 'past_due') int pastDue,
      int suspended,
      int total});
}

/// @nodoc
class __$$SubscriptionMetricsModelImplCopyWithImpl<$Res>
    extends _$SubscriptionMetricsModelCopyWithImpl<$Res,
        _$SubscriptionMetricsModelImpl>
    implements _$$SubscriptionMetricsModelImplCopyWith<$Res> {
  __$$SubscriptionMetricsModelImplCopyWithImpl(
      _$SubscriptionMetricsModelImpl _value,
      $Res Function(_$SubscriptionMetricsModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? active = null,
    Object? expired = null,
    Object? expiringSoon7Days = null,
    Object? pastDue = null,
    Object? suspended = null,
    Object? total = null,
  }) {
    return _then(_$SubscriptionMetricsModelImpl(
      active: null == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as int,
      expired: null == expired
          ? _value.expired
          : expired // ignore: cast_nullable_to_non_nullable
              as int,
      expiringSoon7Days: null == expiringSoon7Days
          ? _value.expiringSoon7Days
          : expiringSoon7Days // ignore: cast_nullable_to_non_nullable
              as int,
      pastDue: null == pastDue
          ? _value.pastDue
          : pastDue // ignore: cast_nullable_to_non_nullable
              as int,
      suspended: null == suspended
          ? _value.suspended
          : suspended // ignore: cast_nullable_to_non_nullable
              as int,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SubscriptionMetricsModelImpl implements _SubscriptionMetricsModel {
  const _$SubscriptionMetricsModelImpl(
      {required this.active,
      required this.expired,
      @JsonKey(name: 'expiring_soon_7_days') required this.expiringSoon7Days,
      @JsonKey(name: 'past_due') required this.pastDue,
      required this.suspended,
      required this.total});

  factory _$SubscriptionMetricsModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SubscriptionMetricsModelImplFromJson(json);

  @override
  final int active;
  @override
  final int expired;
  @override
  @JsonKey(name: 'expiring_soon_7_days')
  final int expiringSoon7Days;
  @override
  @JsonKey(name: 'past_due')
  final int pastDue;
  @override
  final int suspended;
  @override
  final int total;

  @override
  String toString() {
    return 'SubscriptionMetricsModel(active: $active, expired: $expired, expiringSoon7Days: $expiringSoon7Days, pastDue: $pastDue, suspended: $suspended, total: $total)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SubscriptionMetricsModelImpl &&
            (identical(other.active, active) || other.active == active) &&
            (identical(other.expired, expired) || other.expired == expired) &&
            (identical(other.expiringSoon7Days, expiringSoon7Days) ||
                other.expiringSoon7Days == expiringSoon7Days) &&
            (identical(other.pastDue, pastDue) || other.pastDue == pastDue) &&
            (identical(other.suspended, suspended) ||
                other.suspended == suspended) &&
            (identical(other.total, total) || other.total == total));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, active, expired,
      expiringSoon7Days, pastDue, suspended, total);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SubscriptionMetricsModelImplCopyWith<_$SubscriptionMetricsModelImpl>
      get copyWith => __$$SubscriptionMetricsModelImplCopyWithImpl<
          _$SubscriptionMetricsModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SubscriptionMetricsModelImplToJson(
      this,
    );
  }
}

abstract class _SubscriptionMetricsModel implements SubscriptionMetricsModel {
  const factory _SubscriptionMetricsModel(
      {required final int active,
      required final int expired,
      @JsonKey(name: 'expiring_soon_7_days')
      required final int expiringSoon7Days,
      @JsonKey(name: 'past_due') required final int pastDue,
      required final int suspended,
      required final int total}) = _$SubscriptionMetricsModelImpl;

  factory _SubscriptionMetricsModel.fromJson(Map<String, dynamic> json) =
      _$SubscriptionMetricsModelImpl.fromJson;

  @override
  int get active;
  @override
  int get expired;
  @override
  @JsonKey(name: 'expiring_soon_7_days')
  int get expiringSoon7Days;
  @override
  @JsonKey(name: 'past_due')
  int get pastDue;
  @override
  int get suspended;
  @override
  int get total;
  @override
  @JsonKey(ignore: true)
  _$$SubscriptionMetricsModelImplCopyWith<_$SubscriptionMetricsModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

SystemMetricsModel _$SystemMetricsModelFromJson(Map<String, dynamic> json) {
  return _SystemMetricsModel.fromJson(json);
}

/// @nodoc
mixin _$SystemMetricsModel {
  VerificationMetricsModel get verifications =>
      throw _privateConstructorUsedError;
  MatchMetricsModel get matches => throw _privateConstructorUsedError;
  ClubMetricsModel get clubs => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SystemMetricsModelCopyWith<SystemMetricsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SystemMetricsModelCopyWith<$Res> {
  factory $SystemMetricsModelCopyWith(
          SystemMetricsModel value, $Res Function(SystemMetricsModel) then) =
      _$SystemMetricsModelCopyWithImpl<$Res, SystemMetricsModel>;
  @useResult
  $Res call(
      {VerificationMetricsModel verifications,
      MatchMetricsModel matches,
      ClubMetricsModel clubs});

  $VerificationMetricsModelCopyWith<$Res> get verifications;
  $MatchMetricsModelCopyWith<$Res> get matches;
  $ClubMetricsModelCopyWith<$Res> get clubs;
}

/// @nodoc
class _$SystemMetricsModelCopyWithImpl<$Res, $Val extends SystemMetricsModel>
    implements $SystemMetricsModelCopyWith<$Res> {
  _$SystemMetricsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? verifications = null,
    Object? matches = null,
    Object? clubs = null,
  }) {
    return _then(_value.copyWith(
      verifications: null == verifications
          ? _value.verifications
          : verifications // ignore: cast_nullable_to_non_nullable
              as VerificationMetricsModel,
      matches: null == matches
          ? _value.matches
          : matches // ignore: cast_nullable_to_non_nullable
              as MatchMetricsModel,
      clubs: null == clubs
          ? _value.clubs
          : clubs // ignore: cast_nullable_to_non_nullable
              as ClubMetricsModel,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $VerificationMetricsModelCopyWith<$Res> get verifications {
    return $VerificationMetricsModelCopyWith<$Res>(_value.verifications,
        (value) {
      return _then(_value.copyWith(verifications: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $MatchMetricsModelCopyWith<$Res> get matches {
    return $MatchMetricsModelCopyWith<$Res>(_value.matches, (value) {
      return _then(_value.copyWith(matches: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ClubMetricsModelCopyWith<$Res> get clubs {
    return $ClubMetricsModelCopyWith<$Res>(_value.clubs, (value) {
      return _then(_value.copyWith(clubs: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SystemMetricsModelImplCopyWith<$Res>
    implements $SystemMetricsModelCopyWith<$Res> {
  factory _$$SystemMetricsModelImplCopyWith(_$SystemMetricsModelImpl value,
          $Res Function(_$SystemMetricsModelImpl) then) =
      __$$SystemMetricsModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {VerificationMetricsModel verifications,
      MatchMetricsModel matches,
      ClubMetricsModel clubs});

  @override
  $VerificationMetricsModelCopyWith<$Res> get verifications;
  @override
  $MatchMetricsModelCopyWith<$Res> get matches;
  @override
  $ClubMetricsModelCopyWith<$Res> get clubs;
}

/// @nodoc
class __$$SystemMetricsModelImplCopyWithImpl<$Res>
    extends _$SystemMetricsModelCopyWithImpl<$Res, _$SystemMetricsModelImpl>
    implements _$$SystemMetricsModelImplCopyWith<$Res> {
  __$$SystemMetricsModelImplCopyWithImpl(_$SystemMetricsModelImpl _value,
      $Res Function(_$SystemMetricsModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? verifications = null,
    Object? matches = null,
    Object? clubs = null,
  }) {
    return _then(_$SystemMetricsModelImpl(
      verifications: null == verifications
          ? _value.verifications
          : verifications // ignore: cast_nullable_to_non_nullable
              as VerificationMetricsModel,
      matches: null == matches
          ? _value.matches
          : matches // ignore: cast_nullable_to_non_nullable
              as MatchMetricsModel,
      clubs: null == clubs
          ? _value.clubs
          : clubs // ignore: cast_nullable_to_non_nullable
              as ClubMetricsModel,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SystemMetricsModelImpl implements _SystemMetricsModel {
  const _$SystemMetricsModelImpl(
      {required this.verifications,
      required this.matches,
      required this.clubs});

  factory _$SystemMetricsModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SystemMetricsModelImplFromJson(json);

  @override
  final VerificationMetricsModel verifications;
  @override
  final MatchMetricsModel matches;
  @override
  final ClubMetricsModel clubs;

  @override
  String toString() {
    return 'SystemMetricsModel(verifications: $verifications, matches: $matches, clubs: $clubs)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SystemMetricsModelImpl &&
            (identical(other.verifications, verifications) ||
                other.verifications == verifications) &&
            (identical(other.matches, matches) || other.matches == matches) &&
            (identical(other.clubs, clubs) || other.clubs == clubs));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, verifications, matches, clubs);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SystemMetricsModelImplCopyWith<_$SystemMetricsModelImpl> get copyWith =>
      __$$SystemMetricsModelImplCopyWithImpl<_$SystemMetricsModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SystemMetricsModelImplToJson(
      this,
    );
  }
}

abstract class _SystemMetricsModel implements SystemMetricsModel {
  const factory _SystemMetricsModel(
      {required final VerificationMetricsModel verifications,
      required final MatchMetricsModel matches,
      required final ClubMetricsModel clubs}) = _$SystemMetricsModelImpl;

  factory _SystemMetricsModel.fromJson(Map<String, dynamic> json) =
      _$SystemMetricsModelImpl.fromJson;

  @override
  VerificationMetricsModel get verifications;
  @override
  MatchMetricsModel get matches;
  @override
  ClubMetricsModel get clubs;
  @override
  @JsonKey(ignore: true)
  _$$SystemMetricsModelImplCopyWith<_$SystemMetricsModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

VerificationMetricsModel _$VerificationMetricsModelFromJson(
    Map<String, dynamic> json) {
  return _VerificationMetricsModel.fromJson(json);
}

/// @nodoc
mixin _$VerificationMetricsModel {
  int get total => throw _privateConstructorUsedError;
  int get today => throw _privateConstructorUsedError;
  @JsonKey(name: 'this_month')
  int get thisMonth => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VerificationMetricsModelCopyWith<VerificationMetricsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VerificationMetricsModelCopyWith<$Res> {
  factory $VerificationMetricsModelCopyWith(VerificationMetricsModel value,
          $Res Function(VerificationMetricsModel) then) =
      _$VerificationMetricsModelCopyWithImpl<$Res, VerificationMetricsModel>;
  @useResult
  $Res call({int total, int today, @JsonKey(name: 'this_month') int thisMonth});
}

/// @nodoc
class _$VerificationMetricsModelCopyWithImpl<$Res,
        $Val extends VerificationMetricsModel>
    implements $VerificationMetricsModelCopyWith<$Res> {
  _$VerificationMetricsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? total = null,
    Object? today = null,
    Object? thisMonth = null,
  }) {
    return _then(_value.copyWith(
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      today: null == today
          ? _value.today
          : today // ignore: cast_nullable_to_non_nullable
              as int,
      thisMonth: null == thisMonth
          ? _value.thisMonth
          : thisMonth // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VerificationMetricsModelImplCopyWith<$Res>
    implements $VerificationMetricsModelCopyWith<$Res> {
  factory _$$VerificationMetricsModelImplCopyWith(
          _$VerificationMetricsModelImpl value,
          $Res Function(_$VerificationMetricsModelImpl) then) =
      __$$VerificationMetricsModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int total, int today, @JsonKey(name: 'this_month') int thisMonth});
}

/// @nodoc
class __$$VerificationMetricsModelImplCopyWithImpl<$Res>
    extends _$VerificationMetricsModelCopyWithImpl<$Res,
        _$VerificationMetricsModelImpl>
    implements _$$VerificationMetricsModelImplCopyWith<$Res> {
  __$$VerificationMetricsModelImplCopyWithImpl(
      _$VerificationMetricsModelImpl _value,
      $Res Function(_$VerificationMetricsModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? total = null,
    Object? today = null,
    Object? thisMonth = null,
  }) {
    return _then(_$VerificationMetricsModelImpl(
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      today: null == today
          ? _value.today
          : today // ignore: cast_nullable_to_non_nullable
              as int,
      thisMonth: null == thisMonth
          ? _value.thisMonth
          : thisMonth // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VerificationMetricsModelImpl implements _VerificationMetricsModel {
  const _$VerificationMetricsModelImpl(
      {required this.total,
      required this.today,
      @JsonKey(name: 'this_month') required this.thisMonth});

  factory _$VerificationMetricsModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$VerificationMetricsModelImplFromJson(json);

  @override
  final int total;
  @override
  final int today;
  @override
  @JsonKey(name: 'this_month')
  final int thisMonth;

  @override
  String toString() {
    return 'VerificationMetricsModel(total: $total, today: $today, thisMonth: $thisMonth)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VerificationMetricsModelImpl &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.today, today) || other.today == today) &&
            (identical(other.thisMonth, thisMonth) ||
                other.thisMonth == thisMonth));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, total, today, thisMonth);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$VerificationMetricsModelImplCopyWith<_$VerificationMetricsModelImpl>
      get copyWith => __$$VerificationMetricsModelImplCopyWithImpl<
          _$VerificationMetricsModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VerificationMetricsModelImplToJson(
      this,
    );
  }
}

abstract class _VerificationMetricsModel implements VerificationMetricsModel {
  const factory _VerificationMetricsModel(
          {required final int total,
          required final int today,
          @JsonKey(name: 'this_month') required final int thisMonth}) =
      _$VerificationMetricsModelImpl;

  factory _VerificationMetricsModel.fromJson(Map<String, dynamic> json) =
      _$VerificationMetricsModelImpl.fromJson;

  @override
  int get total;
  @override
  int get today;
  @override
  @JsonKey(name: 'this_month')
  int get thisMonth;
  @override
  @JsonKey(ignore: true)
  _$$VerificationMetricsModelImplCopyWith<_$VerificationMetricsModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

MatchMetricsModel _$MatchMetricsModelFromJson(Map<String, dynamic> json) {
  return _MatchMetricsModel.fromJson(json);
}

/// @nodoc
mixin _$MatchMetricsModel {
  int get total => throw _privateConstructorUsedError;
  int get completed => throw _privateConstructorUsedError;
  @JsonKey(name: 'in_progress')
  int get inProgress => throw _privateConstructorUsedError;
  int get scheduled => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MatchMetricsModelCopyWith<MatchMetricsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MatchMetricsModelCopyWith<$Res> {
  factory $MatchMetricsModelCopyWith(
          MatchMetricsModel value, $Res Function(MatchMetricsModel) then) =
      _$MatchMetricsModelCopyWithImpl<$Res, MatchMetricsModel>;
  @useResult
  $Res call(
      {int total,
      int completed,
      @JsonKey(name: 'in_progress') int inProgress,
      int scheduled});
}

/// @nodoc
class _$MatchMetricsModelCopyWithImpl<$Res, $Val extends MatchMetricsModel>
    implements $MatchMetricsModelCopyWith<$Res> {
  _$MatchMetricsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? total = null,
    Object? completed = null,
    Object? inProgress = null,
    Object? scheduled = null,
  }) {
    return _then(_value.copyWith(
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      completed: null == completed
          ? _value.completed
          : completed // ignore: cast_nullable_to_non_nullable
              as int,
      inProgress: null == inProgress
          ? _value.inProgress
          : inProgress // ignore: cast_nullable_to_non_nullable
              as int,
      scheduled: null == scheduled
          ? _value.scheduled
          : scheduled // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MatchMetricsModelImplCopyWith<$Res>
    implements $MatchMetricsModelCopyWith<$Res> {
  factory _$$MatchMetricsModelImplCopyWith(_$MatchMetricsModelImpl value,
          $Res Function(_$MatchMetricsModelImpl) then) =
      __$$MatchMetricsModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int total,
      int completed,
      @JsonKey(name: 'in_progress') int inProgress,
      int scheduled});
}

/// @nodoc
class __$$MatchMetricsModelImplCopyWithImpl<$Res>
    extends _$MatchMetricsModelCopyWithImpl<$Res, _$MatchMetricsModelImpl>
    implements _$$MatchMetricsModelImplCopyWith<$Res> {
  __$$MatchMetricsModelImplCopyWithImpl(_$MatchMetricsModelImpl _value,
      $Res Function(_$MatchMetricsModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? total = null,
    Object? completed = null,
    Object? inProgress = null,
    Object? scheduled = null,
  }) {
    return _then(_$MatchMetricsModelImpl(
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      completed: null == completed
          ? _value.completed
          : completed // ignore: cast_nullable_to_non_nullable
              as int,
      inProgress: null == inProgress
          ? _value.inProgress
          : inProgress // ignore: cast_nullable_to_non_nullable
              as int,
      scheduled: null == scheduled
          ? _value.scheduled
          : scheduled // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MatchMetricsModelImpl implements _MatchMetricsModel {
  const _$MatchMetricsModelImpl(
      {required this.total,
      required this.completed,
      @JsonKey(name: 'in_progress') required this.inProgress,
      required this.scheduled});

  factory _$MatchMetricsModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$MatchMetricsModelImplFromJson(json);

  @override
  final int total;
  @override
  final int completed;
  @override
  @JsonKey(name: 'in_progress')
  final int inProgress;
  @override
  final int scheduled;

  @override
  String toString() {
    return 'MatchMetricsModel(total: $total, completed: $completed, inProgress: $inProgress, scheduled: $scheduled)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MatchMetricsModelImpl &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.completed, completed) ||
                other.completed == completed) &&
            (identical(other.inProgress, inProgress) ||
                other.inProgress == inProgress) &&
            (identical(other.scheduled, scheduled) ||
                other.scheduled == scheduled));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, total, completed, inProgress, scheduled);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MatchMetricsModelImplCopyWith<_$MatchMetricsModelImpl> get copyWith =>
      __$$MatchMetricsModelImplCopyWithImpl<_$MatchMetricsModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MatchMetricsModelImplToJson(
      this,
    );
  }
}

abstract class _MatchMetricsModel implements MatchMetricsModel {
  const factory _MatchMetricsModel(
      {required final int total,
      required final int completed,
      @JsonKey(name: 'in_progress') required final int inProgress,
      required final int scheduled}) = _$MatchMetricsModelImpl;

  factory _MatchMetricsModel.fromJson(Map<String, dynamic> json) =
      _$MatchMetricsModelImpl.fromJson;

  @override
  int get total;
  @override
  int get completed;
  @override
  @JsonKey(name: 'in_progress')
  int get inProgress;
  @override
  int get scheduled;
  @override
  @JsonKey(ignore: true)
  _$$MatchMetricsModelImplCopyWith<_$MatchMetricsModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ClubMetricsModel _$ClubMetricsModelFromJson(Map<String, dynamic> json) {
  return _ClubMetricsModel.fromJson(json);
}

/// @nodoc
mixin _$ClubMetricsModel {
  int get total => throw _privateConstructorUsedError;
  int get active => throw _privateConstructorUsedError;
  int get inactive => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ClubMetricsModelCopyWith<ClubMetricsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClubMetricsModelCopyWith<$Res> {
  factory $ClubMetricsModelCopyWith(
          ClubMetricsModel value, $Res Function(ClubMetricsModel) then) =
      _$ClubMetricsModelCopyWithImpl<$Res, ClubMetricsModel>;
  @useResult
  $Res call({int total, int active, int inactive});
}

/// @nodoc
class _$ClubMetricsModelCopyWithImpl<$Res, $Val extends ClubMetricsModel>
    implements $ClubMetricsModelCopyWith<$Res> {
  _$ClubMetricsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? total = null,
    Object? active = null,
    Object? inactive = null,
  }) {
    return _then(_value.copyWith(
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      active: null == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as int,
      inactive: null == inactive
          ? _value.inactive
          : inactive // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ClubMetricsModelImplCopyWith<$Res>
    implements $ClubMetricsModelCopyWith<$Res> {
  factory _$$ClubMetricsModelImplCopyWith(_$ClubMetricsModelImpl value,
          $Res Function(_$ClubMetricsModelImpl) then) =
      __$$ClubMetricsModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int total, int active, int inactive});
}

/// @nodoc
class __$$ClubMetricsModelImplCopyWithImpl<$Res>
    extends _$ClubMetricsModelCopyWithImpl<$Res, _$ClubMetricsModelImpl>
    implements _$$ClubMetricsModelImplCopyWith<$Res> {
  __$$ClubMetricsModelImplCopyWithImpl(_$ClubMetricsModelImpl _value,
      $Res Function(_$ClubMetricsModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? total = null,
    Object? active = null,
    Object? inactive = null,
  }) {
    return _then(_$ClubMetricsModelImpl(
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      active: null == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as int,
      inactive: null == inactive
          ? _value.inactive
          : inactive // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ClubMetricsModelImpl implements _ClubMetricsModel {
  const _$ClubMetricsModelImpl(
      {required this.total, required this.active, required this.inactive});

  factory _$ClubMetricsModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ClubMetricsModelImplFromJson(json);

  @override
  final int total;
  @override
  final int active;
  @override
  final int inactive;

  @override
  String toString() {
    return 'ClubMetricsModel(total: $total, active: $active, inactive: $inactive)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ClubMetricsModelImpl &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.active, active) || other.active == active) &&
            (identical(other.inactive, inactive) ||
                other.inactive == inactive));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, total, active, inactive);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ClubMetricsModelImplCopyWith<_$ClubMetricsModelImpl> get copyWith =>
      __$$ClubMetricsModelImplCopyWithImpl<_$ClubMetricsModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ClubMetricsModelImplToJson(
      this,
    );
  }
}

abstract class _ClubMetricsModel implements ClubMetricsModel {
  const factory _ClubMetricsModel(
      {required final int total,
      required final int active,
      required final int inactive}) = _$ClubMetricsModelImpl;

  factory _ClubMetricsModel.fromJson(Map<String, dynamic> json) =
      _$ClubMetricsModelImpl.fromJson;

  @override
  int get total;
  @override
  int get active;
  @override
  int get inactive;
  @override
  @JsonKey(ignore: true)
  _$$ClubMetricsModelImplCopyWith<_$ClubMetricsModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

RevenueMetricsModel _$RevenueMetricsModelFromJson(Map<String, dynamic> json) {
  return _RevenueMetricsModel.fromJson(json);
}

/// @nodoc
mixin _$RevenueMetricsModel {
  @JsonKey(name: 'monthly_recurring')
  double get monthlyRecurring => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_collected')
  double get totalCollected => throw _privateConstructorUsedError;
  @JsonKey(name: 'pending_collection')
  double get pendingCollection => throw _privateConstructorUsedError;
  @JsonKey(name: 'overdue_amount')
  double get overdueAmount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RevenueMetricsModelCopyWith<RevenueMetricsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RevenueMetricsModelCopyWith<$Res> {
  factory $RevenueMetricsModelCopyWith(
          RevenueMetricsModel value, $Res Function(RevenueMetricsModel) then) =
      _$RevenueMetricsModelCopyWithImpl<$Res, RevenueMetricsModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'monthly_recurring') double monthlyRecurring,
      @JsonKey(name: 'total_collected') double totalCollected,
      @JsonKey(name: 'pending_collection') double pendingCollection,
      @JsonKey(name: 'overdue_amount') double overdueAmount});
}

/// @nodoc
class _$RevenueMetricsModelCopyWithImpl<$Res, $Val extends RevenueMetricsModel>
    implements $RevenueMetricsModelCopyWith<$Res> {
  _$RevenueMetricsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? monthlyRecurring = null,
    Object? totalCollected = null,
    Object? pendingCollection = null,
    Object? overdueAmount = null,
  }) {
    return _then(_value.copyWith(
      monthlyRecurring: null == monthlyRecurring
          ? _value.monthlyRecurring
          : monthlyRecurring // ignore: cast_nullable_to_non_nullable
              as double,
      totalCollected: null == totalCollected
          ? _value.totalCollected
          : totalCollected // ignore: cast_nullable_to_non_nullable
              as double,
      pendingCollection: null == pendingCollection
          ? _value.pendingCollection
          : pendingCollection // ignore: cast_nullable_to_non_nullable
              as double,
      overdueAmount: null == overdueAmount
          ? _value.overdueAmount
          : overdueAmount // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RevenueMetricsModelImplCopyWith<$Res>
    implements $RevenueMetricsModelCopyWith<$Res> {
  factory _$$RevenueMetricsModelImplCopyWith(_$RevenueMetricsModelImpl value,
          $Res Function(_$RevenueMetricsModelImpl) then) =
      __$$RevenueMetricsModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'monthly_recurring') double monthlyRecurring,
      @JsonKey(name: 'total_collected') double totalCollected,
      @JsonKey(name: 'pending_collection') double pendingCollection,
      @JsonKey(name: 'overdue_amount') double overdueAmount});
}

/// @nodoc
class __$$RevenueMetricsModelImplCopyWithImpl<$Res>
    extends _$RevenueMetricsModelCopyWithImpl<$Res, _$RevenueMetricsModelImpl>
    implements _$$RevenueMetricsModelImplCopyWith<$Res> {
  __$$RevenueMetricsModelImplCopyWithImpl(_$RevenueMetricsModelImpl _value,
      $Res Function(_$RevenueMetricsModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? monthlyRecurring = null,
    Object? totalCollected = null,
    Object? pendingCollection = null,
    Object? overdueAmount = null,
  }) {
    return _then(_$RevenueMetricsModelImpl(
      monthlyRecurring: null == monthlyRecurring
          ? _value.monthlyRecurring
          : monthlyRecurring // ignore: cast_nullable_to_non_nullable
              as double,
      totalCollected: null == totalCollected
          ? _value.totalCollected
          : totalCollected // ignore: cast_nullable_to_non_nullable
              as double,
      pendingCollection: null == pendingCollection
          ? _value.pendingCollection
          : pendingCollection // ignore: cast_nullable_to_non_nullable
              as double,
      overdueAmount: null == overdueAmount
          ? _value.overdueAmount
          : overdueAmount // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RevenueMetricsModelImpl implements _RevenueMetricsModel {
  const _$RevenueMetricsModelImpl(
      {@JsonKey(name: 'monthly_recurring') required this.monthlyRecurring,
      @JsonKey(name: 'total_collected') required this.totalCollected,
      @JsonKey(name: 'pending_collection') required this.pendingCollection,
      @JsonKey(name: 'overdue_amount') required this.overdueAmount});

  factory _$RevenueMetricsModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$RevenueMetricsModelImplFromJson(json);

  @override
  @JsonKey(name: 'monthly_recurring')
  final double monthlyRecurring;
  @override
  @JsonKey(name: 'total_collected')
  final double totalCollected;
  @override
  @JsonKey(name: 'pending_collection')
  final double pendingCollection;
  @override
  @JsonKey(name: 'overdue_amount')
  final double overdueAmount;

  @override
  String toString() {
    return 'RevenueMetricsModel(monthlyRecurring: $monthlyRecurring, totalCollected: $totalCollected, pendingCollection: $pendingCollection, overdueAmount: $overdueAmount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RevenueMetricsModelImpl &&
            (identical(other.monthlyRecurring, monthlyRecurring) ||
                other.monthlyRecurring == monthlyRecurring) &&
            (identical(other.totalCollected, totalCollected) ||
                other.totalCollected == totalCollected) &&
            (identical(other.pendingCollection, pendingCollection) ||
                other.pendingCollection == pendingCollection) &&
            (identical(other.overdueAmount, overdueAmount) ||
                other.overdueAmount == overdueAmount));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, monthlyRecurring, totalCollected,
      pendingCollection, overdueAmount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RevenueMetricsModelImplCopyWith<_$RevenueMetricsModelImpl> get copyWith =>
      __$$RevenueMetricsModelImplCopyWithImpl<_$RevenueMetricsModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RevenueMetricsModelImplToJson(
      this,
    );
  }
}

abstract class _RevenueMetricsModel implements RevenueMetricsModel {
  const factory _RevenueMetricsModel(
      {@JsonKey(name: 'monthly_recurring')
      required final double monthlyRecurring,
      @JsonKey(name: 'total_collected') required final double totalCollected,
      @JsonKey(name: 'pending_collection')
      required final double pendingCollection,
      @JsonKey(name: 'overdue_amount')
      required final double overdueAmount}) = _$RevenueMetricsModelImpl;

  factory _RevenueMetricsModel.fromJson(Map<String, dynamic> json) =
      _$RevenueMetricsModelImpl.fromJson;

  @override
  @JsonKey(name: 'monthly_recurring')
  double get monthlyRecurring;
  @override
  @JsonKey(name: 'total_collected')
  double get totalCollected;
  @override
  @JsonKey(name: 'pending_collection')
  double get pendingCollection;
  @override
  @JsonKey(name: 'overdue_amount')
  double get overdueAmount;
  @override
  @JsonKey(ignore: true)
  _$$RevenueMetricsModelImplCopyWith<_$RevenueMetricsModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

RecentActivityModel _$RecentActivityModelFromJson(Map<String, dynamic> json) {
  return _RecentActivityModel.fromJson(json);
}

/// @nodoc
mixin _$RecentActivityModel {
  @JsonKey(name: 'recent_users')
  List<RecentUserModel> get recentUsers => throw _privateConstructorUsedError;
  @JsonKey(name: 'recent_subscriptions')
  List<RecentSubscriptionModel> get recentSubscriptions =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RecentActivityModelCopyWith<RecentActivityModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecentActivityModelCopyWith<$Res> {
  factory $RecentActivityModelCopyWith(
          RecentActivityModel value, $Res Function(RecentActivityModel) then) =
      _$RecentActivityModelCopyWithImpl<$Res, RecentActivityModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'recent_users') List<RecentUserModel> recentUsers,
      @JsonKey(name: 'recent_subscriptions')
      List<RecentSubscriptionModel> recentSubscriptions});
}

/// @nodoc
class _$RecentActivityModelCopyWithImpl<$Res, $Val extends RecentActivityModel>
    implements $RecentActivityModelCopyWith<$Res> {
  _$RecentActivityModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? recentUsers = null,
    Object? recentSubscriptions = null,
  }) {
    return _then(_value.copyWith(
      recentUsers: null == recentUsers
          ? _value.recentUsers
          : recentUsers // ignore: cast_nullable_to_non_nullable
              as List<RecentUserModel>,
      recentSubscriptions: null == recentSubscriptions
          ? _value.recentSubscriptions
          : recentSubscriptions // ignore: cast_nullable_to_non_nullable
              as List<RecentSubscriptionModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RecentActivityModelImplCopyWith<$Res>
    implements $RecentActivityModelCopyWith<$Res> {
  factory _$$RecentActivityModelImplCopyWith(_$RecentActivityModelImpl value,
          $Res Function(_$RecentActivityModelImpl) then) =
      __$$RecentActivityModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'recent_users') List<RecentUserModel> recentUsers,
      @JsonKey(name: 'recent_subscriptions')
      List<RecentSubscriptionModel> recentSubscriptions});
}

/// @nodoc
class __$$RecentActivityModelImplCopyWithImpl<$Res>
    extends _$RecentActivityModelCopyWithImpl<$Res, _$RecentActivityModelImpl>
    implements _$$RecentActivityModelImplCopyWith<$Res> {
  __$$RecentActivityModelImplCopyWithImpl(_$RecentActivityModelImpl _value,
      $Res Function(_$RecentActivityModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? recentUsers = null,
    Object? recentSubscriptions = null,
  }) {
    return _then(_$RecentActivityModelImpl(
      recentUsers: null == recentUsers
          ? _value._recentUsers
          : recentUsers // ignore: cast_nullable_to_non_nullable
              as List<RecentUserModel>,
      recentSubscriptions: null == recentSubscriptions
          ? _value._recentSubscriptions
          : recentSubscriptions // ignore: cast_nullable_to_non_nullable
              as List<RecentSubscriptionModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RecentActivityModelImpl implements _RecentActivityModel {
  const _$RecentActivityModelImpl(
      {@JsonKey(name: 'recent_users')
      required final List<RecentUserModel> recentUsers,
      @JsonKey(name: 'recent_subscriptions')
      required final List<RecentSubscriptionModel> recentSubscriptions})
      : _recentUsers = recentUsers,
        _recentSubscriptions = recentSubscriptions;

  factory _$RecentActivityModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$RecentActivityModelImplFromJson(json);

  final List<RecentUserModel> _recentUsers;
  @override
  @JsonKey(name: 'recent_users')
  List<RecentUserModel> get recentUsers {
    if (_recentUsers is EqualUnmodifiableListView) return _recentUsers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_recentUsers);
  }

  final List<RecentSubscriptionModel> _recentSubscriptions;
  @override
  @JsonKey(name: 'recent_subscriptions')
  List<RecentSubscriptionModel> get recentSubscriptions {
    if (_recentSubscriptions is EqualUnmodifiableListView)
      return _recentSubscriptions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_recentSubscriptions);
  }

  @override
  String toString() {
    return 'RecentActivityModel(recentUsers: $recentUsers, recentSubscriptions: $recentSubscriptions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecentActivityModelImpl &&
            const DeepCollectionEquality()
                .equals(other._recentUsers, _recentUsers) &&
            const DeepCollectionEquality()
                .equals(other._recentSubscriptions, _recentSubscriptions));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_recentUsers),
      const DeepCollectionEquality().hash(_recentSubscriptions));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RecentActivityModelImplCopyWith<_$RecentActivityModelImpl> get copyWith =>
      __$$RecentActivityModelImplCopyWithImpl<_$RecentActivityModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RecentActivityModelImplToJson(
      this,
    );
  }
}

abstract class _RecentActivityModel implements RecentActivityModel {
  const factory _RecentActivityModel(
          {@JsonKey(name: 'recent_users')
          required final List<RecentUserModel> recentUsers,
          @JsonKey(name: 'recent_subscriptions')
          required final List<RecentSubscriptionModel> recentSubscriptions}) =
      _$RecentActivityModelImpl;

  factory _RecentActivityModel.fromJson(Map<String, dynamic> json) =
      _$RecentActivityModelImpl.fromJson;

  @override
  @JsonKey(name: 'recent_users')
  List<RecentUserModel> get recentUsers;
  @override
  @JsonKey(name: 'recent_subscriptions')
  List<RecentSubscriptionModel> get recentSubscriptions;
  @override
  @JsonKey(ignore: true)
  _$$RecentActivityModelImplCopyWith<_$RecentActivityModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

RecentUserModel _$RecentUserModelFromJson(Map<String, dynamic> json) {
  return _RecentUserModel.fromJson(json);
}

/// @nodoc
mixin _$RecentUserModel {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get role => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  String get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RecentUserModelCopyWith<RecentUserModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecentUserModelCopyWith<$Res> {
  factory $RecentUserModelCopyWith(
          RecentUserModel value, $Res Function(RecentUserModel) then) =
      _$RecentUserModelCopyWithImpl<$Res, RecentUserModel>;
  @useResult
  $Res call(
      {int id,
      String name,
      String email,
      String role,
      @JsonKey(name: 'created_at') String createdAt});
}

/// @nodoc
class _$RecentUserModelCopyWithImpl<$Res, $Val extends RecentUserModel>
    implements $RecentUserModelCopyWith<$Res> {
  _$RecentUserModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? email = null,
    Object? role = null,
    Object? createdAt = null,
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
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RecentUserModelImplCopyWith<$Res>
    implements $RecentUserModelCopyWith<$Res> {
  factory _$$RecentUserModelImplCopyWith(_$RecentUserModelImpl value,
          $Res Function(_$RecentUserModelImpl) then) =
      __$$RecentUserModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      String email,
      String role,
      @JsonKey(name: 'created_at') String createdAt});
}

/// @nodoc
class __$$RecentUserModelImplCopyWithImpl<$Res>
    extends _$RecentUserModelCopyWithImpl<$Res, _$RecentUserModelImpl>
    implements _$$RecentUserModelImplCopyWith<$Res> {
  __$$RecentUserModelImplCopyWithImpl(
      _$RecentUserModelImpl _value, $Res Function(_$RecentUserModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? email = null,
    Object? role = null,
    Object? createdAt = null,
  }) {
    return _then(_$RecentUserModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RecentUserModelImpl implements _RecentUserModel {
  const _$RecentUserModelImpl(
      {required this.id,
      required this.name,
      required this.email,
      required this.role,
      @JsonKey(name: 'created_at') required this.createdAt});

  factory _$RecentUserModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$RecentUserModelImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String email;
  @override
  final String role;
  @override
  @JsonKey(name: 'created_at')
  final String createdAt;

  @override
  String toString() {
    return 'RecentUserModel(id: $id, name: $name, email: $email, role: $role, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecentUserModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, email, role, createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RecentUserModelImplCopyWith<_$RecentUserModelImpl> get copyWith =>
      __$$RecentUserModelImplCopyWithImpl<_$RecentUserModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RecentUserModelImplToJson(
      this,
    );
  }
}

abstract class _RecentUserModel implements RecentUserModel {
  const factory _RecentUserModel(
          {required final int id,
          required final String name,
          required final String email,
          required final String role,
          @JsonKey(name: 'created_at') required final String createdAt}) =
      _$RecentUserModelImpl;

  factory _RecentUserModel.fromJson(Map<String, dynamic> json) =
      _$RecentUserModelImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String get email;
  @override
  String get role;
  @override
  @JsonKey(name: 'created_at')
  String get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$RecentUserModelImplCopyWith<_$RecentUserModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

RecentSubscriptionModel _$RecentSubscriptionModelFromJson(
    Map<String, dynamic> json) {
  return _RecentSubscriptionModel.fromJson(json);
}

/// @nodoc
mixin _$RecentSubscriptionModel {
  int get id => throw _privateConstructorUsedError;
  String get club => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'current_period_end')
  String get currentPeriodEnd => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  String get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RecentSubscriptionModelCopyWith<RecentSubscriptionModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecentSubscriptionModelCopyWith<$Res> {
  factory $RecentSubscriptionModelCopyWith(RecentSubscriptionModel value,
          $Res Function(RecentSubscriptionModel) then) =
      _$RecentSubscriptionModelCopyWithImpl<$Res, RecentSubscriptionModel>;
  @useResult
  $Res call(
      {int id,
      String club,
      String status,
      @JsonKey(name: 'current_period_end') String currentPeriodEnd,
      @JsonKey(name: 'created_at') String createdAt});
}

/// @nodoc
class _$RecentSubscriptionModelCopyWithImpl<$Res,
        $Val extends RecentSubscriptionModel>
    implements $RecentSubscriptionModelCopyWith<$Res> {
  _$RecentSubscriptionModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? club = null,
    Object? status = null,
    Object? currentPeriodEnd = null,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      club: null == club
          ? _value.club
          : club // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      currentPeriodEnd: null == currentPeriodEnd
          ? _value.currentPeriodEnd
          : currentPeriodEnd // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RecentSubscriptionModelImplCopyWith<$Res>
    implements $RecentSubscriptionModelCopyWith<$Res> {
  factory _$$RecentSubscriptionModelImplCopyWith(
          _$RecentSubscriptionModelImpl value,
          $Res Function(_$RecentSubscriptionModelImpl) then) =
      __$$RecentSubscriptionModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String club,
      String status,
      @JsonKey(name: 'current_period_end') String currentPeriodEnd,
      @JsonKey(name: 'created_at') String createdAt});
}

/// @nodoc
class __$$RecentSubscriptionModelImplCopyWithImpl<$Res>
    extends _$RecentSubscriptionModelCopyWithImpl<$Res,
        _$RecentSubscriptionModelImpl>
    implements _$$RecentSubscriptionModelImplCopyWith<$Res> {
  __$$RecentSubscriptionModelImplCopyWithImpl(
      _$RecentSubscriptionModelImpl _value,
      $Res Function(_$RecentSubscriptionModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? club = null,
    Object? status = null,
    Object? currentPeriodEnd = null,
    Object? createdAt = null,
  }) {
    return _then(_$RecentSubscriptionModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      club: null == club
          ? _value.club
          : club // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      currentPeriodEnd: null == currentPeriodEnd
          ? _value.currentPeriodEnd
          : currentPeriodEnd // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RecentSubscriptionModelImpl implements _RecentSubscriptionModel {
  const _$RecentSubscriptionModelImpl(
      {required this.id,
      required this.club,
      required this.status,
      @JsonKey(name: 'current_period_end') required this.currentPeriodEnd,
      @JsonKey(name: 'created_at') required this.createdAt});

  factory _$RecentSubscriptionModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$RecentSubscriptionModelImplFromJson(json);

  @override
  final int id;
  @override
  final String club;
  @override
  final String status;
  @override
  @JsonKey(name: 'current_period_end')
  final String currentPeriodEnd;
  @override
  @JsonKey(name: 'created_at')
  final String createdAt;

  @override
  String toString() {
    return 'RecentSubscriptionModel(id: $id, club: $club, status: $status, currentPeriodEnd: $currentPeriodEnd, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecentSubscriptionModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.club, club) || other.club == club) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.currentPeriodEnd, currentPeriodEnd) ||
                other.currentPeriodEnd == currentPeriodEnd) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, club, status, currentPeriodEnd, createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RecentSubscriptionModelImplCopyWith<_$RecentSubscriptionModelImpl>
      get copyWith => __$$RecentSubscriptionModelImplCopyWithImpl<
          _$RecentSubscriptionModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RecentSubscriptionModelImplToJson(
      this,
    );
  }
}

abstract class _RecentSubscriptionModel implements RecentSubscriptionModel {
  const factory _RecentSubscriptionModel(
          {required final int id,
          required final String club,
          required final String status,
          @JsonKey(name: 'current_period_end')
          required final String currentPeriodEnd,
          @JsonKey(name: 'created_at') required final String createdAt}) =
      _$RecentSubscriptionModelImpl;

  factory _RecentSubscriptionModel.fromJson(Map<String, dynamic> json) =
      _$RecentSubscriptionModelImpl.fromJson;

  @override
  int get id;
  @override
  String get club;
  @override
  String get status;
  @override
  @JsonKey(name: 'current_period_end')
  String get currentPeriodEnd;
  @override
  @JsonKey(name: 'created_at')
  String get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$RecentSubscriptionModelImplCopyWith<_$RecentSubscriptionModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

ClubDashboardModel _$ClubDashboardModelFromJson(Map<String, dynamic> json) {
  return _ClubDashboardModel.fromJson(json);
}

/// @nodoc
mixin _$ClubDashboardModel {
  String get role => throw _privateConstructorUsedError;
  String get timestamp => throw _privateConstructorUsedError;
  @JsonKey(name: 'club_info')
  ClubInfoModel get clubInfo => throw _privateConstructorUsedError;
  ClubPlayersModel get players => throw _privateConstructorUsedError;
  ClubMatchesModel get matches => throw _privateConstructorUsedError;
  ClubPaymentsModel get payments => throw _privateConstructorUsedError;
  FederationInfoModel get federation => throw _privateConstructorUsedError;
  ClubSubscriptionModel? get subscription => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ClubDashboardModelCopyWith<ClubDashboardModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClubDashboardModelCopyWith<$Res> {
  factory $ClubDashboardModelCopyWith(
          ClubDashboardModel value, $Res Function(ClubDashboardModel) then) =
      _$ClubDashboardModelCopyWithImpl<$Res, ClubDashboardModel>;
  @useResult
  $Res call(
      {String role,
      String timestamp,
      @JsonKey(name: 'club_info') ClubInfoModel clubInfo,
      ClubPlayersModel players,
      ClubMatchesModel matches,
      ClubPaymentsModel payments,
      FederationInfoModel federation,
      ClubSubscriptionModel? subscription});

  $ClubInfoModelCopyWith<$Res> get clubInfo;
  $ClubPlayersModelCopyWith<$Res> get players;
  $ClubMatchesModelCopyWith<$Res> get matches;
  $ClubPaymentsModelCopyWith<$Res> get payments;
  $FederationInfoModelCopyWith<$Res> get federation;
  $ClubSubscriptionModelCopyWith<$Res>? get subscription;
}

/// @nodoc
class _$ClubDashboardModelCopyWithImpl<$Res, $Val extends ClubDashboardModel>
    implements $ClubDashboardModelCopyWith<$Res> {
  _$ClubDashboardModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? role = null,
    Object? timestamp = null,
    Object? clubInfo = null,
    Object? players = null,
    Object? matches = null,
    Object? payments = null,
    Object? federation = null,
    Object? subscription = freezed,
  }) {
    return _then(_value.copyWith(
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as String,
      clubInfo: null == clubInfo
          ? _value.clubInfo
          : clubInfo // ignore: cast_nullable_to_non_nullable
              as ClubInfoModel,
      players: null == players
          ? _value.players
          : players // ignore: cast_nullable_to_non_nullable
              as ClubPlayersModel,
      matches: null == matches
          ? _value.matches
          : matches // ignore: cast_nullable_to_non_nullable
              as ClubMatchesModel,
      payments: null == payments
          ? _value.payments
          : payments // ignore: cast_nullable_to_non_nullable
              as ClubPaymentsModel,
      federation: null == federation
          ? _value.federation
          : federation // ignore: cast_nullable_to_non_nullable
              as FederationInfoModel,
      subscription: freezed == subscription
          ? _value.subscription
          : subscription // ignore: cast_nullable_to_non_nullable
              as ClubSubscriptionModel?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ClubInfoModelCopyWith<$Res> get clubInfo {
    return $ClubInfoModelCopyWith<$Res>(_value.clubInfo, (value) {
      return _then(_value.copyWith(clubInfo: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ClubPlayersModelCopyWith<$Res> get players {
    return $ClubPlayersModelCopyWith<$Res>(_value.players, (value) {
      return _then(_value.copyWith(players: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ClubMatchesModelCopyWith<$Res> get matches {
    return $ClubMatchesModelCopyWith<$Res>(_value.matches, (value) {
      return _then(_value.copyWith(matches: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ClubPaymentsModelCopyWith<$Res> get payments {
    return $ClubPaymentsModelCopyWith<$Res>(_value.payments, (value) {
      return _then(_value.copyWith(payments: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $FederationInfoModelCopyWith<$Res> get federation {
    return $FederationInfoModelCopyWith<$Res>(_value.federation, (value) {
      return _then(_value.copyWith(federation: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ClubSubscriptionModelCopyWith<$Res>? get subscription {
    if (_value.subscription == null) {
      return null;
    }

    return $ClubSubscriptionModelCopyWith<$Res>(_value.subscription!, (value) {
      return _then(_value.copyWith(subscription: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ClubDashboardModelImplCopyWith<$Res>
    implements $ClubDashboardModelCopyWith<$Res> {
  factory _$$ClubDashboardModelImplCopyWith(_$ClubDashboardModelImpl value,
          $Res Function(_$ClubDashboardModelImpl) then) =
      __$$ClubDashboardModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String role,
      String timestamp,
      @JsonKey(name: 'club_info') ClubInfoModel clubInfo,
      ClubPlayersModel players,
      ClubMatchesModel matches,
      ClubPaymentsModel payments,
      FederationInfoModel federation,
      ClubSubscriptionModel? subscription});

  @override
  $ClubInfoModelCopyWith<$Res> get clubInfo;
  @override
  $ClubPlayersModelCopyWith<$Res> get players;
  @override
  $ClubMatchesModelCopyWith<$Res> get matches;
  @override
  $ClubPaymentsModelCopyWith<$Res> get payments;
  @override
  $FederationInfoModelCopyWith<$Res> get federation;
  @override
  $ClubSubscriptionModelCopyWith<$Res>? get subscription;
}

/// @nodoc
class __$$ClubDashboardModelImplCopyWithImpl<$Res>
    extends _$ClubDashboardModelCopyWithImpl<$Res, _$ClubDashboardModelImpl>
    implements _$$ClubDashboardModelImplCopyWith<$Res> {
  __$$ClubDashboardModelImplCopyWithImpl(_$ClubDashboardModelImpl _value,
      $Res Function(_$ClubDashboardModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? role = null,
    Object? timestamp = null,
    Object? clubInfo = null,
    Object? players = null,
    Object? matches = null,
    Object? payments = null,
    Object? federation = null,
    Object? subscription = freezed,
  }) {
    return _then(_$ClubDashboardModelImpl(
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as String,
      clubInfo: null == clubInfo
          ? _value.clubInfo
          : clubInfo // ignore: cast_nullable_to_non_nullable
              as ClubInfoModel,
      players: null == players
          ? _value.players
          : players // ignore: cast_nullable_to_non_nullable
              as ClubPlayersModel,
      matches: null == matches
          ? _value.matches
          : matches // ignore: cast_nullable_to_non_nullable
              as ClubMatchesModel,
      payments: null == payments
          ? _value.payments
          : payments // ignore: cast_nullable_to_non_nullable
              as ClubPaymentsModel,
      federation: null == federation
          ? _value.federation
          : federation // ignore: cast_nullable_to_non_nullable
              as FederationInfoModel,
      subscription: freezed == subscription
          ? _value.subscription
          : subscription // ignore: cast_nullable_to_non_nullable
              as ClubSubscriptionModel?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ClubDashboardModelImpl implements _ClubDashboardModel {
  const _$ClubDashboardModelImpl(
      {required this.role,
      required this.timestamp,
      @JsonKey(name: 'club_info') required this.clubInfo,
      required this.players,
      required this.matches,
      required this.payments,
      required this.federation,
      this.subscription});

  factory _$ClubDashboardModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ClubDashboardModelImplFromJson(json);

  @override
  final String role;
  @override
  final String timestamp;
  @override
  @JsonKey(name: 'club_info')
  final ClubInfoModel clubInfo;
  @override
  final ClubPlayersModel players;
  @override
  final ClubMatchesModel matches;
  @override
  final ClubPaymentsModel payments;
  @override
  final FederationInfoModel federation;
  @override
  final ClubSubscriptionModel? subscription;

  @override
  String toString() {
    return 'ClubDashboardModel(role: $role, timestamp: $timestamp, clubInfo: $clubInfo, players: $players, matches: $matches, payments: $payments, federation: $federation, subscription: $subscription)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ClubDashboardModelImpl &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.clubInfo, clubInfo) ||
                other.clubInfo == clubInfo) &&
            (identical(other.players, players) || other.players == players) &&
            (identical(other.matches, matches) || other.matches == matches) &&
            (identical(other.payments, payments) ||
                other.payments == payments) &&
            (identical(other.federation, federation) ||
                other.federation == federation) &&
            (identical(other.subscription, subscription) ||
                other.subscription == subscription));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, role, timestamp, clubInfo,
      players, matches, payments, federation, subscription);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ClubDashboardModelImplCopyWith<_$ClubDashboardModelImpl> get copyWith =>
      __$$ClubDashboardModelImplCopyWithImpl<_$ClubDashboardModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ClubDashboardModelImplToJson(
      this,
    );
  }
}

abstract class _ClubDashboardModel implements ClubDashboardModel {
  const factory _ClubDashboardModel(
      {required final String role,
      required final String timestamp,
      @JsonKey(name: 'club_info') required final ClubInfoModel clubInfo,
      required final ClubPlayersModel players,
      required final ClubMatchesModel matches,
      required final ClubPaymentsModel payments,
      required final FederationInfoModel federation,
      final ClubSubscriptionModel? subscription}) = _$ClubDashboardModelImpl;

  factory _ClubDashboardModel.fromJson(Map<String, dynamic> json) =
      _$ClubDashboardModelImpl.fromJson;

  @override
  String get role;
  @override
  String get timestamp;
  @override
  @JsonKey(name: 'club_info')
  ClubInfoModel get clubInfo;
  @override
  ClubPlayersModel get players;
  @override
  ClubMatchesModel get matches;
  @override
  ClubPaymentsModel get payments;
  @override
  FederationInfoModel get federation;
  @override
  ClubSubscriptionModel? get subscription;
  @override
  @JsonKey(ignore: true)
  _$$ClubDashboardModelImplCopyWith<_$ClubDashboardModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ClubInfoModel _$ClubInfoModelFromJson(Map<String, dynamic> json) {
  return _ClubInfoModel.fromJson(json);
}

/// @nodoc
mixin _$ClubInfoModel {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'short_name')
  String get shortName => throw _privateConstructorUsedError;
  String? get logo => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_active')
  bool get isActive => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_federated')
  bool get isFederated => throw _privateConstructorUsedError;
  @JsonKey(name: 'federation_code')
  String? get federationCode => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get phone => throw _privateConstructorUsedError;
  String? get address => throw _privateConstructorUsedError;
  String? get city => throw _privateConstructorUsedError;
  String? get department => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ClubInfoModelCopyWith<ClubInfoModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClubInfoModelCopyWith<$Res> {
  factory $ClubInfoModelCopyWith(
          ClubInfoModel value, $Res Function(ClubInfoModel) then) =
      _$ClubInfoModelCopyWithImpl<$Res, ClubInfoModel>;
  @useResult
  $Res call(
      {int id,
      String name,
      @JsonKey(name: 'short_name') String shortName,
      String? logo,
      String status,
      @JsonKey(name: 'is_active') bool isActive,
      @JsonKey(name: 'is_federated') bool isFederated,
      @JsonKey(name: 'federation_code') String? federationCode,
      String email,
      String phone,
      String? address,
      String? city,
      String? department});
}

/// @nodoc
class _$ClubInfoModelCopyWithImpl<$Res, $Val extends ClubInfoModel>
    implements $ClubInfoModelCopyWith<$Res> {
  _$ClubInfoModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? shortName = null,
    Object? logo = freezed,
    Object? status = null,
    Object? isActive = null,
    Object? isFederated = null,
    Object? federationCode = freezed,
    Object? email = null,
    Object? phone = null,
    Object? address = freezed,
    Object? city = freezed,
    Object? department = freezed,
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
      shortName: null == shortName
          ? _value.shortName
          : shortName // ignore: cast_nullable_to_non_nullable
              as String,
      logo: freezed == logo
          ? _value.logo
          : logo // ignore: cast_nullable_to_non_nullable
              as String?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      isFederated: null == isFederated
          ? _value.isFederated
          : isFederated // ignore: cast_nullable_to_non_nullable
              as bool,
      federationCode: freezed == federationCode
          ? _value.federationCode
          : federationCode // ignore: cast_nullable_to_non_nullable
              as String?,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      city: freezed == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
      department: freezed == department
          ? _value.department
          : department // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ClubInfoModelImplCopyWith<$Res>
    implements $ClubInfoModelCopyWith<$Res> {
  factory _$$ClubInfoModelImplCopyWith(
          _$ClubInfoModelImpl value, $Res Function(_$ClubInfoModelImpl) then) =
      __$$ClubInfoModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      @JsonKey(name: 'short_name') String shortName,
      String? logo,
      String status,
      @JsonKey(name: 'is_active') bool isActive,
      @JsonKey(name: 'is_federated') bool isFederated,
      @JsonKey(name: 'federation_code') String? federationCode,
      String email,
      String phone,
      String? address,
      String? city,
      String? department});
}

/// @nodoc
class __$$ClubInfoModelImplCopyWithImpl<$Res>
    extends _$ClubInfoModelCopyWithImpl<$Res, _$ClubInfoModelImpl>
    implements _$$ClubInfoModelImplCopyWith<$Res> {
  __$$ClubInfoModelImplCopyWithImpl(
      _$ClubInfoModelImpl _value, $Res Function(_$ClubInfoModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? shortName = null,
    Object? logo = freezed,
    Object? status = null,
    Object? isActive = null,
    Object? isFederated = null,
    Object? federationCode = freezed,
    Object? email = null,
    Object? phone = null,
    Object? address = freezed,
    Object? city = freezed,
    Object? department = freezed,
  }) {
    return _then(_$ClubInfoModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      shortName: null == shortName
          ? _value.shortName
          : shortName // ignore: cast_nullable_to_non_nullable
              as String,
      logo: freezed == logo
          ? _value.logo
          : logo // ignore: cast_nullable_to_non_nullable
              as String?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      isFederated: null == isFederated
          ? _value.isFederated
          : isFederated // ignore: cast_nullable_to_non_nullable
              as bool,
      federationCode: freezed == federationCode
          ? _value.federationCode
          : federationCode // ignore: cast_nullable_to_non_nullable
              as String?,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      city: freezed == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
      department: freezed == department
          ? _value.department
          : department // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ClubInfoModelImpl implements _ClubInfoModel {
  const _$ClubInfoModelImpl(
      {required this.id,
      required this.name,
      @JsonKey(name: 'short_name') required this.shortName,
      this.logo,
      required this.status,
      @JsonKey(name: 'is_active') required this.isActive,
      @JsonKey(name: 'is_federated') required this.isFederated,
      @JsonKey(name: 'federation_code') this.federationCode,
      required this.email,
      required this.phone,
      this.address,
      this.city,
      this.department});

  factory _$ClubInfoModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ClubInfoModelImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  @JsonKey(name: 'short_name')
  final String shortName;
  @override
  final String? logo;
  @override
  final String status;
  @override
  @JsonKey(name: 'is_active')
  final bool isActive;
  @override
  @JsonKey(name: 'is_federated')
  final bool isFederated;
  @override
  @JsonKey(name: 'federation_code')
  final String? federationCode;
  @override
  final String email;
  @override
  final String phone;
  @override
  final String? address;
  @override
  final String? city;
  @override
  final String? department;

  @override
  String toString() {
    return 'ClubInfoModel(id: $id, name: $name, shortName: $shortName, logo: $logo, status: $status, isActive: $isActive, isFederated: $isFederated, federationCode: $federationCode, email: $email, phone: $phone, address: $address, city: $city, department: $department)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ClubInfoModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.shortName, shortName) ||
                other.shortName == shortName) &&
            (identical(other.logo, logo) || other.logo == logo) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.isFederated, isFederated) ||
                other.isFederated == isFederated) &&
            (identical(other.federationCode, federationCode) ||
                other.federationCode == federationCode) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.department, department) ||
                other.department == department));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      shortName,
      logo,
      status,
      isActive,
      isFederated,
      federationCode,
      email,
      phone,
      address,
      city,
      department);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ClubInfoModelImplCopyWith<_$ClubInfoModelImpl> get copyWith =>
      __$$ClubInfoModelImplCopyWithImpl<_$ClubInfoModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ClubInfoModelImplToJson(
      this,
    );
  }
}

abstract class _ClubInfoModel implements ClubInfoModel {
  const factory _ClubInfoModel(
      {required final int id,
      required final String name,
      @JsonKey(name: 'short_name') required final String shortName,
      final String? logo,
      required final String status,
      @JsonKey(name: 'is_active') required final bool isActive,
      @JsonKey(name: 'is_federated') required final bool isFederated,
      @JsonKey(name: 'federation_code') final String? federationCode,
      required final String email,
      required final String phone,
      final String? address,
      final String? city,
      final String? department}) = _$ClubInfoModelImpl;

  factory _ClubInfoModel.fromJson(Map<String, dynamic> json) =
      _$ClubInfoModelImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  @JsonKey(name: 'short_name')
  String get shortName;
  @override
  String? get logo;
  @override
  String get status;
  @override
  @JsonKey(name: 'is_active')
  bool get isActive;
  @override
  @JsonKey(name: 'is_federated')
  bool get isFederated;
  @override
  @JsonKey(name: 'federation_code')
  String? get federationCode;
  @override
  String get email;
  @override
  String get phone;
  @override
  String? get address;
  @override
  String? get city;
  @override
  String? get department;
  @override
  @JsonKey(ignore: true)
  _$$ClubInfoModelImplCopyWith<_$ClubInfoModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ClubPlayersModel _$ClubPlayersModelFromJson(Map<String, dynamic> json) {
  return _ClubPlayersModel.fromJson(json);
}

/// @nodoc
mixin _$ClubPlayersModel {
  int get total => throw _privateConstructorUsedError;
  int get active => throw _privateConstructorUsedError;
  int get inactive => throw _privateConstructorUsedError;
  int get federated => throw _privateConstructorUsedError;
  @JsonKey(name: 'non_federated')
  int get nonFederated => throw _privateConstructorUsedError;
  @JsonKey(name: 'with_overdue_payments')
  int get withOverduePayments => throw _privateConstructorUsedError;
  @JsonKey(name: 'by_category')
  Map<String, int> get byCategory => throw _privateConstructorUsedError;
  @JsonKey(name: 'expiring_medical_certs_30_days')
  int get expiringMedicalCerts30Days => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ClubPlayersModelCopyWith<ClubPlayersModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClubPlayersModelCopyWith<$Res> {
  factory $ClubPlayersModelCopyWith(
          ClubPlayersModel value, $Res Function(ClubPlayersModel) then) =
      _$ClubPlayersModelCopyWithImpl<$Res, ClubPlayersModel>;
  @useResult
  $Res call(
      {int total,
      int active,
      int inactive,
      int federated,
      @JsonKey(name: 'non_federated') int nonFederated,
      @JsonKey(name: 'with_overdue_payments') int withOverduePayments,
      @JsonKey(name: 'by_category') Map<String, int> byCategory,
      @JsonKey(name: 'expiring_medical_certs_30_days')
      int expiringMedicalCerts30Days});
}

/// @nodoc
class _$ClubPlayersModelCopyWithImpl<$Res, $Val extends ClubPlayersModel>
    implements $ClubPlayersModelCopyWith<$Res> {
  _$ClubPlayersModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? total = null,
    Object? active = null,
    Object? inactive = null,
    Object? federated = null,
    Object? nonFederated = null,
    Object? withOverduePayments = null,
    Object? byCategory = null,
    Object? expiringMedicalCerts30Days = null,
  }) {
    return _then(_value.copyWith(
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      active: null == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as int,
      inactive: null == inactive
          ? _value.inactive
          : inactive // ignore: cast_nullable_to_non_nullable
              as int,
      federated: null == federated
          ? _value.federated
          : federated // ignore: cast_nullable_to_non_nullable
              as int,
      nonFederated: null == nonFederated
          ? _value.nonFederated
          : nonFederated // ignore: cast_nullable_to_non_nullable
              as int,
      withOverduePayments: null == withOverduePayments
          ? _value.withOverduePayments
          : withOverduePayments // ignore: cast_nullable_to_non_nullable
              as int,
      byCategory: null == byCategory
          ? _value.byCategory
          : byCategory // ignore: cast_nullable_to_non_nullable
              as Map<String, int>,
      expiringMedicalCerts30Days: null == expiringMedicalCerts30Days
          ? _value.expiringMedicalCerts30Days
          : expiringMedicalCerts30Days // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ClubPlayersModelImplCopyWith<$Res>
    implements $ClubPlayersModelCopyWith<$Res> {
  factory _$$ClubPlayersModelImplCopyWith(_$ClubPlayersModelImpl value,
          $Res Function(_$ClubPlayersModelImpl) then) =
      __$$ClubPlayersModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int total,
      int active,
      int inactive,
      int federated,
      @JsonKey(name: 'non_federated') int nonFederated,
      @JsonKey(name: 'with_overdue_payments') int withOverduePayments,
      @JsonKey(name: 'by_category') Map<String, int> byCategory,
      @JsonKey(name: 'expiring_medical_certs_30_days')
      int expiringMedicalCerts30Days});
}

/// @nodoc
class __$$ClubPlayersModelImplCopyWithImpl<$Res>
    extends _$ClubPlayersModelCopyWithImpl<$Res, _$ClubPlayersModelImpl>
    implements _$$ClubPlayersModelImplCopyWith<$Res> {
  __$$ClubPlayersModelImplCopyWithImpl(_$ClubPlayersModelImpl _value,
      $Res Function(_$ClubPlayersModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? total = null,
    Object? active = null,
    Object? inactive = null,
    Object? federated = null,
    Object? nonFederated = null,
    Object? withOverduePayments = null,
    Object? byCategory = null,
    Object? expiringMedicalCerts30Days = null,
  }) {
    return _then(_$ClubPlayersModelImpl(
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      active: null == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as int,
      inactive: null == inactive
          ? _value.inactive
          : inactive // ignore: cast_nullable_to_non_nullable
              as int,
      federated: null == federated
          ? _value.federated
          : federated // ignore: cast_nullable_to_non_nullable
              as int,
      nonFederated: null == nonFederated
          ? _value.nonFederated
          : nonFederated // ignore: cast_nullable_to_non_nullable
              as int,
      withOverduePayments: null == withOverduePayments
          ? _value.withOverduePayments
          : withOverduePayments // ignore: cast_nullable_to_non_nullable
              as int,
      byCategory: null == byCategory
          ? _value._byCategory
          : byCategory // ignore: cast_nullable_to_non_nullable
              as Map<String, int>,
      expiringMedicalCerts30Days: null == expiringMedicalCerts30Days
          ? _value.expiringMedicalCerts30Days
          : expiringMedicalCerts30Days // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ClubPlayersModelImpl implements _ClubPlayersModel {
  const _$ClubPlayersModelImpl(
      {required this.total,
      required this.active,
      required this.inactive,
      required this.federated,
      @JsonKey(name: 'non_federated') required this.nonFederated,
      @JsonKey(name: 'with_overdue_payments') required this.withOverduePayments,
      @JsonKey(name: 'by_category') required final Map<String, int> byCategory,
      @JsonKey(name: 'expiring_medical_certs_30_days')
      required this.expiringMedicalCerts30Days})
      : _byCategory = byCategory;

  factory _$ClubPlayersModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ClubPlayersModelImplFromJson(json);

  @override
  final int total;
  @override
  final int active;
  @override
  final int inactive;
  @override
  final int federated;
  @override
  @JsonKey(name: 'non_federated')
  final int nonFederated;
  @override
  @JsonKey(name: 'with_overdue_payments')
  final int withOverduePayments;
  final Map<String, int> _byCategory;
  @override
  @JsonKey(name: 'by_category')
  Map<String, int> get byCategory {
    if (_byCategory is EqualUnmodifiableMapView) return _byCategory;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_byCategory);
  }

  @override
  @JsonKey(name: 'expiring_medical_certs_30_days')
  final int expiringMedicalCerts30Days;

  @override
  String toString() {
    return 'ClubPlayersModel(total: $total, active: $active, inactive: $inactive, federated: $federated, nonFederated: $nonFederated, withOverduePayments: $withOverduePayments, byCategory: $byCategory, expiringMedicalCerts30Days: $expiringMedicalCerts30Days)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ClubPlayersModelImpl &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.active, active) || other.active == active) &&
            (identical(other.inactive, inactive) ||
                other.inactive == inactive) &&
            (identical(other.federated, federated) ||
                other.federated == federated) &&
            (identical(other.nonFederated, nonFederated) ||
                other.nonFederated == nonFederated) &&
            (identical(other.withOverduePayments, withOverduePayments) ||
                other.withOverduePayments == withOverduePayments) &&
            const DeepCollectionEquality()
                .equals(other._byCategory, _byCategory) &&
            (identical(other.expiringMedicalCerts30Days,
                    expiringMedicalCerts30Days) ||
                other.expiringMedicalCerts30Days ==
                    expiringMedicalCerts30Days));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      total,
      active,
      inactive,
      federated,
      nonFederated,
      withOverduePayments,
      const DeepCollectionEquality().hash(_byCategory),
      expiringMedicalCerts30Days);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ClubPlayersModelImplCopyWith<_$ClubPlayersModelImpl> get copyWith =>
      __$$ClubPlayersModelImplCopyWithImpl<_$ClubPlayersModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ClubPlayersModelImplToJson(
      this,
    );
  }
}

abstract class _ClubPlayersModel implements ClubPlayersModel {
  const factory _ClubPlayersModel(
      {required final int total,
      required final int active,
      required final int inactive,
      required final int federated,
      @JsonKey(name: 'non_federated') required final int nonFederated,
      @JsonKey(name: 'with_overdue_payments')
      required final int withOverduePayments,
      @JsonKey(name: 'by_category') required final Map<String, int> byCategory,
      @JsonKey(name: 'expiring_medical_certs_30_days')
      required final int expiringMedicalCerts30Days}) = _$ClubPlayersModelImpl;

  factory _ClubPlayersModel.fromJson(Map<String, dynamic> json) =
      _$ClubPlayersModelImpl.fromJson;

  @override
  int get total;
  @override
  int get active;
  @override
  int get inactive;
  @override
  int get federated;
  @override
  @JsonKey(name: 'non_federated')
  int get nonFederated;
  @override
  @JsonKey(name: 'with_overdue_payments')
  int get withOverduePayments;
  @override
  @JsonKey(name: 'by_category')
  Map<String, int> get byCategory;
  @override
  @JsonKey(name: 'expiring_medical_certs_30_days')
  int get expiringMedicalCerts30Days;
  @override
  @JsonKey(ignore: true)
  _$$ClubPlayersModelImplCopyWith<_$ClubPlayersModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ClubMatchesModel _$ClubMatchesModelFromJson(Map<String, dynamic> json) {
  return _ClubMatchesModel.fromJson(json);
}

/// @nodoc
mixin _$ClubMatchesModel {
  @JsonKey(name: 'total_played')
  int get totalPlayed => throw _privateConstructorUsedError;
  int get wins => throw _privateConstructorUsedError;
  int get losses => throw _privateConstructorUsedError;
  @JsonKey(name: 'win_rate')
  double get winRate => throw _privateConstructorUsedError;
  @JsonKey(name: 'upcoming_matches')
  List<UpcomingMatchModel> get upcomingMatches =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ClubMatchesModelCopyWith<ClubMatchesModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClubMatchesModelCopyWith<$Res> {
  factory $ClubMatchesModelCopyWith(
          ClubMatchesModel value, $Res Function(ClubMatchesModel) then) =
      _$ClubMatchesModelCopyWithImpl<$Res, ClubMatchesModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'total_played') int totalPlayed,
      int wins,
      int losses,
      @JsonKey(name: 'win_rate') double winRate,
      @JsonKey(name: 'upcoming_matches')
      List<UpcomingMatchModel> upcomingMatches});
}

/// @nodoc
class _$ClubMatchesModelCopyWithImpl<$Res, $Val extends ClubMatchesModel>
    implements $ClubMatchesModelCopyWith<$Res> {
  _$ClubMatchesModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalPlayed = null,
    Object? wins = null,
    Object? losses = null,
    Object? winRate = null,
    Object? upcomingMatches = null,
  }) {
    return _then(_value.copyWith(
      totalPlayed: null == totalPlayed
          ? _value.totalPlayed
          : totalPlayed // ignore: cast_nullable_to_non_nullable
              as int,
      wins: null == wins
          ? _value.wins
          : wins // ignore: cast_nullable_to_non_nullable
              as int,
      losses: null == losses
          ? _value.losses
          : losses // ignore: cast_nullable_to_non_nullable
              as int,
      winRate: null == winRate
          ? _value.winRate
          : winRate // ignore: cast_nullable_to_non_nullable
              as double,
      upcomingMatches: null == upcomingMatches
          ? _value.upcomingMatches
          : upcomingMatches // ignore: cast_nullable_to_non_nullable
              as List<UpcomingMatchModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ClubMatchesModelImplCopyWith<$Res>
    implements $ClubMatchesModelCopyWith<$Res> {
  factory _$$ClubMatchesModelImplCopyWith(_$ClubMatchesModelImpl value,
          $Res Function(_$ClubMatchesModelImpl) then) =
      __$$ClubMatchesModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'total_played') int totalPlayed,
      int wins,
      int losses,
      @JsonKey(name: 'win_rate') double winRate,
      @JsonKey(name: 'upcoming_matches')
      List<UpcomingMatchModel> upcomingMatches});
}

/// @nodoc
class __$$ClubMatchesModelImplCopyWithImpl<$Res>
    extends _$ClubMatchesModelCopyWithImpl<$Res, _$ClubMatchesModelImpl>
    implements _$$ClubMatchesModelImplCopyWith<$Res> {
  __$$ClubMatchesModelImplCopyWithImpl(_$ClubMatchesModelImpl _value,
      $Res Function(_$ClubMatchesModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalPlayed = null,
    Object? wins = null,
    Object? losses = null,
    Object? winRate = null,
    Object? upcomingMatches = null,
  }) {
    return _then(_$ClubMatchesModelImpl(
      totalPlayed: null == totalPlayed
          ? _value.totalPlayed
          : totalPlayed // ignore: cast_nullable_to_non_nullable
              as int,
      wins: null == wins
          ? _value.wins
          : wins // ignore: cast_nullable_to_non_nullable
              as int,
      losses: null == losses
          ? _value.losses
          : losses // ignore: cast_nullable_to_non_nullable
              as int,
      winRate: null == winRate
          ? _value.winRate
          : winRate // ignore: cast_nullable_to_non_nullable
              as double,
      upcomingMatches: null == upcomingMatches
          ? _value._upcomingMatches
          : upcomingMatches // ignore: cast_nullable_to_non_nullable
              as List<UpcomingMatchModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ClubMatchesModelImpl implements _ClubMatchesModel {
  const _$ClubMatchesModelImpl(
      {@JsonKey(name: 'total_played') required this.totalPlayed,
      required this.wins,
      required this.losses,
      @JsonKey(name: 'win_rate') required this.winRate,
      @JsonKey(name: 'upcoming_matches')
      required final List<UpcomingMatchModel> upcomingMatches})
      : _upcomingMatches = upcomingMatches;

  factory _$ClubMatchesModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ClubMatchesModelImplFromJson(json);

  @override
  @JsonKey(name: 'total_played')
  final int totalPlayed;
  @override
  final int wins;
  @override
  final int losses;
  @override
  @JsonKey(name: 'win_rate')
  final double winRate;
  final List<UpcomingMatchModel> _upcomingMatches;
  @override
  @JsonKey(name: 'upcoming_matches')
  List<UpcomingMatchModel> get upcomingMatches {
    if (_upcomingMatches is EqualUnmodifiableListView) return _upcomingMatches;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_upcomingMatches);
  }

  @override
  String toString() {
    return 'ClubMatchesModel(totalPlayed: $totalPlayed, wins: $wins, losses: $losses, winRate: $winRate, upcomingMatches: $upcomingMatches)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ClubMatchesModelImpl &&
            (identical(other.totalPlayed, totalPlayed) ||
                other.totalPlayed == totalPlayed) &&
            (identical(other.wins, wins) || other.wins == wins) &&
            (identical(other.losses, losses) || other.losses == losses) &&
            (identical(other.winRate, winRate) || other.winRate == winRate) &&
            const DeepCollectionEquality()
                .equals(other._upcomingMatches, _upcomingMatches));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, totalPlayed, wins, losses,
      winRate, const DeepCollectionEquality().hash(_upcomingMatches));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ClubMatchesModelImplCopyWith<_$ClubMatchesModelImpl> get copyWith =>
      __$$ClubMatchesModelImplCopyWithImpl<_$ClubMatchesModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ClubMatchesModelImplToJson(
      this,
    );
  }
}

abstract class _ClubMatchesModel implements ClubMatchesModel {
  const factory _ClubMatchesModel(
          {@JsonKey(name: 'total_played') required final int totalPlayed,
          required final int wins,
          required final int losses,
          @JsonKey(name: 'win_rate') required final double winRate,
          @JsonKey(name: 'upcoming_matches')
          required final List<UpcomingMatchModel> upcomingMatches}) =
      _$ClubMatchesModelImpl;

  factory _ClubMatchesModel.fromJson(Map<String, dynamic> json) =
      _$ClubMatchesModelImpl.fromJson;

  @override
  @JsonKey(name: 'total_played')
  int get totalPlayed;
  @override
  int get wins;
  @override
  int get losses;
  @override
  @JsonKey(name: 'win_rate')
  double get winRate;
  @override
  @JsonKey(name: 'upcoming_matches')
  List<UpcomingMatchModel> get upcomingMatches;
  @override
  @JsonKey(ignore: true)
  _$$ClubMatchesModelImplCopyWith<_$ClubMatchesModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

UpcomingMatchModel _$UpcomingMatchModelFromJson(Map<String, dynamic> json) {
  return _UpcomingMatchModel.fromJson(json);
}

/// @nodoc
mixin _$UpcomingMatchModel {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'home_team')
  String get homeTeam => throw _privateConstructorUsedError;
  @JsonKey(name: 'away_team')
  String get awayTeam => throw _privateConstructorUsedError;
  String get tournament => throw _privateConstructorUsedError;
  @JsonKey(name: 'scheduled_at')
  String get scheduledAt => throw _privateConstructorUsedError;
  String get venue => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_home')
  bool get isHome => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UpcomingMatchModelCopyWith<UpcomingMatchModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpcomingMatchModelCopyWith<$Res> {
  factory $UpcomingMatchModelCopyWith(
          UpcomingMatchModel value, $Res Function(UpcomingMatchModel) then) =
      _$UpcomingMatchModelCopyWithImpl<$Res, UpcomingMatchModel>;
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'home_team') String homeTeam,
      @JsonKey(name: 'away_team') String awayTeam,
      String tournament,
      @JsonKey(name: 'scheduled_at') String scheduledAt,
      String venue,
      @JsonKey(name: 'is_home') bool isHome});
}

/// @nodoc
class _$UpcomingMatchModelCopyWithImpl<$Res, $Val extends UpcomingMatchModel>
    implements $UpcomingMatchModelCopyWith<$Res> {
  _$UpcomingMatchModelCopyWithImpl(this._value, this._then);

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
    Object? tournament = null,
    Object? scheduledAt = null,
    Object? venue = null,
    Object? isHome = null,
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
      tournament: null == tournament
          ? _value.tournament
          : tournament // ignore: cast_nullable_to_non_nullable
              as String,
      scheduledAt: null == scheduledAt
          ? _value.scheduledAt
          : scheduledAt // ignore: cast_nullable_to_non_nullable
              as String,
      venue: null == venue
          ? _value.venue
          : venue // ignore: cast_nullable_to_non_nullable
              as String,
      isHome: null == isHome
          ? _value.isHome
          : isHome // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UpcomingMatchModelImplCopyWith<$Res>
    implements $UpcomingMatchModelCopyWith<$Res> {
  factory _$$UpcomingMatchModelImplCopyWith(_$UpcomingMatchModelImpl value,
          $Res Function(_$UpcomingMatchModelImpl) then) =
      __$$UpcomingMatchModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'home_team') String homeTeam,
      @JsonKey(name: 'away_team') String awayTeam,
      String tournament,
      @JsonKey(name: 'scheduled_at') String scheduledAt,
      String venue,
      @JsonKey(name: 'is_home') bool isHome});
}

/// @nodoc
class __$$UpcomingMatchModelImplCopyWithImpl<$Res>
    extends _$UpcomingMatchModelCopyWithImpl<$Res, _$UpcomingMatchModelImpl>
    implements _$$UpcomingMatchModelImplCopyWith<$Res> {
  __$$UpcomingMatchModelImplCopyWithImpl(_$UpcomingMatchModelImpl _value,
      $Res Function(_$UpcomingMatchModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? homeTeam = null,
    Object? awayTeam = null,
    Object? tournament = null,
    Object? scheduledAt = null,
    Object? venue = null,
    Object? isHome = null,
  }) {
    return _then(_$UpcomingMatchModelImpl(
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
      tournament: null == tournament
          ? _value.tournament
          : tournament // ignore: cast_nullable_to_non_nullable
              as String,
      scheduledAt: null == scheduledAt
          ? _value.scheduledAt
          : scheduledAt // ignore: cast_nullable_to_non_nullable
              as String,
      venue: null == venue
          ? _value.venue
          : venue // ignore: cast_nullable_to_non_nullable
              as String,
      isHome: null == isHome
          ? _value.isHome
          : isHome // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UpcomingMatchModelImpl implements _UpcomingMatchModel {
  const _$UpcomingMatchModelImpl(
      {required this.id,
      @JsonKey(name: 'home_team') required this.homeTeam,
      @JsonKey(name: 'away_team') required this.awayTeam,
      required this.tournament,
      @JsonKey(name: 'scheduled_at') required this.scheduledAt,
      required this.venue,
      @JsonKey(name: 'is_home') required this.isHome});

  factory _$UpcomingMatchModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$UpcomingMatchModelImplFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'home_team')
  final String homeTeam;
  @override
  @JsonKey(name: 'away_team')
  final String awayTeam;
  @override
  final String tournament;
  @override
  @JsonKey(name: 'scheduled_at')
  final String scheduledAt;
  @override
  final String venue;
  @override
  @JsonKey(name: 'is_home')
  final bool isHome;

  @override
  String toString() {
    return 'UpcomingMatchModel(id: $id, homeTeam: $homeTeam, awayTeam: $awayTeam, tournament: $tournament, scheduledAt: $scheduledAt, venue: $venue, isHome: $isHome)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpcomingMatchModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.homeTeam, homeTeam) ||
                other.homeTeam == homeTeam) &&
            (identical(other.awayTeam, awayTeam) ||
                other.awayTeam == awayTeam) &&
            (identical(other.tournament, tournament) ||
                other.tournament == tournament) &&
            (identical(other.scheduledAt, scheduledAt) ||
                other.scheduledAt == scheduledAt) &&
            (identical(other.venue, venue) || other.venue == venue) &&
            (identical(other.isHome, isHome) || other.isHome == isHome));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, homeTeam, awayTeam,
      tournament, scheduledAt, venue, isHome);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpcomingMatchModelImplCopyWith<_$UpcomingMatchModelImpl> get copyWith =>
      __$$UpcomingMatchModelImplCopyWithImpl<_$UpcomingMatchModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UpcomingMatchModelImplToJson(
      this,
    );
  }
}

abstract class _UpcomingMatchModel implements UpcomingMatchModel {
  const factory _UpcomingMatchModel(
          {required final int id,
          @JsonKey(name: 'home_team') required final String homeTeam,
          @JsonKey(name: 'away_team') required final String awayTeam,
          required final String tournament,
          @JsonKey(name: 'scheduled_at') required final String scheduledAt,
          required final String venue,
          @JsonKey(name: 'is_home') required final bool isHome}) =
      _$UpcomingMatchModelImpl;

  factory _UpcomingMatchModel.fromJson(Map<String, dynamic> json) =
      _$UpcomingMatchModelImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'home_team')
  String get homeTeam;
  @override
  @JsonKey(name: 'away_team')
  String get awayTeam;
  @override
  String get tournament;
  @override
  @JsonKey(name: 'scheduled_at')
  String get scheduledAt;
  @override
  String get venue;
  @override
  @JsonKey(name: 'is_home')
  bool get isHome;
  @override
  @JsonKey(ignore: true)
  _$$UpcomingMatchModelImplCopyWith<_$UpcomingMatchModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ClubPaymentsModel _$ClubPaymentsModelFromJson(Map<String, dynamic> json) {
  return _ClubPaymentsModel.fromJson(json);
}

/// @nodoc
mixin _$ClubPaymentsModel {
  @JsonKey(name: 'pending_count')
  int get pendingCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'overdue_count')
  int get overdueCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'pending_amount')
  double get pendingAmount => throw _privateConstructorUsedError;
  @JsonKey(name: 'overdue_amount')
  double get overdueAmount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ClubPaymentsModelCopyWith<ClubPaymentsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClubPaymentsModelCopyWith<$Res> {
  factory $ClubPaymentsModelCopyWith(
          ClubPaymentsModel value, $Res Function(ClubPaymentsModel) then) =
      _$ClubPaymentsModelCopyWithImpl<$Res, ClubPaymentsModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'pending_count') int pendingCount,
      @JsonKey(name: 'overdue_count') int overdueCount,
      @JsonKey(name: 'pending_amount') double pendingAmount,
      @JsonKey(name: 'overdue_amount') double overdueAmount});
}

/// @nodoc
class _$ClubPaymentsModelCopyWithImpl<$Res, $Val extends ClubPaymentsModel>
    implements $ClubPaymentsModelCopyWith<$Res> {
  _$ClubPaymentsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pendingCount = null,
    Object? overdueCount = null,
    Object? pendingAmount = null,
    Object? overdueAmount = null,
  }) {
    return _then(_value.copyWith(
      pendingCount: null == pendingCount
          ? _value.pendingCount
          : pendingCount // ignore: cast_nullable_to_non_nullable
              as int,
      overdueCount: null == overdueCount
          ? _value.overdueCount
          : overdueCount // ignore: cast_nullable_to_non_nullable
              as int,
      pendingAmount: null == pendingAmount
          ? _value.pendingAmount
          : pendingAmount // ignore: cast_nullable_to_non_nullable
              as double,
      overdueAmount: null == overdueAmount
          ? _value.overdueAmount
          : overdueAmount // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ClubPaymentsModelImplCopyWith<$Res>
    implements $ClubPaymentsModelCopyWith<$Res> {
  factory _$$ClubPaymentsModelImplCopyWith(_$ClubPaymentsModelImpl value,
          $Res Function(_$ClubPaymentsModelImpl) then) =
      __$$ClubPaymentsModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'pending_count') int pendingCount,
      @JsonKey(name: 'overdue_count') int overdueCount,
      @JsonKey(name: 'pending_amount') double pendingAmount,
      @JsonKey(name: 'overdue_amount') double overdueAmount});
}

/// @nodoc
class __$$ClubPaymentsModelImplCopyWithImpl<$Res>
    extends _$ClubPaymentsModelCopyWithImpl<$Res, _$ClubPaymentsModelImpl>
    implements _$$ClubPaymentsModelImplCopyWith<$Res> {
  __$$ClubPaymentsModelImplCopyWithImpl(_$ClubPaymentsModelImpl _value,
      $Res Function(_$ClubPaymentsModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pendingCount = null,
    Object? overdueCount = null,
    Object? pendingAmount = null,
    Object? overdueAmount = null,
  }) {
    return _then(_$ClubPaymentsModelImpl(
      pendingCount: null == pendingCount
          ? _value.pendingCount
          : pendingCount // ignore: cast_nullable_to_non_nullable
              as int,
      overdueCount: null == overdueCount
          ? _value.overdueCount
          : overdueCount // ignore: cast_nullable_to_non_nullable
              as int,
      pendingAmount: null == pendingAmount
          ? _value.pendingAmount
          : pendingAmount // ignore: cast_nullable_to_non_nullable
              as double,
      overdueAmount: null == overdueAmount
          ? _value.overdueAmount
          : overdueAmount // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ClubPaymentsModelImpl implements _ClubPaymentsModel {
  const _$ClubPaymentsModelImpl(
      {@JsonKey(name: 'pending_count') required this.pendingCount,
      @JsonKey(name: 'overdue_count') required this.overdueCount,
      @JsonKey(name: 'pending_amount') required this.pendingAmount,
      @JsonKey(name: 'overdue_amount') required this.overdueAmount});

  factory _$ClubPaymentsModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ClubPaymentsModelImplFromJson(json);

  @override
  @JsonKey(name: 'pending_count')
  final int pendingCount;
  @override
  @JsonKey(name: 'overdue_count')
  final int overdueCount;
  @override
  @JsonKey(name: 'pending_amount')
  final double pendingAmount;
  @override
  @JsonKey(name: 'overdue_amount')
  final double overdueAmount;

  @override
  String toString() {
    return 'ClubPaymentsModel(pendingCount: $pendingCount, overdueCount: $overdueCount, pendingAmount: $pendingAmount, overdueAmount: $overdueAmount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ClubPaymentsModelImpl &&
            (identical(other.pendingCount, pendingCount) ||
                other.pendingCount == pendingCount) &&
            (identical(other.overdueCount, overdueCount) ||
                other.overdueCount == overdueCount) &&
            (identical(other.pendingAmount, pendingAmount) ||
                other.pendingAmount == pendingAmount) &&
            (identical(other.overdueAmount, overdueAmount) ||
                other.overdueAmount == overdueAmount));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, pendingCount, overdueCount, pendingAmount, overdueAmount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ClubPaymentsModelImplCopyWith<_$ClubPaymentsModelImpl> get copyWith =>
      __$$ClubPaymentsModelImplCopyWithImpl<_$ClubPaymentsModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ClubPaymentsModelImplToJson(
      this,
    );
  }
}

abstract class _ClubPaymentsModel implements ClubPaymentsModel {
  const factory _ClubPaymentsModel(
      {@JsonKey(name: 'pending_count') required final int pendingCount,
      @JsonKey(name: 'overdue_count') required final int overdueCount,
      @JsonKey(name: 'pending_amount') required final double pendingAmount,
      @JsonKey(name: 'overdue_amount')
      required final double overdueAmount}) = _$ClubPaymentsModelImpl;

  factory _ClubPaymentsModel.fromJson(Map<String, dynamic> json) =
      _$ClubPaymentsModelImpl.fromJson;

  @override
  @JsonKey(name: 'pending_count')
  int get pendingCount;
  @override
  @JsonKey(name: 'overdue_count')
  int get overdueCount;
  @override
  @JsonKey(name: 'pending_amount')
  double get pendingAmount;
  @override
  @JsonKey(name: 'overdue_amount')
  double get overdueAmount;
  @override
  @JsonKey(ignore: true)
  _$$ClubPaymentsModelImplCopyWith<_$ClubPaymentsModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

FederationInfoModel _$FederationInfoModelFromJson(Map<String, dynamic> json) {
  return _FederationInfoModel.fromJson(json);
}

/// @nodoc
mixin _$FederationInfoModel {
  @JsonKey(name: 'pending_federation')
  int get pendingFederation => throw _privateConstructorUsedError;
  @JsonKey(name: 'expiring_federation_30_days')
  int get expiringFederation30Days => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FederationInfoModelCopyWith<FederationInfoModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FederationInfoModelCopyWith<$Res> {
  factory $FederationInfoModelCopyWith(
          FederationInfoModel value, $Res Function(FederationInfoModel) then) =
      _$FederationInfoModelCopyWithImpl<$Res, FederationInfoModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'pending_federation') int pendingFederation,
      @JsonKey(name: 'expiring_federation_30_days')
      int expiringFederation30Days});
}

/// @nodoc
class _$FederationInfoModelCopyWithImpl<$Res, $Val extends FederationInfoModel>
    implements $FederationInfoModelCopyWith<$Res> {
  _$FederationInfoModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pendingFederation = null,
    Object? expiringFederation30Days = null,
  }) {
    return _then(_value.copyWith(
      pendingFederation: null == pendingFederation
          ? _value.pendingFederation
          : pendingFederation // ignore: cast_nullable_to_non_nullable
              as int,
      expiringFederation30Days: null == expiringFederation30Days
          ? _value.expiringFederation30Days
          : expiringFederation30Days // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FederationInfoModelImplCopyWith<$Res>
    implements $FederationInfoModelCopyWith<$Res> {
  factory _$$FederationInfoModelImplCopyWith(_$FederationInfoModelImpl value,
          $Res Function(_$FederationInfoModelImpl) then) =
      __$$FederationInfoModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'pending_federation') int pendingFederation,
      @JsonKey(name: 'expiring_federation_30_days')
      int expiringFederation30Days});
}

/// @nodoc
class __$$FederationInfoModelImplCopyWithImpl<$Res>
    extends _$FederationInfoModelCopyWithImpl<$Res, _$FederationInfoModelImpl>
    implements _$$FederationInfoModelImplCopyWith<$Res> {
  __$$FederationInfoModelImplCopyWithImpl(_$FederationInfoModelImpl _value,
      $Res Function(_$FederationInfoModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pendingFederation = null,
    Object? expiringFederation30Days = null,
  }) {
    return _then(_$FederationInfoModelImpl(
      pendingFederation: null == pendingFederation
          ? _value.pendingFederation
          : pendingFederation // ignore: cast_nullable_to_non_nullable
              as int,
      expiringFederation30Days: null == expiringFederation30Days
          ? _value.expiringFederation30Days
          : expiringFederation30Days // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FederationInfoModelImpl implements _FederationInfoModel {
  const _$FederationInfoModelImpl(
      {@JsonKey(name: 'pending_federation') required this.pendingFederation,
      @JsonKey(name: 'expiring_federation_30_days')
      required this.expiringFederation30Days});

  factory _$FederationInfoModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$FederationInfoModelImplFromJson(json);

  @override
  @JsonKey(name: 'pending_federation')
  final int pendingFederation;
  @override
  @JsonKey(name: 'expiring_federation_30_days')
  final int expiringFederation30Days;

  @override
  String toString() {
    return 'FederationInfoModel(pendingFederation: $pendingFederation, expiringFederation30Days: $expiringFederation30Days)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FederationInfoModelImpl &&
            (identical(other.pendingFederation, pendingFederation) ||
                other.pendingFederation == pendingFederation) &&
            (identical(
                    other.expiringFederation30Days, expiringFederation30Days) ||
                other.expiringFederation30Days == expiringFederation30Days));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, pendingFederation, expiringFederation30Days);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FederationInfoModelImplCopyWith<_$FederationInfoModelImpl> get copyWith =>
      __$$FederationInfoModelImplCopyWithImpl<_$FederationInfoModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FederationInfoModelImplToJson(
      this,
    );
  }
}

abstract class _FederationInfoModel implements FederationInfoModel {
  const factory _FederationInfoModel(
      {@JsonKey(name: 'pending_federation')
      required final int pendingFederation,
      @JsonKey(name: 'expiring_federation_30_days')
      required final int expiringFederation30Days}) = _$FederationInfoModelImpl;

  factory _FederationInfoModel.fromJson(Map<String, dynamic> json) =
      _$FederationInfoModelImpl.fromJson;

  @override
  @JsonKey(name: 'pending_federation')
  int get pendingFederation;
  @override
  @JsonKey(name: 'expiring_federation_30_days')
  int get expiringFederation30Days;
  @override
  @JsonKey(ignore: true)
  _$$FederationInfoModelImplCopyWith<_$FederationInfoModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ClubSubscriptionModel _$ClubSubscriptionModelFromJson(
    Map<String, dynamic> json) {
  return _ClubSubscriptionModel.fromJson(json);
}

/// @nodoc
mixin _$ClubSubscriptionModel {
  @JsonKey(name: 'has_subscription')
  bool get hasSubscription => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'current_period_end')
  String get currentPeriodEnd => throw _privateConstructorUsedError;
  @JsonKey(name: 'days_until_renewal')
  int get daysUntilRenewal => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_active')
  bool get isActive => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_past_due')
  bool get isPastDue => throw _privateConstructorUsedError;
  @JsonKey(name: 'player_count')
  int get playerCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_amount')
  double get lastAmount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ClubSubscriptionModelCopyWith<ClubSubscriptionModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClubSubscriptionModelCopyWith<$Res> {
  factory $ClubSubscriptionModelCopyWith(ClubSubscriptionModel value,
          $Res Function(ClubSubscriptionModel) then) =
      _$ClubSubscriptionModelCopyWithImpl<$Res, ClubSubscriptionModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'has_subscription') bool hasSubscription,
      String status,
      @JsonKey(name: 'current_period_end') String currentPeriodEnd,
      @JsonKey(name: 'days_until_renewal') int daysUntilRenewal,
      @JsonKey(name: 'is_active') bool isActive,
      @JsonKey(name: 'is_past_due') bool isPastDue,
      @JsonKey(name: 'player_count') int playerCount,
      @JsonKey(name: 'last_amount') double lastAmount});
}

/// @nodoc
class _$ClubSubscriptionModelCopyWithImpl<$Res,
        $Val extends ClubSubscriptionModel>
    implements $ClubSubscriptionModelCopyWith<$Res> {
  _$ClubSubscriptionModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hasSubscription = null,
    Object? status = null,
    Object? currentPeriodEnd = null,
    Object? daysUntilRenewal = null,
    Object? isActive = null,
    Object? isPastDue = null,
    Object? playerCount = null,
    Object? lastAmount = null,
  }) {
    return _then(_value.copyWith(
      hasSubscription: null == hasSubscription
          ? _value.hasSubscription
          : hasSubscription // ignore: cast_nullable_to_non_nullable
              as bool,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      currentPeriodEnd: null == currentPeriodEnd
          ? _value.currentPeriodEnd
          : currentPeriodEnd // ignore: cast_nullable_to_non_nullable
              as String,
      daysUntilRenewal: null == daysUntilRenewal
          ? _value.daysUntilRenewal
          : daysUntilRenewal // ignore: cast_nullable_to_non_nullable
              as int,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      isPastDue: null == isPastDue
          ? _value.isPastDue
          : isPastDue // ignore: cast_nullable_to_non_nullable
              as bool,
      playerCount: null == playerCount
          ? _value.playerCount
          : playerCount // ignore: cast_nullable_to_non_nullable
              as int,
      lastAmount: null == lastAmount
          ? _value.lastAmount
          : lastAmount // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ClubSubscriptionModelImplCopyWith<$Res>
    implements $ClubSubscriptionModelCopyWith<$Res> {
  factory _$$ClubSubscriptionModelImplCopyWith(
          _$ClubSubscriptionModelImpl value,
          $Res Function(_$ClubSubscriptionModelImpl) then) =
      __$$ClubSubscriptionModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'has_subscription') bool hasSubscription,
      String status,
      @JsonKey(name: 'current_period_end') String currentPeriodEnd,
      @JsonKey(name: 'days_until_renewal') int daysUntilRenewal,
      @JsonKey(name: 'is_active') bool isActive,
      @JsonKey(name: 'is_past_due') bool isPastDue,
      @JsonKey(name: 'player_count') int playerCount,
      @JsonKey(name: 'last_amount') double lastAmount});
}

/// @nodoc
class __$$ClubSubscriptionModelImplCopyWithImpl<$Res>
    extends _$ClubSubscriptionModelCopyWithImpl<$Res,
        _$ClubSubscriptionModelImpl>
    implements _$$ClubSubscriptionModelImplCopyWith<$Res> {
  __$$ClubSubscriptionModelImplCopyWithImpl(_$ClubSubscriptionModelImpl _value,
      $Res Function(_$ClubSubscriptionModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hasSubscription = null,
    Object? status = null,
    Object? currentPeriodEnd = null,
    Object? daysUntilRenewal = null,
    Object? isActive = null,
    Object? isPastDue = null,
    Object? playerCount = null,
    Object? lastAmount = null,
  }) {
    return _then(_$ClubSubscriptionModelImpl(
      hasSubscription: null == hasSubscription
          ? _value.hasSubscription
          : hasSubscription // ignore: cast_nullable_to_non_nullable
              as bool,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      currentPeriodEnd: null == currentPeriodEnd
          ? _value.currentPeriodEnd
          : currentPeriodEnd // ignore: cast_nullable_to_non_nullable
              as String,
      daysUntilRenewal: null == daysUntilRenewal
          ? _value.daysUntilRenewal
          : daysUntilRenewal // ignore: cast_nullable_to_non_nullable
              as int,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      isPastDue: null == isPastDue
          ? _value.isPastDue
          : isPastDue // ignore: cast_nullable_to_non_nullable
              as bool,
      playerCount: null == playerCount
          ? _value.playerCount
          : playerCount // ignore: cast_nullable_to_non_nullable
              as int,
      lastAmount: null == lastAmount
          ? _value.lastAmount
          : lastAmount // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ClubSubscriptionModelImpl implements _ClubSubscriptionModel {
  const _$ClubSubscriptionModelImpl(
      {@JsonKey(name: 'has_subscription') required this.hasSubscription,
      required this.status,
      @JsonKey(name: 'current_period_end') required this.currentPeriodEnd,
      @JsonKey(name: 'days_until_renewal') required this.daysUntilRenewal,
      @JsonKey(name: 'is_active') required this.isActive,
      @JsonKey(name: 'is_past_due') required this.isPastDue,
      @JsonKey(name: 'player_count') required this.playerCount,
      @JsonKey(name: 'last_amount') required this.lastAmount});

  factory _$ClubSubscriptionModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ClubSubscriptionModelImplFromJson(json);

  @override
  @JsonKey(name: 'has_subscription')
  final bool hasSubscription;
  @override
  final String status;
  @override
  @JsonKey(name: 'current_period_end')
  final String currentPeriodEnd;
  @override
  @JsonKey(name: 'days_until_renewal')
  final int daysUntilRenewal;
  @override
  @JsonKey(name: 'is_active')
  final bool isActive;
  @override
  @JsonKey(name: 'is_past_due')
  final bool isPastDue;
  @override
  @JsonKey(name: 'player_count')
  final int playerCount;
  @override
  @JsonKey(name: 'last_amount')
  final double lastAmount;

  @override
  String toString() {
    return 'ClubSubscriptionModel(hasSubscription: $hasSubscription, status: $status, currentPeriodEnd: $currentPeriodEnd, daysUntilRenewal: $daysUntilRenewal, isActive: $isActive, isPastDue: $isPastDue, playerCount: $playerCount, lastAmount: $lastAmount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ClubSubscriptionModelImpl &&
            (identical(other.hasSubscription, hasSubscription) ||
                other.hasSubscription == hasSubscription) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.currentPeriodEnd, currentPeriodEnd) ||
                other.currentPeriodEnd == currentPeriodEnd) &&
            (identical(other.daysUntilRenewal, daysUntilRenewal) ||
                other.daysUntilRenewal == daysUntilRenewal) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.isPastDue, isPastDue) ||
                other.isPastDue == isPastDue) &&
            (identical(other.playerCount, playerCount) ||
                other.playerCount == playerCount) &&
            (identical(other.lastAmount, lastAmount) ||
                other.lastAmount == lastAmount));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      hasSubscription,
      status,
      currentPeriodEnd,
      daysUntilRenewal,
      isActive,
      isPastDue,
      playerCount,
      lastAmount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ClubSubscriptionModelImplCopyWith<_$ClubSubscriptionModelImpl>
      get copyWith => __$$ClubSubscriptionModelImplCopyWithImpl<
          _$ClubSubscriptionModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ClubSubscriptionModelImplToJson(
      this,
    );
  }
}

abstract class _ClubSubscriptionModel implements ClubSubscriptionModel {
  const factory _ClubSubscriptionModel(
      {@JsonKey(name: 'has_subscription') required final bool hasSubscription,
      required final String status,
      @JsonKey(name: 'current_period_end')
      required final String currentPeriodEnd,
      @JsonKey(name: 'days_until_renewal') required final int daysUntilRenewal,
      @JsonKey(name: 'is_active') required final bool isActive,
      @JsonKey(name: 'is_past_due') required final bool isPastDue,
      @JsonKey(name: 'player_count') required final int playerCount,
      @JsonKey(name: 'last_amount')
      required final double lastAmount}) = _$ClubSubscriptionModelImpl;

  factory _ClubSubscriptionModel.fromJson(Map<String, dynamic> json) =
      _$ClubSubscriptionModelImpl.fromJson;

  @override
  @JsonKey(name: 'has_subscription')
  bool get hasSubscription;
  @override
  String get status;
  @override
  @JsonKey(name: 'current_period_end')
  String get currentPeriodEnd;
  @override
  @JsonKey(name: 'days_until_renewal')
  int get daysUntilRenewal;
  @override
  @JsonKey(name: 'is_active')
  bool get isActive;
  @override
  @JsonKey(name: 'is_past_due')
  bool get isPastDue;
  @override
  @JsonKey(name: 'player_count')
  int get playerCount;
  @override
  @JsonKey(name: 'last_amount')
  double get lastAmount;
  @override
  @JsonKey(ignore: true)
  _$$ClubSubscriptionModelImplCopyWith<_$ClubSubscriptionModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

LeagueDashboardModel _$LeagueDashboardModelFromJson(Map<String, dynamic> json) {
  return _LeagueDashboardModel.fromJson(json);
}

/// @nodoc
mixin _$LeagueDashboardModel {
  String get role => throw _privateConstructorUsedError;
  String get timestamp => throw _privateConstructorUsedError;
  @JsonKey(name: 'league_info')
  Map<String, dynamic> get leagueInfo => throw _privateConstructorUsedError;
  Map<String, dynamic> get clubs => throw _privateConstructorUsedError;
  Map<String, dynamic> get players => throw _privateConstructorUsedError;
  Map<String, dynamic> get tournaments => throw _privateConstructorUsedError;
  Map<String, dynamic> get sanctions => throw _privateConstructorUsedError;
  Map<String, dynamic> get verifications => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LeagueDashboardModelCopyWith<LeagueDashboardModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LeagueDashboardModelCopyWith<$Res> {
  factory $LeagueDashboardModelCopyWith(LeagueDashboardModel value,
          $Res Function(LeagueDashboardModel) then) =
      _$LeagueDashboardModelCopyWithImpl<$Res, LeagueDashboardModel>;
  @useResult
  $Res call(
      {String role,
      String timestamp,
      @JsonKey(name: 'league_info') Map<String, dynamic> leagueInfo,
      Map<String, dynamic> clubs,
      Map<String, dynamic> players,
      Map<String, dynamic> tournaments,
      Map<String, dynamic> sanctions,
      Map<String, dynamic> verifications});
}

/// @nodoc
class _$LeagueDashboardModelCopyWithImpl<$Res,
        $Val extends LeagueDashboardModel>
    implements $LeagueDashboardModelCopyWith<$Res> {
  _$LeagueDashboardModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? role = null,
    Object? timestamp = null,
    Object? leagueInfo = null,
    Object? clubs = null,
    Object? players = null,
    Object? tournaments = null,
    Object? sanctions = null,
    Object? verifications = null,
  }) {
    return _then(_value.copyWith(
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as String,
      leagueInfo: null == leagueInfo
          ? _value.leagueInfo
          : leagueInfo // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      clubs: null == clubs
          ? _value.clubs
          : clubs // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      players: null == players
          ? _value.players
          : players // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      tournaments: null == tournaments
          ? _value.tournaments
          : tournaments // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      sanctions: null == sanctions
          ? _value.sanctions
          : sanctions // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      verifications: null == verifications
          ? _value.verifications
          : verifications // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LeagueDashboardModelImplCopyWith<$Res>
    implements $LeagueDashboardModelCopyWith<$Res> {
  factory _$$LeagueDashboardModelImplCopyWith(_$LeagueDashboardModelImpl value,
          $Res Function(_$LeagueDashboardModelImpl) then) =
      __$$LeagueDashboardModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String role,
      String timestamp,
      @JsonKey(name: 'league_info') Map<String, dynamic> leagueInfo,
      Map<String, dynamic> clubs,
      Map<String, dynamic> players,
      Map<String, dynamic> tournaments,
      Map<String, dynamic> sanctions,
      Map<String, dynamic> verifications});
}

/// @nodoc
class __$$LeagueDashboardModelImplCopyWithImpl<$Res>
    extends _$LeagueDashboardModelCopyWithImpl<$Res, _$LeagueDashboardModelImpl>
    implements _$$LeagueDashboardModelImplCopyWith<$Res> {
  __$$LeagueDashboardModelImplCopyWithImpl(_$LeagueDashboardModelImpl _value,
      $Res Function(_$LeagueDashboardModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? role = null,
    Object? timestamp = null,
    Object? leagueInfo = null,
    Object? clubs = null,
    Object? players = null,
    Object? tournaments = null,
    Object? sanctions = null,
    Object? verifications = null,
  }) {
    return _then(_$LeagueDashboardModelImpl(
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as String,
      leagueInfo: null == leagueInfo
          ? _value._leagueInfo
          : leagueInfo // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      clubs: null == clubs
          ? _value._clubs
          : clubs // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      players: null == players
          ? _value._players
          : players // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      tournaments: null == tournaments
          ? _value._tournaments
          : tournaments // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      sanctions: null == sanctions
          ? _value._sanctions
          : sanctions // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      verifications: null == verifications
          ? _value._verifications
          : verifications // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LeagueDashboardModelImpl implements _LeagueDashboardModel {
  const _$LeagueDashboardModelImpl(
      {required this.role,
      required this.timestamp,
      @JsonKey(name: 'league_info')
      required final Map<String, dynamic> leagueInfo,
      required final Map<String, dynamic> clubs,
      required final Map<String, dynamic> players,
      required final Map<String, dynamic> tournaments,
      required final Map<String, dynamic> sanctions,
      required final Map<String, dynamic> verifications})
      : _leagueInfo = leagueInfo,
        _clubs = clubs,
        _players = players,
        _tournaments = tournaments,
        _sanctions = sanctions,
        _verifications = verifications;

  factory _$LeagueDashboardModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$LeagueDashboardModelImplFromJson(json);

  @override
  final String role;
  @override
  final String timestamp;
  final Map<String, dynamic> _leagueInfo;
  @override
  @JsonKey(name: 'league_info')
  Map<String, dynamic> get leagueInfo {
    if (_leagueInfo is EqualUnmodifiableMapView) return _leagueInfo;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_leagueInfo);
  }

  final Map<String, dynamic> _clubs;
  @override
  Map<String, dynamic> get clubs {
    if (_clubs is EqualUnmodifiableMapView) return _clubs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_clubs);
  }

  final Map<String, dynamic> _players;
  @override
  Map<String, dynamic> get players {
    if (_players is EqualUnmodifiableMapView) return _players;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_players);
  }

  final Map<String, dynamic> _tournaments;
  @override
  Map<String, dynamic> get tournaments {
    if (_tournaments is EqualUnmodifiableMapView) return _tournaments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_tournaments);
  }

  final Map<String, dynamic> _sanctions;
  @override
  Map<String, dynamic> get sanctions {
    if (_sanctions is EqualUnmodifiableMapView) return _sanctions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_sanctions);
  }

  final Map<String, dynamic> _verifications;
  @override
  Map<String, dynamic> get verifications {
    if (_verifications is EqualUnmodifiableMapView) return _verifications;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_verifications);
  }

  @override
  String toString() {
    return 'LeagueDashboardModel(role: $role, timestamp: $timestamp, leagueInfo: $leagueInfo, clubs: $clubs, players: $players, tournaments: $tournaments, sanctions: $sanctions, verifications: $verifications)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LeagueDashboardModelImpl &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            const DeepCollectionEquality()
                .equals(other._leagueInfo, _leagueInfo) &&
            const DeepCollectionEquality().equals(other._clubs, _clubs) &&
            const DeepCollectionEquality().equals(other._players, _players) &&
            const DeepCollectionEquality()
                .equals(other._tournaments, _tournaments) &&
            const DeepCollectionEquality()
                .equals(other._sanctions, _sanctions) &&
            const DeepCollectionEquality()
                .equals(other._verifications, _verifications));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      role,
      timestamp,
      const DeepCollectionEquality().hash(_leagueInfo),
      const DeepCollectionEquality().hash(_clubs),
      const DeepCollectionEquality().hash(_players),
      const DeepCollectionEquality().hash(_tournaments),
      const DeepCollectionEquality().hash(_sanctions),
      const DeepCollectionEquality().hash(_verifications));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LeagueDashboardModelImplCopyWith<_$LeagueDashboardModelImpl>
      get copyWith =>
          __$$LeagueDashboardModelImplCopyWithImpl<_$LeagueDashboardModelImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LeagueDashboardModelImplToJson(
      this,
    );
  }
}

abstract class _LeagueDashboardModel implements LeagueDashboardModel {
  const factory _LeagueDashboardModel(
          {required final String role,
          required final String timestamp,
          @JsonKey(name: 'league_info')
          required final Map<String, dynamic> leagueInfo,
          required final Map<String, dynamic> clubs,
          required final Map<String, dynamic> players,
          required final Map<String, dynamic> tournaments,
          required final Map<String, dynamic> sanctions,
          required final Map<String, dynamic> verifications}) =
      _$LeagueDashboardModelImpl;

  factory _LeagueDashboardModel.fromJson(Map<String, dynamic> json) =
      _$LeagueDashboardModelImpl.fromJson;

  @override
  String get role;
  @override
  String get timestamp;
  @override
  @JsonKey(name: 'league_info')
  Map<String, dynamic> get leagueInfo;
  @override
  Map<String, dynamic> get clubs;
  @override
  Map<String, dynamic> get players;
  @override
  Map<String, dynamic> get tournaments;
  @override
  Map<String, dynamic> get sanctions;
  @override
  Map<String, dynamic> get verifications;
  @override
  @JsonKey(ignore: true)
  _$$LeagueDashboardModelImplCopyWith<_$LeagueDashboardModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

VerifierDashboardModel _$VerifierDashboardModelFromJson(
    Map<String, dynamic> json) {
  return _VerifierDashboardModel.fromJson(json);
}

/// @nodoc
mixin _$VerifierDashboardModel {
  String get role => throw _privateConstructorUsedError;
  String get timestamp => throw _privateConstructorUsedError;
  @JsonKey(name: 'verifier_stats')
  VerifierStatsModel get verifierStats => throw _privateConstructorUsedError;
  @JsonKey(name: 'recent_verifications')
  List<RecentVerificationModel>? get recentVerifications =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VerifierDashboardModelCopyWith<VerifierDashboardModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VerifierDashboardModelCopyWith<$Res> {
  factory $VerifierDashboardModelCopyWith(VerifierDashboardModel value,
          $Res Function(VerifierDashboardModel) then) =
      _$VerifierDashboardModelCopyWithImpl<$Res, VerifierDashboardModel>;
  @useResult
  $Res call(
      {String role,
      String timestamp,
      @JsonKey(name: 'verifier_stats') VerifierStatsModel verifierStats,
      @JsonKey(name: 'recent_verifications')
      List<RecentVerificationModel>? recentVerifications});

  $VerifierStatsModelCopyWith<$Res> get verifierStats;
}

/// @nodoc
class _$VerifierDashboardModelCopyWithImpl<$Res,
        $Val extends VerifierDashboardModel>
    implements $VerifierDashboardModelCopyWith<$Res> {
  _$VerifierDashboardModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? role = null,
    Object? timestamp = null,
    Object? verifierStats = null,
    Object? recentVerifications = freezed,
  }) {
    return _then(_value.copyWith(
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as String,
      verifierStats: null == verifierStats
          ? _value.verifierStats
          : verifierStats // ignore: cast_nullable_to_non_nullable
              as VerifierStatsModel,
      recentVerifications: freezed == recentVerifications
          ? _value.recentVerifications
          : recentVerifications // ignore: cast_nullable_to_non_nullable
              as List<RecentVerificationModel>?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $VerifierStatsModelCopyWith<$Res> get verifierStats {
    return $VerifierStatsModelCopyWith<$Res>(_value.verifierStats, (value) {
      return _then(_value.copyWith(verifierStats: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$VerifierDashboardModelImplCopyWith<$Res>
    implements $VerifierDashboardModelCopyWith<$Res> {
  factory _$$VerifierDashboardModelImplCopyWith(
          _$VerifierDashboardModelImpl value,
          $Res Function(_$VerifierDashboardModelImpl) then) =
      __$$VerifierDashboardModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String role,
      String timestamp,
      @JsonKey(name: 'verifier_stats') VerifierStatsModel verifierStats,
      @JsonKey(name: 'recent_verifications')
      List<RecentVerificationModel>? recentVerifications});

  @override
  $VerifierStatsModelCopyWith<$Res> get verifierStats;
}

/// @nodoc
class __$$VerifierDashboardModelImplCopyWithImpl<$Res>
    extends _$VerifierDashboardModelCopyWithImpl<$Res,
        _$VerifierDashboardModelImpl>
    implements _$$VerifierDashboardModelImplCopyWith<$Res> {
  __$$VerifierDashboardModelImplCopyWithImpl(
      _$VerifierDashboardModelImpl _value,
      $Res Function(_$VerifierDashboardModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? role = null,
    Object? timestamp = null,
    Object? verifierStats = null,
    Object? recentVerifications = freezed,
  }) {
    return _then(_$VerifierDashboardModelImpl(
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as String,
      verifierStats: null == verifierStats
          ? _value.verifierStats
          : verifierStats // ignore: cast_nullable_to_non_nullable
              as VerifierStatsModel,
      recentVerifications: freezed == recentVerifications
          ? _value._recentVerifications
          : recentVerifications // ignore: cast_nullable_to_non_nullable
              as List<RecentVerificationModel>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VerifierDashboardModelImpl implements _VerifierDashboardModel {
  const _$VerifierDashboardModelImpl(
      {required this.role,
      required this.timestamp,
      @JsonKey(name: 'verifier_stats') required this.verifierStats,
      @JsonKey(name: 'recent_verifications')
      final List<RecentVerificationModel>? recentVerifications})
      : _recentVerifications = recentVerifications;

  factory _$VerifierDashboardModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$VerifierDashboardModelImplFromJson(json);

  @override
  final String role;
  @override
  final String timestamp;
  @override
  @JsonKey(name: 'verifier_stats')
  final VerifierStatsModel verifierStats;
  final List<RecentVerificationModel>? _recentVerifications;
  @override
  @JsonKey(name: 'recent_verifications')
  List<RecentVerificationModel>? get recentVerifications {
    final value = _recentVerifications;
    if (value == null) return null;
    if (_recentVerifications is EqualUnmodifiableListView)
      return _recentVerifications;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'VerifierDashboardModel(role: $role, timestamp: $timestamp, verifierStats: $verifierStats, recentVerifications: $recentVerifications)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VerifierDashboardModelImpl &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.verifierStats, verifierStats) ||
                other.verifierStats == verifierStats) &&
            const DeepCollectionEquality()
                .equals(other._recentVerifications, _recentVerifications));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, role, timestamp, verifierStats,
      const DeepCollectionEquality().hash(_recentVerifications));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$VerifierDashboardModelImplCopyWith<_$VerifierDashboardModelImpl>
      get copyWith => __$$VerifierDashboardModelImplCopyWithImpl<
          _$VerifierDashboardModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VerifierDashboardModelImplToJson(
      this,
    );
  }
}

abstract class _VerifierDashboardModel implements VerifierDashboardModel {
  const factory _VerifierDashboardModel(
          {required final String role,
          required final String timestamp,
          @JsonKey(name: 'verifier_stats')
          required final VerifierStatsModel verifierStats,
          @JsonKey(name: 'recent_verifications')
          final List<RecentVerificationModel>? recentVerifications}) =
      _$VerifierDashboardModelImpl;

  factory _VerifierDashboardModel.fromJson(Map<String, dynamic> json) =
      _$VerifierDashboardModelImpl.fromJson;

  @override
  String get role;
  @override
  String get timestamp;
  @override
  @JsonKey(name: 'verifier_stats')
  VerifierStatsModel get verifierStats;
  @override
  @JsonKey(name: 'recent_verifications')
  List<RecentVerificationModel>? get recentVerifications;
  @override
  @JsonKey(ignore: true)
  _$$VerifierDashboardModelImplCopyWith<_$VerifierDashboardModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

VerifierStatsModel _$VerifierStatsModelFromJson(Map<String, dynamic> json) {
  return _VerifierStatsModel.fromJson(json);
}

/// @nodoc
mixin _$VerifierStatsModel {
  @JsonKey(name: 'total_verifications')
  int get totalVerifications => throw _privateConstructorUsedError;
  @JsonKey(name: 'today_verifications')
  int get todayVerifications => throw _privateConstructorUsedError;
  @JsonKey(name: 'this_week_verifications')
  int get thisWeekVerifications => throw _privateConstructorUsedError;
  @JsonKey(name: 'this_month_verifications')
  int get thisMonthVerifications => throw _privateConstructorUsedError;
  @JsonKey(name: 'average_per_session')
  double get averagePerSession => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_sessions')
  int get totalSessions => throw _privateConstructorUsedError;
  @JsonKey(name: 'unique_players_verified')
  int get uniquePlayersVerified => throw _privateConstructorUsedError;
  @JsonKey(name: 'weekly_verifications')
  Map<String, int>? get weeklyVerifications =>
      throw _privateConstructorUsedError;
  TrendDataModel? get trend => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VerifierStatsModelCopyWith<VerifierStatsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VerifierStatsModelCopyWith<$Res> {
  factory $VerifierStatsModelCopyWith(
          VerifierStatsModel value, $Res Function(VerifierStatsModel) then) =
      _$VerifierStatsModelCopyWithImpl<$Res, VerifierStatsModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'total_verifications') int totalVerifications,
      @JsonKey(name: 'today_verifications') int todayVerifications,
      @JsonKey(name: 'this_week_verifications') int thisWeekVerifications,
      @JsonKey(name: 'this_month_verifications') int thisMonthVerifications,
      @JsonKey(name: 'average_per_session') double averagePerSession,
      @JsonKey(name: 'total_sessions') int totalSessions,
      @JsonKey(name: 'unique_players_verified') int uniquePlayersVerified,
      @JsonKey(name: 'weekly_verifications')
      Map<String, int>? weeklyVerifications,
      TrendDataModel? trend});

  $TrendDataModelCopyWith<$Res>? get trend;
}

/// @nodoc
class _$VerifierStatsModelCopyWithImpl<$Res, $Val extends VerifierStatsModel>
    implements $VerifierStatsModelCopyWith<$Res> {
  _$VerifierStatsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalVerifications = null,
    Object? todayVerifications = null,
    Object? thisWeekVerifications = null,
    Object? thisMonthVerifications = null,
    Object? averagePerSession = null,
    Object? totalSessions = null,
    Object? uniquePlayersVerified = null,
    Object? weeklyVerifications = freezed,
    Object? trend = freezed,
  }) {
    return _then(_value.copyWith(
      totalVerifications: null == totalVerifications
          ? _value.totalVerifications
          : totalVerifications // ignore: cast_nullable_to_non_nullable
              as int,
      todayVerifications: null == todayVerifications
          ? _value.todayVerifications
          : todayVerifications // ignore: cast_nullable_to_non_nullable
              as int,
      thisWeekVerifications: null == thisWeekVerifications
          ? _value.thisWeekVerifications
          : thisWeekVerifications // ignore: cast_nullable_to_non_nullable
              as int,
      thisMonthVerifications: null == thisMonthVerifications
          ? _value.thisMonthVerifications
          : thisMonthVerifications // ignore: cast_nullable_to_non_nullable
              as int,
      averagePerSession: null == averagePerSession
          ? _value.averagePerSession
          : averagePerSession // ignore: cast_nullable_to_non_nullable
              as double,
      totalSessions: null == totalSessions
          ? _value.totalSessions
          : totalSessions // ignore: cast_nullable_to_non_nullable
              as int,
      uniquePlayersVerified: null == uniquePlayersVerified
          ? _value.uniquePlayersVerified
          : uniquePlayersVerified // ignore: cast_nullable_to_non_nullable
              as int,
      weeklyVerifications: freezed == weeklyVerifications
          ? _value.weeklyVerifications
          : weeklyVerifications // ignore: cast_nullable_to_non_nullable
              as Map<String, int>?,
      trend: freezed == trend
          ? _value.trend
          : trend // ignore: cast_nullable_to_non_nullable
              as TrendDataModel?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $TrendDataModelCopyWith<$Res>? get trend {
    if (_value.trend == null) {
      return null;
    }

    return $TrendDataModelCopyWith<$Res>(_value.trend!, (value) {
      return _then(_value.copyWith(trend: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$VerifierStatsModelImplCopyWith<$Res>
    implements $VerifierStatsModelCopyWith<$Res> {
  factory _$$VerifierStatsModelImplCopyWith(_$VerifierStatsModelImpl value,
          $Res Function(_$VerifierStatsModelImpl) then) =
      __$$VerifierStatsModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'total_verifications') int totalVerifications,
      @JsonKey(name: 'today_verifications') int todayVerifications,
      @JsonKey(name: 'this_week_verifications') int thisWeekVerifications,
      @JsonKey(name: 'this_month_verifications') int thisMonthVerifications,
      @JsonKey(name: 'average_per_session') double averagePerSession,
      @JsonKey(name: 'total_sessions') int totalSessions,
      @JsonKey(name: 'unique_players_verified') int uniquePlayersVerified,
      @JsonKey(name: 'weekly_verifications')
      Map<String, int>? weeklyVerifications,
      TrendDataModel? trend});

  @override
  $TrendDataModelCopyWith<$Res>? get trend;
}

/// @nodoc
class __$$VerifierStatsModelImplCopyWithImpl<$Res>
    extends _$VerifierStatsModelCopyWithImpl<$Res, _$VerifierStatsModelImpl>
    implements _$$VerifierStatsModelImplCopyWith<$Res> {
  __$$VerifierStatsModelImplCopyWithImpl(_$VerifierStatsModelImpl _value,
      $Res Function(_$VerifierStatsModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalVerifications = null,
    Object? todayVerifications = null,
    Object? thisWeekVerifications = null,
    Object? thisMonthVerifications = null,
    Object? averagePerSession = null,
    Object? totalSessions = null,
    Object? uniquePlayersVerified = null,
    Object? weeklyVerifications = freezed,
    Object? trend = freezed,
  }) {
    return _then(_$VerifierStatsModelImpl(
      totalVerifications: null == totalVerifications
          ? _value.totalVerifications
          : totalVerifications // ignore: cast_nullable_to_non_nullable
              as int,
      todayVerifications: null == todayVerifications
          ? _value.todayVerifications
          : todayVerifications // ignore: cast_nullable_to_non_nullable
              as int,
      thisWeekVerifications: null == thisWeekVerifications
          ? _value.thisWeekVerifications
          : thisWeekVerifications // ignore: cast_nullable_to_non_nullable
              as int,
      thisMonthVerifications: null == thisMonthVerifications
          ? _value.thisMonthVerifications
          : thisMonthVerifications // ignore: cast_nullable_to_non_nullable
              as int,
      averagePerSession: null == averagePerSession
          ? _value.averagePerSession
          : averagePerSession // ignore: cast_nullable_to_non_nullable
              as double,
      totalSessions: null == totalSessions
          ? _value.totalSessions
          : totalSessions // ignore: cast_nullable_to_non_nullable
              as int,
      uniquePlayersVerified: null == uniquePlayersVerified
          ? _value.uniquePlayersVerified
          : uniquePlayersVerified // ignore: cast_nullable_to_non_nullable
              as int,
      weeklyVerifications: freezed == weeklyVerifications
          ? _value._weeklyVerifications
          : weeklyVerifications // ignore: cast_nullable_to_non_nullable
              as Map<String, int>?,
      trend: freezed == trend
          ? _value.trend
          : trend // ignore: cast_nullable_to_non_nullable
              as TrendDataModel?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VerifierStatsModelImpl implements _VerifierStatsModel {
  const _$VerifierStatsModelImpl(
      {@JsonKey(name: 'total_verifications') required this.totalVerifications,
      @JsonKey(name: 'today_verifications') required this.todayVerifications,
      @JsonKey(name: 'this_week_verifications')
      required this.thisWeekVerifications,
      @JsonKey(name: 'this_month_verifications')
      required this.thisMonthVerifications,
      @JsonKey(name: 'average_per_session') required this.averagePerSession,
      @JsonKey(name: 'total_sessions') required this.totalSessions,
      @JsonKey(name: 'unique_players_verified')
      required this.uniquePlayersVerified,
      @JsonKey(name: 'weekly_verifications')
      final Map<String, int>? weeklyVerifications,
      this.trend})
      : _weeklyVerifications = weeklyVerifications;

  factory _$VerifierStatsModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$VerifierStatsModelImplFromJson(json);

  @override
  @JsonKey(name: 'total_verifications')
  final int totalVerifications;
  @override
  @JsonKey(name: 'today_verifications')
  final int todayVerifications;
  @override
  @JsonKey(name: 'this_week_verifications')
  final int thisWeekVerifications;
  @override
  @JsonKey(name: 'this_month_verifications')
  final int thisMonthVerifications;
  @override
  @JsonKey(name: 'average_per_session')
  final double averagePerSession;
  @override
  @JsonKey(name: 'total_sessions')
  final int totalSessions;
  @override
  @JsonKey(name: 'unique_players_verified')
  final int uniquePlayersVerified;
  final Map<String, int>? _weeklyVerifications;
  @override
  @JsonKey(name: 'weekly_verifications')
  Map<String, int>? get weeklyVerifications {
    final value = _weeklyVerifications;
    if (value == null) return null;
    if (_weeklyVerifications is EqualUnmodifiableMapView)
      return _weeklyVerifications;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  final TrendDataModel? trend;

  @override
  String toString() {
    return 'VerifierStatsModel(totalVerifications: $totalVerifications, todayVerifications: $todayVerifications, thisWeekVerifications: $thisWeekVerifications, thisMonthVerifications: $thisMonthVerifications, averagePerSession: $averagePerSession, totalSessions: $totalSessions, uniquePlayersVerified: $uniquePlayersVerified, weeklyVerifications: $weeklyVerifications, trend: $trend)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VerifierStatsModelImpl &&
            (identical(other.totalVerifications, totalVerifications) ||
                other.totalVerifications == totalVerifications) &&
            (identical(other.todayVerifications, todayVerifications) ||
                other.todayVerifications == todayVerifications) &&
            (identical(other.thisWeekVerifications, thisWeekVerifications) ||
                other.thisWeekVerifications == thisWeekVerifications) &&
            (identical(other.thisMonthVerifications, thisMonthVerifications) ||
                other.thisMonthVerifications == thisMonthVerifications) &&
            (identical(other.averagePerSession, averagePerSession) ||
                other.averagePerSession == averagePerSession) &&
            (identical(other.totalSessions, totalSessions) ||
                other.totalSessions == totalSessions) &&
            (identical(other.uniquePlayersVerified, uniquePlayersVerified) ||
                other.uniquePlayersVerified == uniquePlayersVerified) &&
            const DeepCollectionEquality()
                .equals(other._weeklyVerifications, _weeklyVerifications) &&
            (identical(other.trend, trend) || other.trend == trend));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      totalVerifications,
      todayVerifications,
      thisWeekVerifications,
      thisMonthVerifications,
      averagePerSession,
      totalSessions,
      uniquePlayersVerified,
      const DeepCollectionEquality().hash(_weeklyVerifications),
      trend);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$VerifierStatsModelImplCopyWith<_$VerifierStatsModelImpl> get copyWith =>
      __$$VerifierStatsModelImplCopyWithImpl<_$VerifierStatsModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VerifierStatsModelImplToJson(
      this,
    );
  }
}

abstract class _VerifierStatsModel implements VerifierStatsModel {
  const factory _VerifierStatsModel(
      {@JsonKey(name: 'total_verifications')
      required final int totalVerifications,
      @JsonKey(name: 'today_verifications')
      required final int todayVerifications,
      @JsonKey(name: 'this_week_verifications')
      required final int thisWeekVerifications,
      @JsonKey(name: 'this_month_verifications')
      required final int thisMonthVerifications,
      @JsonKey(name: 'average_per_session')
      required final double averagePerSession,
      @JsonKey(name: 'total_sessions') required final int totalSessions,
      @JsonKey(name: 'unique_players_verified')
      required final int uniquePlayersVerified,
      @JsonKey(name: 'weekly_verifications')
      final Map<String, int>? weeklyVerifications,
      final TrendDataModel? trend}) = _$VerifierStatsModelImpl;

  factory _VerifierStatsModel.fromJson(Map<String, dynamic> json) =
      _$VerifierStatsModelImpl.fromJson;

  @override
  @JsonKey(name: 'total_verifications')
  int get totalVerifications;
  @override
  @JsonKey(name: 'today_verifications')
  int get todayVerifications;
  @override
  @JsonKey(name: 'this_week_verifications')
  int get thisWeekVerifications;
  @override
  @JsonKey(name: 'this_month_verifications')
  int get thisMonthVerifications;
  @override
  @JsonKey(name: 'average_per_session')
  double get averagePerSession;
  @override
  @JsonKey(name: 'total_sessions')
  int get totalSessions;
  @override
  @JsonKey(name: 'unique_players_verified')
  int get uniquePlayersVerified;
  @override
  @JsonKey(name: 'weekly_verifications')
  Map<String, int>? get weeklyVerifications;
  @override
  TrendDataModel? get trend;
  @override
  @JsonKey(ignore: true)
  _$$VerifierStatsModelImplCopyWith<_$VerifierStatsModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TrendDataModel _$TrendDataModelFromJson(Map<String, dynamic> json) {
  return _TrendDataModel.fromJson(json);
}

/// @nodoc
mixin _$TrendDataModel {
  @JsonKey(name: 'percentage_change')
  double get percentageChange => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_positive')
  bool get isPositive => throw _privateConstructorUsedError;
  @JsonKey(name: 'comparison_period')
  String get comparisonPeriod => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TrendDataModelCopyWith<TrendDataModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TrendDataModelCopyWith<$Res> {
  factory $TrendDataModelCopyWith(
          TrendDataModel value, $Res Function(TrendDataModel) then) =
      _$TrendDataModelCopyWithImpl<$Res, TrendDataModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'percentage_change') double percentageChange,
      @JsonKey(name: 'is_positive') bool isPositive,
      @JsonKey(name: 'comparison_period') String comparisonPeriod});
}

/// @nodoc
class _$TrendDataModelCopyWithImpl<$Res, $Val extends TrendDataModel>
    implements $TrendDataModelCopyWith<$Res> {
  _$TrendDataModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? percentageChange = null,
    Object? isPositive = null,
    Object? comparisonPeriod = null,
  }) {
    return _then(_value.copyWith(
      percentageChange: null == percentageChange
          ? _value.percentageChange
          : percentageChange // ignore: cast_nullable_to_non_nullable
              as double,
      isPositive: null == isPositive
          ? _value.isPositive
          : isPositive // ignore: cast_nullable_to_non_nullable
              as bool,
      comparisonPeriod: null == comparisonPeriod
          ? _value.comparisonPeriod
          : comparisonPeriod // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TrendDataModelImplCopyWith<$Res>
    implements $TrendDataModelCopyWith<$Res> {
  factory _$$TrendDataModelImplCopyWith(_$TrendDataModelImpl value,
          $Res Function(_$TrendDataModelImpl) then) =
      __$$TrendDataModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'percentage_change') double percentageChange,
      @JsonKey(name: 'is_positive') bool isPositive,
      @JsonKey(name: 'comparison_period') String comparisonPeriod});
}

/// @nodoc
class __$$TrendDataModelImplCopyWithImpl<$Res>
    extends _$TrendDataModelCopyWithImpl<$Res, _$TrendDataModelImpl>
    implements _$$TrendDataModelImplCopyWith<$Res> {
  __$$TrendDataModelImplCopyWithImpl(
      _$TrendDataModelImpl _value, $Res Function(_$TrendDataModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? percentageChange = null,
    Object? isPositive = null,
    Object? comparisonPeriod = null,
  }) {
    return _then(_$TrendDataModelImpl(
      percentageChange: null == percentageChange
          ? _value.percentageChange
          : percentageChange // ignore: cast_nullable_to_non_nullable
              as double,
      isPositive: null == isPositive
          ? _value.isPositive
          : isPositive // ignore: cast_nullable_to_non_nullable
              as bool,
      comparisonPeriod: null == comparisonPeriod
          ? _value.comparisonPeriod
          : comparisonPeriod // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TrendDataModelImpl implements _TrendDataModel {
  const _$TrendDataModelImpl(
      {@JsonKey(name: 'percentage_change') required this.percentageChange,
      @JsonKey(name: 'is_positive') required this.isPositive,
      @JsonKey(name: 'comparison_period') required this.comparisonPeriod});

  factory _$TrendDataModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$TrendDataModelImplFromJson(json);

  @override
  @JsonKey(name: 'percentage_change')
  final double percentageChange;
  @override
  @JsonKey(name: 'is_positive')
  final bool isPositive;
  @override
  @JsonKey(name: 'comparison_period')
  final String comparisonPeriod;

  @override
  String toString() {
    return 'TrendDataModel(percentageChange: $percentageChange, isPositive: $isPositive, comparisonPeriod: $comparisonPeriod)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TrendDataModelImpl &&
            (identical(other.percentageChange, percentageChange) ||
                other.percentageChange == percentageChange) &&
            (identical(other.isPositive, isPositive) ||
                other.isPositive == isPositive) &&
            (identical(other.comparisonPeriod, comparisonPeriod) ||
                other.comparisonPeriod == comparisonPeriod));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, percentageChange, isPositive, comparisonPeriod);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TrendDataModelImplCopyWith<_$TrendDataModelImpl> get copyWith =>
      __$$TrendDataModelImplCopyWithImpl<_$TrendDataModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TrendDataModelImplToJson(
      this,
    );
  }
}

abstract class _TrendDataModel implements TrendDataModel {
  const factory _TrendDataModel(
      {@JsonKey(name: 'percentage_change')
      required final double percentageChange,
      @JsonKey(name: 'is_positive') required final bool isPositive,
      @JsonKey(name: 'comparison_period')
      required final String comparisonPeriod}) = _$TrendDataModelImpl;

  factory _TrendDataModel.fromJson(Map<String, dynamic> json) =
      _$TrendDataModelImpl.fromJson;

  @override
  @JsonKey(name: 'percentage_change')
  double get percentageChange;
  @override
  @JsonKey(name: 'is_positive')
  bool get isPositive;
  @override
  @JsonKey(name: 'comparison_period')
  String get comparisonPeriod;
  @override
  @JsonKey(ignore: true)
  _$$TrendDataModelImplCopyWith<_$TrendDataModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

RecentVerificationModel _$RecentVerificationModelFromJson(
    Map<String, dynamic> json) {
  return _RecentVerificationModel.fromJson(json);
}

/// @nodoc
mixin _$RecentVerificationModel {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'player_name')
  String get playerName => throw _privateConstructorUsedError;
  @JsonKey(name: 'player_photo')
  String? get playerPhoto => throw _privateConstructorUsedError;
  @JsonKey(name: 'was_eligible')
  bool get wasEligible => throw _privateConstructorUsedError;
  @JsonKey(name: 'verified_at')
  String get verifiedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'match_info')
  String? get matchInfo => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RecentVerificationModelCopyWith<RecentVerificationModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecentVerificationModelCopyWith<$Res> {
  factory $RecentVerificationModelCopyWith(RecentVerificationModel value,
          $Res Function(RecentVerificationModel) then) =
      _$RecentVerificationModelCopyWithImpl<$Res, RecentVerificationModel>;
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'player_name') String playerName,
      @JsonKey(name: 'player_photo') String? playerPhoto,
      @JsonKey(name: 'was_eligible') bool wasEligible,
      @JsonKey(name: 'verified_at') String verifiedAt,
      @JsonKey(name: 'match_info') String? matchInfo});
}

/// @nodoc
class _$RecentVerificationModelCopyWithImpl<$Res,
        $Val extends RecentVerificationModel>
    implements $RecentVerificationModelCopyWith<$Res> {
  _$RecentVerificationModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? playerName = null,
    Object? playerPhoto = freezed,
    Object? wasEligible = null,
    Object? verifiedAt = null,
    Object? matchInfo = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      playerName: null == playerName
          ? _value.playerName
          : playerName // ignore: cast_nullable_to_non_nullable
              as String,
      playerPhoto: freezed == playerPhoto
          ? _value.playerPhoto
          : playerPhoto // ignore: cast_nullable_to_non_nullable
              as String?,
      wasEligible: null == wasEligible
          ? _value.wasEligible
          : wasEligible // ignore: cast_nullable_to_non_nullable
              as bool,
      verifiedAt: null == verifiedAt
          ? _value.verifiedAt
          : verifiedAt // ignore: cast_nullable_to_non_nullable
              as String,
      matchInfo: freezed == matchInfo
          ? _value.matchInfo
          : matchInfo // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RecentVerificationModelImplCopyWith<$Res>
    implements $RecentVerificationModelCopyWith<$Res> {
  factory _$$RecentVerificationModelImplCopyWith(
          _$RecentVerificationModelImpl value,
          $Res Function(_$RecentVerificationModelImpl) then) =
      __$$RecentVerificationModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'player_name') String playerName,
      @JsonKey(name: 'player_photo') String? playerPhoto,
      @JsonKey(name: 'was_eligible') bool wasEligible,
      @JsonKey(name: 'verified_at') String verifiedAt,
      @JsonKey(name: 'match_info') String? matchInfo});
}

/// @nodoc
class __$$RecentVerificationModelImplCopyWithImpl<$Res>
    extends _$RecentVerificationModelCopyWithImpl<$Res,
        _$RecentVerificationModelImpl>
    implements _$$RecentVerificationModelImplCopyWith<$Res> {
  __$$RecentVerificationModelImplCopyWithImpl(
      _$RecentVerificationModelImpl _value,
      $Res Function(_$RecentVerificationModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? playerName = null,
    Object? playerPhoto = freezed,
    Object? wasEligible = null,
    Object? verifiedAt = null,
    Object? matchInfo = freezed,
  }) {
    return _then(_$RecentVerificationModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      playerName: null == playerName
          ? _value.playerName
          : playerName // ignore: cast_nullable_to_non_nullable
              as String,
      playerPhoto: freezed == playerPhoto
          ? _value.playerPhoto
          : playerPhoto // ignore: cast_nullable_to_non_nullable
              as String?,
      wasEligible: null == wasEligible
          ? _value.wasEligible
          : wasEligible // ignore: cast_nullable_to_non_nullable
              as bool,
      verifiedAt: null == verifiedAt
          ? _value.verifiedAt
          : verifiedAt // ignore: cast_nullable_to_non_nullable
              as String,
      matchInfo: freezed == matchInfo
          ? _value.matchInfo
          : matchInfo // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RecentVerificationModelImpl implements _RecentVerificationModel {
  const _$RecentVerificationModelImpl(
      {required this.id,
      @JsonKey(name: 'player_name') required this.playerName,
      @JsonKey(name: 'player_photo') this.playerPhoto,
      @JsonKey(name: 'was_eligible') required this.wasEligible,
      @JsonKey(name: 'verified_at') required this.verifiedAt,
      @JsonKey(name: 'match_info') this.matchInfo});

  factory _$RecentVerificationModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$RecentVerificationModelImplFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'player_name')
  final String playerName;
  @override
  @JsonKey(name: 'player_photo')
  final String? playerPhoto;
  @override
  @JsonKey(name: 'was_eligible')
  final bool wasEligible;
  @override
  @JsonKey(name: 'verified_at')
  final String verifiedAt;
  @override
  @JsonKey(name: 'match_info')
  final String? matchInfo;

  @override
  String toString() {
    return 'RecentVerificationModel(id: $id, playerName: $playerName, playerPhoto: $playerPhoto, wasEligible: $wasEligible, verifiedAt: $verifiedAt, matchInfo: $matchInfo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecentVerificationModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.playerName, playerName) ||
                other.playerName == playerName) &&
            (identical(other.playerPhoto, playerPhoto) ||
                other.playerPhoto == playerPhoto) &&
            (identical(other.wasEligible, wasEligible) ||
                other.wasEligible == wasEligible) &&
            (identical(other.verifiedAt, verifiedAt) ||
                other.verifiedAt == verifiedAt) &&
            (identical(other.matchInfo, matchInfo) ||
                other.matchInfo == matchInfo));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, playerName, playerPhoto,
      wasEligible, verifiedAt, matchInfo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RecentVerificationModelImplCopyWith<_$RecentVerificationModelImpl>
      get copyWith => __$$RecentVerificationModelImplCopyWithImpl<
          _$RecentVerificationModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RecentVerificationModelImplToJson(
      this,
    );
  }
}

abstract class _RecentVerificationModel implements RecentVerificationModel {
  const factory _RecentVerificationModel(
          {required final int id,
          @JsonKey(name: 'player_name') required final String playerName,
          @JsonKey(name: 'player_photo') final String? playerPhoto,
          @JsonKey(name: 'was_eligible') required final bool wasEligible,
          @JsonKey(name: 'verified_at') required final String verifiedAt,
          @JsonKey(name: 'match_info') final String? matchInfo}) =
      _$RecentVerificationModelImpl;

  factory _RecentVerificationModel.fromJson(Map<String, dynamic> json) =
      _$RecentVerificationModelImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'player_name')
  String get playerName;
  @override
  @JsonKey(name: 'player_photo')
  String? get playerPhoto;
  @override
  @JsonKey(name: 'was_eligible')
  bool get wasEligible;
  @override
  @JsonKey(name: 'verified_at')
  String get verifiedAt;
  @override
  @JsonKey(name: 'match_info')
  String? get matchInfo;
  @override
  @JsonKey(ignore: true)
  _$$RecentVerificationModelImplCopyWith<_$RecentVerificationModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
