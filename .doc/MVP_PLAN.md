# Plan MVP - VolleyPass Mobile

> **Versión:** 1.0.0
> **Fecha:** Diciembre 26, 2024
> **Objetivo:** Definir el alcance mínimo viable del producto

---

## 📋 Tabla de Contenidos

1. [Visión del MVP](#visión-del-mvp)
2. [Usuarios Objetivo](#usuarios-objetivo)
3. [Funcionalidades Core](#funcionalidades-core)
4. [Funcionalidades Fuera del MVP](#funcionalidades-fuera-del-mvp)
5. [Pantallas del MVP](#pantallas-del-mvp)
6. [Arquitectura Técnica](#arquitectura-técnica)
7. [Plan de Fases](#plan-de-fases)
8. [Criterios de Aceptación](#criterios-de-aceptación)
9. [Métricas de Éxito](#métricas-de-éxito)

---

## 🎯 Visión del MVP

### Problema a Resolver

Los verificadores de torneos de voleibol necesitan una aplicación móvil para:
- Verificar carnets de jugadores mediante escaneo QR
- Trabajar sin conexión a internet en estadios
- Sincronizar verificaciones cuando haya conexión
- Ver información de torneos y partidos

### Propuesta de Valor

Una aplicación móvil nativa (Flutter) que permite a verificadores autenticados escanear carnets QR de jugadores, verificar su elegibilidad para jugar, y gestionar sesiones de verificación en partidos, funcionando tanto online como offline.

---

## 👥 Usuarios Objetivo

### Usuario Primario: Verificador
- Rol: Verificador de carnets en eventos
- Necesidades:
  - Escanear carnets rápidamente
  - Ver estado del jugador (apto/no apto)
  - Trabajar sin conexión
  - Ver historial de verificaciones

### Usuario Secundario: Jugador/Espectador
- Rol: Usuario que consulta información pública
- Necesidades:
  - Ver torneos activos
  - Ver partidos en vivo
  - Consultar tablas de posiciones

---

## ✅ Funcionalidades Core (MVP)

### 1. Autenticación ⭐⭐⭐⭐⭐
**Prioridad:** CRÍTICA

**User Stories:**
- Como verificador, quiero iniciar sesión con email y contraseña
- Como verificador, quiero que mi sesión persista para no tener que loguearme constantemente
- Como verificador, quiero cerrar sesión de forma segura

**Endpoints API:**
- `POST /auth/login`
- `GET /auth/user`
- `POST /auth/logout`

**Pantallas:**
- Splash Screen
- Login
- Home (después de login)

**Criterios de Aceptación:**
- [ ] Login funcional con validación de campos
- [ ] Token almacenado de forma segura
- [ ] Sesión persiste entre reinicios de app
- [ ] Logout limpia token y redirige a login
- [ ] Manejo de errores de autenticación
- [ ] Rate limiting respetado (5 intentos/300s)

---

### 2. Verificación QR ⭐⭐⭐⭐⭐
**Prioridad:** CRÍTICA

**User Stories:**
- Como verificador, quiero escanear el QR de un carnet y ver si el jugador puede jugar
- Como verificador, quiero ver la foto del jugador para confirmar identidad
- Como verificador, quiero ver información de emergencia (tipo de sangre, contacto)
- Como verificador, quiero ver claramente si hay sanciones activas

**Endpoints API:**
- `POST /verify-qr` (público, con scanner_id)
- `POST /mobile/verify` (autenticado)

**Pantallas:**
- QR Scanner
- Resultado de Verificación (Apto/No Apto)
- Detalles del Jugador

**Criterios de Aceptación:**
- [ ] Cámara se abre y escanea QR correctamente
- [ ] Validación de formato QR (64 caracteres hex)
- [ ] Muestra resultado visual claro (verde/rojo)
- [ ] Muestra foto del jugador
- [ ] Muestra información de emergencia
- [ ] Muestra razón si no es apto (sanción, carnet vencido, etc.)
- [ ] Tiempo de respuesta < 2 segundos
- [ ] Sonido/vibración al escanear

---

### 3. Modo Offline ⭐⭐⭐⭐⭐
**Prioridad:** CRÍTICA

**User Stories:**
- Como verificador, quiero poder escanear carnets sin conexión a internet
- Como verificador, quiero que las verificaciones offline se sincronicen automáticamente
- Como verificador, quiero ver un indicador de cuántas verificaciones están pendientes de sincronización

**Endpoints API:**
- `POST /mobile/verifications/sync`

**Componentes:**
- Offline Storage (SQLite/Hive)
- Sync Manager
- Connectivity Monitor

**Criterios de Aceptación:**
- [ ] Detecta pérdida de conexión
- [ ] Almacena verificaciones localmente
- [ ] Indicador visual de modo offline
- [ ] Auto-sincroniza al recuperar conexión
- [ ] Muestra contador de verificaciones pendientes
- [ ] No pierde datos al cerrar app
- [ ] Manejo de conflictos en sincronización

---

### 4. Sesiones de Verificación ⭐⭐⭐⭐
**Prioridad:** ALTA

**User Stories:**
- Como verificador, quiero iniciar una sesión para un partido específico
- Como verificador, quiero ver el resumen de jugadores verificados en la sesión
- Como verificador, quiero finalizar la sesión al terminar el partido

**Endpoints API:**
- `GET /mobile/sessions/available-matches`
- `POST /mobile/sessions`
- `GET /mobile/sessions/active`
- `POST /mobile/sessions/{id}/complete`

**Pantallas:**
- Lista de Partidos Disponibles
- Sesión Activa
- Detalle de Sesión
- Resumen de Sesión

**Criterios de Aceptación:**
- [ ] Muestra partidos disponibles (6h atrás - 24h adelante)
- [ ] Solo permite una sesión activa por usuario
- [ ] Contador de verificaciones en tiempo real
- [ ] Separación por equipo (local/visitante)
- [ ] Resumen al finalizar sesión
- [ ] Historial de sesiones completadas

---

### 5. Consulta Pública de Torneos ⭐⭐⭐
**Prioridad:** MEDIA

**User Stories:**
- Como usuario, quiero ver la lista de torneos activos
- Como usuario, quiero ver los detalles de un torneo
- Como usuario, quiero ver la tabla de posiciones
- Como usuario, quiero ver los partidos programados

**Endpoints API:**
- `GET /public/tournaments`
- `GET /public/tournaments/{id}`
- `GET /public/tournaments/{id}/standings`
- `GET /public/matches/scheduled`

**Pantallas:**
- Lista de Torneos
- Detalle de Torneo
- Tabla de Posiciones
- Lista de Partidos

**Criterios de Aceptación:**
- [ ] Lista de torneos con filtros (estado, categoría, género)
- [ ] Paginación funcional
- [ ] Tabla de posiciones ordenada correctamente
- [ ] Partidos con filtro por fecha
- [ ] Pull-to-refresh
- [ ] Caché de datos

---

### 6. Partidos en Vivo ⭐⭐⭐
**Prioridad:** MEDIA

**User Stories:**
- Como usuario, quiero ver partidos que están en vivo
- Como usuario, quiero ver el marcador actualizado
- Como usuario, quiero ver el set actual y puntuación

**Endpoints API:**
- `GET /public/matches/live`
- `GET /matches/{id}/realtime`

**Pantallas:**
- Lista de Partidos en Vivo
- Detalle de Partido en Vivo

**Criterios de Aceptación:**
- [ ] Lista de partidos en vivo actualizada
- [ ] Marcador en tiempo real
- [ ] Información de sets completados
- [ ] Auto-refresh cada 10 segundos
- [ ] Indicador de "EN VIVO"

---

### 7. Perfil de Usuario ⭐⭐
**Prioridad:** BAJA

**User Stories:**
- Como usuario autenticado, quiero ver mi perfil
- Como usuario autenticado, quiero ver mis estadísticas de verificación
- Como usuario autenticado, quiero actualizar mi información

**Endpoints API:**
- `GET /users/profile`
- `PUT /users/profile`
- `GET /mobile/verifications/stats`

**Pantallas:**
- Perfil
- Editar Perfil
- Estadísticas

**Criterios de Aceptación:**
- [ ] Muestra información completa del usuario
- [ ] Edición de campos permitidos
- [ ] Estadísticas de verificaciones (total, hoy, promedio)
- [ ] Validación de formularios

---

## ❌ Funcionalidades Fuera del MVP

Las siguientes funcionalidades NO estarán en el MVP y se considerarán para versiones futuras:

### Fase 2 (Post-MVP)
- Sistema de notificaciones push
- Broadcasting en tiempo real (WebSockets)
- Gestión avanzada de sanciones
- Reportes y analytics avanzados
- Gestión de equipos
- Chat/Mensajería

### Fase 3 (Futuro)
- Múltiples idiomas (i18n)
- Modo oscuro
- Biometría (FaceID/TouchID)
- Exportación de reportes PDF
- Integración con redes sociales
- Sistema de badges/logros

---

## 📱 Pantallas del MVP

### Diagrama de Navegación

```
┌─────────────┐
│   Splash    │
└──────┬──────┘
       │
       ▼
┌─────────────┐     ┌──────────────┐
│    Login    │────▶│  Dashboard   │
└─────────────┘     └──────┬───────┘
                           │
        ┌──────────────────┼──────────────────┐
        │                  │                  │
        ▼                  ▼                  ▼
┌──────────────┐  ┌──────────────┐  ┌──────────────┐
│ Verificación │  │   Torneos    │  │    Perfil    │
│      QR      │  │   Públicos   │  │              │
└──────┬───────┘  └──────┬───────┘  └──────────────┘
       │                 │
       ▼                 ▼
┌──────────────┐  ┌──────────────┐
│  Resultado   │  │  Detalle de  │
│ Verificación │  │   Torneo     │
└──────────────┘  └──────────────┘
       │                 │
       ▼                 ▼
┌──────────────┐  ┌──────────────┐
│  Detalles    │  │   Tabla de   │
│  Jugador     │  │  Posiciones  │
└──────────────┘  └──────────────┘
       │
       ▼
┌──────────────┐
│   Sesión     │
│   Activa     │
└──────────────┘
```

### Prioridad de Implementación

1. **Sprint 1** (Core Infrastructure)
   - Splash Screen
   - Login
   - Dashboard básico

2. **Sprint 2** (Navegación y Verificación Core)
   - Menú Lateral con permisos por roles ✅
   - QR Scanner
   - Resultado Verificación
   - Detalles Jugador
   - Offline Storage

3. **Sprint 3** (Sesiones)
   - Lista Partidos Disponibles
   - Crear Sesión
   - Sesión Activa
   - Finalizar Sesión

4. **Sprint 4** (Público)
   - Lista Torneos
   - Detalle Torneo
   - Tabla Posiciones
   - Partidos Programados/En Vivo

5. **Sprint 5** (Perfil y Pulido)
   - Perfil Usuario
   - Estadísticas
   - Testing E2E
   - Bug fixes

---

## 🏗️ Arquitectura Técnica

### Stack Tecnológico

**Framework:**
- Flutter 3.10+
- Dart 3.0+

**Gestión de Estado:**
- Riverpod 2.4+

**Networking:**
- Dio 5.4+

**Storage:**
- flutter_secure_storage (tokens)
- Hive (datos offline)
- SharedPreferences (configuración)

**QR:**
- mobile_scanner 3.5+

**Otros:**
- freezed + json_serializable (modelos)
- dartz (functional programming)
- connectivity_plus (detección de red)
- logger (logging)

### Estructura de Capas

```
Presentation (UI)
       ↓
  Domain (Business Logic)
       ↓
  Data (API + Storage)
```

---

## 📅 Plan de Fases

### Fase 0: Setup (1 semana)
- [ ] Configurar proyecto Flutter
- [ ] Configurar flavors (dev/staging/prod)
- [ ] Configurar CI/CD básico
- [ ] Configurar estructura de carpetas
- [ ] Configurar dependencias base
- [ ] Configurar testing
- [ ] Crear modelos de datos base

### Fase 1: Autenticación (1 semana)
- [ ] Implementar Login UI
- [ ] Implementar Auth Repository
- [ ] Implementar Token Storage
- [ ] Implementar Auth State Management
- [ ] Implementar interceptores HTTP
- [ ] Testing de autenticación

### Fase 2: Verificación QR (2 semanas)
- [ ] Implementar QR Scanner
- [ ] Implementar Verificación Repository
- [ ] Implementar UI de resultados
- [ ] Implementar detalle de jugador
- [ ] Implementar validaciones
- [ ] Testing de verificación

### Fase 3: Modo Offline (1.5 semanas)
- [ ] Implementar Offline Storage
- [ ] Implementar Sync Manager
- [ ] Implementar Connectivity Monitor
- [ ] Implementar Queue de sincronización
- [ ] Testing offline

### Fase 4: Sesiones (1.5 semanas)
- [ ] Implementar Sessions Repository
- [ ] Implementar UI de creación de sesión
- [ ] Implementar UI de sesión activa
- [ ] Implementar finalización de sesión
- [ ] Testing de sesiones

### Fase 5: Consulta Pública (1 semana)
- [ ] Implementar Tournaments Repository
- [ ] Implementar UI de torneos
- [ ] Implementar UI de partidos
- [ ] Implementar caché
- [ ] Testing

### Fase 6: Perfil y Pulido (1 semana)
- [ ] Implementar Profile UI
- [ ] Implementar estadísticas
- [ ] Testing E2E
- [ ] Bug fixes
- [ ] Performance optimization
- [ ] Documentación

**Total Estimado:** 8-9 semanas

---

## ✅ Criterios de Aceptación del MVP

### Funcionales
- [ ] Usuario puede iniciar sesión
- [ ] Usuario puede escanear QR y ver resultado
- [ ] App funciona sin conexión
- [ ] Verificaciones offline se sincronizan
- [ ] Usuario puede crear y finalizar sesión de partido
- [ ] Usuario puede ver torneos y partidos públicos
- [ ] Usuario puede ver su perfil

### No Funcionales
- [ ] Tiempo de carga < 3 segundos
- [ ] Tiempo de escaneo QR < 2 segundos
- [ ] App funciona en iOS 12+ y Android 8+
- [ ] Coverage de tests > 70%
- [ ] Cero crashes en funcionalidades core
- [ ] Consumo de batería razonable
- [ ] Tamaño de app < 50MB

### Calidad
- [ ] Código cumple estándares definidos
- [ ] Documentación completa
- [ ] Tests pasando
- [ ] Sin code smells críticos
- [ ] Performance aceptable

---

## 📊 Métricas de Éxito

### KPIs Técnicos
- **Crash-free rate:** > 99%
- **API success rate:** > 95%
- **Offline sync success:** > 98%
- **App start time:** < 2s
- **QR scan time:** < 1.5s

### KPIs de Negocio
- **Usuarios activos diarios:** Meta inicial
- **Verificaciones por sesión:** Promedio
- **Tiempo promedio de verificación:** < 5s
- **Tasa de adopción:** % de verificadores usando la app
- **NPS (Net Promoter Score):** > 7

### Métricas de Calidad
- **Code coverage:** > 70%
- **Technical debt:** < 15%
- **Documentation coverage:** 100%
- **Security vulnerabilities:** 0 críticas

---

## 🎯 Definición de "Done"

Una funcionalidad se considera completada cuando:

1. ✅ Código implementado y revisado
2. ✅ Tests unitarios escritos y pasando
3. ✅ Tests de integración escritos y pasando
4. ✅ Documentación actualizada
5. ✅ Code review aprobado
6. ✅ QA testing completado
7. ✅ Performance aceptable
8. ✅ Accesibilidad considerada
9. ✅ Error handling implementado
10. ✅ Logging apropiado

---

## 📋 Checklist Pre-Release

Antes de lanzar el MVP:

### Testing
- [ ] Todos los tests unitarios pasan
- [ ] Todos los tests de integración pasan
- [ ] Testing manual de flows críticos
- [ ] Testing en dispositivos físicos (iOS/Android)
- [ ] Testing de modo offline
- [ ] Testing de sincronización
- [ ] Load testing básico

### Seguridad
- [ ] Tokens almacenados de forma segura
- [ ] HTTPS en todas las conexiones
- [ ] Validación de inputs
- [ ] Sin datos sensibles en logs
- [ ] Permisos mínimos necesarios

### Performance
- [ ] App inicia en < 3s
- [ ] Navegación fluida (60fps)
- [ ] Imágenes optimizadas
- [ ] Caché implementado
- [ ] Memory leaks verificados

### Documentación
- [ ] README actualizado
- [ ] API documentation completa
- [ ] Architecture documentation
- [ ] Deployment guide
- [ ] User manual básico

### Legal/Compliance
- [ ] Privacy policy
- [ ] Terms of service
- [ ] Permisos explicados
- [ ] GDPR considerations (si aplica)

---

## 🚀 Plan de Rollout

### Fase Alpha (Interna)
- **Duración:** 1 semana
- **Usuarios:** 5-10 verificadores internos
- **Objetivo:** Validar funcionalidad core

### Fase Beta (Cerrada)
- **Duración:** 2 semanas
- **Usuarios:** 20-30 verificadores seleccionados
- **Objetivo:** Validar estabilidad y UX

### Fase Beta (Abierta)
- **Duración:** 2 semanas
- **Usuarios:** Todos los verificadores interesados
- **Objetivo:** Testing en producción

### Release 1.0
- **Target:** Después de Beta abierta exitosa
- **Usuarios:** Todos
- **Canales:** App Store + Google Play

---

**Última actualización:** Diciembre 26, 2024
**Próxima revisión:** Al completar Fase 1
