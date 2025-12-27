# Índice de Documentación - VolleyPass Mobile

> **Centro de documentación del proyecto**
> Última actualización: Diciembre 26, 2024

---

## 📚 Documentos del Proyecto

### 🌟 Esenciales (Lectura Obligatoria)

| # | Documento | Descripción | Cuándo Leer |
|---|-----------|-------------|-------------|
| 1 | **[README_DEVELOPMENT.md](./README_DEVELOPMENT.md)** | Guía principal de desarrollo. Tu punto de partida. | **SIEMPRE PRIMERO** |
| 2 | **[DEVELOPMENT_STANDARDS.md](./DEVELOPMENT_STANDARDS.md)** | Normas y estándares de desarrollo. Código de conducta técnico. | Antes de escribir código |
| 3 | **[TECHNICAL_ARCHITECTURE.md](./TECHNICAL_ARCHITECTURE.md)** | Arquitectura técnica completa con ejemplos de código. | Al diseñar soluciones |

### 📋 Planning y Features

| # | Documento | Descripción | Cuándo Leer |
|---|-----------|-------------|-------------|
| 4 | **[MVP_PLAN.md](./MVP_PLAN.md)** | Plan del producto mínimo viable. Alcance y prioridades. | Al iniciar proyecto |
| 5 | **[SCREENS_AND_FEATURES.md](./SCREENS_AND_FEATURES.md)** | Detalle completo de todas las pantallas y funcionalidades. | Al implementar features |

### 🌐 API

| # | Documento | Descripción | Cuándo Leer |
|---|-----------|-------------|-------------|
| 6 | **[API_DOCUMENTATION.MD](./API_DOCUMENTATION.MD)** | Documentación completa de la API del backend. | Al consumir endpoints |
| 7 | **[README.md (backend)](.doc/README.md)** | Información del sistema backend Archive Master. | Para contexto general |

---

## 🗺️ Mapa de Lectura

### Para Nuevos Desarrolladores

**Día 1:**
1. Lee [README.md](../README.md) del proyecto (5 min)
2. Lee [README_DEVELOPMENT.md](./README_DEVELOPMENT.md) completo (30 min)
3. Lee [DEVELOPMENT_STANDARDS.md](./DEVELOPMENT_STANDARDS.md) completo (45 min)

**Día 2:**
4. Lee [MVP_PLAN.md](./MVP_PLAN.md) completo (30 min)
5. Lee [TECHNICAL_ARCHITECTURE.md](./TECHNICAL_ARCHITECTURE.md) completo (60 min)

**Día 3:**
6. Revisa [SCREENS_AND_FEATURES.md](./SCREENS_AND_FEATURES.md) general (30 min)
7. Revisa [API_DOCUMENTATION.MD](./API_DOCUMENTATION.MD) general (30 min)

**Total:** ~4 horas de lectura inicial

---

### Para Implementar una Feature

**Paso 1: Planning** (30 min)
1. Lee la sección específica en [SCREENS_AND_FEATURES.md](./SCREENS_AND_FEATURES.md)
2. Revisa los endpoints relevantes en [API_DOCUMENTATION.MD](./API_DOCUMENTATION.MD)
3. Revisa ejemplos en [TECHNICAL_ARCHITECTURE.md](./TECHNICAL_ARCHITECTURE.md)

**Paso 2: Diseño Técnico** (1-2 horas)
1. Define entidades (Domain)
2. Define modelos (Data)
3. Define interfaces de repositorios
4. Define casos de uso
5. Define estados
6. Diseña UI

**Paso 3: Implementación** (variable)
1. Sigue [DEVELOPMENT_STANDARDS.md](./DEVELOPMENT_STANDARDS.md)
2. Consulta [TECHNICAL_ARCHITECTURE.md](./TECHNICAL_ARCHITECTURE.md) para ejemplos

---

## 📖 Guías por Tema

