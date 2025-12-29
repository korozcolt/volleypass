# VolleyPass Mobile - Revisión MVP Actual y Plan Fase 2

> **Fecha:** Diciembre 29, 2024
> **Versión Actual:** 1.0.0 (MVP Completado)
> **Siguiente Fase:** MVP 2.0 - Gestión Completa

---

## 📋 Tabla de Contenidos

1. [Resumen Ejecutivo](#resumen-ejecutivo)
2. [Estado Actual del MVP 1.0](#estado-actual-del-mvp-10)
3. [Análisis de Backend vs Mobile](#análisis-de-backend-vs-mobile)
4. [Funcionalidades Faltantes](#funcionalidades-faltantes)
5. [Propuesta MVP 2.0](#propuesta-mvp-20)
6. [Plan de Implementación](#plan-de-implementación)
7. [Priorización y Roadmap](#priorización-y-roadmap)

---

## 🎯 Resumen Ejecutivo

### Estado Actual
✅ **MVP 1.0 COMPLETADO** (100%)

El MVP original ha sido **completamente implementado** con todas las funcionalidades core operativas:
- ✅ Autenticación completa
- ✅ Verificación QR funcional
- ✅ Modo offline con sincronización
- ✅ Sesiones de verificación
- ✅ Torneos públicos con tablas de posiciones
- ✅ Dashboard básico

### Oportunidades Identificadas
El backend tiene **funcionalidades adicionales** que no están expuestas en mobile:
- 📊 **Estadísticas avanzadas** (dashboards por rol, analytics)
- 💰 **Gestión de pagos** (suscripciones, pagos pendientes)
- 👤 **Perfil completo** (edición, estadísticas personales)
- ⚡ **Partidos en vivo** (broadcasting, marcadores en tiempo real)
- ⚠️ **Sistema de sanciones** (visualización, gestión)
- 📱 **Gestión de equipos** (jugadores, categorías)

---

## ✅ Estado Actual del MVP 1.0

### Módulos Implementados y Operativos

#### 1. Autenticación (`auth`) ✅ COMPLETO
**Estado:** 100% funcional y testeado

**Funcionalidades:**
- ✅ Login con email y contraseña
- ✅ Token storage seguro (flutter_secure_storage)
- ✅ Persistencia de sesión
- ✅ Logout con limpieza de token
- ✅ Rate limiting respetado
- ✅ Interceptores HTTP
- ✅ Check de email disponible
- ✅ Gestión de tokens múltiples

**Endpoints Utilizados:**
- `POST /auth/login`
- `GET /auth/user`
- `POST /auth/logout`
- `POST /auth/logout-all`
- `GET /auth/tokens`
- `DELETE /auth/tokens/{id}`

**Arquitectura:**
- Domain: Entities, Repository interface, Use cases ✅
- Data: Models, Remote/Local datasources, Repository impl ✅
- Presentation: States, Providers, Notifiers, Pages ✅

---

#### 2. Verificación QR (`verification`) ✅ COMPLETO
**Estado:** 100% funcional con soporte offline

**Funcionalidades:**
- ✅ Escaneo de QR con cámara (mobile_scanner)
- ✅ Validación de formato QR (64 hex chars)
- ✅ Resultado visual (Apto/No Apto)
- ✅ Detalles completos del jugador
- ✅ Información de emergencia (tipo sangre, contacto)
- ✅ Verificación offline con sync
- ✅ Historial de verificaciones
- ✅ Indicador de conexión

**Endpoints Utilizados:**
- `POST /mobile/verify`
- `GET /mobile/verifications`
- `POST /mobile/verifications/sync`

**Páginas:**
- QR Scanner Page ✅
- Verification Result Page ✅
- Player Details Page ✅

**Widgets:**
- QR Scanner Overlay ✅
- Player Info Section ✅

---

#### 3. Sesiones de Partido (`match_sessions`) ✅ COMPLETO
**Estado:** 100% funcional (Data + Presentation)

**Funcionalidades:**
- ✅ Listar partidos disponibles
- ✅ Crear sesión para partido
- ✅ Ver sesión activa
- ✅ Pausar/reanudar sesión
- ✅ Finalizar sesión
- ✅ Historial de sesiones
- ✅ Detalle de sesión con verificaciones
- ✅ Contador de verificaciones por equipo
- ✅ Soporte offline para lectura

**Endpoints Utilizados:**
- `GET /mobile/sessions/available-matches`
- `POST /mobile/sessions`
- `GET /mobile/sessions/active`
- `GET /mobile/sessions/{id}`
- `PATCH /mobile/sessions/{id}`
- `POST /mobile/sessions/{id}/complete`
- `GET /mobile/sessions`

**Páginas:**
- Available Matches Page ✅
- Active Session Page ✅
- Sessions History Page ✅
- Session Details Page ✅

**Widgets:**
- Available Match Card ✅
- Session Card ✅
- Session Header ✅
- Session Stats Card ✅
- Session Status Badge ✅
- Team Verifications Section ✅
- Verification List Item ✅
- Match Info Section ✅

---

#### 4. Torneos Públicos (`tournaments`) ✅ COMPLETO
**Estado:** 100% funcional

**Funcionalidades:**
- ✅ Lista de torneos con filtros
- ✅ Detalle de torneo completo
- ✅ Tabla de posiciones
- ✅ Información de equipos
- ✅ Partidos del torneo
- ✅ Estadísticas del torneo
- ✅ Paginación
- ✅ Pull-to-refresh
- ✅ Caché de datos

**Endpoints Utilizados:**
- `GET /public/tournaments`
- `GET /public/tournaments/{id}`
- `GET /public/tournaments/{id}/standings`

**Páginas:**
- Tournaments List Page ✅
- Tournament Detail Page ✅
- Standings Page ✅

**Widgets:**
- Tournament Card ✅
- Tournament Header ✅
- Tournament Stats Card ✅
- Standing Table ✅
- Team Standing Row ✅
- Tournament Matches List ✅

---

#### 5. Dashboard (`dashboard`) ✅ PARCIAL
**Estado:** 70% - Solo carga datos básicos

**Funcionalidades Implementadas:**
- ✅ Dashboard unificado básico
- ✅ Carga de datos según rol
- ✅ Indicadores principales

**Funcionalidades Faltantes:**
- ❌ Visualización de estadísticas por rol
- ❌ Dashboards específicos (SuperAdmin, League, Club)
- ❌ Métricas de revenue (pagos)
- ❌ Gráficas y analytics
- ❌ Actividad reciente
- ❌ Alertas y notificaciones

**Endpoints Disponibles pero NO Utilizados:**
- `GET /dashboard` - Solo se llama básicamente
- `GET /admin/dashboard` - NO implementado
- `GET /league/dashboard` - NO implementado
- `GET /club/dashboard` - NO implementado

---

#### 6. Perfil (`profile`) ⚠️ PLACEHOLDER
**Estado:** 10% - Solo muestra info básica

**Funcionalidades Implementadas:**
- ✅ Visualización de perfil básico (nombre, email, rol)
- ✅ Avatar con iniciales
- ✅ Cerrar sesión

**Funcionalidades Faltantes:**
- ❌ Edición de perfil
- ❌ Actualización de avatar
- ❌ Cambio de contraseña
- ❌ Estadísticas personales de verificaciones
- ❌ Historial de actividad
- ❌ Configuración de notificaciones

**Endpoints Disponibles pero NO Utilizados:**
- `GET /users/profile` - NO implementado
- `PUT /users/profile` - NO implementado
- `GET /mobile/verifications/stats` - NO implementado

---

#### 7. Pagos (`payments`) ❌ NO IMPLEMENTADO
**Estado:** 0% - Solo placeholder

**Funcionalidades Faltantes:**
- ❌ Lista de pagos pendientes
- ❌ Historial de pagos
- ❌ Detalle de pago
- ❌ Estado de suscripción
- ❌ Alertas de pagos vencidos
- ❌ Gestión de métodos de pago

**Endpoints Disponibles en Backend:**
- Información de pagos viene en dashboards:
  - `GET /dashboard` (SuperAdmin) → `data.revenue`
  - `GET /club/dashboard` (Club) → `data.payments`, `data.subscription`

**Nota:** No hay endpoints específicos de pagos expuestos en la API actual. Los pagos son:
- Para SuperAdmin: métricas de revenue en dashboard
- Para Club: pagos pendientes y suscripción en dashboard
- Para Jugadores: NO aplicable en mobile (gestión web)

---

#### 8. Estadísticas (`statistics`) ❌ NO IMPLEMENTADO
**Estado:** 0% - Solo placeholder

**Funcionalidades Faltantes:**
- ❌ Estadísticas de verificaciones
- ❌ Estadísticas de liga
- ❌ Estadísticas de carnets
- ❌ Gráficas y analytics
- ❌ Comparativas por período
- ❌ Reportes descargables

**Endpoints Disponibles pero NO Utilizados:**
- `GET /mobile/verifications/stats`
- `GET /stats/dashboard`
- `GET /card/stats`
- `GET /public/league-stats`

---

## 📊 Análisis de Backend vs Mobile

### Endpoints del Backend Disponibles

#### ✅ TOTALMENTE UTILIZADOS

**Autenticación (6/6):**
- ✅ `POST /auth/login`
- ✅ `GET /auth/user`
- ✅ `POST /auth/logout`
- ✅ `POST /auth/logout-all`
- ✅ `GET /auth/tokens`
- ✅ `DELETE /auth/tokens/{id}`

**Verificación Mobile (3/3):**
- ✅ `POST /mobile/verify`
- ✅ `GET /mobile/verifications`
- ✅ `POST /mobile/verifications/sync`

**Sesiones de Partido (7/7):**
- ✅ `GET /mobile/sessions/available-matches`
- ✅ `POST /mobile/sessions`
- ✅ `GET /mobile/sessions/active`
- ✅ `GET /mobile/sessions/{id}`
- ✅ `PATCH /mobile/sessions/{id}`
- ✅ `POST /mobile/sessions/{id}/complete`
- ✅ `GET /mobile/sessions`

**Torneos Públicos (3/3):**
- ✅ `GET /public/tournaments`
- ✅ `GET /public/tournaments/{id}`
- ✅ `GET /public/tournaments/{id}/standings`

---

#### ⚠️ PARCIALMENTE UTILIZADOS

**Dashboard (1/4):**
- ✅ `GET /dashboard` - Básico
- ❌ `GET /admin/dashboard` - NO usado
- ❌ `GET /league/dashboard` - NO usado
- ❌ `GET /club/dashboard` - NO usado

**Perfil de Usuario (0/3):**
- ❌ `GET /users/profile` - NO usado
- ❌ `PUT /users/profile` - NO usado
- ❌ `GET /users/{id}/profile` - NO usado

---

#### ❌ NO UTILIZADOS (Oportunidades)

**Verificación QR Adicional (5 endpoints):**
- ❌ `POST /verify-qr` - Verificación pública
- ❌ `GET /qr-info` - Info de QR sin verificación
- ❌ `GET /card/verify/{token}` - Verificación por token
- ❌ `GET /card/number/{cardNumber}` - Verificación por número
- ❌ `GET /card/details/{token}` - Detalles de carnet
- ❌ `GET /card/stats` - Estadísticas de carnets
- ❌ `POST /verify-batch` - Verificación batch
- ❌ `GET /stats/dashboard` - Dashboard de verificación

**Estadísticas (4 endpoints):**
- ❌ `GET /mobile/verifications/stats` - Stats personales
- ❌ `GET /card/stats` - Estadísticas de carnets
- ❌ `GET /public/league-stats` - Estadísticas de liga
- ❌ `GET /stats/dashboard` - Dashboard de verificación

**Partidos Públicos (5 endpoints):**
- ❌ `GET /public/matches/scheduled` - Partidos programados
- ❌ `GET /public/matches/live` - Partidos en vivo
- ❌ `GET /public/matches/{id}` - Detalle de partido
- ❌ `GET /public/matches/{id}/players` - Jugadores del partido
- ❌ `GET /public/matches/{id}/teams/{teamId}/players` - Jugadores por equipo

**Partidos en Vivo (10 endpoints):**
- ❌ `GET /matches/live` - Lista de partidos en vivo
- ❌ `GET /matches/{id}/realtime` - Datos en tiempo real
- ❌ `POST /matches/{id}/start` - Iniciar partido
- ❌ `POST /matches/{id}/finish` - Finalizar partido
- ❌ `POST /matches/{id}/sets/start` - Iniciar set
- ❌ `POST /matches/{id}/sets/finish` - Finalizar set
- ❌ `POST /matches/{id}/score` - Actualizar marcador
- ❌ `POST /matches/{id}/rotation` - Actualizar rotación
- ❌ `POST /matches/{id}/events` - Agregar eventos
- ❌ `GET /matches/{id}/status` - Estado del partido

**Público General (1 endpoint):**
- ❌ `GET /public/player-status/{cardNumber}` - Estado de jugador

---

### Resumen de Cobertura

| Módulo | Endpoints Disponibles | Utilizados | Cobertura |
|--------|----------------------|------------|-----------|
| **Autenticación** | 6 | 6 | 100% ✅ |
| **Verificación Mobile** | 3 | 3 | 100% ✅ |
| **Sesiones Partido** | 7 | 7 | 100% ✅ |
| **Torneos Públicos** | 3 | 3 | 100% ✅ |
| **Dashboard** | 4 | 1 | 25% ⚠️ |
| **Perfil Usuario** | 3 | 0 | 0% ❌ |
| **Verificación QR Extra** | 8 | 0 | 0% ❌ |
| **Estadísticas** | 4 | 0 | 0% ❌ |
| **Partidos Públicos** | 5 | 0 | 0% ❌ |
| **Partidos en Vivo** | 10 | 0 | 0% ❌ |
| **TOTAL** | **53** | **20** | **38%** |

**Conclusión:** Solo se está utilizando el **38% de la API disponible**. Hay **33 endpoints** sin implementar que representan oportunidades claras para MVP 2.0.

---

## 🚀 Propuesta MVP 2.0

### Visión
Completar la experiencia móvil completa con gestión de pagos, estadísticas avanzadas, partidos en vivo, y perfil completo.

### Objetivos
1. **Gestión Completa de Club/Liga** - Dashboards específicos, pagos, suscripciones
2. **Estadísticas y Analytics** - Gráficas, métricas, reportes
3. **Partidos en Vivo** - Broadcasting, marcadores en tiempo real
4. **Perfil Completo** - Edición, estadísticas personales
5. **Experiencia Pública Mejorada** - Consulta de partidos, jugadores

---

## 📱 Funcionalidades MVP 2.0

### Sprint 6: Dashboards Avanzados ⭐⭐⭐⭐⭐
**Prioridad:** CRÍTICA

#### User Stories
- Como SuperAdmin, quiero ver el dashboard completo con métricas de sistema
- Como LeagueAdmin, quiero ver el dashboard de mi liga con clubes y torneos
- Como ClubAdmin, quiero ver el dashboard de mi club con jugadores y pagos
- Como Verifier, quiero ver mi dashboard de verificaciones

#### Funcionalidades
- **SuperAdmin Dashboard:**
  - Total de usuarios por rol
  - Suscripciones activas/vencidas/por vencer
  - Métricas de sistema (verificaciones, partidos, clubes)
  - Revenue (MRR, total, pendiente, vencido)
  - Actividad reciente (usuarios, suscripciones)

- **LeagueAdmin Dashboard:**
  - Información de liga
  - Clubes (total, activos, por categoría/género)
  - Jugadores (total, federados, por club/categoría)
  - Torneos (activos, programados, completados)
  - Sanciones activas
  - Verificaciones pendientes

- **ClubAdmin Dashboard:**
  - Información del club
  - Jugadores (total, activos, federados, con pagos pendientes)
  - Partidos (jugados, ganados, próximos)
  - **Pagos (pendientes, vencidos, montos)** ⚠️
  - **Suscripción (estado, vencimiento, renovación)** ⚠️
  - Federación (pendientes, por vencer)

- **Verifier Dashboard:**
  - Estadísticas personales de verificaciones
  - Total verificaciones (hoy, mes, total)
  - Promedio por sesión
  - Gráficas de tendencia

#### Endpoints a Utilizar
- ✅ `GET /dashboard` - Ya implementado básicamente
- ⭐ `GET /admin/dashboard` - SuperAdmin
- ⭐ `GET /league/dashboard` - LeagueAdmin
- ⭐ `GET /club/dashboard` - ClubAdmin
- ⭐ `GET /stats/dashboard` - Verifier

#### Pantallas
1. **SuperAdmin Dashboard Page**
   - Métricas de sistema
   - Gráficas de usuarios y suscripciones
   - Revenue charts
   - Actividad reciente

2. **League Dashboard Page**
   - Métricas de liga
   - Gráficas de clubes y jugadores
   - Lista de torneos activos
   - Sanciones recientes

3. **Club Dashboard Page**
   - Métricas del club
   - Gráficas de jugadores
   - Próximos partidos
   - **Resumen de pagos** ⚠️
   - **Estado de suscripción** ⚠️

4. **Verifier Dashboard Page**
   - Estadísticas personales
   - Gráficas de verificaciones
   - Historial reciente

#### Widgets Necesarios
- `MetricCard` - Card con métrica e icono
- `ChartWidget` - Gráficas (líneas, barras, pie)
- `ActivityListItem` - Item de actividad reciente
- `PaymentSummaryCard` - Resumen de pagos (Club)
- `SubscriptionStatusCard` - Estado de suscripción (Club)
- `RevenueCard` - Métricas de ingresos (SuperAdmin)

#### Estimación
- Diseño de UI: 2 días
- Implementación: 5 días
- Testing: 2 días
- **Total: 9 días (1.8 semanas)**

---

### Sprint 7: Gestión de Pagos (Solo Visualización) ⭐⭐⭐⭐
**Prioridad:** ALTA

#### User Stories
- Como ClubAdmin, quiero ver mis pagos pendientes y vencidos
- Como ClubAdmin, quiero ver el estado de mi suscripción
- Como ClubAdmin, quiero ver el historial de pagos
- Como SuperAdmin, quiero ver métricas de revenue global

#### Funcionalidades
- **Club Payments (ClubAdmin/Coach):**
  - Lista de pagos pendientes con montos y fechas
  - Lista de pagos vencidos (overdue)
  - Detalle de cada pago
  - Historial de pagos completados
  - Estado de suscripción actual
  - Días hasta renovación
  - Alertas de pagos próximos a vencer

- **SuperAdmin Revenue:**
  - MRR (Monthly Recurring Revenue)
  - Total recaudado
  - Pendiente de cobro
  - Montos vencidos
  - Gráficas de tendencia

#### Endpoints a Utilizar
Los datos de pagos vienen en los dashboards:
- ⭐ `GET /club/dashboard` → `data.payments`, `data.subscription`
- ⭐ `GET /admin/dashboard` → `data.revenue`

**Nota:** NO hay endpoints específicos de pagos en la API actual. Los pagos se gestionan en el panel web. Mobile solo **visualiza** información de pagos que viene en los dashboards.

#### Pantallas
1. **Payments Page (Club)**
   - Tab "Pendientes"
   - Tab "Vencidos"
   - Tab "Historial"
   - Estado de suscripción header

2. **Payment Detail Modal**
   - Concepto del pago
   - Monto
   - Fecha de vencimiento
   - Estado
   - Botón "Pagar en Web" (deeplink)

3. **Subscription Status Card**
   - Estado actual
   - Fecha de vencimiento
   - Días hasta renovación
   - Monto del último pago
   - Botón "Gestionar Suscripción" (deeplink)

#### Widgets Necesarios
- `PaymentCard` - Card de pago individual
- `SubscriptionStatusCard` - Estado de suscripción
- `PaymentStatusBadge` - Badge de estado (pendiente/vencido/pagado)
- `RevenueMetricCard` - Métrica de revenue

#### Limitaciones Importantes
⚠️ **Mobile NO permite realizar pagos.** Solo visualiza información.
- Los pagos se realizan en el panel web
- Mobile proporciona deeplinks al web para gestión
- Alertas de pagos vencidos
- Recordatorios de renovación

#### Estimación
- Diseño de UI: 1 día
- Implementación: 3 días
- Testing: 1 día
- **Total: 5 días (1 semana)**

---

### Sprint 8: Estadísticas y Analytics ⭐⭐⭐⭐
**Prioridad:** ALTA

#### User Stories
- Como usuario autenticado, quiero ver mis estadísticas personales
- Como verificador, quiero ver mis métricas de verificación
- Como público, quiero ver estadísticas de la liga
- Como usuario, quiero ver gráficas de tendencias

#### Funcionalidades
- **Estadísticas Personales (Verifier):**
  - Total de verificaciones (hoy, semana, mes, año, total)
  - Promedio de verificaciones por sesión
  - Partidos verificados
  - Jugadores únicos verificados
  - Gráfica de tendencia
  - Comparativa con período anterior

- **Estadísticas de Liga (Público):**
  - Total de jugadores registrados
  - Jugadores activos
  - Carnets emitidos
  - Partidos jugados
  - Torneos activos
  - Clubes registrados

- **Estadísticas de Carnets:**
  - Carnets activos/inactivos
  - Carnets por vencer (30 días)
  - Carnets emitidos por período
  - Distribución por categoría
  - Distribución por club

#### Endpoints a Utilizar
- ⭐ `GET /mobile/verifications/stats` - Estadísticas personales
- ⭐ `GET /card/stats` - Estadísticas de carnets
- ⭐ `GET /public/league-stats` - Estadísticas de liga
- ⭐ `GET /stats/dashboard` - Dashboard de verificación

#### Pantallas
1. **Statistics Page**
   - Tab "Personal" (si es verificador)
   - Tab "Liga" (público)
   - Tab "Carnets" (admins)
   - Gráficas interactivas
   - Filtros por período

2. **Verifier Stats Page**
   - Cards con métricas principales
   - Gráfica de verificaciones por día
   - Comparativa con mes anterior
   - Ranking (opcional)

3. **League Stats Page**
   - Métricas generales
   - Gráficas de crecimiento
   - Distribución por categoría
   - Top clubes

#### Widgets Necesarios
- `StatCard` - Card de estadística
- `LineChartWidget` - Gráfica de líneas
- `BarChartWidget` - Gráfica de barras
- `PieChartWidget` - Gráfica circular
- `TrendIndicator` - Indicador de tendencia (↑↓)
- `PeriodSelector` - Selector de período (día/semana/mes/año)

#### Librerías Adicionales
- `fl_chart: ^0.65.0` - Charts y gráficas

#### Estimación
- Diseño de UI: 2 días
- Implementación: 5 días (incluye charts)
- Testing: 2 días
- **Total: 9 días (1.8 semanas)**

---

### Sprint 9: Perfil de Usuario Completo ⭐⭐⭐
**Prioridad:** MEDIA

#### User Stories
- Como usuario, quiero editar mi perfil
- Como usuario, quiero actualizar mi avatar
- Como usuario, quiero cambiar mi contraseña
- Como usuario, quiero ver mi historial de actividad

#### Funcionalidades
- **Ver Perfil:**
  - Información completa del usuario
  - Avatar personalizado
  - Roles y permisos
  - Estadísticas personales
  - Último acceso

- **Editar Perfil:**
  - Actualizar nombre completo
  - Actualizar teléfono
  - Actualizar avatar (upload de imagen)
  - Validaciones

- **Seguridad:**
  - Cambiar contraseña
  - Ver sesiones activas
  - Cerrar sesiones remotas
  - Ver historial de accesos

- **Estadísticas Personales:**
  - Actividad reciente
  - Métricas según rol
  - Historial de acciones

#### Endpoints a Utilizar
- ⭐ `GET /users/profile` - Obtener perfil
- ⭐ `PUT /users/profile` - Actualizar perfil
- ⭐ `GET /mobile/verifications/stats` - Stats de verificador
- ✅ `GET /auth/tokens` - Sesiones activas (ya disponible)
- ✅ `DELETE /auth/tokens/{id}` - Cerrar sesión remota (ya disponible)

#### Pantallas
1. **Profile Page** (actualizar existente)
   - Header con avatar
   - Información completa
   - Botón "Editar Perfil"
   - Estadísticas según rol
   - Configuración
   - Seguridad

2. **Edit Profile Page**
   - Formulario de edición
   - Upload de avatar
   - Validaciones
   - Guardar cambios

3. **Change Password Page**
   - Contraseña actual
   - Nueva contraseña
   - Confirmar contraseña
   - Validaciones de seguridad

4. **Active Sessions Page**
   - Lista de sesiones activas
   - Dispositivo y fecha
   - Botón "Cerrar sesión" por dispositivo
   - Botón "Cerrar todas las sesiones"

#### Widgets Necesarios
- `ProfileHeader` - Header con avatar grande
- `ProfileInfoCard` - Card de información
- `EditProfileForm` - Formulario de edición
- `ChangePasswordForm` - Formulario de cambio de contraseña
- `SessionCard` - Card de sesión activa
- `AvatarPicker` - Selector de avatar

#### Estimación
- Diseño de UI: 1.5 días
- Implementación: 4 días
- Testing: 1.5 días
- **Total: 7 días (1.4 semanas)**

---

### Sprint 10: Partidos Públicos y en Vivo ⭐⭐⭐
**Prioridad:** MEDIA

#### User Stories
- Como usuario público, quiero ver partidos programados
- Como usuario público, quiero ver partidos en vivo
- Como usuario público, quiero ver marcadores en tiempo real
- Como usuario público, quiero ver jugadores del partido

#### Funcionalidades
- **Partidos Programados:**
  - Lista de partidos próximos
  - Filtro por fecha
  - Filtro por torneo
  - Detalle de partido
  - Jugadores por equipo

- **Partidos en Vivo:**
  - Lista de partidos en vivo
  - Marcador en tiempo real
  - Set actual
  - Puntos por set
  - Eventos del partido
  - Auto-refresh cada 10 segundos

- **Detalle de Partido:**
  - Información completa
  - Equipos y jugadores
  - Marcador actualizado
  - Estadísticas del partido
  - Venue y horario

#### Endpoints a Utilizar
- ⭐ `GET /public/matches/scheduled` - Partidos programados
- ⭐ `GET /public/matches/live` - Partidos en vivo
- ⭐ `GET /public/matches/{id}` - Detalle de partido
- ⭐ `GET /public/matches/{id}/players` - Jugadores del partido
- ⭐ `GET /public/matches/{id}/teams/{teamId}/players` - Jugadores por equipo

#### Pantallas
1. **Matches Page**
   - Tab "Programados"
   - Tab "En Vivo"
   - Filtros (fecha, torneo)
   - Pull-to-refresh

2. **Live Match Page**
   - Marcador grande
   - Score por set
   - Indicador "EN VIVO"
   - Auto-refresh
   - Eventos del partido

3. **Match Detail Page**
   - Información del partido
   - Marcador
   - Lineups de equipos
   - Estadísticas
   - Venue

#### Widgets Necesarios
- `MatchCard` - Card de partido
- `LiveMatchCard` - Card de partido en vivo
- `ScoreBoard` - Marcador grande
- `LiveIndicator` - Indicador "EN VIVO"
- `MatchEventItem` - Item de evento
- `TeamLineup` - Lineup de equipo
- `PlayerMatchCard` - Card de jugador en partido

#### Consideraciones
- Auto-refresh cada 10 segundos en partidos en vivo
- WebSocket/Broadcasting opcional para tiempo real
- Caché de datos para offline

#### Estimación
- Diseño de UI: 2 días
- Implementación: 4 días
- Testing: 2 días
- **Total: 8 días (1.6 semanas)**

---

### Sprint 11: Gestión de Partidos (Árbitros) ⭐⭐
**Prioridad:** BAJA (Post-MVP 2.0)

#### User Stories
- Como árbitro, quiero iniciar un partido
- Como árbitro, quiero actualizar el marcador
- Como árbitro, quiero finalizar sets
- Como árbitro, quiero finalizar el partido

#### Funcionalidades
- **Control de Partido:**
  - Iniciar partido
  - Iniciar/finalizar sets
  - Actualizar marcador
  - Agregar eventos
  - Gestionar rotaciones
  - Finalizar partido

- **Marcador en Vivo:**
  - Puntos por equipo
  - Set actual
  - Botones +/- para puntos
  - Eventos rápidos (saque, punto, falta)

#### Endpoints a Utilizar
- ⭐ `GET /matches/live` - Partidos en vivo (autenticado)
- ⭐ `GET /matches/{id}/realtime` - Datos en tiempo real
- ⭐ `POST /matches/{id}/start` - Iniciar partido
- ⭐ `POST /matches/{id}/finish` - Finalizar partido
- ⭐ `POST /matches/{id}/sets/start` - Iniciar set
- ⭐ `POST /matches/{id}/sets/finish` - Finalizar set
- ⭐ `POST /matches/{id}/score` - Actualizar marcador
- ⭐ `POST /matches/{id}/rotation` - Actualizar rotación
- ⭐ `POST /matches/{id}/events` - Agregar eventos
- ⭐ `GET /matches/{id}/status` - Estado del partido

#### Pantallas
1. **Referee Match Control Page**
   - Marcador grande con botones +/-
   - Botones de acciones (inicio set, fin set)
   - Eventos rápidos
   - Rotaciones
   - Finalizar partido

#### Widgets Necesarios
- `RefereeScorerWidget` - Marcador con controles
- `QuickEventButtons` - Botones de eventos rápidos
- `RotationControl` - Control de rotaciones
- `SetControl` - Controles de set

#### Estimación
- Diseño de UI: 2 días
- Implementación: 5 días
- Testing: 2 días
- **Total: 9 días (1.8 semanas)**

**Nota:** Este sprint se considera **Post-MVP 2.0** por su complejidad y prioridad menor.

---

## 📅 Plan de Implementación MVP 2.0

### Fase 1: Core Experience (Crítico)
**Duración:** 3-4 semanas

#### Sprint 6: Dashboards Avanzados
- **Duración:** 1.8 semanas (9 días)
- **Prioridad:** CRÍTICA ⭐⭐⭐⭐⭐
- **Funcionalidades:**
  - SuperAdmin Dashboard completo
  - League Dashboard completo
  - Club Dashboard completo (con pagos)
  - Verifier Dashboard completo
- **Endpoints:** 4 nuevos dashboards
- **Valor:** Visualización completa según rol

#### Sprint 7: Gestión de Pagos (Visualización)
- **Duración:** 1 semana (5 días)
- **Prioridad:** ALTA ⭐⭐⭐⭐
- **Funcionalidades:**
  - Lista de pagos pendientes/vencidos
  - Estado de suscripción
  - Alertas de vencimientos
  - Deeplinks a web para pagar
- **Endpoints:** Datos de dashboards
- **Valor:** Visibilidad de pagos para clubs

---

### Fase 2: Analytics & Insights (Alta)
**Duración:** 2-3 semanas

#### Sprint 8: Estadísticas y Analytics
- **Duración:** 1.8 semanas (9 días)
- **Prioridad:** ALTA ⭐⭐⭐⭐
- **Funcionalidades:**
  - Estadísticas personales de verificador
  - Estadísticas de liga
  - Estadísticas de carnets
  - Gráficas y charts
- **Endpoints:** 4 endpoints de stats
- **Librerías:** fl_chart
- **Valor:** Analytics avanzados

---

### Fase 3: User Experience (Media)
**Duración:** 3-4 semanas

#### Sprint 9: Perfil de Usuario Completo
- **Duración:** 1.4 semanas (7 días)
- **Prioridad:** MEDIA ⭐⭐⭐
- **Funcionalidades:**
  - Editar perfil
  - Cambiar avatar
  - Cambiar contraseña
  - Gestionar sesiones
- **Endpoints:** 2 endpoints de perfil
- **Valor:** Control completo del perfil

#### Sprint 10: Partidos Públicos y en Vivo
- **Duración:** 1.6 semanas (8 días)
- **Prioridad:** MEDIA ⭐⭐⭐
- **Funcionalidades:**
  - Partidos programados
  - Partidos en vivo
  - Marcadores en tiempo real
  - Detalle de partidos
- **Endpoints:** 5 endpoints de partidos
- **Valor:** Consulta pública mejorada

---

### Fase 4: Advanced Features (Post-MVP 2.0)
**Duración:** 2+ semanas

#### Sprint 11: Gestión de Partidos (Árbitros)
- **Duración:** 1.8 semanas (9 días)
- **Prioridad:** BAJA ⭐⭐ (Post-MVP 2.0)
- **Funcionalidades:**
  - Control de marcador
  - Gestión de sets
  - Eventos de partido
  - Rotaciones
- **Endpoints:** 10 endpoints de gestión
- **Valor:** App completa para árbitros

---

## 🎯 Priorización y Roadmap

### Criterios de Priorización

| Criterio | Peso | Descripción |
|----------|------|-------------|
| **Valor de Negocio** | 40% | Impacto en usuarios y adopción |
| **Dependencias Técnicas** | 25% | Requisitos previos |
| **Complejidad** | 20% | Esfuerzo de desarrollo |
| **Disponibilidad de API** | 15% | Endpoints disponibles en backend |

### Roadmap Visual

```
MVP 1.0 (COMPLETADO) ✅
├── Sprint 1: Autenticación ✅
├── Sprint 2: Verificación QR ✅
├── Sprint 3: Sesiones de Partido ✅
└── Sprint 4: Torneos Públicos ✅

MVP 2.0 (PROPUESTO)
│
├── Fase 1: Core Experience (CRÍTICO) - 3-4 semanas
│   ├── Sprint 6: Dashboards Avanzados ⭐⭐⭐⭐⭐
│   └── Sprint 7: Gestión de Pagos ⭐⭐⭐⭐
│
├── Fase 2: Analytics & Insights (ALTO) - 2-3 semanas
│   └── Sprint 8: Estadísticas y Analytics ⭐⭐⭐⭐
│
├── Fase 3: User Experience (MEDIO) - 3-4 semanas
│   ├── Sprint 9: Perfil Completo ⭐⭐⭐
│   └── Sprint 10: Partidos Públicos/Vivo ⭐⭐⭐
│
└── Fase 4: Advanced (POST-MVP 2.0) - 2+ semanas
    └── Sprint 11: Gestión de Partidos ⭐⭐
```

### Timeline Estimado

| Fase | Duración | Finalización |
|------|----------|--------------|
| **Fase 1: Core** | 3-4 semanas | ~Final Enero 2025 |
| **Fase 2: Analytics** | 2-3 semanas | ~Mitad Febrero 2025 |
| **Fase 3: UX** | 3-4 semanas | ~Mitad Marzo 2025 |
| **Fase 4: Advanced** | 2+ semanas | ~Final Marzo 2025 |

**Total MVP 2.0:** 10-13 semanas (2.5-3 meses)

---

## 📊 Matriz de Prioridades

### Must Have (MVP 2.0 Core)
1. ✅ **Dashboards Avanzados** - Todos los roles necesitan sus dashboards específicos
2. ✅ **Gestión de Pagos (Visualización)** - Clubs necesitan visibilidad de pagos
3. ✅ **Estadísticas y Analytics** - Métricas y gráficas para todos

### Should Have (MVP 2.0 Extended)
4. **Perfil de Usuario Completo** - Edición y gestión completa
5. **Partidos Públicos y en Vivo** - Consulta mejorada para público

### Could Have (Post-MVP 2.0)
6. **Gestión de Partidos (Árbitros)** - Control completo de marcadores

### Won't Have (Futuras Versiones)
- Sistema de notificaciones push
- Broadcasting en tiempo real (WebSockets)
- Gestión avanzada de sanciones desde mobile
- Reportes y exports PDF
- Gestión de equipos completa
- Chat/Mensajería
- Múltiples idiomas (i18n)
- Modo oscuro
- Biometría (FaceID/TouchID)

---

## 🎓 Recomendaciones

### Arrancar Inmediatamente
**Sprint 6: Dashboards Avanzados**
- Es crítico para todos los roles
- Aprovecha endpoints ya disponibles
- Alto impacto en UX
- Base para otros módulos (pagos, stats)

### Quick Wins
Estos módulos son relativamente rápidos y de alto impacto:
1. **Sprint 7: Pagos (Visualización)** - 1 semana, alto valor para clubs
2. **Sprint 9: Perfil Completo** - 1.4 semanas, mejora UX global

### Consideraciones Técnicas
- **Librería de Charts:** Implementar `fl_chart` en Sprint 8
- **Caché Mejorado:** Expandir offline storage para nuevos módulos
- **Deeplinks:** Configurar para redirección a web (pagos, gestión)
- **Auto-refresh:** Implementar para partidos en vivo (Sprint 10)
- **Image Upload:** Agregar en Sprint 9 para avatares

### Testing
- **E2E Tests:** Agregar para flujos críticos
- **Performance Testing:** Especialmente charts y auto-refresh
- **Offline Testing:** Validar caché de nuevos módulos
- **Role-based Testing:** Verificar dashboards específicos

---

## 📈 Métricas de Éxito MVP 2.0

### KPIs Técnicos
- **Cobertura de API:** > 80% (vs 38% actual)
- **Crash-free rate:** > 99.5%
- **Tiempo de carga dashboards:** < 2s
- **Tiempo de carga gráficas:** < 1.5s
- **API success rate:** > 95%

### KPIs de Negocio
- **Adopción de dashboards:** > 70% de usuarios activos
- **Visibilidad de pagos:** 100% clubs ven sus pagos
- **Uso de estadísticas:** > 50% verificadores revisan stats
- **Consulta de partidos:** > 60% usuarios públicos usan live matches
- **Edición de perfil:** > 40% usuarios editan su perfil

### KPIs de Calidad
- **Code coverage:** > 75%
- **Technical debt:** < 10%
- **Documentation coverage:** 100%
- **Performance score:** > 90

---

## ✅ Checklist Pre-Inicio MVP 2.0

### Preparación
- [ ] Revisar y aprobar este documento
- [ ] Definir prioridades finales
- [ ] Asignar recursos y timeline
- [ ] Configurar ambiente de desarrollo

### Setup Técnico
- [ ] Agregar `fl_chart` a dependencies
- [ ] Configurar deeplinks para web
- [ ] Expandir offline storage
- [ ] Configurar CI/CD para nuevos módulos

### Diseño
- [ ] Diseñar dashboards específicos por rol
- [ ] Diseñar pantallas de pagos
- [ ] Diseñar gráficas de estadísticas
- [ ] Diseñar perfil completo
- [ ] Diseñar partidos en vivo

### Backend Coordination
- [ ] Verificar todos los endpoints disponibles
- [ ] Confirmar formatos de respuesta
- [ ] Coordinar testing de endpoints
- [ ] Definir rate limits

---

**Documento creado:** Diciembre 29, 2024
**Próxima revisión:** Al completar Fase 1
**Contacto:** Equipo de Desarrollo VolleyPass

