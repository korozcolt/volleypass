# VolleyPass Mobile - Guía de Desarrollo

> **LECTURA OBLIGATORIA** antes de comenzar cualquier desarrollo
>
> Esta guía debe ser consultada antes de:
> - Implementar nuevas funcionalidades
> - Hacer cambios arquitectónicos
> - Agregar dependencias
> - Crear pull requests

---

## 📚 Documentación del Proyecto

El proyecto VolleyPass Mobile está completamente documentado. **DEBES leer** estos documentos en orden:

### 1️⃣ PRIMERO: Normas de Desarrollo
**Archivo:** [`DEVELOPMENT_STANDARDS.md`](./DEVELOPMENT_STANDARDS.md)

**Contenido:**
- Principios fundamentales (CERO hardcoding, todo con fundamento)
- Arquitectura del proyecto (Clean Architecture + Feature-First)
- Gestión de configuración por entornos
- Conectividad con API (principio de transparencia)
- Manejo de estado (Riverpod)
- Seguridad
- Testing
- Anti-patrones a evitar

**¿Por qué leerlo?**
Define las reglas de oro del proyecto. Cualquier código que no cumpla estos estándares será rechazado.

---

### 2️⃣ SEGUNDO: Plan MVP
**Archivo:** [`MVP_PLAN.md`](./MVP_PLAN.md)

**Contenido:**
- Visión del MVP
- Usuarios objetivo
- Funcionalidades core (prioridades)
- Funcionalidades fuera del MVP
- Pantallas del MVP
- Plan de fases (sprints)
- Criterios de aceptación
- Métricas de éxito

**¿Por qué leerlo?**
Define QUÉ vamos a construir y en qué orden. Te da contexto sobre prioridades y alcance.

---

### 3️⃣ TERCERO: Pantallas y Funcionalidades
**Archivo:** [`SCREENS_AND_FEATURES.md`](./SCREENS_AND_FEATURES.md)

**Contenido:**
- Todos los módulos de la aplicación
- Detalle de cada pantalla
- Componentes compartidos
- Navegación
- UI/UX mockups en texto
- Endpoints de API que usa cada pantalla
- Modelos de datos

**¿Por qué leerlo?**
Define CÓMO debe ser cada pantalla, qué información muestra, qué acciones permite. Es tu referencia de implementación.

---

### 4️⃣ CUARTO: Arquitectura Técnica
**Archivo:** [`TECHNICAL_ARCHITECTURE.md`](./TECHNICAL_ARCHITECTURE.md)

**Contenido:**
- Principios arquitectónicos (SOLID)
- Clean Architecture en detalle
- Estructura de capas (Presentation, Domain, Data)
- Gestión de estado con Riverpod
- Networking con Dio
- Almacenamiento (Secure Storage, Hive, SharedPreferences)
- Autenticación
- Modo Offline
- Dependencias
- Patrones de diseño

**¿Por qué leerlo?**
Define CÓMO implementar técnicamente. Ejemplos de código reales, estructura de carpetas, patrones a seguir.

---

### 5️⃣ QUINTO: Documentación de la API
**Archivo:** [`API_DOCUMENTATION.MD`](./API_DOCUMENTATION.MD)

**Contenido:**
- Todos los endpoints disponibles
- Autenticación (Sanctum)
- Request/Response de cada endpoint
- Validaciones
- Códigos de error
- Rate limiting
- Ejemplos de uso

**¿Por qué leerlo?**
Es la referencia completa de la API del backend. Todo lo que la app puede hacer está aquí.

---

## 🚀 Workflow de Desarrollo

### Antes de Empezar Cualquier Tarea

1. **Lee la documentación relevante**
   - Si vas a implementar login → Lee SCREENS_AND_FEATURES.md (sección Auth)
   - Si vas a implementar verificación QR → Lee SCREENS_AND_FEATURES.md (sección QR)
   - Siempre revisa DEVELOPMENT_STANDARDS.md y TECHNICAL_ARCHITECTURE.md

2. **Crea un plan técnico**
   - ¿Qué entidades necesitas? (Domain layer)
   - ¿Qué modelos necesitas? (Data layer)
   - ¿Qué casos de uso? (Domain layer)
   - ¿Qué repositorio? (Domain interface + Data implementation)
   - ¿Qué providers? (Presentation layer)
   - ¿Qué estados? (Presentation layer)
   - ¿Qué widgets? (Presentation layer)

3. **Documenta tus decisiones**
   - Si eliges una librería: ¿Por qué?
   - Si cambias arquitectura: ¿Por qué?
   - Si te desvías de la norma: ¿Por qué y está justificado?

### Durante el Desarrollo

1. **Sigue la arquitectura**
   ```
   lib/
   └── features/
       └── [feature_name]/
           ├── data/
           │   ├── models/
           │   ├── repositories/
           │   └── datasources/
           ├── domain/
           │   ├── entities/
           │   ├── repositories/
           │   └── usecases/
           └── presentation/
               ├── pages/
               ├── widgets/
               ├── providers/
               └── state/
   ```