### Autenticación
- **Standards:** [DEVELOPMENT_STANDARDS.md - Seguridad](./DEVELOPMENT_STANDARDS.md#-seguridad)
- **Architecture:** [TECHNICAL_ARCHITECTURE.md - Autenticación](./TECHNICAL_ARCHITECTURE.md#-autenticación)
- **Screens:** [SCREENS_AND_FEATURES.md - Módulo de Autenticación](./SCREENS_AND_FEATURES.md#-módulo-de-autenticación)
- **API:** [API_DOCUMENTATION.MD - Autenticación](./API_DOCUMENTATION.MD#-autenticación)

### Verificación QR
- **MVP:** [MVP_PLAN.md - Verificación QR](./MVP_PLAN.md#2-verificación-qr-)
- **Screens:** [SCREENS_AND_FEATURES.md - Módulo de Verificación QR](./SCREENS_AND_FEATURES.md#-módulo-de-verificación-qr)
- **API:** [API_DOCUMENTATION.MD - Sistema de Verificación QR](./API_DOCUMENTATION.MD#-sistema-de-verificación-qr)

### Modo Offline
- **Standards:** [DEVELOPMENT_STANDARDS.md - Almacenamiento](./DEVELOPMENT_STANDARDS.md#-almacenamiento)
- **Architecture:** [TECHNICAL_ARCHITECTURE.md - Modo Offline](./TECHNICAL_ARCHITECTURE.md#-modo-offline)
- **MVP:** [MVP_PLAN.md - Modo Offline](./MVP_PLAN.md#3-modo-offline-)

### Sesiones de Partido
- **MVP:** [MVP_PLAN.md - Sesiones de Verificación](./MVP_PLAN.md#4-sesiones-de-verificación-)
- **Screens:** [SCREENS_AND_FEATURES.md - Módulo de Sesiones](./SCREENS_AND_FEATURES.md#-módulo-de-sesiones)
- **API:** [API_DOCUMENTATION.MD - Sesiones de Partido](./API_DOCUMENTATION.MD#-sesiones-de-partido-match-sessions)

### Torneos y Partidos
- **MVP:** [MVP_PLAN.md - Consulta Pública de Torneos](./MVP_PLAN.md#5-consulta-pública-de-torneos-)
- **Screens:** [SCREENS_AND_FEATURES.md - Torneos](./SCREENS_AND_FEATURES.md#-módulo-de-torneos-públicos) y [Partidos](./SCREENS_AND_FEATURES.md#-módulo-de-partidos)
- **API:** [API_DOCUMENTATION.MD - Torneos Públicos](./API_DOCUMENTATION.MD#-endpoints-públicos)

### Networking y API
- **Standards:** [DEVELOPMENT_STANDARDS.md - Conectividad con API](./DEVELOPMENT_STANDARDS.md#-conectividad-con-api)
- **Architecture:** [TECHNICAL_ARCHITECTURE.md - Networking](./TECHNICAL_ARCHITECTURE.md#-networking)
- **API:** [API_DOCUMENTATION.MD - Completo](./API_DOCUMENTATION.MD)

### State Management
- **Standards:** [DEVELOPMENT_STANDARDS.md - Manejo de Estado](./DEVELOPMENT_STANDARDS.md#-manejo-de-estado)
- **Architecture:** [TECHNICAL_ARCHITECTURE.md - Gestión de Estado](./TECHNICAL_ARCHITECTURE.md#-gestión-de-estado)

### Testing
- **Standards:** [DEVELOPMENT_STANDARDS.md - Testing](./DEVELOPMENT_STANDARDS.md#-testing)
- **MVP:** [MVP_PLAN.md - Criterios de Aceptación](./MVP_PLAN.md#-criterios-de-aceptación-del-mvp)

---

## 🔍 Búsqueda Rápida

### Patrones y Ejemplos de Código

#### Clean Architecture
- [TECHNICAL_ARCHITECTURE.md - Clean Architecture](./TECHNICAL_ARCHITECTURE.md#️-clean-architecture)
- [TECHNICAL_ARCHITECTURE.md - Estructura de Capas](./TECHNICAL_ARCHITECTURE.md#-estructura-de-capas)

#### Repository Pattern
```dart
// Ver: TECHNICAL_ARCHITECTURE.md - Capa de Dominio
abstract class AuthRepository {
  Future<Either<Failure, User>> login(...);
}
```

#### UseCase Pattern
```dart
// Ver: TECHNICAL_ARCHITECTURE.md - Ejemplo de UseCase
class LoginUseCase {
  Future<Either<Failure, User>> call(LoginParams params) async {...}
}
```

#### State Management (Riverpod)
```dart
// Ver: TECHNICAL_ARCHITECTURE.md - Gestión de Estado
final authStateProvider = StateNotifierProvider<AuthNotifier, AuthState>(...);
```

#### API Client
```dart
// Ver: TECHNICAL_ARCHITECTURE.md - API Client
class ApiClient {
  Future<ApiResponse<T>> get<T>(...) async {...}
}
```

#### Offline Storage
```dart
// Ver: TECHNICAL_ARCHITECTURE.md - Almacenamiento
class OfflineStorage {
  Future<void> saveVerification(...) async {...}
}
```

---

## ❓ FAQ Rápido

### ¿Por dónde empiezo?
**R:** Lee [README_DEVELOPMENT.md](./README_DEVELOPMENT.md) primero. Te guía paso a paso.

### ¿Dónde veo qué pantallas implementar?
**R:** [SCREENS_AND_FEATURES.md](./SCREENS_AND_FEATURES.md) tiene el detalle completo de cada pantalla.

### ¿Dónde encuentro ejemplos de código?
**R:** [TECHNICAL_ARCHITECTURE.md](./TECHNICAL_ARCHITECTURE.md) tiene ejemplos reales de cada patrón.

### ¿Cómo sé qué endpoints usar?
**R:** [API_DOCUMENTATION.MD](./API_DOCUMENTATION.MD) documenta todos los endpoints con ejemplos.

### ¿Qué puedo y no puedo hacer?
**R:** [DEVELOPMENT_STANDARDS.md](./DEVELOPMENT_STANDARDS.md) define las reglas del proyecto.

### ¿Cuál es el alcance del MVP?
**R:** [MVP_PLAN.md](./MVP_PLAN.md) define exactamente qué se incluye y qué no.

### ¿Cómo implemento offline?
**R:** [TECHNICAL_ARCHITECTURE.md - Modo Offline](./TECHNICAL_ARCHITECTURE.md#-modo-offline)

### ¿Cómo manejo estado?
**R:** [TECHNICAL_ARCHITECTURE.md - Gestión de Estado](./TECHNICAL_ARCHITECTURE.md#-gestión-de-estado)

---

## 📊 Métricas de Documentación

| Documento | Páginas (est.) | Tiempo de lectura | Actualización |
|-----------|----------------|-------------------|---------------|
| README.md | 5 | 10 min | 26/12/2024 |
| README_DEVELOPMENT.md | 10 | 25 min | 26/12/2024 |
| DEVELOPMENT_STANDARDS.md | 15 | 40 min | 26/12/2024 |
| MVP_PLAN.md | 12 | 30 min | 26/12/2024 |
| SCREENS_AND_FEATURES.md | 25 | 60 min | 26/12/2024 |
| TECHNICAL_ARCHITECTURE.md | 20 | 50 min | 26/12/2024 |
| API_DOCUMENTATION.MD | 50+ | Referencia | 26/12/2024 |

**Total de lectura inicial:** ~4 horas

---

## ✅ Checklist de Onboarding

Para nuevos miembros del equipo:

### Semana 1
- [ ] Leí README.md del proyecto
- [ ] Leí README_DEVELOPMENT.md completo
- [ ] Leí DEVELOPMENT_STANDARDS.md completo
- [ ] Leí MVP_PLAN.md completo
- [ ] Leí TECHNICAL_ARCHITECTURE.md completo
- [ ] Revisé SCREENS_AND_FEATURES.md (general)
- [ ] Revisé API_DOCUMENTATION.MD (general)
- [ ] Configuré mi entorno de desarrollo
- [ ] Ejecuté la app en mi dispositivo

### Semana 2
- [ ] Implementé mi primera feature (pequeña)
- [ ] Escribí tests para mi feature
- [ ] Hice mi primer PR
- [ ] Recibí code review
- [ ] Entiendo el workflow completo

---

## 🔄 Mantenimiento de Documentación

### Responsabilidades

**Al agregar una feature:**
- Actualizar SCREENS_AND_FEATURES.md si es pantalla nueva
- Actualizar MVP_PLAN.md si cambia el scope
- Actualizar README.md si cambia funcionalidad core

**Al cambiar arquitectura:**
- Actualizar TECHNICAL_ARCHITECTURE.md
- Actualizar DEVELOPMENT_STANDARDS.md si aplica
- Documentar decisión técnica

**Al cambiar API:**
- Actualizar API_DOCUMENTATION.MD
- Notificar al equipo

### Versionado

Todos los documentos tienen:
- Versión en el header
- Fecha de última actualización
- Fecha de próxima revisión (si aplica)

---

## 📞 Contacto

¿Documentación faltante o incorrecta?

1. Crear issue en el repo
2. Proponer cambio en PR
3. Notificar al equipo

---

## 📚 Recursos Adicionales

### Externas
- [Flutter Documentation](https://docs.flutter.dev/)
- [Riverpod Documentation](https://riverpod.dev/)
- [Clean Architecture Blog](https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html)
- [SOLID Principles](https://www.digitalocean.com/community/conceptual_articles/s-o-l-i-d-the-first-five-principles-of-object-oriented-design)

### Internas
- Slack: #volleypass-mobile
- Wiki: [Pendiente]
- Figma: [Pendiente]

---

## 🎯 Próximos Pasos

Después de leer toda la documentación:

1. ✅ Configurar entorno de desarrollo
2. ✅ Ejecutar la app
3. ✅ Explorar el código existente
4. ✅ Elegir una feature del MVP para implementar
5. ✅ Crear plan técnico
6. ✅ Empezar a codear

**¡Bienvenido al equipo! 🚀**

---

**Última actualización:** Diciembre 26, 2024
**Mantenido por:** Equipo VolleyPass
