# 🔴 Cambios Críticos para Conexión con API Real

Este documento lista los cambios específicos y críticos que DEBES hacer en el código antes de conectar con la API real.

---

## 1. 🌐 Configuración de URLs

### `lib/core/config/environment.dart`

```dart
class EnvironmentConfig {
  // ❌ CAMBIAR ESTO:
  static const String baseUrl = 'http://localhost:3000/api/v1';
  static const String apiUrl = 'http://localhost:3000/api/v1';

  // ✅ POR ESTO (según tu entorno):

  // DESARROLLO
  static const String baseUrl = 'https://dev-api.volleypass.com/api/v1';
  static const String apiUrl = 'https://dev-api.volleypass.com/api/v1';

  // PRODUCCIÓN
  // static const String baseUrl = 'https://api.volleypass.com/api/v1';
  // static const String apiUrl = 'https://api.volleypass.com/api/v1';
}
```

---

## 2. 🔒 Seguridad SSL/HTTPS

### `lib/main.dart`

```dart
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // ❌ REMOVER ESTO EN PRODUCCIÓN:
  if (AppConfig.isDevelopment) {
    HttpOverrides.global = DevHttpOverrides(); // SOLO PARA DESARROLLO LOCAL
  }

  // ✅ EN PRODUCCIÓN NO USAR HttpOverrides
}
```

**⚠️ IMPORTANTE:**
- `DevHttpOverrides` desactiva la verificación SSL
- NUNCA usar en producción
- Solo para desarrollo local con certificados autofirmados

---

## 3. 🔑 Formato de Token

### Verificar en `lib/core/network/api_client.dart`

**El interceptor actual envía:**
```dart
options.headers['Authorization'] = 'Bearer $token';
```

**Si tu API espera un formato diferente, cambiar a:**
```dart
// Token sin "Bearer"
options.headers['Authorization'] = token;

// O custom header
options.headers['X-Auth-Token'] = token;
```

---

## 4. 📦 Estructura de Respuestas JSON

### ⚠️ VERIFICAR EL FORMATO DE TU API

**Formato actual esperado:**
```json
{
  "success": true,
  "data": { ... },
  "message": "OK"
}
```

### Si tu API NO usa este formato:

#### Opción A: API devuelve datos directamente

**Tu API:**
```json
{
  "id": 1,
  "name": "John",
  ...
}
```

**Cambiar en TODOS los datasources:**
```dart
// lib/features/*/data/datasources/*_remote_datasource.dart

// ❌ NO USAR:
return ModelResponse.fromJson(response.data);

// ✅ USAR:
return Model.fromJson(response.data);
// Y actualizar los modelos Freezed para no usar wrapper "data"
```

#### Opción B: API usa "data" pero sin "success"

**Tu API:**
```json
{
  "data": { ... }
}
```

**Cambiar los modelos Freezed:**
```dart
@freezed
class ResponseModel with _$ResponseModel {
  const factory ResponseModel({
    required DataModel data,
    // Remover 'success' y 'message' si no existen
  }) = _ResponseModel;
}
```

---

## 5. 🔄 Paginación

### Formato actual en `payment_model.dart`:

```dart
@freezed
class PaginationMeta with _$PaginationMeta {
  const factory PaginationMeta({
    @JsonKey(name: 'current_page') required int currentPage,
    @JsonKey(name: 'last_page') required int lastPage,
    @JsonKey(name: 'per_page') required int perPage,
    required int total,
  }) = _PaginationMeta;
}
```

### Si tu API usa nombres diferentes:

**Laravel (ejemplo):**
```json
{
  "data": [...],
  "links": {...},
  "meta": {
    "current_page": 1,
    "from": 1,
    "last_page": 5,
    "per_page": 15,
    "to": 15,
    "total": 75
  }
}
```
✅ Este formato YA está soportado

**Django (ejemplo):**
```json
{
  "count": 75,
  "next": "url",
  "previous": null,
  "results": [...]
}
```

**Si usas este, cambiar:**
```dart
@freezed
class PaginationMeta with _$PaginationMeta {
  const factory PaginationMeta({
    required int count,
    String? next,
    String? previous,
  }) = _PaginationMeta;
}
```

---

## 6. ❌ Manejo de Errores

### Verificar formato de errores de tu API

**Formato actual esperado:**
```json
{
  "success": false,
  "message": "Error description"
}
```

### Cambiar en cada datasource si es diferente:

```dart
// lib/features/*/data/datasources/*_remote_datasource.dart

on DioException catch (e) {
  // ❌ SI TU API USA OTRO FORMATO:
  // Ejemplo: { "error": "message" }
  final message = e.response?.data?['error'] ?? 'Error desconocido';

  // O: { "message": "...", "errors": [...] }
  final message = e.response?.data?['message'] ?? 'Error desconocido';
  final errors = e.response?.data?['errors'] as List?;

  throw ApiException(
    message: message,
    statusCode: e.response?.statusCode ?? 500,
  );
}
```

---

## 7. 📅 Formato de Fechas

### Verificar formato de fechas en tu API

**Actual: ISO 8601**
```json
{
  "created_at": "2024-01-15T10:30:00Z",
  "due_date": "2024-02-01T00:00:00Z"
}
```

**Si tu API usa otro formato:**

#### Formato Unix Timestamp:
```json
{
  "created_at": 1705319400
}
```