2. **Escribe tests**
   - Test unitario por cada caso de uso
   - Test unitario por cada repositorio
   - Widget test por cada widget complejo
   - Integration test para flujos críticos

3. **No hagas hardcoding**
   ```dart
   // ❌ MAL
   final url = 'https://volleypass.test/api/v1';

   // ✅ BIEN
   final url = AppConfig.apiBaseUrl;
   ```

4. **Usa el principio de transparencia**
   ```dart
   // ❌ MAL - Controller llama API directamente
   class MyController {
     Future<void> loadData() async {
       final response = await http.get(...);
     }
   }

   // ✅ BIEN - Controller usa caso de uso
   class MyController {
     final LoadDataUseCase _useCase;

     Future<void> loadData() async {
       final result = await _useCase();
     }
   }
   ```

### Antes de Hacer Pull Request

1. **Checklist de código**
   - [ ] ¿Sigue Clean Architecture?
   - [ ] ¿No hay hardcoding?
   - [ ] ¿Tiene tests?
   - [ ] ¿Está documentado?
   - [ ] ¿Maneja errores correctamente?
   - [ ] ¿Funciona offline (si aplica)?

2. **Checklist de calidad**
   - [ ] ¿Pasan todos los tests?
   - [ ] ¿No hay warnings?
   - [ ] ¿Cumple con flutter analyze?
   - [ ] ¿Coverage > 70%?

3. **Checklist de documentación**
   - [ ] ¿Están documentadas las clases públicas?
   - [ ] ¿Están documentados los métodos complejos?
   - [ ] ¿Están actualizados los docs relevantes?

---

## 📋 Checklist por Tipo de Tarea

### Implementar Nueva Pantalla

1. **Preparación**
   - [ ] Leí la sección en SCREENS_AND_FEATURES.md
   - [ ] Identifiqué los endpoints de API necesarios
   - [ ] Identifiqué las entidades del dominio
   - [ ] Diseñé el flujo de datos

2. **Domain Layer**
   - [ ] Crear entidad en `domain/entities/`
   - [ ] Crear interfaz de repositorio en `domain/repositories/`
   - [ ] Crear casos de uso en `domain/usecases/`

3. **Data Layer**
   - [ ] Crear modelo en `data/models/` con json_serializable
   - [ ] Crear mapper de modelo a entidad
   - [ ] Implementar repositorio en `data/repositories/`
   - [ ] Crear remote datasource en `data/datasources/`

4. **Presentation Layer**
   - [ ] Crear estados con Freezed en `presentation/state/`
   - [ ] Crear providers en `presentation/providers/`
   - [ ] Crear page en `presentation/pages/`
   - [ ] Crear widgets en `presentation/widgets/`

5. **Testing**
   - [ ] Tests unitarios de casos de uso
   - [ ] Tests unitarios de repositorio
   - [ ] Widget tests de la pantalla
   - [ ] Integration test del flujo completo

6. **Documentación**
   - [ ] Documentar clases públicas
   - [ ] Actualizar README si es necesario

---

### Agregar Endpoint de API

1. **Documentación**
   - [ ] Verificar endpoint en API_DOCUMENTATION.MD
   - [ ] Entender request/response
   - [ ] Entender validaciones y errores

2. **Constantes**
   - [ ] Agregar endpoint a `core/constants/api_endpoints.dart`
   ```dart
   class ApiEndpoints {
     static const login = '/auth/login';
     static const verifyQr = '/mobile/verify';
     // ...
   }
   ```

3. **Modelo**
   - [ ] Crear request model (si aplica)
   - [ ] Crear response model con json_serializable
   - [ ] Crear mapper a entidad

4. **DataSource**
   - [ ] Agregar método en datasource
   - [ ] Usar ApiClient
   - [ ] Manejar errores

5. **Repository**
   - [ ] Implementar método en repositorio
   - [ ] Manejar conversión modelo → entidad
   - [ ] Retornar Either<Failure, Success>

6. **Testing**
   - [ ] Mock del ApiClient
   - [ ] Test de success case
   - [ ] Test de error cases

---

### Implementar Funcionalidad Offline

1. **Análisis**
   - [ ] ¿Qué datos necesito offline?
   - [ ] ¿Cuándo sincronizar?
   - [ ] ¿Cómo resolver conflictos?

2. **Storage**
   - [ ] Crear Hive adapter para el modelo
   - [ ] Registrar adapter
   - [ ] Crear box

3. **Local DataSource**
   - [ ] Crear local datasource
   - [ ] Implementar CRUD local

4. **Repository**
   - [ ] Modificar repositorio para usar ambas sources
   - [ ] Implementar lógica de caché
   - [ ] Implementar lógica offline-first

5. **Sync**
   - [ ] Crear servicio de sincronización
   - [ ] Detectar conectividad
   - [ ] Queue de operaciones pendientes
   - [ ] Auto-sync al recuperar conexión

