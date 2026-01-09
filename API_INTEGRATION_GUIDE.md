# Guía de Integración con la API Real

Este documento describe los cambios importantes que debes realizar al momento de conectar la aplicación con la API real de backend.

## 📋 Índice
1. [Configuración de Endpoints](#configuración-de-endpoints)
2. [Autenticación y Tokens](#autenticación-y-tokens)
3. [Manejo de Errores de la API](#manejo-de-errores-de-la-api)
4. [Estructura de Respuestas](#estructura-de-respuestas)
5. [Headers y Configuración de Red](#headers-y-configuración-de-red)
6. [Caché y Persistencia](#caché-y-persistencia)

---

## 1. Configuración de Endpoints

### 📁 Archivo: `lib/core/config/environment.dart`

**Cambiar:**
```dart
static const String baseUrl = 'http://localhost:3000/api/v1';
static const String apiUrl = 'http://localhost:3000/api/v1';
```

**Por:**
```dart
// Producción
static const String baseUrl = 'https://api.volleypass.com/api/v1';
static const String apiUrl = 'https://api.volleypass.com/api/v1';

// O usar variables de entorno
static String get baseUrl => const String.fromEnvironment(
  'API_BASE_URL',
  defaultValue: 'https://api.volleypass.com/api/v1',
);
```

### 📁 Archivo: `lib/core/constants/api_endpoints.dart`

**Verificar que los endpoints coincidan con tu backend:**
- `POST /auth/login`
- `POST /auth/register`
- `GET /dashboard` (con parámetro `?role=`)
- `GET /payments`
- `POST /payments/:id/upload-proof`
- `GET /club/payments`
- `POST /club/payments/:id/verify`
- etc.

---

## 2. Autenticación y Tokens

### 📁 Archivo: `lib/core/network/api_client.dart`

**Cambios importantes:**

1. **Token de autenticación:**
   - El token se obtiene del login y se guarda en `TokenStorage`
   - Se agrega automáticamente en el interceptor de Dio
   - **Asegúrate de que el backend espera**: `Authorization: Bearer <token>`

2. **Refresh Token (si tu API lo usa):**
```dart
// Agregar lógica de refresh token en el interceptor
if (response.statusCode == 401) {
  // Intentar renovar el token
  final newToken = await _refreshToken();
  if (newToken != null) {
    // Reintentar la petición original
    options.headers['Authorization'] = 'Bearer $newToken';
    return handler.resolve(await dio.fetch(options));
  }
}
```

---

## 3. Manejo de Errores de la API

### 📁 Archivo: `lib/core/error/api_exception.dart`

**Verificar que las respuestas de error del backend tienen este formato:**

```json
{
  "success": false,
  "message": "Mensaje de error legible",
  "code": "ERROR_CODE", // Opcional
  "errors": [] // Opcional, para validaciones
}
```

**Si el formato es diferente, actualizar:**
```dart
// En cada datasource
on DioException catch (e) {
  // Ajustar según el formato de tu API
  final message = e.response?.data?['message'] ??
                  e.response?.data?['error'] ??
                  'Error desconocido';
  throw ApiException(
    message: message,
    statusCode: e.response?.statusCode ?? 500,
  );
}
```

---

## 4. Estructura de Respuestas

### Respuestas Exitosas

**Formato esperado actualmente:**
```json
{
  "success": true,
  "data": { /* datos */ },
  "message": "Mensaje opcional"
}
```

**Si tu API devuelve solo los datos directamente:**
```dart
// Actualizar en cada datasource
// De:
return ModelResponse.fromJson(response.data as Map<String, dynamic>);

// A:
return ModelResponse.fromJson({
  'success': true,
  'data': response.data,
});
```

### Paginación

**Formato esperado:**
```json
{
  "success": true,
  "data": [ /* items */ ],
  "meta": {
    "current_page": 1,
    "last_page": 5,
    "per_page": 20,
    "total": 100
  }
}
```

**Si es diferente, actualizar:**
`lib/features/payments/data/models/payment_model.dart`

---

## 5. Headers y Configuración de Red

### 📁 Archivo: `lib/core/network/api_client.dart`

**Headers que se envían actualmente:**
```dart
'Content-Type': 'application/json',
'Accept': 'application/json',
'Authorization': 'Bearer $token', // Si está autenticado
```

**Agregar si el backend lo requiere:**
```dart
// API Key
'X-API-Key': 'tu-api-key',

// Versión de la app
'X-App-Version': AppConfig.appVersion,

// Platform
'X-Platform': Platform.isAndroid ? 'android' : 'ios',
```

### SSL/HTTPS

**En producción, REMOVER:**
```dart
// lib/main.dart
if (AppConfig.isDevelopment) {
  HttpOverrides.global = DevHttpOverrides(); // ❌ SOLO PARA DESARROLLO
}
```

**Para producción:**
```dart
// Asegurar que todas las URLs usan HTTPS
static const String baseUrl = 'https://...'; // ✅
```

---

## 6. Caché y Persistencia

### Datos Offline

**Si quieres que la app funcione sin conexión:**

1. **Guardar datos en caché:**
```dart
// En cada repository_impl
final cachedData = await _offlineStorage.get('key');
if (cachedData != null) {
  return Right(CachedModel.fromJson(cachedData));
}
```

2. **Sincronización:**
```dart
// Cuando vuelva la conexión
await _syncOfflineChanges();
```

---

## 📝 Checklist de Integración

### Antes de Conectar con la API Real:

- [ ] Cambiar `baseUrl` a la URL real del backend
- [ ] Verificar que todos los endpoints coincidan con el backend
- [ ] Probar el flujo de login y verificar que el token se guarda correctamente
- [ ] Verificar el formato de las respuestas exitosas
- [ ] Verificar el formato de las respuestas de error
- [ ] Probar la paginación en endpoints como `/payments`
- [ ] Verificar que los headers requeridos se envían
- [ ] Probar el refresh token (si aplica)
- [ ] Remover `DevHttpOverrides` en producción
- [ ] Probar la app sin conexión (si es necesario)
- [ ] Agregar logs para debugging en desarrollo
- [ ] Probar todos los roles (SuperAdmin, LeagueAdmin, ClubAdmin, Verifier, Player)

### Endpoints Críticos a Probar:

#### Autenticación
- [ ] `POST /auth/login`
- [ ] `POST /auth/register`
- [ ] `POST /auth/logout`
- [ ] `POST /auth/refresh` (si aplica)

#### Dashboard
- [ ] `GET /dashboard?role=SuperAdmin`
- [ ] `GET /dashboard?role=ClubAdmin`
- [ ] `GET /dashboard?role=LeagueAdmin`
- [ ] `GET /dashboard?role=Verifier`
- [ ] `GET /dashboard?role=Player`

#### Pagos (Player)
- [ ] `GET /payments` (lista de pagos del jugador)
- [ ] `POST /payments/:id/upload-proof` (subir comprobante)

#### Pagos (ClubAdmin)
- [ ] `GET /club/payments` (lista de pagos del club)
- [ ] `POST /club/payments/:id/verify` (aprobar pago)
- [ ] `POST /club/payments/:id/verify` (rechazar pago con notas)

#### Verificaciones (Verifier)
- [ ] `POST /verifications/scan` (escanear QR)
- [ ] `GET /match-sessions/available` (partidos disponibles)
- [ ] `POST /match-sessions/:id/start` (iniciar sesión)

---

## 🔧 Configuración Avanzada

### Variables de Entorno

**Crear archivo `.env` en la raíz:**
```env
API_BASE_URL=https://api.volleypass.com/api/v1
API_TIMEOUT=30000
ENABLE_LOGS=true
```

**Usar en el código:**
```dart
static const String baseUrl = String.fromEnvironment(
  'API_BASE_URL',
  defaultValue: 'http://localhost:3000/api/v1',
);
```

### Logging en Producción

**Usar un servicio de logging como Sentry:**
```dart
// lib/core/utils/app_logger.dart
if (AppConfig.isProduction) {
  Sentry.captureException(exception, stackTrace: stackTrace);
} else {
  print('Error: $exception');
}
```

---

## 🚨 Problemas Comunes

### 1. Error 401 (No Autorizado)
- Verificar que el token se está enviando correctamente
- Verificar que el token no ha expirado
- Implementar refresh token

### 2. Error 404 (No Encontrado)
- Verificar que la URL del endpoint es correcta
- Verificar que el método HTTP es correcto (GET, POST, etc.)

### 3. Error 422 (Validación)
- Verificar que los datos se envían en el formato correcto
- Verificar que todos los campos requeridos están presentes

### 4. Error de CORS (Solo en Web)
- El backend debe permitir el origen de la app web
- Agregar headers CORS en el backend

### 5. Timeout
- Aumentar el timeout en `api_client.dart`
- Optimizar las consultas en el backend

---

## 📞 Contacto y Soporte

Para cualquier duda sobre la integración, revisar:
- Documentación del backend
- Postman collection del API
- Swagger/OpenAPI del backend