**Cambiar en modelos:**
```dart
@JsonKey(
  name: 'created_at',
  fromJson: _fromUnixTimestamp,
  toJson: _toUnixTimestamp,
)
required DateTime createdAt,

static DateTime _fromUnixTimestamp(int timestamp) {
  return DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
}

static int _toUnixTimestamp(DateTime date) {
  return date.millisecondsSinceEpoch ~/ 1000;
}
```

#### Formato personalizado:
```json
{
  "created_at": "15/01/2024 10:30"
}
```

**Cambiar en modelos:**
```dart
@JsonKey(
  name: 'created_at',
  fromJson: _parseCustomDate,
)
required DateTime createdAt,

static DateTime _parseCustomDate(String dateStr) {
  final format = DateFormat('dd/MM/yyyy HH:mm');
  return format.parse(dateStr);
}
```

---

## 8. 📤 Subida de Archivos

### Verificar en `payment_remote_datasource.dart`

**Formato actual de multipart:**
```dart
final formData = FormData.fromMap({
  'file': await MultipartFile.fromFile(
    file.path,
    filename: fileName,
    contentType: MediaType('image', extension),
  ),
});
```

**Si tu API espera:**
- Diferente nombre de campo: cambiar `'file'` por el correcto
- Headers específicos: agregar en el request
- Datos adicionales: agregar más campos al FormData

```dart
final formData = FormData.fromMap({
  'proof': await MultipartFile.fromFile(...), // Nombre diferente
  'payment_id': paymentId, // Datos adicionales
  'type': 'image',
});
```

---

## 9. 🎯 Endpoints Específicos

### Dashboard - Parámetro de Rol

**Actual:**
```dart
GET /dashboard?role=ClubAdmin
```

**Si tu API usa URL diferente:**
```dart
// Opción 1: Por path
GET /dashboard/club-admin

// Opción 2: Sin parámetro (rol desde token)
GET /dashboard

// Cambiar en dashboard_remote_datasource.dart:
final endpoint = ApiEndpoints.dashboard; // Sin query params
```

### Pagos - Filtros

**Actual:**
```dart
GET /payments?status=pending&type=monthly_fee&page=1
```

**Verificar nombres de parámetros en tu API:**
- `status` → podría ser `payment_status` o `state`
- `type` → podría ser `payment_type` o `category`
- `page` → podría ser `page_number` o `offset`

```dart
// Cambiar en payment_remote_datasource.dart
final queryParams = <String, dynamic>{
  'payment_status': status, // En lugar de 'status'
  'category': type,         // En lugar de 'type'
  'page_number': page,      // En lugar de 'page'
};
```

---

## 10. 🔍 Logging y Debug

### Habilitar logs detallados durante integración

```dart
// lib/core/network/api_client.dart

Dio _createDio() {
  final dio = Dio(BaseOptions(...));

  // ✅ AGREGAR ESTO DURANTE INTEGRACIÓN:
  dio.interceptors.add(LogInterceptor(
    request: true,
    requestHeader: true,
    requestBody: true,
    responseHeader: true,
    responseBody: true,
    error: true,
    logPrint: (obj) => AppLogger.d('API', obj.toString()),
  ));

  return dio;
}
```

**⚠️ REMOVER o CONDICIONAR en producción:**
```dart
if (AppConfig.isDevelopment) {
  dio.interceptors.add(LogInterceptor(...));
}
```

---

## 📝 Checklist Pre-Conexión

### Antes de conectar con la API real:

#### Configuración Base
- [ ] Cambiar `baseUrl` en `environment.dart`
- [ ] Remover `DevHttpOverrides` en producción
- [ ] Verificar que todas las URLs usan HTTPS

#### Autenticación
- [ ] Probar login y verificar token
- [ ] Verificar formato del header `Authorization`
- [ ] Implementar refresh token (si aplica)
- [ ] Probar logout

#### Estructura de Datos
- [ ] Verificar formato de respuestas exitosas
- [ ] Verificar formato de errores
- [ ] Verificar nombres de campos JSON
- [ ] Verificar formato de fechas
- [ ] Verificar paginación

#### Endpoints
- [ ] Verificar cada endpoint en Postman/Insomnia
- [ ] Verificar query parameters
- [ ] Verificar request bodies
- [ ] Verificar multipart/form-data

#### Seguridad
- [ ] No exponer API keys en el código
- [ ] No hacer commit de tokens de prueba
- [ ] Verificar que los certificados SSL son válidos
- [ ] Implementar rate limiting en cliente

---

## 🆘 Testing Rápido

### Script de prueba básico:

```dart
// Crear un archivo test_api.dart en la raíz

Future<void> testAPI() async {
  final dio = Dio();

  try {
    // Test 1: Endpoint base
    final response = await dio.get('https://tu-api.com/api/v1/health');
    print('✅ API Reachable: ${response.statusCode}');

    // Test 2: Login
    final loginResponse = await dio.post(
      'https://tu-api.com/api/v1/auth/login',
      data: {'email': 'test@test.com', 'password': 'test123'},
    );
    print('✅ Login OK: ${loginResponse.data}');

    // Test 3: Endpoint autenticado
    final token = loginResponse.data['data']['token'];
    final dashboardResponse = await dio.get(
      'https://tu-api.com/api/v1/dashboard',
      options: Options(headers: {'Authorization': 'Bearer $token'}),
    );
    print('✅ Dashboard OK: ${dashboardResponse.data}');

  } catch (e) {
    print('❌ Error: $e');
  }
}
```

---

## 📞 Soporte

Si encuentras problemas:
1. Revisar logs del servidor backend
2. Usar Postman para probar endpoints directamente
3. Comparar request de Postman vs request de la app
4. Revisar documentación Swagger/OpenAPI del backend

