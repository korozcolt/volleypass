# Normas de Desarrollo Profesional - VolleyPass Mobile

> **Versión:** 1.0.0
> **Última actualización:** Diciembre 26, 2024
> **LECTURA OBLIGATORIA** antes de realizar cualquier desarrollo o implementación

---

## 📋 Tabla de Contenidos

1. [Principios Fundamentales](#principios-fundamentales)
2. [Arquitectura del Proyecto](#arquitectura-del-proyecto)
3. [Gestión de Configuración](#gestión-de-configuración)
4. [Conectividad con API](#conectividad-con-api)
5. [Manejo de Estado](#manejo-de-estado)
6. [Seguridad](#seguridad)
7. [Testing](#testing)
8. [Documentación](#documentación)
9. [Control de Versiones](#control-de-versiones)
10. [Checklist Pre-Desarrollo](#checklist-pre-desarrollo)

---

## 🎯 Principios Fundamentales

### 1. CERO Hardcoding

**❌ PROHIBIDO:**
```dart
// NO hacer esto
final apiUrl = 'https://volleypass.test/api/v1';
final timeout = 30;
const maxRetries = 3;
```

**✅ CORRECTO:**
```dart
// Usar configuración centralizada
final apiUrl = AppConfig.apiBaseUrl;
final timeout = AppConfig.apiTimeout;
const maxRetries = AppConfig.maxRetries;
```

**Regla de oro:** Si un valor puede cambiar entre entornos (dev, staging, prod) o puede ser ajustado, debe estar en configuración.

### 2. Todo con Fundamento

Cada decisión técnica debe tener justificación documentada:

- ¿Por qué esta arquitectura?
- ¿Por qué este paquete?
- ¿Por qué este patrón?
- ¿Cuáles son las alternativas consideradas?

**Formato de decisión técnica:**
```markdown
## Decisión: [Título]
**Fecha:** YYYY-MM-DD
**Contexto:** [Problema o necesidad]
**Opciones consideradas:**
- Opción A: [Pros/Contras]
- Opción B: [Pros/Contras]
**Decisión:** [Opción elegida]
**Justificación:** [Razones técnicas y de negocio]
```

### 3. Nivel de Seniority Máximo

El código debe reflejar:
- **SOLID principles**
- **Clean Architecture**
- **Design Patterns apropiados**
- **Testabilidad**
- **Mantenibilidad**
- **Escalabilidad**

### 4. Manejabilidad y Administración

Todo debe ser:
- **Configurable** sin cambiar código
- **Observable** con logs y métricas
- **Debuggable** con herramientas apropiadas
- **Actualizable** sin romper funcionalidad existente

---

## 🏗️ Arquitectura del Proyecto

### Clean Architecture + Feature-First

```
lib/
├── core/                           # Núcleo del sistema
│   ├── config/                     # Configuración centralizada
│   │   ├── app_config.dart         # Configuración de la app
│   │   ├── environment.dart        # Entornos (dev, staging, prod)
│   │   └── flavor_config.dart      # Configuración por flavor
│   ├── network/                    # Capa de red
│   │   ├── api_client.dart         # Cliente HTTP base
│   │   ├── interceptors/           # Interceptores HTTP
│   │   ├── api_response.dart       # Modelos de respuesta
│   │   └── api_exception.dart      # Manejo de errores HTTP
│   ├── auth/                       # Autenticación
│   │   ├── auth_manager.dart       # Gestor de autenticación
│   │   ├── token_storage.dart      # Almacenamiento seguro de tokens
│   │   └── auth_interceptor.dart   # Interceptor de auth
│   ├── storage/                    # Almacenamiento local
│   │   ├── secure_storage.dart     # Almacenamiento seguro
│   │   ├── cache_manager.dart      # Gestión de caché
│   │   └── offline_storage.dart    # Datos offline
│   ├── error/                      # Manejo de errores
│   │   ├── failures.dart           # Tipos de fallos
│   │   ├── error_handler.dart      # Manejador centralizado
│   │   └── error_messages.dart     # Mensajes de error
│   ├── utils/                      # Utilidades
│   │   ├── logger.dart             # Sistema de logging
│   │   ├── validators.dart         # Validadores
│   │   └── formatters.dart         # Formateadores
│   └── constants/                  # Constantes
│       ├── api_endpoints.dart      # Endpoints de API
│       ├── app_constants.dart      # Constantes generales
│       └── asset_constants.dart    # Rutas de assets
│
├── features/                       # Características de la app
│   ├── auth/                       # Feature: Autenticación
│   │   ├── data/                   # Capa de datos
│   │   │   ├── models/             # Modelos de datos
│   │   │   ├── repositories/       # Implementación de repositorios
│   │   │   └── datasources/        # Fuentes de datos (API, local)
│   │   ├── domain/                 # Capa de dominio
│   │   │   ├── entities/           # Entidades de negocio
│   │   │   ├── repositories/       # Interfaces de repositorios
│   │   │   └── usecases/           # Casos de uso
│   │   └── presentation/           # Capa de presentación
│   │       ├── pages/              # Páginas/Pantallas
│   │       ├── widgets/            # Widgets específicos
│   │       ├── providers/          # Providers (Riverpod/Bloc)
│   │       └── state/              # Estados
│   │
│   ├── qr_verification/            # Feature: Verificación QR
│   │   ├── data/
│   │   ├── domain/
│   │   └── presentation/
│   │
│   ├── tournaments/                # Feature: Torneos
│   ├── matches/                    # Feature: Partidos
│   ├── profile/                    # Feature: Perfil
│   └── [otras features...]
│
├── shared/                         # Componentes compartidos
│   ├── widgets/                    # Widgets reutilizables
│   │   ├── buttons/
│   │   ├── cards/
│   │   ├── forms/
│   │   └── loaders/
│   ├── theme/                      # Tema de la app
│   │   ├── app_theme.dart
│   │   ├── colors.dart
│   │   ├── typography.dart
│   │   └── spacing.dart
│   └── extensions/                 # Extensiones
│       ├── context_extensions.dart
│       └── string_extensions.dart
│
└── main.dart                       # Punto de entrada
```

### Principios de la Arquitectura

1. **Separación de responsabilidades**: Cada capa tiene una responsabilidad única
2. **Independencia de frameworks**: El dominio no debe depender de Flutter
3. **Testabilidad**: Cada capa debe ser fácilmente testeable
4. **Inversión de dependencias**: El dominio define las interfaces

---

## ⚙️ Gestión de Configuración

### Environment Configuration

Crear archivos de configuración por entorno:

```dart
// lib/core/config/environment.dart
enum Environment {
  development,
  staging,
  production,
}

class EnvironmentConfig {
  final Environment environment;
  final String apiBaseUrl;
  final int apiTimeout;
  final bool enableLogging;
  final bool enableCrashReporting;
  final int maxRetries;
  final Duration cacheDuration;

  const EnvironmentConfig({
    required this.environment,
    required this.apiBaseUrl,
    this.apiTimeout = 30000,
    this.enableLogging = false,
    this.enableCrashReporting = false,
    this.maxRetries = 3,
    this.cacheDuration = const Duration(hours: 24),
  });

  // Development
  static const development = EnvironmentConfig(
    environment: Environment.development,
    apiBaseUrl: 'https://volleypass.test/api/v1',
    enableLogging: true,
    enableCrashReporting: false,
  );

  // Staging
  static const staging = EnvironmentConfig(
    environment: Environment.staging,
    apiBaseUrl: 'https://staging.volleypass.com/api/v1',
    enableLogging: true,
    enableCrashReporting: true,
  );

  // Production
  static const production = EnvironmentConfig(
    environment: Environment.production,
    apiBaseUrl: 'https://api.volleypass.com/api/v1',
    enableLogging: false,
    enableCrashReporting: true,
  );
}
```

### App Configuration

```dart
// lib/core/config/app_config.dart
class AppConfig {
  static late EnvironmentConfig _config;

  static void initialize(EnvironmentConfig config) {
    _config = config;
  }

  static EnvironmentConfig get current => _config;
  static String get apiBaseUrl => _config.apiBaseUrl;
  static int get apiTimeout => _config.apiTimeout;
  static bool get enableLogging => _config.enableLogging;
  static int get maxRetries => _config.maxRetries;

  // Configuración de features
  static const int qrScanTimeout = 30; // segundos
  static const int maxBatchVerifications = 50;
  static const int paginationLimit = 20;
  static const int offlineSyncBatchSize = 100;

  // Configuración de UI
  static const double defaultPadding = 16.0;
  static const double defaultRadius = 12.0;
  static const Duration animationDuration = Duration(milliseconds: 300);

  // Configuración de caché
  static const Duration tokenExpiration = Duration(days: 30);
  static const Duration cacheExpiration = Duration(hours: 24);
  static const int maxCacheSize = 100; // MB
}
```

---

## 🌐 Conectividad con API

### Principio de Transparencia

La capa de presentación NO debe conocer detalles de la API. Debe comunicarse solo con el dominio.

```dart
// ❌ MAL - Controller conoce la API
class AuthController {
  Future<void> login(String email, String password) async {
    final response = await http.post(
      Uri.parse('https://api.volleypass.com/auth/login'),
      body: {'email': email, 'password': password},
    );
    // ...
  }
}

// ✅ BIEN - Controller usa caso de uso
class AuthController {
  final LoginUseCase _loginUseCase;

  AuthController(this._loginUseCase);

  Future<void> login(String email, String password) async {
    final result = await _loginUseCase(LoginParams(
      email: email,
      password: password,
    ));

    result.fold(
      (failure) => _handleFailure(failure),
      (user) => _handleSuccess(user),
    );
  }
}
```

### API Client Centralizado

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
      final response = await _dio.get(path, queryParameters: queryParameters);
      return ApiResponse.fromResponse(response, fromJson: fromJson);
    } on DioException catch (e) {
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
      final response = await _dio.post(
        path,
        data: data,
        queryParameters: queryParameters,
      );
      return ApiResponse.fromResponse(response, fromJson: fromJson);
    } on DioException catch (e) {
      throw ApiException.fromDioError(e);
    }
  }

  // PUT, DELETE, PATCH similares...
}
```

### API Response Wrapper

```dart
// lib/core/network/api_response.dart
class ApiResponse<T> {
  final bool success;
  final T? data;
  final String? message;
  final Map<String, dynamic>? meta;

  ApiResponse({
    required this.success,
    this.data,
    this.message,
    this.meta,
  });

  factory ApiResponse.fromResponse(
    Response response, {
    T Function(Map<String, dynamic>)? fromJson,
  }) {
    final jsonData = response.data;

    return ApiResponse<T>(
      success: jsonData['success'] ?? true,
      message: jsonData['message'],
      meta: jsonData['meta'],
      data: fromJson != null && jsonData['data'] != null
          ? fromJson(jsonData['data'])
          : jsonData['data'] as T?,
    );
  }
}
```

---

## 🔐 Seguridad

### 1. Almacenamiento de Tokens

```dart
// lib/core/auth/token_storage.dart
class TokenStorage {
  final FlutterSecureStorage _secureStorage;

  static const _tokenKey = 'auth_token';
  static const _refreshTokenKey = 'refresh_token';
  static const _tokenExpiryKey = 'token_expiry';

  Future<void> saveToken(String token, {DateTime? expiresAt}) async {
    await _secureStorage.write(key: _tokenKey, value: token);
    if (expiresAt != null) {
      await _secureStorage.write(
        key: _tokenExpiryKey,
        value: expiresAt.toIso8601String(),
      );
    }
  }

  Future<String?> getToken() async {
    final token = await _secureStorage.read(key: _tokenKey);
    if (token == null) return null;

    // Verificar expiración
    final expiryStr = await _secureStorage.read(key: _tokenExpiryKey);
    if (expiryStr != null) {
      final expiry = DateTime.parse(expiryStr);
      if (DateTime.now().isAfter(expiry)) {
        await clearToken();
        return null;
      }
    }

    return token;
  }

  Future<void> clearToken() async {
    await _secureStorage.delete(key: _tokenKey);
    await _secureStorage.delete(key: _refreshTokenKey);
    await _secureStorage.delete(key: _tokenExpiryKey);
  }
}
```

### 2. Validación de Datos

```dart
// lib/core/utils/validators.dart
class Validators {
  static String? email(String? value) {
    if (value == null || value.isEmpty) {
      return 'El email es requerido';
    }

    // Regex sin acentos según API
    final emailRegex = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    if (!emailRegex.hasMatch(value)) {
      return 'Email inválido (sin acentos)';
    }

    return null;
  }

  static String? qrCode(String? value) {
    if (value == null || value.isEmpty) {
      return 'El código QR es requerido';
    }

    // Debe ser 64 caracteres hexadecimales (SHA-256)
    final qrRegex = RegExp(r'^[a-fA-F0-9]{64}$');
    if (!qrRegex.hasMatch(value)) {
      return 'Código QR inválido (debe ser 64 caracteres hex)';
    }

    return null;
  }

  static String? notEmpty(String? value, {String fieldName = 'Campo'}) {
    if (value == null || value.isEmpty) {
      return '$fieldName es requerido';
    }
    return null;
  }
}
```

---

## 📊 Manejo de Estado

### Riverpod (Recomendado)

Usar Riverpod para gestión de estado por:
- Type-safe
- Compile-time safety
- Testeable
- Performance

```dart
// Ejemplo de provider structure
final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepositoryImpl(
    apiClient: ref.watch(apiClientProvider),
    tokenStorage: ref.watch(tokenStorageProvider),
  );
});

final loginUseCaseProvider = Provider<LoginUseCase>((ref) {
  return LoginUseCase(ref.watch(authRepositoryProvider));
});

final authStateProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  return AuthNotifier(
    loginUseCase: ref.watch(loginUseCaseProvider),
    logoutUseCase: ref.watch(logoutUseCaseProvider),
  );
});
```

---

## 🧪 Testing

### Estructura de Testing

```
test/
├── unit/                           # Tests unitarios
│   ├── core/
│   ├── features/
│   └── shared/
├── widget/                         # Tests de widgets
│   ├── auth/
│   ├── qr_verification/
│   └── tournaments/
└── integration/                    # Tests de integración
    ├── auth_flow_test.dart
    └── qr_verification_flow_test.dart
```

### Coverage Mínimo

- **Unit tests:** 80% coverage mínimo
- **Widget tests:** 70% coverage mínimo
- **Integration tests:** Flujos críticos cubiertos

---

## 📝 Documentación

### Cada archivo debe tener:

```dart
/// Gestiona la autenticación de usuarios en la aplicación.
///
/// Responsabilidades:
/// - Inicio de sesión
/// - Cierre de sesión
/// - Verificación de estado de autenticación
/// - Manejo de tokens
///
/// Ejemplo de uso:
/// ```dart
/// final authManager = AuthManager(tokenStorage, apiClient);
/// await authManager.login(email, password);
/// ```
class AuthManager {
  // ...
}
```

---

## ✅ Checklist Pre-Desarrollo

Antes de escribir cualquier código, asegurar:

- [ ] ¿Está documentada la decisión técnica?
- [ ] ¿Está definida la estructura de carpetas?
- [ ] ¿Están identificadas las dependencias necesarias?
- [ ] ¿Están definidos los modelos de datos?
- [ ] ¿Están definidas las interfaces de repositorio?
- [ ] ¿Están definidos los casos de uso?
- [ ] ¿Están identificados los estados posibles?
- [ ] ¿Están definidos los tests a implementar?
- [ ] ¿Está clara la configuración necesaria?
- [ ] ¿Se han considerado casos de error?
- [ ] ¿Se ha planificado el manejo offline?
- [ ] ¿Se ha considerado la seguridad?

---

## 🚫 Anti-Patrones a Evitar

### 1. God Objects
```dart
// ❌ NO hacer esto
class AppManager {
  void login() {}
  void verifyQR() {}
  void loadTournaments() {}
  void updateProfile() {}
  // ... 50 métodos más
}
```

### 2. Magic Numbers/Strings
```dart
// ❌ NO hacer esto
if (response.statusCode == 401) {}
await Future.delayed(Duration(seconds: 3));

// ✅ Hacer esto
if (response.statusCode == HttpStatus.unauthorized) {}
await Future.delayed(AppConfig.retryDelay);
```

### 3. Business Logic en UI
```dart
// ❌ NO hacer esto
class LoginPage extends StatelessWidget {
  void _login() async {
    final response = await http.post(...);
    if (response.statusCode == 200) {
      final token = json.decode(response.body)['token'];
      await storage.write('token', token);
    }
  }
}

// ✅ Hacer esto
class LoginPage extends ConsumerWidget {
  void _login() {
    ref.read(authStateProvider.notifier).login(email, password);
  }
}
```

---

## 📚 Referencias

- [Flutter Clean Architecture](https://resocoder.com/flutter-clean-architecture-tdd/)
- [Riverpod Documentation](https://riverpod.dev/)
- [Effective Dart](https://dart.dev/guides/language/effective-dart)
- [Flutter Best Practices](https://flutter.dev/docs/development/best-practices)

---

**IMPORTANTE:** Este documento es ley. Cualquier PR que no cumpla estos estándares será rechazado.
