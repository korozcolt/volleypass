# Arquitectura Técnica - VolleyPass Mobile

> **Versión:** 1.0.0
> **Fecha:** Diciembre 26, 2024
> **Framework:** Flutter 3.10+

---

## 📋 Tabla de Contenidos

1. [Principios Arquitectónicos](#principios-arquitectónicos)
2. [Clean Architecture](#clean-architecture)
3. [Estructura de Capas](#estructura-de-capas)
4. [Gestión de Estado](#gestión-de-estado)
5. [Networking](#networking)
6. [Almacenamiento](#almacenamiento)
7. [Autenticación](#autenticación)
8. [Modo Offline](#modo-offline)
9. [Dependencias](#dependencias)
10. [Patrones de Diseño](#patrones-de-diseño)

---

## 🎯 Principios Arquitectónicos

### 1. Separation of Concerns (SoC)
Cada módulo tiene una responsabilidad única y bien definida.

### 2. Dependency Inversion (DIP)
Las capas de alto nivel no dependen de las de bajo nivel. Ambas dependen de abstracciones.

### 3. Single Responsibility (SRP)
Una clase debe tener solo una razón para cambiar.

### 4. Open/Closed Principle (OCP)
Abierto para extensión, cerrado para modificación.

### 5. Interface Segregation (ISP)
Muchas interfaces específicas son mejores que una interfaz general.

---

## 🏛️ Clean Architecture

### Diagrama de Capas

```
┌─────────────────────────────────────────────────┐
│                 PRESENTATION                     │
│  (UI, Widgets, Pages, State Management)         │
│  Dependencies: Domain                            │
└─────────────────────────────────────────────────┘
                        ↓
┌─────────────────────────────────────────────────┐
│                   DOMAIN                         │
│  (Entities, Use Cases, Repository Interfaces)   │
│  Dependencies: None (Pure Dart)                 │
└─────────────────────────────────────────────────┘
                        ↓
┌─────────────────────────────────────────────────┐
│                    DATA                          │
│  (Models, Repository Impl, Data Sources)        │
│  Dependencies: Domain                            │
└─────────────────────────────────────────────────┘
                        ↓
┌─────────────────────────────────────────────────┐
│                  EXTERNAL                        │
│  (API, Database, Shared Preferences, etc)       │
└─────────────────────────────────────────────────┘
```

### Flujo de Datos

**Request Flow (UI → API):**
```
Widget → Provider/Bloc → UseCase → Repository Interface
  → Repository Implementation → DataSource → API Client → Backend
```

**Response Flow (API → UI):**
```
Backend → API Client → DataSource → Repository Implementation
  → Repository Interface → UseCase → Provider/Bloc → Widget
```

---

## 📚 Estructura de Capas

### Capa de Presentación (Presentation Layer)

**Responsabilidades:**
- Renderizar UI
- Capturar interacciones del usuario
- Manejar estado de UI
- Navegación

**Componentes:**
```dart
// lib/features/auth/presentation/

├── pages/
│   ├── login_page.dart              // Pantalla completa
│   └── splash_page.dart
│
├── widgets/
│   ├── login_form.dart              // Componentes de UI
│   └── auth_error_message.dart
│
├── providers/
│   ├── auth_provider.dart           // Riverpod providers
│   └── auth_state.dart
│
└── state/
    └── auth_state.freezed.dart      // Estados inmutables
```

**Ejemplo de Page:**
```dart
class LoginPage extends ConsumerWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authProvider);

    return Scaffold(
      body: authState.when(
        initial: () => const LoginForm(),
        loading: () => const LoadingIndicator(),
        authenticated: (user) => const DashboardPage(),
        error: (message) => ErrorMessage(message: message),
      ),
    );
  }
}
```

---

### Capa de Dominio (Domain Layer)

**Responsabilidades:**
- Definir reglas de negocio
- Definir entidades
- Definir interfaces de repositorios
- Casos de uso

**Componentes:**
```dart
// lib/features/auth/domain/

├── entities/
│   ├── user.dart                    // Entidades de negocio
│   └── auth_token.dart
│
├── repositories/
│   └── auth_repository.dart         // Interfaces (abstract)
│
└── usecases/
    ├── login_usecase.dart           // Casos de uso
    ├── logout_usecase.dart
    └── get_current_user_usecase.dart
```

**Ejemplo de Entity:**
```dart
// lib/features/auth/domain/entities/user.dart

class User {
  final int id;
  final String name;
  final String email;
  final List<String> roles;
  final List<String> abilities;
  final UserProfile? profile;

  const User({
    required this.id,
    required this.name,
    required this.email,
    required this.roles,
    required this.abilities,
    this.profile,
  });

  bool hasRole(String role) => roles.contains(role);
  bool hasAbility(String ability) => abilities.contains(ability);
}
```

**Ejemplo de Repository Interface:**
```dart
// lib/features/auth/domain/repositories/auth_repository.dart

abstract class AuthRepository {
  Future<Either<Failure, User>> login({
    required String email,
    required String password,
    required String deviceName,
  });

  Future<Either<Failure, User>> getCurrentUser();

  Future<Either<Failure, void>> logout();

  Future<Either<Failure, void>> logoutAll();

  Future<Either<Failure, List<AuthToken>>> getActiveTokens();

  Future<Either<Failure, void>> revokeToken(int tokenId);
}
```

**Ejemplo de UseCase:**
```dart
// lib/features/auth/domain/usecases/login_usecase.dart

class LoginUseCase {
  final AuthRepository _repository;

  LoginUseCase(this._repository);

  Future<Either<Failure, User>> call(LoginParams params) async {
    // Validaciones de negocio
    if (!_isValidEmail(params.email)) {
      return Left(ValidationFailure('Email inválido'));
    }

    if (params.password.length < 6) {
      return Left(ValidationFailure('Contraseña muy corta'));
    }

    // Delegar a repositorio
    return await _repository.login(
      email: params.email,
      password: params.password,
      deviceName: params.deviceName,
    );
  }

  bool _isValidEmail(String email) {
    final regex = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    return regex.hasMatch(email);
  }
}

class LoginParams {
  final String email;
  final String password;
  final String deviceName;

  const LoginParams({
    required this.email,
    required this.password,
    required this.deviceName,
  });
}
```

---

### Capa de Datos (Data Layer)

**Responsabilidades:**
- Implementar interfaces de repositorios
- Transformar modelos de API a entidades
- Gestionar fuentes de datos (API, local)
- Caché

**Componentes:**
```dart
// lib/features/auth/data/

├── models/
│   ├── user_model.dart              // Modelos serializables
│   ├── user_model.g.dart            // Generated by json_serializable
│   └── login_response_model.dart
│
├── repositories/
│   └── auth_repository_impl.dart    // Implementación concreta
│
└── datasources/
    ├── auth_remote_datasource.dart  // API
    └── auth_local_datasource.dart   // Local storage
```

**Ejemplo de Model:**
```dart
// lib/features/auth/data/models/user_model.dart

import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/user.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel {
  const factory UserModel({
    required int id,
    required String name,
    required String email,
    @JsonKey(name: 'first_name') String? firstName,
    @JsonKey(name: 'last_name') String? lastName,
    required List<String> roles,
    required List<String> abilities,
    UserProfileModel? profile,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  // Mapper to entity
  const UserModel._();

  User toEntity() {
    return User(
      id: id,
      name: name,
      email: email,
      roles: roles,
      abilities: abilities,
      profile: profile?.toEntity(),
    );
  }
}
```

**Ejemplo de Repository Implementation:**
```dart
// lib/features/auth/data/repositories/auth_repository_impl.dart

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource _remoteDataSource;
  final AuthLocalDataSource _localDataSource;
  final NetworkInfo _networkInfo;

  AuthRepositoryImpl({
    required AuthRemoteDataSource remoteDataSource,
    required AuthLocalDataSource localDataSource,
    required NetworkInfo networkInfo,
  })  : _remoteDataSource = remoteDataSource,
        _localDataSource = localDataSource,
        _networkInfo = networkInfo;

  @override
  Future<Either<Failure, User>> login({
    required String email,
    required String password,
    required String deviceName,
  }) async {
    try {
      // Verificar conexión
      if (!await _networkInfo.isConnected) {
        return Left(NetworkFailure('Sin conexión a internet'));
      }

      // Llamar API
      final response = await _remoteDataSource.login(
        email: email,
        password: password,
        deviceName: deviceName,
      );

      // Guardar token
      await _localDataSource.saveToken(response.token);
      await _localDataSource.saveTokenExpiry(
        DateTime.now().add(Duration(seconds: response.expiresIn)),
      );

      // Guardar usuario
      await _localDataSource.saveUser(response.user);

      // Retornar entidad
      return Right(response.user.toEntity());
    } on ApiException catch (e) {
      return Left(ApiFailure(e.message));
    } on Exception catch (e) {
      return Left(UnexpectedFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, User>> getCurrentUser() async {
    try {
      // Intentar obtener de caché primero
      final cachedUser = await _localDataSource.getCachedUser();
      if (cachedUser != null) {
        return Right(cachedUser.toEntity());
      }

      // Si no hay caché, obtener de API
      if (!await _networkInfo.isConnected) {
        return Left(NetworkFailure('Sin conexión y sin caché'));
      }

      final userModel = await _remoteDataSource.getCurrentUser();
      await _localDataSource.saveUser(userModel);

      return Right(userModel.toEntity());
    } on Exception catch (e) {
      return Left(UnexpectedFailure(e.toString()));
    }
  }

  // ... otros métodos
}
```

**Ejemplo de Remote DataSource:**
```dart
// lib/features/auth/data/datasources/auth_remote_datasource.dart

abstract class AuthRemoteDataSource {
  Future<LoginResponseModel> login({
    required String email,
    required String password,
    required String deviceName,
  });

  Future<UserModel> getCurrentUser();

  Future<void> logout();

  Future<void> logoutAll();

  Future<List<AuthTokenModel>> getActiveTokens();

  Future<void> revokeToken(int tokenId);
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final ApiClient _apiClient;

  AuthRemoteDataSourceImpl({required ApiClient apiClient})
      : _apiClient = apiClient;

  @override
  Future<LoginResponseModel> login({
    required String email,
    required String password,
    required String deviceName,
  }) async {
    final response = await _apiClient.post<Map<String, dynamic>>(
      ApiEndpoints.login,
      data: {
        'email': email,
        'password': password,
        'device_name': deviceName,
      },
    );

    if (response.success && response.data != null) {
      return LoginResponseModel.fromJson(response.data!);
    } else {
      throw ApiException(response.message ?? 'Login failed');
    }
  }

  @override
  Future<UserModel> getCurrentUser() async {
    final response = await _apiClient.get<Map<String, dynamic>>(
      ApiEndpoints.currentUser,
    );

    if (response.success && response.data != null) {
      return UserModel.fromJson(response.data!['user']);
    } else {
      throw ApiException(response.message ?? 'Failed to get user');
    }
  }

  // ... otros métodos
}
```

---

## 🔄 Gestión de Estado

### Riverpod (Elección)

**Razones:**
- Type-safe
- Compile-time errors
- No BuildContext necesario
- Testing fácil
- Performance optimizado
- Provider composition

**Estructura de Providers:**

```dart
// lib/features/auth/presentation/providers/auth_provider.dart

// 1. Provider de dependencias
final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepositoryImpl(
    remoteDataSource: ref.watch(authRemoteDataSourceProvider),
    localDataSource: ref.watch(authLocalDataSourceProvider),
    networkInfo: ref.watch(networkInfoProvider),
  );
});

final loginUseCaseProvider = Provider<LoginUseCase>((ref) {
  return LoginUseCase(ref.watch(authRepositoryProvider));
});

// 2. State Provider
final authStateProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  return AuthNotifier(
    loginUseCase: ref.watch(loginUseCaseProvider),
    logoutUseCase: ref.watch(logoutUseCaseProvider),
    getCurrentUserUseCase: ref.watch(getCurrentUserUseCaseProvider),
  );
});

// 3. State Notifier
class AuthNotifier extends StateNotifier<AuthState> {
  final LoginUseCase _loginUseCase;
  final LogoutUseCase _logoutUseCase;
  final GetCurrentUserUseCase _getCurrentUserUseCase;

  AuthNotifier({
    required LoginUseCase loginUseCase,
    required LogoutUseCase logoutUseCase,
    required GetCurrentUserUseCase getCurrentUserUseCase,
  })  : _loginUseCase = loginUseCase,
        _logoutUseCase = logoutUseCase,
        _getCurrentUserUseCase = getCurrentUserUseCase,
        super(const AuthState.initial());

  Future<void> login(String email, String password) async {
    state = const AuthState.loading();

    final deviceName = await _getDeviceName();

    final result = await _loginUseCase(LoginParams(
      email: email,
      password: password,
      deviceName: deviceName,
    ));

    result.fold(
      (failure) => state = AuthState.error(failure.message),
      (user) => state = AuthState.authenticated(user),
    );
  }

  Future<void> checkAuthStatus() async {
    final result = await _getCurrentUserUseCase(NoParams());

    result.fold(
      (failure) => state = const AuthState.unauthenticated(),
      (user) => state = AuthState.authenticated(user),
    );
  }

  Future<void> logout() async {
    state = const AuthState.loading();

    final result = await _logoutUseCase(NoParams());

    result.fold(
      (failure) => state = AuthState.error(failure.message),
      (_) => state = const AuthState.unauthenticated(),
    );
  }

  Future<String> _getDeviceName() async {
    // Implementación para obtener nombre del dispositivo
    return 'iPhone 15 Pro';
  }
}

// 4. States (usando Freezed)
@freezed
class AuthState with _$AuthState {
  const factory AuthState.initial() = _Initial;
  const factory AuthState.loading() = _Loading;
  const factory AuthState.authenticated(User user) = _Authenticated;
  const factory AuthState.unauthenticated() = _Unauthenticated;
  const factory AuthState.error(String message) = _Error;
}
```

---

## 🌐 Networking

### API Client (Dio)

```dart
// lib/core/network/api_client.dart

class ApiClient {
  final Dio _dio;
  final AuthManager _authManager;
  final Logger _logger;

  ApiClient({
    required AuthManager authManager,
    required Logger logger,
  })  : _authManager = authManager,
        _logger = logger {
    _dio = Dio(
      BaseOptions(
        baseUrl: AppConfig.apiBaseUrl,
        connectTimeout: Duration(milliseconds: AppConfig.apiTimeout),
        receiveTimeout: Duration(milliseconds: AppConfig.apiTimeout),
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        },
      ),
    );

    _setupInterceptors();
  }

  void _setupInterceptors() {
    _dio.interceptors.addAll([
      AuthInterceptor(_authManager),
      LoggingInterceptor(_logger),
      ErrorInterceptor(),
      RetryInterceptor(maxRetries: AppConfig.maxRetries),
    ]);
  }

  // Métodos genéricos type-safe
  Future<ApiResponse<T>> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    T Function(Map<String, dynamic>)? fromJson,
  }) async {
    try {
      _logger.info('GET $path with params: $queryParameters');

      final response = await _dio.get(path, queryParameters: queryParameters);

      _logger.info('Response: ${response.statusCode}');

      return ApiResponse.fromResponse(response, fromJson: fromJson);
    } on DioException catch (e) {
      _logger.error('GET $path failed: ${e.message}');
      throw ApiException.fromDioError(e);
    }
  }

  Future<ApiResponse<T>> post<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    T Function(Map<String, dynamic>)? fromJson,
  }) async {
    try {
      _logger.info('POST $path with data: $data');

      final response = await _dio.post(
        path,
        data: data,
        queryParameters: queryParameters,
      );

      _logger.info('Response: ${response.statusCode}');

      return ApiResponse.fromResponse(response, fromJson: fromJson);
    } on DioException catch (e) {
      _logger.error('POST $path failed: ${e.message}');
      throw ApiException.fromDioError(e);
    }
  }

  // PUT, DELETE, PATCH...
}
```

### Interceptores

**Auth Interceptor:**
```dart
// lib/core/network/interceptors/auth_interceptor.dart

class AuthInterceptor extends Interceptor {
  final AuthManager _authManager;

  AuthInterceptor(this._authManager);

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    // Excluir endpoints que no requieren auth
    if (_isPublicEndpoint(options.path)) {
      return handler.next(options);
    }

    // Agregar token
    final token = await _authManager.getToken();
    if (token != null) {
      options.headers['Authorization'] = 'Bearer $token';
    }

    return handler.next(options);
  }

  bool _isPublicEndpoint(String path) {
    const publicPaths = [
      ApiEndpoints.login,
      ApiEndpoints.checkEmail,
      ApiEndpoints.verifyQrPublic,
    ];
    return publicPaths.any((p) => path.contains(p));
  }
}
```

**Retry Interceptor:**
```dart
// lib/core/network/interceptors/retry_interceptor.dart

class RetryInterceptor extends Interceptor {
  final int maxRetries;
  final Duration retryDelay;

  RetryInterceptor({
    this.maxRetries = 3,
    this.retryDelay = const Duration(seconds: 2),
  });

  @override
  void onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    if (!_shouldRetry(err)) {
      return handler.next(err);
    }

    int retries = 0;
    while (retries < maxRetries) {
      await Future.delayed(retryDelay * (retries + 1));

      try {
        final response = await _retry(err.requestOptions);
        return handler.resolve(response);
      } catch (e) {
        retries++;
        if (retries >= maxRetries) {
          return handler.next(err);
        }
      }
    }
  }

  bool _shouldRetry(DioException err) {
    return err.type == DioExceptionType.connectionTimeout ||
        err.type == DioExceptionType.sendTimeout ||
        err.type == DioExceptionType.receiveTimeout ||
        (err.response?.statusCode != null &&
            err.response!.statusCode! >= 500);
  }

  Future<Response> _retry(RequestOptions options) async {
    final dio = Dio();
    return await dio.request(
      options.path,
      data: options.data,
      queryParameters: options.queryParameters,
      options: Options(
        method: options.method,
        headers: options.headers,
      ),
    );
  }
}
```

---

## 💾 Almacenamiento

### Estrategia de Almacenamiento

**1. Tokens y Credenciales (Secure Storage)**
```dart
// lib/core/storage/secure_storage.dart

class SecureStorage {
  final FlutterSecureStorage _storage;

  SecureStorage() : _storage = const FlutterSecureStorage();

  Future<void> saveToken(String token) async {
    await _storage.write(key: 'auth_token', value: token);
  }

  Future<String?> getToken() async {
    return await _storage.read(key: 'auth_token');
  }

  Future<void> deleteToken() async {
    await _storage.delete(key: 'auth_token');
  }

  Future<void> clearAll() async {
    await _storage.deleteAll();
  }
}
```

**2. Configuración (Shared Preferences)**
```dart
// lib/core/storage/preferences_storage.dart

class PreferencesStorage {
  late final SharedPreferences _prefs;

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  bool getBool(String key, {bool defaultValue = false}) {
    return _prefs.getBool(key) ?? defaultValue;
  }

  Future<bool> setBool(String key, bool value) {
    return _prefs.setBool(key, value);
  }

  String? getString(String key) {
    return _prefs.getString(key);
  }

  Future<bool> setString(String key, String value) {
    return _prefs.setString(key, value);
  }
}
```

**3. Datos Offline (Hive)**
```dart
// lib/core/storage/offline_storage.dart

class OfflineStorage {
  late Box<VerificationModel> _verificationsBox;
  late Box<PlayerModel> _playersBox;

  Future<void> init() async {
    await Hive.initFlutter();

    // Registrar adapters
    Hive.registerAdapter(VerificationModelAdapter());
    Hive.registerAdapter(PlayerModelAdapter());

    // Abrir boxes
    _verificationsBox = await Hive.openBox<VerificationModel>('verifications');
    _playersBox = await Hive.openBox<PlayerModel>('players');
  }

  // Verificaciones
  Future<void> saveVerification(VerificationModel verification) async {
    await _verificationsBox.put(verification.id, verification);
  }

  List<VerificationModel> getPendingVerifications() {
    return _verificationsBox.values
        .where((v) => !v.isSynced)
        .toList();
  }

  Future<void> markAsSynced(String id) async {
    final verification = _verificationsBox.get(id);
    if (verification != null) {
      verification.isSynced = true;
      await _verificationsBox.put(id, verification);
    }
  }

  // Players cache
  Future<void> cachePlayer(PlayerModel player) async {
    await _playersBox.put(player.id, player);
  }

  PlayerModel? getCachedPlayer(int id) {
    return _playersBox.get(id);
  }
}
```

---

## 🔐 Autenticación

### Auth Manager

```dart
// lib/core/auth/auth_manager.dart

class AuthManager {
  final SecureStorage _secureStorage;
  final PreferencesStorage _preferencesStorage;

  AuthManager({
    required SecureStorage secureStorage,
    required PreferencesStorage preferencesStorage,
  })  : _secureStorage = secureStorage,
        _preferencesStorage = preferencesStorage;

  Future<void> saveAuthToken(String token, {DateTime? expiresAt}) async {
    await _secureStorage.saveToken(token);

    if (expiresAt != null) {
      await _preferencesStorage.setString(
        'token_expiry',
        expiresAt.toIso8601String(),
      );
    }
  }

  Future<String?> getToken() async {
    final token = await _secureStorage.getToken();
    if (token == null) return null;

    // Verificar expiración
    final expiryStr = _preferencesStorage.getString('token_expiry');
    if (expiryStr != null) {
      final expiry = DateTime.parse(expiryStr);
      if (DateTime.now().isAfter(expiry)) {
        await clearAuth();
        return null;
      }
    }

    return token;
  }

  Future<bool> isAuthenticated() async {
    final token = await getToken();
    return token != null;
  }

  Future<void> clearAuth() async {
    await _secureStorage.deleteToken();
    await _preferencesStorage.remove('token_expiry');
  }
}
```

---

## 📴 Modo Offline

### Sync Manager

```dart
// lib/core/sync/sync_manager.dart

class SyncManager {
  final OfflineStorage _offlineStorage;
  final VerificationRemoteDataSource _remoteDataSource;
  final ConnectivityService _connectivityService;
  final Logger _logger;

  SyncManager({
    required OfflineStorage offlineStorage,
    required VerificationRemoteDataSource remoteDataSource,
    required ConnectivityService connectivityService,
    required Logger logger,
  })  : _offlineStorage = offlineStorage,
        _remoteDataSource = remoteDataSource,
        _connectivityService = connectivityService,
        _logger = logger;

  Future<SyncResult> syncPendingVerifications() async {
    if (!await _connectivityService.isConnected) {
      return SyncResult.noConnection();
    }

    final pending = _offlineStorage.getPendingVerifications();
    _logger.info('Syncing ${pending.length} pending verifications');

    int synced = 0;
    int failed = 0;
    final errors = <String>[];

    for (final verification in pending) {
      try {
        await _remoteDataSource.syncVerification(verification);
        await _offlineStorage.markAsSynced(verification.id);
        synced++;
      } catch (e) {
        _logger.error('Failed to sync verification ${verification.id}: $e');
        errors.add(verification.id);
        failed++;
      }
    }

    _logger.info('Sync completed: $synced synced, $failed failed');

    return SyncResult(
      total: pending.length,
      synced: synced,
      failed: failed,
      errors: errors,
    );
  }

  Stream<int> get pendingCount {
    return Stream.periodic(const Duration(seconds: 5), (_) {
      return _offlineStorage.getPendingVerifications().length;
    });
  }
}

class SyncResult {
  final int total;
  final int synced;
  final int failed;
  final List<String> errors;

  SyncResult({
    required this.total,
    required this.synced,
    required this.failed,
    required this.errors,
  });

  factory SyncResult.noConnection() {
    return SyncResult(total: 0, synced: 0, failed: 0, errors: []);
  }

  bool get isSuccess => failed == 0;
}
```

### Connectivity Service

```dart
// lib/core/network/connectivity_service.dart

class ConnectivityService {
  final Connectivity _connectivity;
  final _controller = StreamController<bool>.broadcast();

  ConnectivityService() : _connectivity = Connectivity() {
    _init();
  }

  void _init() {
    _connectivity.onConnectivityChanged.listen((result) {
      final isConnected = result != ConnectivityResult.none;
      _controller.add(isConnected);
    });
  }

  Future<bool> get isConnected async {
    final result = await _connectivity.checkConnectivity();
    return result != ConnectivityResult.none;
  }

  Stream<bool> get connectionStream => _controller.stream;

  void dispose() {
    _controller.close();
  }
}
```

---

## 📦 Dependencias

### pubspec.yaml

```yaml
name: volleypass
description: VolleyPass Mobile App
version: 1.0.0+1

environment:
  sdk: ^3.10.4

dependencies:
  flutter:
    sdk: flutter

  # State Management
  flutter_riverpod: ^2.4.0
  riverpod_annotation: ^2.3.0

  # Networking
  dio: ^5.4.0

  # Storage
  flutter_secure_storage: ^9.0.0
  shared_preferences: ^2.2.2
  hive: ^2.2.3
  hive_flutter: ^1.1.0

  # Connectivity
  connectivity_plus: ^5.0.2

  # QR Scanner
  mobile_scanner: ^3.5.5

  # Functional Programming
  dartz: ^0.10.1
  freezed_annotation: ^2.4.1
  json_annotation: ^4.8.1

  # Utils
  logger: ^2.0.2+1
  intl: ^0.18.1
  device_info_plus: ^10.0.1

  # UI
  cached_network_image: ^3.3.1
  shimmer: ^3.0.0

dev_dependencies:
  flutter_test:
    sdk: flutter

  # Code Generation
  build_runner: ^2.4.7
  freezed: ^2.4.6
  json_serializable: ^6.7.1
  riverpod_generator: ^2.3.9
  hive_generator: ^2.0.1

  # Linting
  flutter_lints: ^3.0.1

  # Testing
  mockito: ^5.4.4
  mocktail: ^1.0.2
```

---

## 🎨 Patrones de Diseño

### 1. Repository Pattern
Abstrae la lógica de acceso a datos

### 2. Dependency Injection
Usando Riverpod providers

### 3. Observer Pattern
Para estado reactivo

### 4. Factory Pattern
Para creación de instancias complejas

### 5. Singleton Pattern
Para servicios globales (Logger, Config)

### 6. Strategy Pattern
Para diferentes estrategias de almacenamiento

---

## ✅ Checklist de Implementación

Antes de desarrollar cada feature:

- [ ] ¿Está definida la entidad del dominio?
- [ ] ¿Está definido el modelo de datos?
- [ ] ¿Está definida la interfaz del repositorio?
- [ ] ¿Está implementado el repositorio?
- [ ] ¿Están definidos los casos de uso?
- [ ] ¿Está definido el estado?
- [ ] ¿Están configurados los providers?
- [ ] ¿Está implementada la UI?
- [ ] ¿Están escritos los tests?

---

**Última actualización:** Diciembre 26, 2024
