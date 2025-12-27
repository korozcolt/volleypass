# Pantallas y Funcionalidades - VolleyPass Mobile

> **Versión:** 1.0.0
> **Fecha:** Diciembre 26, 2024
> **Basado en:** API Documentation v1.0.0

---

## 📋 Índice

1. [Módulo de Autenticación](#módulo-de-autenticación)
2. [Módulo de Verificación QR](#módulo-de-verificación-qr)
3. [Módulo de Sesiones](#módulo-de-sesiones)
4. [Módulo de Torneos Públicos](#módulo-de-torneos-públicos)
5. [Módulo de Partidos](#módulo-de-partidos)
6. [Módulo de Perfil](#módulo-de-perfil)
7. [Componentes Compartidos](#componentes-compartidos)

---

## 🔐 Módulo de Autenticación

### 1.1 Splash Screen

**Ruta:** `/`
**Tipo:** Stateless
**Autenticación:** No requerida

**Propósito:**
- Pantalla inicial mientras se verifica el estado de autenticación
- Mostrar branding de la aplicación

**Lógica:**
1. Mostrar logo de VolleyPass
2. Verificar si existe token válido
3. Si existe token: navegar a Dashboard
4. Si no existe token: navegar a Login

**UI/UX:**
```
┌────────────────────┐
│                    │
│                    │
│    [LOGO APP]      │
│                    │
│   VolleyPass       │
│                    │
│  [Progress Bar]    │
│                    │
│                    │
└────────────────────┘
```

**Endpoints:**
- `GET /auth/user` (verificar token)

---

### 1.2 Login Screen

**Ruta:** `/login`
**Tipo:** StatefulWidget
**Autenticación:** No requerida

**Propósito:**
- Permitir a verificadores iniciar sesión

**Campos del Formulario:**
- Email (TextField)
  - Validación: email válido sin acentos
  - Error: "Email inválido (sin acentos permitidos)"
- Password (TextField)
  - Validación: no vacío
  - Obscure text: true
- Device Name (auto-generado)
  - Formato: "iPhone 15 Pro" o "Samsung Galaxy S23"

**Botones:**
- "Iniciar Sesión" (Primary Button)
- "¿Olvidaste tu contraseña?" (Text Button) - Fuera de MVP

**Estados:**
- Idle
- Loading
- Success (navega a Dashboard)
- Error (muestra mensaje)

**UI/UX:**
```
┌────────────────────┐
│    [LOGO]          │
│                    │
│  Iniciar Sesión    │
│                    │
│ ┌────────────────┐ │
│ │ Email          │ │
│ └────────────────┘ │
│                    │
│ ┌────────────────┐ │
│ │ Contraseña  👁 │ │
│ └────────────────┘ │
│                    │
│ [Iniciar Sesión]   │
│                    │
│ ¿Olvidaste tu      │
│  contraseña?       │
└────────────────────┘
```

**Validaciones:**
- Email: regex `^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$`
- Password: min 6 caracteres

**Rate Limiting:**
- 5 intentos por 300 segundos (manejado por API)
- Mostrar mensaje: "Demasiados intentos. Intenta en X segundos"

**Endpoints:**
- `POST /auth/login`

**Modelo de Datos:**
```dart
class LoginRequest {
  final String email;
  final String password;
  final String deviceName;
}

class LoginResponse {
  final String token;
  final String tokenType;
  final int expiresIn;
  final User user;
}
```

---

### 1.3 Dashboard / Home Screen

**Ruta:** `/dashboard`
**Tipo:** StatefulWidget
**Autenticación:** Requerida
**Navegación:** Bottom Navigation Bar

**Propósito:**
- Hub principal de la aplicación
- Acceso rápido a funcionalidades principales

**Tabs de Navegación:**
1. Verificación (QR Scanner)
2. Torneos (Públicos)
3. Partidos (En Vivo)
4. Perfil

**Contenido del Home Tab:**
- Header con saludo: "Hola, [Nombre]"
- Indicador de conexión (Online/Offline)
- Contador de verificaciones pendientes de sync
- Quick Actions:
  - "Escanear QR"
  - "Iniciar Sesión de Partido"
  - "Ver Mis Sesiones"
- Estadísticas del día:
  - Verificaciones hoy
  - Sesión activa (si existe)
- Notificaciones/Alertas

**UI/UX:**
```
┌────────────────────┐
│ Hola, Juan 👋      │
│ [Online] ✓ [3 ⬆]  │
├────────────────────┤
│ Quick Actions      │
│ ┌────┐ ┌────┐     │
│ │ QR │ │🏐 │     │
│ └────┘ └────┘     │
├────────────────────┤
│ Hoy                │
│ 25 verificaciones  │
│ 2 sesiones         │
├────────────────────┤
│ [Bottom Nav Bar]   │
└────────────────────┘
```

**Endpoints:**
- `GET /auth/user`
- `GET /mobile/verifications/stats`
- `GET /mobile/sessions/active`

---

## 📸 Módulo de Verificación QR

### 2.1 QR Scanner Screen

**Ruta:** `/scanner`
**Tipo:** StatefulWidget
**Autenticación:** Requerida
**Permisos:** Cámara

**Propósito:**
- Escanear códigos QR de carnets de jugadores
- Verificar elegibilidad en tiempo real

**Componentes:**
- Vista de cámara (fullscreen)
- Overlay con guías de escaneo
- Indicador de estado de conexión
- Botón de flash
- Botón de cerrar
- Indicador de procesamiento

**Estados:**
- Camera Loading
- Camera Ready
- Scanning
- Processing QR
- Success (navega a ResultScreen)
- Error (muestra error y permite reintentar)

**UI/UX:**
```
┌────────────────────┐
│  [X]        [Flash]│
│                    │
│   ╔══════════╗     │
│   ║          ║     │
│   ║  [📷]    ║     │
│   ║          ║     │
│   ╚══════════╝     │
│                    │
│ Escanea el QR del  │
│      carnet        │
│                    │
│ [Online] ✓         │
└────────────────────┘
```

**Funcionalidades:**
- Auto-focus en QR
- Validación de formato QR (64 chars hex)
- Vibración al escanear
- Sonido de confirmación
- Prevenir múltiples escaneos simultáneos
- Timeout de 30 segundos sin escaneo

**Validaciones:**
- QR Code: `^[a-fA-F0-9]{64}$`

**Modo Offline:**
- Si no hay conexión, guardar verificación localmente
- Mostrar indicador "Verificado Offline - Pendiente Sync"

**Endpoints:**
- `POST /mobile/verify` (online)
- Local storage (offline)

**Modelo de Datos:**
```dart
class VerificationRequest {
  final String qrCode;
  final int? matchSessionId;
  final String? deviceInfo;
  final Location? location;
}

class VerificationResponse {
  final bool success;
  final Verification verification;
  final Player player;
}
```

---

### 2.2 Verification Result Screen

**Ruta:** `/verification/result`
**Tipo:** StatelessWidget
**Autenticación:** Requerida

**Propósito:**
- Mostrar resultado de verificación (Apto/No Apto)
- Mostrar información del jugador
- Permitir acciones posteriores

**Resultado: APTO (Eligible)**

**UI/UX:**
```
┌────────────────────┐
│        ✅          │
│                    │
│   JUGADOR APTO     │
│                    │
│   [FOTO]           │
│                    │
│  Juan Pérez        │
│  VP2024001         │
│                    │
│  Club ABC          │
│  Líbero            │
│  Senior            │
│                    │
│  🩸 O+             │
│  📞 +57 300..      │
│                    │
│  [Escanear Otro]   │
│  [Finalizar]       │
└────────────────────┘
```

**Resultado: NO APTO (Restricted/Not Eligible)**

**UI/UX:**
```
┌────────────────────┐
│        ⛔          │
│                    │
│  JUGADOR NO APTO   │
│                    │
│   [FOTO]           │
│                    │
│  Juan Pérez        │
│  VP2024001         │
│                    │
│  ⚠️ RAZÓN:         │
│  Sanción activa    │
│  2 partidos rest.  │
│                    │
│  [Ver Detalles]    │
│  [Escanear Otro]   │
└────────────────────┘
```

**Información a Mostrar:**

**Jugador Apto:**
- ✅ Icono verde grande
- Foto del jugador
- Nombre completo
- Número de carnet
- Club
- Posición
- Categoría
- Tipo de sangre
- Contacto de emergencia

**Jugador No Apto:**
- ⛔ Icono rojo grande
- Foto del jugador
- Nombre completo
- Número de carnet
- Razón de restricción
- Detalles adicionales (partidos restantes, etc.)

**Botones:**
- "Escanear Otro" - Vuelve al scanner
- "Ver Detalles" - Va a PlayerDetailsScreen
- "Finalizar" - Vuelve al Dashboard

**Auto-dismiss:**
- Después de 10 segundos sin acción, volver al scanner

---

### 2.3 Player Details Screen

**Ruta:** `/player/details`
**Tipo:** StatelessWidget
**Autenticación:** Requerida

**Propósito:**
- Mostrar información completa del jugador verificado

**Secciones:**

1. **Header con Foto**
   - Foto del jugador (grande)
   - Nombre completo
   - Número de carnet

2. **Información Básica**
   - Club
   - Posición
   - Categoría
   - Género
   - Edad/Fecha de nacimiento

3. **Información de Emergencia**
   - Tipo de sangre
   - Contacto de emergencia
   - Teléfono de emergencia
   - Alergias (si aplica)
   - Condiciones médicas (si aplica)

4. **Estado del Carnet**
   - Estado: Activo/Suspendido/Expirado
   - Válido hasta
   - Fecha de emisión

5. **Historial (si disponible)**
   - Verificaciones recientes
   - Última verificación

**UI/UX:**
```
┌────────────────────┐
│  [<] Detalles      │
├────────────────────┤
│                    │
│     [FOTO]         │
│                    │
│   Juan Pérez       │
│   VP2024001        │
│                    │
├────────────────────┤
│ ℹ️ Información     │
│                    │
│ Club: ABC          │
│ Posición: Líbero   │
│ Categoría: Senior  │
│ Género: Masculino  │
│ Edad: 34 años      │
│                    │
├────────────────────┤
│ 🆘 Emergencia      │
│                    │
│ Tipo: O+           │
│ Contacto: María    │
│ Tel: +57 300...    │
│                    │
├────────────────────┤
│ 📋 Estado Carnet   │
│                    │
│ Estado: ✅ Activo  │
│ Válido: 31/12/2024 │
│                    │
└────────────────────┘
```

---

### 2.4 Verification History Screen

**Ruta:** `/verifications/history`
**Tipo:** StatefulWidget
**Autenticación:** Requerida
**Paginación:** 20 por página

**Propósito:**
- Ver historial de verificaciones realizadas
- Filtrar por fecha, resultado, sesión
- Ver estadísticas

**Filtros:**
- Por resultado (Todos/Apto/No Apto)
- Por fecha (selector de fecha)
- Por sesión de partido

**Lista de Verificaciones:**
```
┌────────────────────┐
│ [<] Historial      │
│                    │
│ [Filtros] 🔍       │
│                    │
├────────────────────┤
│ ✅ Juan Pérez      │
│    VP2024001       │
│    15:45 - Hoy     │
│    Match: ABC vs X │
├────────────────────┤
│ ⛔ María García    │
│    VP2024002       │
│    15:30 - Hoy     │
│    Sanción activa  │
├────────────────────┤
│ ✅ Carlos López    │
│    VP2024003       │
│    14:20 - Hoy     │
│    [Offline] 📴    │
├────────────────────┤
│    [Cargar más]    │
└────────────────────┘
```

**Indicadores:**
- ✅ Verificación exitosa
- ⛔ Verificación rechazada
- 📴 Verificación offline
- ⬆️ Pendiente de sync

**Endpoints:**
- `GET /mobile/verifications?per_page=20&page=1`

**Modelo de Datos:**
```dart
class VerificationItem {
  final int id;
  final String playerName;
  final String? playerPhoto;
  final String cardNumber;
  final String result; // eligible, restricted, not_eligible
  final String? restrictionReason;
  final DateTime verifiedAt;
  final bool isOffline;
  final Match? match;
}
```

---

### 2.5 Verification Stats Screen

**Ruta:** `/verifications/stats`
**Tipo:** StatelessWidget
**Autenticación:** Requerida

**Propósito:**
- Mostrar estadísticas de verificaciones del usuario

**Métricas:**
- Total de verificaciones
- Verificaciones hoy
- Verificaciones aptas
- Verificaciones rechazadas
- Verificaciones offline
- Promedio por día
- Última verificación
- Día más activo

**UI/UX:**
```
┌────────────────────┐
│ [<] Estadísticas   │
├────────────────────┤
│ 📊 General         │
│                    │
│ Total: 150         │
│ Hoy: 25            │
│                    │
├────────────────────┤
│ 📈 Resultados      │
│                    │
│ ✅ Aptas: 140      │
│ ⛔ Rechazadas: 10  │
│                    │
├────────────────────┤
│ 📴 Offline         │
│                    │
│ Offline: 5         │
│ Pendientes: 2      │
│                    │
├────────────────────┤
│ 📅 Promedios       │
│                    │
│ Por día: 21.4      │
│ Día activo: 25/12  │
│                    │
└────────────────────┘
```

**Endpoints:**
- `GET /mobile/verifications/stats`

---

## 🏐 Módulo de Sesiones

### 3.1 Available Matches Screen

**Ruta:** `/sessions/available-matches`
**Tipo:** StatefulWidget
**Autenticación:** Requerida

**Propósito:**
- Mostrar partidos disponibles para crear sesión
- Filtro: 6 horas atrás - 24 horas adelante

**Lista de Partidos:**
```
┌────────────────────┐
│ [<] Partidos       │
│     Disponibles    │
│                    │
│ 📅 Hoy             │
├────────────────────┤
│ 🏐 Águilas FC      │
│    vs              │
│    Tigres Unidos   │
│                    │
│ 🕐 15:00           │
│ 📍 Estadio Nac.    │
│                    │
│ [Crear Sesión]     │
├────────────────────┤
│ 🏐 Leones SC       │
│    vs              │
│    Panteras FC     │
│                    │
│ 🕐 17:00           │
│ 📍 Coliseo Mpal.   │
│                    │
│ [Crear Sesión]     │
└────────────────────┘
```

**Información por Partido:**
- Equipos (local vs visitante)
- Hora programada
- Sede/Venue
- Torneo
- Botón "Crear Sesión"

**Estados:**
- Loading
- Empty (no hay partidos)
- Loaded
- Error

**Endpoints:**
- `GET /mobile/sessions/available-matches`

---

### 3.2 Active Session Screen

**Ruta:** `/sessions/active`
**Tipo:** StatefulWidget
**Autenticación:** Requerida

**Propósito:**
- Mostrar sesión activa actual
- Quick access a scanner
- Resumen en tiempo real

**Componentes:**

1. **Header del Partido**
   - Equipos
   - Hora
   - Sede
   - Estado del partido

2. **Contador de Verificaciones**
   - Total
   - Por equipo local
   - Por equipo visitante
   - Última verificación

3. **Quick Actions**
   - "Escanear QR" (botón grande)
   - "Pausar Sesión"
   - "Ver Verificaciones"

4. **Footer**
   - Tiempo transcurrido
   - "Finalizar Sesión"

**UI/UX:**
```
┌────────────────────┐
│ [<] Sesión Activa  │
├────────────────────┤
│ 🏐 Águilas FC      │
│        vs          │
│    Tigres Unidos   │
│                    │
│ 🕐 15:00 - En Vivo │
│ 📍 Estadio Nacional│
│                    │
├────────────────────┤
│ Verificaciones     │
│                    │
│ Total: 20          │
│ 🏠 Local: 12       │
│ 🚌 Visitante: 8    │
│                    │
│ Última: 15:45      │
│                    │
├────────────────────┤
│  [📸 Escanear QR]  │
│                    │
│ [⏸ Pausar]         │
│ [📋 Ver Lista]     │
│                    │
├────────────────────┤
│ ⏱ 45 minutos       │
│                    │
│ [Finalizar Sesión] │
└────────────────────┘
```

**Actualización en Tiempo Real:**
- Contador se actualiza al verificar
- Tiempo transcurrido actualizado

**Endpoints:**
- `GET /mobile/sessions/active`
- `GET /mobile/sessions/{id}`
- `PUT /mobile/sessions/{id}` (pausar/reanudar)
- `POST /mobile/sessions/{id}/complete`

---

### 3.3 Create Session Screen

**Ruta:** `/sessions/create`
**Tipo:** StatefulWidget
**Autenticación:** Requerida

**Propósito:**
- Crear nueva sesión de verificación para un partido

**Formulario:**
- Partido (pre-seleccionado o seleccionable)
- Notas opcionales (ubicación, clima, etc.)

**Validaciones:**
- Usuario no debe tener otra sesión activa
- Partido debe estar en ventana de tiempo válida

**UI/UX:**
```
┌────────────────────┐
│ [<] Nueva Sesión   │
├────────────────────┤
│ Partido            │
│ ┌────────────────┐ │
│ │ Águilas FC     │ │
│ │    vs          │ │
│ │ Tigres Unidos  │ │
│ │ 15:00          │ │
│ └────────────────┘ │
│                    │
│ Notas (opcional)   │
│ ┌────────────────┐ │
│ │ Cancha Princ.  │ │
│ │                │ │
│ └────────────────┘ │
│                    │
│ [Iniciar Sesión]   │
└────────────────────┘
```

**Errores:**
- "Ya tienes una sesión activa. Complétala primero."

**Endpoints:**
- `POST /mobile/sessions`

---

### 3.4 Session Summary Screen

**Ruta:** `/sessions/summary/:id`
**Tipo:** StatelessWidget
**Autenticación:** Requerida

**Propósito:**
- Mostrar resumen completo de sesión finalizada

**Información:**

1. **Header del Partido**
   - Equipos
   - Fecha/Hora
   - Duración total

2. **Estadísticas**
   - Total verificaciones
   - Por equipo
   - Aptos vs No Aptos

3. **Lista de Verificaciones**
   - Jugadores verificados
   - Hora de verificación
   - Estado

4. **Acciones**
   - Compartir resumen
   - Exportar (futuro)
   - Ver otra sesión

**UI/UX:**
```
┌────────────────────┐
│ [<] Resumen        │
├────────────────────┤
│ Águilas FC vs      │
│ Tigres Unidos      │
│                    │
│ 26/12/2024 15:00   │
│ Duración: 90 min   │
│                    │
├────────────────────┤
│ 📊 Estadísticas    │
│                    │
│ Total: 20          │
│ 🏠 Local: 12       │
│ 🚌 Visit: 8        │
│                    │
│ ✅ Aptos: 19       │
│ ⛔ No Aptos: 1     │
│                    │
├────────────────────┤
│ Verificaciones     │
│                    │
│ ✅ Juan Pérez      │
│    15:30           │
│                    │
│ ⛔ María García    │
│    15:35           │
│                    │
│ ...                │
│                    │
├────────────────────┤
│ [Compartir] [OK]   │
└────────────────────┘
```

**Endpoints:**
- `GET /mobile/sessions/{id}`

---

### 3.5 Sessions History Screen

**Ruta:** `/sessions/history`
**Tipo:** StatefulWidget
**Autenticación:** Requerida
**Paginación:** 20 por página

**Propósito:**
- Ver historial de sesiones completadas

**Filtros:**
- Por estado (activa, pausada, completada)
- Por partido

**Lista:**
```
┌────────────────────┐
│ [<] Mis Sesiones   │
│                    │
│ [Filtros] 🔍       │
│                    │
├────────────────────┤
│ ✅ Completada      │
│ Águilas vs Tigres  │
│ 26/12 - 20 verif.  │
│ 90 min             │
├────────────────────┤
│ ▶️ Activa          │
│ Leones vs Panteras │
│ Hoy - 15 verif.    │
│ 45 min             │
├────────────────────┤
│ ⏸ Pausada          │
│ Condor vs Halcones │
│ 25/12 - 10 verif.  │
│ 30 min             │
└────────────────────┘
```

**Tap en sesión:** Navega a detalle/resumen

**Endpoints:**
- `GET /mobile/sessions?per_page=20&page=1`

---

## 🏆 Módulo de Torneos Públicos

### 4.1 Tournaments List Screen

**Ruta:** `/tournaments`
**Tipo:** StatefulWidget
**Autenticación:** No requerida
**Paginación:** 20 por página

**Propósito:**
- Mostrar torneos públicos activos
- Filtrar y buscar torneos

**Filtros:**
- Estado (programado, en progreso, finalizado)
- Tipo (campeonato, liga, amistoso)
- Categoría (senior, junior, sub-17)
- Género (masculino, femenino, mixto)

**Lista de Torneos:**
```
┌────────────────────┐
│ [≡] Torneos    [🔍]│
│                    │
│ [Filtros] ▼        │
│                    │
├────────────────────┤
│ [LOGO]             │
│ Campeonato         │
│ Nacional 2024      │
│                    │
│ 🏐 Senior Femenil  │
│ ▶️ En Progreso     │
│ 16 equipos         │
│                    │
│ 📅 01/11 - 31/12   │
│ 📍 Estadio Nac.    │
├────────────────────┤
│ [LOGO]             │
│ Liga Juvenil       │
│ 2024               │
│                    │
│ 🏐 Junior Varonil  │
│ ⏰ Programado      │
│ 12 equipos         │
│                    │
│ 📅 15/01 - 28/02   │
│ 📍 Coliseo Mpal.   │
└────────────────────┘
```

**Pull-to-Refresh:** Sí
**Infinite Scroll:** Sí
**Caché:** 1 hora

**Endpoints:**
- `GET /public/tournaments?page=1&per_page=20`

**Modelo de Datos:**
```dart
class Tournament {
  final int id;
  final String name;
  final String slug;
  final String description;
  final String type;
  final String format;
  final String category;
  final String gender;
  final String status;
  final DateTime startDate;
  final DateTime endDate;
  final String venue;
  final int maxTeams;
  final int teamCount;
  final bool isRegistrationOpen;
  final String? logoUrl;
}
```

---

### 4.2 Tournament Detail Screen

**Ruta:** `/tournaments/:id`
**Tipo:** StatefulWidget
**Autenticación:** No requerida

**Propósito:**
- Mostrar información completa del torneo
- Ver equipos participantes
- Ver partidos
- Ver tabla de posiciones

**Tabs:**
1. Información
2. Equipos
3. Partidos
4. Posiciones

**Tab 1: Información**
```
┌────────────────────┐
│ [<] [LOGO]     [⭐] │
│                    │
│ Campeonato Nac.    │
│ 2024               │
│                    │
├────────────────────┤
│ 📋 Info  👥  🏐  📊│
├────────────────────┤
│ Descripción        │
│ Torneo anual de    │
│ voleibol...        │
│                    │
│ 📅 Fechas          │
│ 01/11 - 31/12/2024 │
│                    │
│ 🏐 Categoría       │
│ Senior Femenino    │
│                    │
│ 📍 Sede            │
│ Estadio Nacional   │
│                    │
│ 👥 Equipos         │
│ 16 / 16            │
│                    │
│ 🏆 Formato         │
│ Grupos             │
│                    │
│ ⚡ Estado          │
│ En Progreso        │
└────────────────────┘
```

**Tab 2: Equipos**
```
┌────────────────────┐
│ Equipos (16)       │
│                    │
├────────────────────┤
│ [LOGO] Águilas FC  │
│        Club ABC    │
├────────────────────┤
│ [LOGO] Tigres U.   │
│        Club XYZ    │
├────────────────────┤
│ ...                │
└────────────────────┘
```

**Tab 3: Partidos**
- Ver MatchesListScreen filtrado por torneo

**Tab 4: Posiciones**
- Ver StandingsScreen

**Endpoints:**
- `GET /public/tournaments/{id}`

---

### 4.3 Standings Screen

**Ruta:** `/tournaments/:id/standings`
**Tipo:** StatefulWidget
**Autenticación:** No requerida

**Propósito:**
- Mostrar tabla de posiciones del torneo

**Para Torneos con Grupos:**
- Selector de grupo
- Tabla por grupo

**Para Torneos sin Grupos:**
- Tabla general única

**Tabla de Posiciones:**
```
┌────────────────────────────────────┐
│ [<] Posiciones                     │
│                                    │
│ [Grupo A ▼]                        │
│                                    │
├─┬────────────────┬───┬───┬───┬────┤
││ Equipo          │PJ │G  │P  │Pts │
├─┼────────────────┼───┼───┼───┼────┤
│1│[L] Águilas FC  │10 │9  │1  │27  │
├─┼────────────────┼───┼───┼───┼────┤
│2│[L] Tigres U.   │10 │8  │2  │24  │
├─┼────────────────┼───┼───┼───┼────┤
│3│[L] Leones SC   │10 │6  │4  │18  │
├─┼────────────────┼───┼───┼───┼────┤
│4│    Panteras FC │10 │4  │6  │12  │
├─┼────────────────┼───┼───┼───┼────┤
│...                                 │
└────────────────────────────────────┘

Leyenda:
PJ: Partidos Jugados
G: Ganados
P: Perdidos
Pts: Puntos
[L]: Líder de grupo
```

**Información Adicional:**
- Sets a favor/contra
- Puntos a favor/contra
- Diferencia de sets

**Pull-to-Refresh:** Sí
**Actualización:** Cada vez que se entra

**Endpoints:**
- `GET /public/tournaments/{id}/standings`
- `GET /public/tournaments/{id}/groups/{groupId}/standings`

---

## ⚽ Módulo de Partidos

### 5.1 Matches List Screen

**Ruta:** `/matches`
**Tipo:** StatefulWidget
**Autenticación:** No requerida
**Paginación:** 20 por página

**Propósito:**
- Mostrar partidos programados
- Filtrar por torneo, equipo, fecha

**Tabs:**
1. Programados
2. En Vivo
3. Finalizados

**Tab: Programados**
```
┌────────────────────┐
│ Partidos [Filtros] │
│                    │
│ 📅  🔴  ✅         │
│                    │
│ 📅 Hoy - 26/12     │
├────────────────────┤
│ 🏐 Torneo: Nac.    │
│                    │
│ Águilas FC         │
│        vs          │
│ Tigres Unidos      │
│                    │
│ 🕐 15:00           │
│ 📍 Estadio Nac.    │
│ Jornada 1          │
├────────────────────┤
│ 🏐 Torneo: Nac.    │
│                    │
│ Leones SC          │
│        vs          │
│ Panteras FC        │
│                    │
│ 🕐 17:00           │
│ 📍 Coliseo Mpal.   │
│ Jornada 1          │
└────────────────────┘
```

**Tab: En Vivo**
```
┌────────────────────┐
│ 🔴 EN VIVO (2)     │
│                    │
├────────────────────┤
│ 🏐 Torneo: Nac.    │
│                    │
│ Águilas FC    [1]  │
│        vs          │
│ Tigres U.     [0]  │
│                    │
│ 🔴 Set 1: 15-12    │
│ ⏱ 25 min           │
├────────────────────┤
│ ...                │
└────────────────────┘
```

**Tab: Finalizados**
- Similar a programados pero con resultado final

**Filtros:**
- Por torneo
- Por equipo
- Por fecha (date picker)

**Endpoints:**
- `GET /public/matches/scheduled?page=1`
- `GET /public/matches/live`
- `GET /public/matches/finished?page=1` (futuro)

---

### 5.2 Live Match Detail Screen

**Ruta:** `/matches/:id/live`
**Tipo:** StatefulWidget
**Autenticación:** No requerida
**Auto-refresh:** 10 segundos

**Propósito:**
- Ver partido en vivo con detalles
- Marcador en tiempo real
- Sets completados
- Eventos recientes

**UI/UX:**
```
┌────────────────────┐
│ [<] 🔴 EN VIVO     │
│                    │
│ Campeonato Nac.    │
│ Jornada 1          │
│                    │
├────────────────────┤
│ [LOGO]             │
│ Águilas FC    [2]  │
│                    │
│        vs          │
│                    │
│ Tigres U.     [1]  │
│ [LOGO]             │
│                    │
├────────────────────┤
│ 🔴 Set 3: 18-15    │
│                    │
│ ⏱ 80 minutos       │
│                    │
├────────────────────┤
│ Sets Completados   │
│                    │
│ Set 1: 25-22 ✅    │
│ Set 2: 20-25 ⛔    │
│ Set 3: 18-15 ▶️    │
│                    │
├────────────────────┤
│ Eventos Recientes  │
│                    │
│ 15:25 - Punto      │
│ Juan P. (Águilas)  │
│                    │
│ 15:24 - Punto      │
│ María G. (Tigres)  │
│                    │
├────────────────────┤
│ [Ver Jugadores]    │
│ [Ver Estadísticas] │
└────────────────────┘
```

**Componentes:**
1. Header con estado EN VIVO
2. Marcador principal (sets ganados)
3. Set actual con puntuación
4. Tiempo transcurrido
5. Sets completados
6. Eventos recientes
7. Botones de acciones

**Auto-refresh:**
- Polling cada 10 segundos
- Indicador de actualización

**Endpoints:**
- `GET /matches/{id}/realtime`
- `GET /public/matches/{id}`

---

### 5.3 Match Detail Screen

**Ruta:** `/matches/:id`
**Tipo:** StatefulWidget
**Autenticación:** No requerida

**Propósito:**
- Ver detalles completos de un partido (programado o finalizado)

**Para Partido Programado:**
```
┌────────────────────┐
│ [<] Partido        │
│                    │
│ Campeonato Nac.    │
│                    │
├────────────────────┤
│ [LOGO]             │
│ Águilas FC         │
│                    │
│        vs          │
│                    │
│ Tigres Unidos      │
│ [LOGO]             │
│                    │
├────────────────────┤
│ 📅 26/12/2024      │
│ 🕐 15:00           │
│ 📍 Estadio Nac.    │
│                    │
│ Jornada 1          │
│                    │
├────────────────────┤
│ [Ver Jugadores]    │
│ [Agregar a Cal.]   │
└────────────────────┘
```

**Para Partido Finalizado:**
- Similar pero con marcador final
- Sets completados
- Duración
- Estadísticas finales

**Tabs:**
1. Información
2. Jugadores
3. Estadísticas (si disponible)

**Endpoints:**
- `GET /public/matches/{id}`
- `GET /public/matches/{id}/players`

---

### 5.4 Match Players Screen

**Ruta:** `/matches/:id/players`
**Tipo:** StatefulWidget
**Autenticación:** No requerida

**Propósito:**
- Ver jugadores de ambos equipos en el partido

**Tabs por Equipo:**
- Equipo Local
- Equipo Visitante

**Lista de Jugadores:**
```
┌────────────────────┐
│ [<] Jugadores      │
│                    │
│ 🏠 Local  🚌 Visit.│
│                    │
├────────────────────┤
│ Águilas FC         │
│                    │
│ En Cancha          │
├────────────────────┤
│ [F] 👤 Juan Pérez  │
│     #1 - Setter    │
│     ⭐ Capitán     │
├────────────────────┤
│ [F] 👤 María G.    │
│     #5 - Libero    │
├────────────────────┤
│ ...                │
│                    │
│ Banca              │
├────────────────────┤
│ [F] 👤 Carlos L.   │
│     #10 - Outside  │
├────────────────────┤
│ ...                │
└────────────────────┘
```

**Indicadores:**
- [F] Foto del jugador
- ⭐ Capitán
- 🟢 En cancha
- 🔵 En banca

**Endpoints:**
- `GET /public/matches/{id}/players`
- `GET /public/matches/{id}/teams/{teamId}/players`

---

## 👤 Módulo de Perfil

### 6.1 Profile Screen

**Ruta:** `/profile`
**Tipo:** StatefulWidget
**Autenticación:** Requerida

**Propósito:**
- Ver y editar perfil del usuario autenticado
- Ver estadísticas personales
- Gestionar sesión

**Secciones:**

1. **Header con Avatar**
   - Foto de perfil (editable)
   - Nombre completo
   - Email
   - Rol

2. **Información Personal**
   - Teléfono
   - Fecha de nacimiento
   - Género
   - Dirección

3. **Información del Jugador** (si aplica)
   - Posición
   - Número de camiseta
   - Club actual
   - Categoría
   - Número de licencia

4. **Estadísticas**
   - Total de verificaciones
   - Verificaciones hoy
   - Sesiones completadas

5. **Acciones**
   - Editar perfil
   - Ver tokens activos
   - Cambiar contraseña (futuro)
   - Cerrar sesión

**UI/UX:**
```
┌────────────────────┐
│ [≡] Perfil         │
│                    │
│     [AVATAR]       │
│                    │
│   Juan Pérez       │
│   verificador@...  │
│   📛 Verificador   │
│                    │
├────────────────────┤
│ ℹ️ Información     │
│                    │
│ 📞 +57 300...      │
│ 📅 15/05/1990      │
│ 👤 Masculino       │
│ 📍 Calle 123...    │
│                    │
├────────────────────┤
│ 📊 Estadísticas    │
│                    │
│ Total verif: 150   │
│ Hoy: 25            │
│ Sesiones: 10       │
│                    │
├────────────────────┤
│ ⚙️ Acciones        │
│                    │
│ [Editar Perfil]    │
│ [Ver Tokens]       │
│ [Configuración]    │
│ [Cerrar Sesión]    │
└────────────────────┘
```

**Endpoints:**
- `GET /users/profile`
- `GET /mobile/verifications/stats`

---

### 6.2 Edit Profile Screen

**Ruta:** `/profile/edit`
**Tipo:** StatefulWidget
**Autenticación:** Requerida

**Propósito:**
- Editar información personal del perfil

**Campos Editables:**
- Foto de perfil
- Nombre
- Apellido
- Teléfono
- Dirección
- Apodo
- Bio
- Contacto de emergencia
- Tipo de sangre
- Alergias
- Condiciones médicas
- Talla de camiseta
- Redes sociales

**Validaciones:**
- Nombre: max 100 caracteres
- Apellido: max 100 caracteres
- Teléfono: max 20 caracteres, formato válido
- Bio: max 500 caracteres

**UI/UX:**
```
┌────────────────────┐
│ [<] Editar Perfil  │
│                    │
│   [Cambiar Foto]   │
│     [AVATAR]       │
│                    │
├────────────────────┤
│ Nombre             │
│ ┌────────────────┐ │
│ │ Juan Carlos    │ │
│ └────────────────┘ │
│                    │
│ Apellido           │
│ ┌────────────────┐ │
│ │ Pérez García   │ │
│ └────────────────┘ │
│                    │
│ Teléfono           │
│ ┌────────────────┐ │
│ │ +57 300...     │ │
│ └────────────────┘ │
│                    │
│ ...                │
│                    │
│ [Cancelar][Guardar]│
└────────────────────┘
```

**Endpoints:**
- `PUT /users/profile`

---

### 6.3 Active Tokens Screen

**Ruta:** `/profile/tokens`
**Tipo:** StatefulWidget
**Autenticación:** Requerida

**Propósito:**
- Ver dispositivos con sesión activa
- Revocar sesiones en otros dispositivos

**Lista de Tokens:**
```
┌────────────────────┐
│ [<] Dispositivos   │
│     Activos        │
│                    │
├────────────────────┤
│ 📱 iPhone 15 Pro   │
│    (Este disp.) ✓  │
│                    │
│ Último uso: Ahora  │
│ Creado: 26/12/2024 │
│ Expira: 25/01/2025 │
├────────────────────┤
│ 📱 iPad Pro        │
│                    │
│ Último uso: hace   │
│ 2 días             │
│ Creado: 20/12/2024 │
│ Expira: 19/01/2025 │
│                    │
│ [Revocar]          │
├────────────────────┤
│ [Cerrar en Todos]  │
└────────────────────┘
```

**Acciones:**
- Revocar token específico
- Cerrar sesión en todos los dispositivos

**Confirmación:**
- Dialog de confirmación antes de revocar

**Endpoints:**
- `GET /auth/tokens`
- `DELETE /auth/tokens/{tokenId}`
- `POST /auth/logout-all`

---

## 🧩 Componentes Compartidos

### Widgets Reutilizables

#### 1. AppNetworkImage
**Propósito:** Cargar imágenes de red con placeholder y error handling
```dart
AppNetworkImage(
  imageUrl: player.photoUrl,
  placeholder: CircularProgressIndicator(),
  errorWidget: Icon(Icons.person),
  height: 100,
  width: 100,
  fit: BoxFit.cover,
)
```

#### 2. AppButton
**Propósito:** Botón estándar de la app
**Variantes:**
- Primary (azul)
- Secondary (gris)
- Danger (rojo)
- Success (verde)

#### 3. AppTextField
**Propósito:** Campo de texto estándar con validación
```dart
AppTextField(
  label: 'Email',
  hintText: 'ejemplo@correo.com',
  validator: Validators.email,
  keyboardType: TextInputType.emailAddress,
)
```

#### 4. AppCard
**Propósito:** Card estándar con sombra y bordes redondeados

#### 5. EmptyState
**Propósito:** Mostrar estado vacío con icono y mensaje
```dart
EmptyState(
  icon: Icons.inbox,
  title: 'No hay verificaciones',
  message: 'Escanea tu primer carnet QR',
)
```

#### 6. LoadingOverlay
**Propósito:** Overlay de carga fullscreen

#### 7. ErrorMessage
**Propósito:** Mensaje de error estándar
```dart
ErrorMessage(
  message: 'Error al cargar datos',
  onRetry: () => _loadData(),
)
```

#### 8. ConnectionIndicator
**Propósito:** Indicador de conexión online/offline
```dart
ConnectionIndicator(
  isOnline: true,
  pendingSyncCount: 3,
)
```

#### 9. PlayerAvatar
**Propósito:** Avatar circular de jugador con foto
```dart
PlayerAvatar(
  photoUrl: player.photoUrl,
  size: 50,
  borderColor: player.isEligible ? Colors.green : Colors.red,
)
```

#### 10. MatchCard
**Propósito:** Card de partido reutilizable
```dart
MatchCard(
  match: match,
  onTap: () => _navigateToMatch(match.id),
  showLiveIndicator: true,
)
```

#### 11. TeamBadge
**Propósito:** Badge de equipo con logo
```dart
TeamBadge(
  teamName: 'Águilas FC',
  logoUrl: team.logoUrl,
  size: 40,
)
```

#### 12. StatCard
**Propósito:** Card de estadística
```dart
StatCard(
  icon: Icons.check_circle,
  label: 'Verificaciones',
  value: '150',
  color: Colors.green,
)
```

---

### Dialogs

#### 1. ConfirmationDialog
```dart
showAppConfirmationDialog(
  context,
  title: '¿Cerrar sesión?',
  message: '¿Estás seguro que deseas cerrar sesión?',
  confirmText: 'Sí, cerrar',
  cancelText: 'Cancelar',
  onConfirm: () => _logout(),
);
```

#### 2. InfoDialog
```dart
showAppInfoDialog(
  context,
  title: 'Información',
  message: 'El jugador tiene sanción activa',
);
```

#### 3. ErrorDialog
```dart
showAppErrorDialog(
  context,
  title: 'Error',
  message: error.message,
  onRetry: () => _retry(),
);
```

---

### Navegación

**Estructura:**
- Bottom Navigation Bar (Main Tabs)
  - Verificación
  - Torneos
  - Partidos
  - Perfil
- Stack Navigation para detalles

**Transiciones:**
- Material Page Route (Android)
- Cupertino Page Route (iOS)

**Deep Linking:**
- `/tournaments/:id`
- `/matches/:id`
- `/players/:id`

---

### Temas y Estilos

**Colores Principales:**
```dart
class AppColors {
  static const primary = Color(0xFF1976D2);
  static const secondary = Color(0xFF424242);
  static const success = Color(0xFF4CAF50);
  static const warning = Color(0xFFFF9800);
  static const danger = Color(0xFFF44336);
  static const background = Color(0xFFF5F5F5);
  static const surface = Color(0xFFFFFFFF);
  static const text = Color(0xFF212121);
  static const textSecondary = Color(0xFF757575);
}
```

**Tipografía:**
```dart
class AppTextStyles {
  static const headline1 = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: AppColors.text,
  );
  static const headline2 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: AppColors.text,
  );
  static const body1 = TextStyle(
    fontSize: 16,
    color: AppColors.text,
  );
  static const body2 = TextStyle(
    fontSize: 14,
    color: AppColors.textSecondary,
  );
}
```

**Espaciado:**
```dart
class AppSpacing {
  static const xs = 4.0;
  static const sm = 8.0;
  static const md = 16.0;
  static const lg = 24.0;
  static const xl = 32.0;
}
```

---

## 📝 Notas de Implementación

### Prioridades de MVP

**CRÍTICO (Sprint 1-3):**
1. Autenticación
2. Verificación QR
3. Modo Offline
4. Sesiones

**IMPORTANTE (Sprint 4):**
5. Torneos Públicos
6. Partidos

**DESEABLE (Sprint 5):**
7. Perfil
8. Estadísticas

### Consideraciones Técnicas

1. **Performance:**
   - Lazy loading de imágenes
   - Caché de datos
   - Paginación infinita

2. **Offline-First:**
   - SQLite para almacenamiento local
   - Queue de sincronización
   - Conflict resolution

3. **UX:**
   - Loading states
   - Error states
   - Empty states
   - Pull-to-refresh
   - Haptic feedback

4. **Accesibilidad:**
   - Semantic labels
   - Contrast ratio
   - Font scaling

---

**Última actualización:** Diciembre 26, 2024
**Próxima revisión:** Al completar Sprint 1