6. **Testing**
   - [ ] Test offline scenarios
   - [ ] Test sync scenarios
   - [ ] Test conflict resolution

---

## 🛠️ Setup del Proyecto

### Requisitos

- Flutter 3.10+
- Dart 3.0+
- Android Studio / VS Code
- Xcode (para iOS)

### Instalación

```bash
# 1. Clonar repositorio
git clone [url]
cd volleypass

# 2. Instalar dependencias
flutter pub get

# 3. Generar código
flutter pub run build_runner build --delete-conflicting-outputs

# 4. Configurar entorno (dev/staging/prod)
# Ver: DEVELOPMENT_STANDARDS.md - Gestión de Configuración

# 5. Ejecutar
flutter run
```

### Comandos Útiles

```bash
# Ejecutar tests
flutter test

# Ejecutar tests con coverage
flutter test --coverage

# Ver coverage
genhtml coverage/lcov.info -o coverage/html
open coverage/html/index.html

# Analizar código
flutter analyze

# Formatear código
dart format .

# Generar código (freezed, json_serializable, etc)
flutter pub run build_runner build --delete-conflicting-outputs

# Limpiar y regenerar
flutter pub run build_runner clean
flutter pub run build_runner build --delete-conflicting-outputs

# Ejecutar en dispositivo específico
flutter devices
flutter run -d [device_id]
```

---

## 🎯 Estructura de Commits

Usar [Conventional Commits](https://www.conventionalcommits.org/):

```
<type>(<scope>): <subject>

<body>

<footer>
```

**Types:**
- `feat`: Nueva funcionalidad
- `fix`: Bug fix
- `docs`: Cambios en documentación
- `style`: Formateo, no afecta código
- `refactor`: Refactorización
- `test`: Agregar tests
- `chore`: Mantenimiento

**Ejemplos:**
```
feat(auth): implement login screen

- Add login page with email/password form
- Implement login use case
- Add auth state management with Riverpod
- Add unit tests for login use case

Closes #123
```

```
fix(qr): validate QR code format before scanning

- Add regex validation for 64-char hex QR codes
- Show error message for invalid format
- Add unit test for validation

Fixes #456
```

---

## 🚨 Reglas de Oro

### 1. **SIEMPRE lee la documentación ANTES de escribir código**

No asumas. No improvises. Lee primero.

### 2. **NUNCA hagas hardcoding**

Si un valor puede cambiar, debe estar en configuración.

### 3. **SIEMPRE escribe tests**

No hay excusas. Si no tiene tests, no está completo.

### 4. **SIEMPRE sigue Clean Architecture**

Respeta las capas. No las mezcles.

### 5. **SIEMPRE documenta**

Si escribiste código complejo, explica por qué.

### 6. **NUNCA bypasses la arquitectura**

Si necesitas hacer algo fuera de lo establecido, discútelo primero.

### 7. **SIEMPRE maneja errores**

No asumas que todo funcionará. Maneja los errores apropiadamente.

### 8. **SIEMPRE piensa en offline**

¿Qué pasa si no hay internet? ¿Se rompe la app?

### 9. **NUNCA commitees código roto**

Si no compila o los tests fallan, no hagas commit.

### 10. **SIEMPRE pide code review**

Otro par de ojos siempre ayuda.

---

## 📞 ¿Tienes Dudas?

1. **Primero:** Lee la documentación relevante
2. **Segundo:** Busca en el código existente ejemplos similares
3. **Tercero:** Pregunta al equipo

---

## 📚 Referencias Adicionales

- [Flutter Documentation](https://docs.flutter.dev/)
- [Riverpod Documentation](https://riverpod.dev/)
- [Clean Architecture](https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html)
- [SOLID Principles](https://www.digitalocean.com/community/conceptual_articles/s-o-l-i-d-the-first-five-principles-of-object-oriented-design)
- [Effective Dart](https://dart.dev/guides/language/effective-dart)

---

## ✅ Checklist Final

Antes de marcar una tarea como completa:

- [ ] Leí toda la documentación relevante
- [ ] Entiendo el problema que estoy resolviendo
- [ ] Tengo un plan técnico claro
- [ ] Seguí Clean Architecture
- [ ] No hay hardcoding
- [ ] Escribí tests (coverage > 70%)
- [ ] Todos los tests pasan
- [ ] Documenté el código
- [ ] Manejo errores apropiadamente
- [ ] Funciona offline (si aplica)
- [ ] Pasó code review
- [ ] Actualicé la documentación (si aplica)

---

## 🎓 Aprendizaje Continuo

Este proyecto es un ejercicio de excelencia técnica. Aprende de cada línea que escribes.

**Pregúntate siempre:**
- ¿Es esto mantenible?
- ¿Es esto testeable?
- ¿Es esto escalable?
- ¿Es esto seguro?
- ¿Hay una manera mejor?

---

**Bienvenido al proyecto VolleyPass Mobile. Let's build something great! 🚀**

---

**Última actualización:** Diciembre 26, 2024
