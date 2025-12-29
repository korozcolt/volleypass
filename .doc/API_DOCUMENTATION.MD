# VolleyPass API - Documentación Completa para Desarrollo Móvil

> **Versión:** 1.0.0
> **Última actualización:** Diciembre 28, 2024
> **Base URL:** `https://volleypass.test/api/v1` o `https://volleypass-new.test/api/v1`
> **Autenticación:** Laravel Sanctum (Bearer Tokens)

---

## 📋 Tabla de Contenidos

1. [Información General](#información-general)
2. [Autenticación](#autenticación)
3. [📊 Dashboards (NUEVO)](#-dashboards)
4. [Endpoints Públicos](#endpoints-públicos)
5. [Endpoints Autenticados](#endpoints-autenticados)
6. [Sistema de Verificación QR](#sistema-de-verificación-qr)
7. [Gestión de Partidos en Vivo](#gestión-de-partidos-en-vivo)
8. [Sistema de Sanciones](#sistema-de-sanciones)
9. [Gestión de Categorías de Jugadores](#gestión-de-categorías-de-jugadores)
10. [Reportes y Administración](#reportes-y-administración)
11. [Manejo de Errores](#manejo-de-errores)
12. [Formatos y Convenciones](#formatos-y-convenciones)
13. [Guía de Implementación](#guía-de-implementación)

---

## 📱 Información General

### Características del Sistema

VolleyPass es un sistema integral de gestión de ligas de voleibol que incluye:

- ✅ **Autenticación basada en roles** con Sanctum
- ✅ **Verificación QR de carnets** de jugadores en tiempo real
- ✅ **Gestión de partidos en vivo** con marcadores y rotaciones
- ✅ **Sistema de sanciones** para jugadores
- ✅ **Torneos públicos** con tablas de posiciones
- ✅ **Sincronización offline** para verificaciones
- ✅ **Broadcasting en tiempo real** para partidos

### Stack Tecnológico

- **Backend:** Laravel 12.24.0
- **PHP:** 8.4.16
- **Base de datos:** MySQL
- **Autenticación:** Laravel Sanctum
- **Broadcasting:** Pusher/Socket.IO compatible
- **Cache:** Redis (opcional)

### Roles de Usuario

| Rol | Descripción | Abilities |
|-----|-------------|-----------|
| `SuperAdmin` | Administrador del sistema | `*` (todos) |
| `LeagueAdmin` | Administrador de liga | `verify`, `view:stats`, `manage:events` |
| `Verifier` | Verificador de carnets | `verify:qr`, `verify:batch` |
| `Referee` | Árbitro de partidos | `manage:matches`, `add:sanctions` |
| `Coach` | Entrenador | `view:team`, `view:players` |
| `ClubAdmin` | Administrador de club | `manage:club` |
| `Player` | Jugador | `view:profile` |

---

## 🔐 Autenticación

### Configuración de Sanctum

```json
{
  "token_expiration": "30 days",
  "prefix": "Bearer",
  "stateful_domains": ["volleypass.test"],
  "guard": "sanctum"
}
```

### 1. Login

Obtiene un token de acceso para autenticar futuras peticiones.

**Endpoint:** `POST /auth/login`
**Auth:** No requerida
**Rate Limit:** 5 intentos por 300 segundos (por IP)

#### Request

```json
{
  "email": "verificador@volleypass.com",
  "password": "password123",
  "device_name": "iPhone 15 Pro"
}
```

**Validación:**
- `email`: requerido, string, formato email válido sin acentos
- `password`: requerido, string
- `device_name`: requerido, string (identifica el dispositivo)

#### Response Exitoso (200 OK)

```json
{
  "token": "1|abcdefghijklmnopqrstuvwxyz123456",
  "token_type": "Bearer",
  "expires_in": 2592000,
  "user": {
    "id": 1,
    "name": "Juan Pérez",
    "email": "verificador@volleypass.com",
    "roles": ["Verifier"],
    "abilities": ["verify:qr", "verify:batch", "view:own-stats"],
    "profile": {
      "avatar_url": null,
      "phone": "+57 300 123 4567"
    }
  }
}
```

#### Errores

**401 Unauthorized** - Credenciales inválidas
```json
{
  "error": "Credenciales inválidas"
}
```

**429 Too Many Requests** - Rate limit excedido
```json
{
  "error": "Demasiados intentos de login. Intente en 300 segundos."
}
```

**422 Validation Error**
```json
{
  "message": "The given data was invalid.",
  "errors": {
    "email": ["El email es requerido"],
    "password": ["La contraseña es requerida"]
  }
}
```

---

### 2. Verificar Email

Verifica si un email existe y tiene rol de verificador.

**Endpoint:** `POST /auth/check-email`
**Auth:** No requerida

#### Request

```json
{
  "email": "verificador@volleypass.com"
}
```

#### Response

```json
{
  "exists": true
}
```

---

### 3. Obtener Usuario Actual

**Endpoint:** `GET /auth/user`
**Auth:** Requerida (Sanctum)

#### Headers

```
Authorization: Bearer {token}
Accept: application/json
```

#### Response (200 OK)

```json
{
  "user": {
    "id": 1,
    "name": "Juan Pérez",
    "email": "verificador@volleypass.com",
    "roles": ["Verifier"],
    "abilities": ["verify:qr", "verify:batch"],
    "profile": {
      "avatar_url": null,
      "phone": "+57 300 123 4567"
    }
  },
  "token_info": {
    "name": "iPhone 15 Pro",
    "abilities": ["verify:qr"],
    "created_at": "2024-12-26T10:30:00Z",
    "expires_at": "2025-01-25T10:30:00Z"
  }
}
```

---

### 4. Logout (Dispositivo Actual)

Revoca el token actual del dispositivo.

**Endpoint:** `POST /auth/logout`
**Auth:** Requerida

#### Response (200 OK)

```json
{
  "message": "Sesión cerrada exitosamente"
}
```

---

### 5. Logout (Todos los Dispositivos)

Revoca todos los tokens del usuario.

**Endpoint:** `POST /auth/logout-all`
**Auth:** Requerida

#### Response (200 OK)

```json
{
  "message": "Sesión cerrada en todos los dispositivos (3 tokens revocados)"
}
```

---

### 6. Listar Tokens Activos

**Endpoint:** `GET /auth/tokens`
**Auth:** Requerida

#### Response (200 OK)

```json
{
  "tokens": [
    {
      "id": 1,
      "name": "iPhone 15 Pro",
      "abilities": ["verify:qr"],
      "created_at": "2024-12-26T10:30:00Z",
      "expires_at": "2025-01-25T10:30:00Z",
      "last_used_at": "2024-12-26T15:45:00Z",
      "is_current": true
    },
    {
      "id": 2,
      "name": "iPad Pro",
      "abilities": ["verify:qr"],
      "created_at": "2024-12-20T08:00:00Z",
      "expires_at": "2025-01-19T08:00:00Z",
      "last_used_at": "2024-12-25T12:00:00Z",
      "is_current": false
    }
  ],
  "total": 2
}
```

---

### 7. Revocar Token Específico

**Endpoint:** `DELETE /auth/tokens/{tokenId}`
**Auth:** Requerida

#### Request

```json
{
  "token_id": 2
}
```

#### Response (200 OK)

```json
{
  "message": "Token 'iPad Pro' revocado exitosamente"
}
```

---

## 📊 Dashboards

Los dashboards proporcionan métricas específicas según el rol del usuario autenticado. **Recomendamos usar el endpoint unificado** para simplicidad en el frontend móvil.

### 🎯 Dashboard Unificado (RECOMENDADO)

Endpoint inteligente que detecta automáticamente el rol del usuario y retorna el dashboard apropiado.

**Endpoint:** `GET /dashboard`
**Auth:** Bearer Token requerido
**Roles:** Todos (excepto Player)

#### Request

```http
GET /api/v1/dashboard
Authorization: Bearer 1|abcdef123456...
```

#### Response SuperAdmin (200 OK)

```json
{
  "success": true,
  "role": "SuperAdmin",
  "data": {
    "users": {
      "total": 150,
      "active": 142,
      "inactive": 8,
      "new_last_30_days": 12,
      "by_role": {
        "SuperAdmin": 2,
        "LeagueAdmin": 5,
        "ClubAdmin": 15,
        "Coach": 20,
        "Verifier": 30,
        "Player": 78
      }
    },
    "subscriptions": {
      "active": 12,
      "expired": 3,
      "expiring_soon_7_days": 2,
      "past_due": 1,
      "suspended": 0,
      "total": 16
    },
    "system_metrics": {
      "verifications": {
        "total": 5420,
        "today": 45,
        "this_month": 1230
      },
      "matches": {
        "total": 156,
        "completed": 89,
        "in_progress": 2,
        "scheduled": 65
      },
      "clubs": {
        "total": 15,
        "active": 14,
        "inactive": 1
      }
    },
    "revenue": {
      "monthly_recurring": 12500.00,
      "total_collected": 125000.00,
      "pending_collection": 3500.00,
      "overdue_amount": 1200.00
    },
    "recent_activity": {
      "recent_users": [
        {
          "id": 145,
          "name": "María González",
          "email": "maria@club.com",
          "role": "ClubAdmin",
          "created_at": "2024-12-26T10:30:00.000000Z"
        }
      ],
      "recent_subscriptions": [
        {
          "id": 12,
          "club": "Club Deportivo Norte",
          "status": "active",
          "current_period_end": "2025-01-26",
          "created_at": "2024-12-01T08:00:00.000000Z"
        }
      ]
    }
  },
  "timestamp": "2024-12-28T14:30:00.000000Z"
}
```

#### Response LeagueAdmin (200 OK)

```json
{
  "success": true,
  "role": "LeagueAdmin",
  "data": {
    "league_info": {
      "id": 1,
      "name": "Liga Nacional de Voleibol",
      "short_name": "LNV",
      "logo": "https://volleypass.test/storage/logos/league-1.png",
      "status": "active",
      "is_active": true,
      "email": "contacto@lnv.com",
      "phone": "+57 300 1234567",
      "website": "https://lnv.com"
    },
    "clubs": {
      "total": 15,
      "active": 14,
      "inactive": 1,
      "by_category": {
        "mayores": 8,
        "juvenil": 10,
        "infantil": 5
      },
      "by_gender": {
        "femenino": 12,
        "masculino": 8,
        "mixto": 3
      }
    },
    "players": {
      "total": 450,
      "federated": 320,
      "non_federated": 130,
      "federation_percentage": 71.11,
      "by_club": {
        "Club Norte": 45,
        "Club Sur": 38,
        "Club Este": 35
      },
      "by_category": {
        "mayores": 180,
        "juvenil": 150,
        "infantil": 120
      }
    },
    "tournaments": {
      "total": 24,
      "active": 3,
      "scheduled": 5,
      "completed": 16,
      "recent": [
        {
          "id": 12,
          "name": "Torneo Nacional 2024",
          "status": "in_progress",
          "type": "league",
          "category": "mayores",
          "gender": "femenino",
          "start_date": "2024-12-01",
          "total_teams": 12
        }
      ]
    },
    "sanctions": {
      "active": 8,
      "by_type": {
        "yellow_card": 5,
        "red_card": 2,
        "suspension": 1
      },
      "recent": [
        {
          "id": 23,
          "player": "Ana Martínez",
          "club": "Club Norte",
          "type": "yellow_card",
          "status": "active",
          "start_date": "2024-12-20",
          "end_date": null
        }
      ]
    },
    "verifications": {
      "pending": 12,
      "today": 45,
      "this_month": 1230
    }
  },
  "timestamp": "2024-12-28T14:30:00.000000Z"
}
```

#### Response ClubAdmin/Coach (200 OK)

```json
{
  "success": true,
  "role": "ClubAdmin",
  "data": {
    "club_info": {
      "id": 5,
      "name": "Club Deportivo Norte",
      "short_name": "CDN",
      "logo": "https://volleypass.test/storage/logos/club-5.png",
      "status": "active",
      "is_active": true,
      "is_federated": true,
      "federation_code": "CDN-2024-001",
      "email": "contacto@clubnorte.com",
      "phone": "+57 300 9876543",
      "address": "Calle 123 #45-67",
      "city": "Bogotá",
      "department": "Cundinamarca"
    },
    "players": {
      "total": 45,
      "active": 42,
      "inactive": 3,
      "federated": 38,
      "non_federated": 7,
      "with_overdue_payments": 5,
      "by_category": {
        "mayores": 18,
        "juvenil": 15,
        "infantil": 12
      },
      "expiring_medical_certs_30_days": 3
    },
    "matches": {
      "total_played": 28,
      "wins": 18,
      "losses": 10,
      "win_rate": 64.29,
      "upcoming_matches": [
        {
          "id": 89,
          "home_team": "Club Deportivo Norte",
          "away_team": "Club Sur",
          "tournament": "Torneo Nacional 2024",
          "scheduled_at": "2024-12-29T15:00:00.000000Z",
          "venue": "Coliseo Norte",
          "is_home": true
        }
      ]
    },
    "payments": {
      "pending_count": 8,
      "overdue_count": 5,
      "pending_amount": 2400000.00,
      "overdue_amount": 1500000.00
    },
    "federation": {
      "pending_federation": 3,
      "expiring_federation_30_days": 2
    },
    "subscription": {
      "has_subscription": true,
      "status": "active",
      "current_period_end": "2025-01-26",
      "days_until_renewal": 29,
      "is_active": true,
      "is_past_due": false,
      "player_count": 45,
      "last_amount": 850000.00
    }
  },
  "timestamp": "2024-12-28T14:30:00.000000Z"
}
```

#### Response Verifier (200 OK)

```json
{
  "success": true,
  "role": "Verifier",
  "message": "Verifiers should use /v1/stats/dashboard endpoint",
  "redirect_to": "/v1/stats/dashboard"
}
```

#### Errors

**403 Forbidden** - Sin dashboard disponible para este rol
```json
{
  "success": false,
  "message": "No hay dashboard disponible para este rol de usuario",
  "user_roles": ["Player"]
}
```

### 🔧 Dashboards Específicos (Acceso Alternativo)

También puedes acceder directamente a dashboards específicos por rol:

#### SuperAdmin Dashboard

**Endpoint:** `GET /admin/dashboard`
**Auth:** Bearer Token requerido
**Roles:** SuperAdmin

Retorna las mismas métricas que el dashboard unificado para SuperAdmin.

#### League Dashboard

**Endpoint:** `GET /league/dashboard`
**Auth:** Bearer Token requerido
**Roles:** LeagueAdmin, SuperAdmin

Retorna las mismas métricas que el dashboard unificado para LeagueAdmin.

#### Club Dashboard

**Endpoint:** `GET /club/dashboard`
**Auth:** Bearer Token requerido
**Roles:** ClubAdmin, Coach, SuperAdmin

Retorna las mismas métricas que el dashboard unificado para ClubAdmin/Coach.

### 💡 Recomendación de Implementación

```javascript
// React Native / JavaScript
async function fetchDashboard() {
  const response = await fetch('https://volleypass.test/api/v1/dashboard', {
    headers: {
      'Authorization': `Bearer ${token}`,
      'Accept': 'application/json'
    }
  });

  const data = await response.json();

  // El backend decide qué dashboard retornar según el rol
  console.log(`Dashboard para: ${data.role}`);

  // Renderizar componentes según el rol
  switch(data.role) {
    case 'SuperAdmin':
      return <SuperAdminDashboard data={data.data} />;
    case 'LeagueAdmin':
      return <LeagueDashboard data={data.data} />;
    case 'ClubAdmin':
    case 'Coach':
      return <ClubDashboard data={data.data} />;
    case 'Verifier':
      // Redirigir al dashboard de verificación
      navigateTo(data.redirect_to);
      break;
  }
}
```

---

## 💳 Gestión de Pagos

El sistema de pagos utiliza un **modelo de verificación manual** donde los jugadores suben comprobantes de transferencias bancarias/billeteras virtuales (Nequi, Daviplata, etc.) y el ClubAdmin/Coach los aprueba manualmente.

### 🔄 Flujo de Pago

```
1. Jugador realiza transferencia a cuenta del club
2. Jugador sube captura del comprobante → Status: "under_verification"
3. ClubAdmin/Coach verifica comprobante
   - ✅ Aprobar → Status: "verified"
   - ❌ Rechazar → Status: "rejected" (jugador debe volver a subir)
```

### Estados de Pago

| Estado | Descripción | Puede Jugador Subir Comprobante | Puede Club Verificar |
|--------|-------------|--------------------------------|---------------------|
| `pending` | Pago creado, esperando comprobante | ✅ Sí | ❌ No |
| `under_verification` | Comprobante subido, esperando aprobación | ❌ No | ✅ Sí |
| `verified` | Pago aprobado por el club | ❌ No | ❌ No |
| `rejected` | Comprobante rechazado | ✅ Sí | ❌ No |
| `overdue` | Pago vencido (automático si pasa `due_date`) | ✅ Sí | ❌ No |

---

### 📋 Listar Mis Pagos (Jugador)

**Endpoint:** `GET /v1/payments`
**Auth:** Bearer Token (Player)
**Roles:** Cualquier usuario autenticado con perfil de jugador

#### Query Parameters

| Parámetro | Tipo | Requerido | Descripción |
|-----------|------|-----------|-------------|
| `status` | string | No | Filtrar por estado: `pending`, `under_verification`, `verified`, `rejected`, `overdue` |
| `type` | string | No | Filtrar por tipo: `monthly_fee`, `registration`, `tournament`, `fine` |

#### Response (200 OK)

```json
{
  "success": true,
  "data": {
    "current_page": 1,
    "data": [
      {
        "id": 15,
        "club_id": 1,
        "player_id": 5,
        "type": "monthly_fee",
        "amount": "150000.00",
        "currency": "COP",
        "status": "under_verification",
        "payment_date": "2025-12-29T10:30:00.000000Z",
        "due_date": "2026-01-05",
        "reference_number": "NEQUI-123456",
        "notes": "Pago mensualidad diciembre",
        "payment_proof_url": "https://volleypass-new.test/storage/receipts/abc123.jpg",
        "created_at": "2025-12-20T00:00:00.000000Z",
        "club": {
          "id": 1,
          "name": "CLUB DEPORTIVO ATHLETIC SINCELEJO"
        },
        "verifier": null
      },
      {
        "id": 14,
        "club_id": 1,
        "player_id": 5,
        "type": "monthly_fee",
        "amount": "150000.00",
        "status": "verified",
        "payment_date": "2025-11-28T14:22:00.000000Z",
        "due_date": "2025-12-05",
        "reference_number": "DAVIPLATA-789012",
        "payment_proof_url": "https://volleypass-new.test/storage/receipts/xyz789.jpg",
        "verified_at": "2025-11-29T09:15:00.000000Z",
        "club": {
          "id": 1,
          "name": "CLUB DEPORTIVO ATHLETIC SINCELEJO"
        },
        "verifier": {
          "id": 3,
          "name": "Kristian Orozco"
        }
      }
    ],
    "total": 12,
    "per_page": 20
  }
}
```

---

### 🔍 Ver Detalle de Pago (Jugador)

**Endpoint:** `GET /v1/payments/{id}`
**Auth:** Bearer Token
**Roles:** Owner del pago, ClubAdmin del club, Coach del club

#### Response (200 OK)

```json
{
  "success": true,
  "data": {
    "id": 15,
    "club_id": 1,
    "player_id": 5,
    "type": "monthly_fee",
    "amount": "150000.00",
    "currency": "COP",
    "status": "under_verification",
    "payment_date": "2025-12-29T10:30:00.000000Z",
    "due_date": "2026-01-05",
    "reference_number": "NEQUI-123456",
    "notes": "Pago mensualidad diciembre",
    "payment_proof_url": "https://volleypass-new.test/storage/receipts/abc123.jpg",
    "created_at": "2025-12-20T00:00:00.000000Z",
    "verified_at": null,
    "club": {
      "id": 1,
      "name": "CLUB DEPORTIVO ATHLETIC SINCELEJO"
    },
    "player": {
      "user": {
        "id": 9,
        "name": "ANA SOFIA OROZCO SUAREZ"
      }
    },
    "verifier": null
  }
}
```

#### Errors

```json
// 403 Forbidden
{
  "success": false,
  "message": "No tiene permiso para ver este pago"
}

// 404 Not Found
{
  "success": false,
  "message": "Error al obtener el pago"
}
```

---

### 📤 Subir Comprobante de Pago (Jugador)

**Endpoint:** `POST /v1/payments/{id}/proof`
**Auth:** Bearer Token (Player)
**Content-Type:** `multipart/form-data`

#### Request Body

| Campo | Tipo | Requerido | Descripción |
|-------|------|-----------|-------------|
| `proof` | file | ✅ Sí | Captura del comprobante (JPEG, PNG, PDF, max 5MB) |
| `reference_number` | string | No | Número de referencia de la transacción |
| `notes` | string | No | Notas adicionales sobre el pago (max 500 caracteres) |

#### Condiciones

- Solo se puede subir comprobante si el pago está en estado `pending` o `rejected`
- El archivo debe ser imagen (JPEG/PNG) o PDF
- Tamaño máximo: 5MB

#### Response (200 OK)

```json
{
  "success": true,
  "message": "Comprobante subido exitosamente. El pago está en proceso de verificación.",
  "data": {
    "id": 15,
    "status": "under_verification",
    "payment_date": "2025-12-29T11:45:00.000000Z",
    "reference_number": "NEQUI-123456",
    "notes": "Pago mensualidad diciembre",
    "payment_proof_url": "https://volleypass-new.test/storage/receipts/abc123.jpg",
    "club": {
      "id": 1,
      "name": "CLUB DEPORTIVO ATHLETIC SINCELEJO"
    }
  }
}
```

#### Errors

```json
// 422 Estado no permite subir comprobante
{
  "success": false,
  "message": "No se puede subir comprobante para un pago en estado: Verificado"
}

// 422 Validación
{
  "success": false,
  "message": "Error de validación",
  "errors": {
    "proof": [
      "El campo proof es obligatorio.",
      "El archivo debe ser una imagen o PDF.",
      "El archivo no debe pesar más de 5MB."
    ]
  }
}
```

---

### 🖼️ Ver Comprobante de Pago (Jugador)

**Endpoint:** `GET /v1/payments/{id}/proof`
**Auth:** Bearer Token

#### Response (200 OK)

```json
{
  "success": true,
  "data": {
    "proof_url": "https://volleypass-new.test/storage/receipts/abc123.jpg",
    "uploaded_at": "2025-12-29T11:45:00.000000Z",
    "file_name": "comprobante-diciembre.jpg",
    "mime_type": "image/jpeg",
    "size": 245678
  }
}
```

#### Errors

```json
// 404 No hay comprobante
{
  "success": false,
  "message": "Este pago no tiene comprobante subido"
}
```

---

## 🏢 Gestión de Pagos (Club)

Endpoints para que ClubAdmin y Coach gestionen los pagos de sus jugadores.

### 📋 Listar Pagos del Club

**Endpoint:** `GET /v1/club/payments`
**Auth:** Bearer Token
**Roles:** ClubAdmin, Coach, SuperAdmin

#### Query Parameters

| Parámetro | Tipo | Requerido | Descripción |
|-----------|------|-----------|-------------|
| `status` | string | No | Filtrar por estado |
| `player_id` | integer | No | Filtrar por jugador específico |

#### Response (200 OK)

```json
{
  "success": true,
  "data": {
    "current_page": 1,
    "data": [
      {
        "id": 15,
        "club_id": 1,
        "player_id": 5,
        "type": "monthly_fee",
        "amount": "150000.00",
        "status": "under_verification",
        "payment_date": "2025-12-29T10:30:00.000000Z",
        "due_date": "2026-01-05",
        "reference_number": "NEQUI-123456",
        "payment_proof_url": "https://volleypass-new.test/storage/receipts/abc123.jpg",
        "player": {
          "user": {
            "id": 9,
            "name": "ANA SOFIA OROZCO SUAREZ",
            "email": "anasofia@example.com"
          }
        },
        "verifier": null
      }
    ],
    "total": 25,
    "per_page": 20
  }
}
```

---

### ✅ Verificar o Rechazar Pago

**Endpoint:** `PUT /v1/club/payments/{id}/verify`
**Auth:** Bearer Token
**Roles:** ClubAdmin, Coach, SuperAdmin

#### Request Body

```json
{
  "action": "approve", // "approve" o "reject"
  "notes": "Comprobante verificado correctamente" // Requerido si action=reject
}
```

#### Condiciones

- Solo se puede verificar si el pago está en estado `under_verification`
- `notes` es obligatorio cuando se rechaza

#### Response (200 OK) - Aprobado

```json
{
  "success": true,
  "message": "Pago aprobado exitosamente",
  "data": {
    "id": 15,
    "status": "verified",
    "verified_at": "2025-12-29T12:00:00.000000Z",
    "player": {
      "user": {
        "id": 9,
        "name": "ANA SOFIA OROZCO SUAREZ"
      }
    },
    "verifier": {
      "id": 3,
      "name": "Kristian Orozco"
    }
  }
}
```

#### Response (200 OK) - Rechazado

```json
{
  "success": true,
  "message": "Pago rechazado. El jugador deberá subir un nuevo comprobante.",
  "data": {
    "id": 15,
    "status": "rejected",
    "verified_at": "2025-12-29T12:00:00.000000Z",
    "notes": "Comprobante no es legible",
    "verifier": {
      "id": 3,
      "name": "Kristian Orozco"
    }
  }
}
```

#### Errors

```json
// 422 Estado no permite verificación
{
  "success": false,
  "message": "Solo se pueden verificar pagos en estado \"Por Verificación\""
}

// 422 Validación
{
  "success": false,
  "message": "Error de validación",
  "errors": {
    "notes": [
      "El campo notes es obligatorio cuando el action es reject."
    ]
  }
}
```

---

### 📊 Estadísticas de Pagos del Club

**Endpoint:** `GET /v1/club/payments/statistics`
**Auth:** Bearer Token
**Roles:** ClubAdmin, Coach, SuperAdmin

#### Response (200 OK)

```json
{
  "success": true,
  "data": {
    "total_pending": 5,
    "total_under_verification": 8,
    "total_verified": 45,
    "total_overdue": 3,
    "pending_amount": 750000.00,
    "verified_amount": 6750000.00,
    "recent_payments": [
      {
        "id": 15,
        "player_id": 5,
        "type": "monthly_fee",
        "amount": "150000.00",
        "status": "under_verification",
        "payment_date": "2025-12-29T10:30:00.000000Z",
        "payment_proof_url": "https://volleypass-new.test/storage/receipts/abc123.jpg",
        "player": {
          "user": {
            "id": 9,
            "name": "ANA SOFIA OROZCO SUAREZ"
          }
        }
      }
    ]
  }
}
```

---

### 💡 Implementación en Mobile - Ejemplo React Native

```javascript
import * as ImagePicker from 'expo-image-picker';
import * as DocumentPicker from 'expo-document-picker';

// Listar pagos del jugador
const fetchMyPayments = async () => {
  const response = await fetch('https://volleypass-new.test/api/v1/payments', {
    headers: {
      'Authorization': `Bearer ${token}`,
      'Accept': 'application/json'
    }
  });

  const { data } = await response.json();
  return data;
};

// Subir comprobante de pago
const uploadPaymentProof = async (paymentId) => {
  // 1. Seleccionar imagen o documento
  const result = await ImagePicker.launchImageLibraryAsync({
    mediaTypes: ImagePicker.MediaTypeOptions.Images,
    allowsEditing: true,
    quality: 0.8,
  });

  if (result.canceled) return;

  // 2. Preparar FormData
  const formData = new FormData();
  formData.append('proof', {
    uri: result.assets[0].uri,
    type: 'image/jpeg',
    name: 'comprobante.jpg'
  });
  formData.append('reference_number', 'NEQUI-123456');
  formData.append('notes', 'Pago mensualidad diciembre');

  // 3. Enviar a API
  const response = await fetch(`https://volleypass-new.test/api/v1/payments/${paymentId}/proof`, {
    method: 'POST',
    headers: {
      'Authorization': `Bearer ${token}`,
      'Accept': 'application/json',
      'Content-Type': 'multipart/form-data'
    },
    body: formData
  });

  const { success, message } = await response.json();

  if (success) {
    Alert.alert('Éxito', message);
    refreshPayments();
  }
};

// Ver comprobante (abrir en navegador o visor de imágenes)
const viewPaymentProof = async (paymentId) => {
  const response = await fetch(`https://volleypass-new.test/api/v1/payments/${paymentId}/proof`, {
    headers: {
      'Authorization': `Bearer ${token}`,
      'Accept': 'application/json'
    }
  });

  const { data } = await response.json();

  // Abrir imagen en navegador o visor
  Linking.openURL(data.proof_url);
};

// CLUB - Aprobar/Rechazar pago
const verifyPayment = async (paymentId, approve, notes = '') => {
  const response = await fetch(`https://volleypass-new.test/api/v1/club/payments/${paymentId}/verify`, {
    method: 'PUT',
    headers: {
      'Authorization': `Bearer ${token}`,
      'Accept': 'application/json',
      'Content-Type': 'application/json'
    },
    body: JSON.stringify({
      action: approve ? 'approve' : 'reject',
      notes: notes
    })
  });

  const { success, message } = await response.json();

  if (success) {
    Alert.alert('Éxito', message);
    refreshClubPayments();
  }
};
```

---

## 🌐 Endpoints Públicos

### Health Check

Verifica el estado del API.

**Endpoint:** `GET /health`
**Auth:** No requerida

#### Response (200 OK)

```json
{
  "status": "ok",
  "timestamp": "2024-12-26T15:45:00Z",
  "version": "1.0.0",
  "environment": "production"
}
```

---

### Estado de Jugador (Por Número de Carnet)

**Endpoint:** `GET /public/player-status/{card_number}`
**Auth:** No requerida

#### Ejemplo

```
GET /public/player-status/VP2024001
```

#### Response (200 OK)

```json
{
  "player_name": "Juan Pérez",
  "position": "Líbero",
  "category": "Senior",
  "card_status": "Activo",
  "is_active": true
}
```

#### Error (404)

```json
{
  "error": "Carnet no encontrado"
}
```

---

### Estadísticas de Liga

**Endpoint:** `GET /public/league-stats`
**Auth:** No requerida

#### Response (200 OK)

```json
{
  "total_players": 450,
  "active_cards": 420,
  "verifications_today": 125,
  "clubs_registered": 15
}
```

---

### Torneos Públicos

#### Listar Torneos

**Endpoint:** `GET /public/tournaments`
**Auth:** No requerida
**Paginación:** 20 por página

##### Query Parameters

| Parámetro | Tipo | Descripción |
|-----------|------|-------------|
| `status` | string | Filtrar por estado (scheduled, in_progress, finished) |
| `type` | string | Filtrar por tipo (championship, league, friendly) |
| `category` | string | Filtrar por categoría (senior, junior, sub_17) |
| `gender` | string | Filtrar por género (male, female, mixed) |
| `page` | integer | Número de página (default: 1) |

##### Response (200 OK)

```json
{
  "success": true,
  "data": {
    "current_page": 1,
    "data": [
      {
        "id": 1,
        "name": "Campeonato Nacional 2024",
        "slug": "campeonato-nacional-2024",
        "description": "Torneo anual de voleibol",
        "type": "championship",
        "format": "groups",
        "category": "senior",
        "gender": "female",
        "status": "in_progress",
        "start_date": "2024-11-01",
        "end_date": "2024-12-31",
        "venue": "Estadio Nacional",
        "max_teams": 16,
        "total_teams": 16,
        "team_count": 16,
        "is_registration_open": false,
        "logo_url": "https://volleypass.test/storage/tournaments/logo.png"
      }
    ],
    "per_page": 20,
    "total": 5,
    "last_page": 1,
    "from": 1,
    "to": 5
  }
}
```

---

#### Obtener Torneo por ID

**Endpoint:** `GET /public/tournaments/{id}`
**Auth:** No requerida

##### Response (200 OK)

```json
{
  "success": true,
  "data": {
    "id": 1,
    "name": "Campeonato Nacional 2024",
    "slug": "campeonato-nacional-2024",
    "type": "championship",
    "status": "in_progress",
    "start_date": "2024-11-01",
    "end_date": "2024-12-31",
    "league": {
      "id": 1,
      "name": "Liga Nacional de Voleibol",
      "logo_url": "https://volleypass.test/storage/leagues/logo.png"
    },
    "teams": [
      {
        "id": 1,
        "name": "Águilas FC",
        "logo": "https://volleypass.test/storage/teams/logo1.png",
        "club": "Club Deportivo ABC"
      }
    ],
    "matches": [
      {
        "id": 1,
        "home_team": "Águilas FC",
        "away_team": "Tigres Unidos",
        "scheduled_at": "2024-12-27T10:00:00Z",
        "status": "scheduled",
        "home_score": null,
        "away_score": null,
        "venue": "Estadio Nacional"
      }
    ],
    "statistics": {
      "total_teams": 16,
      "total_matches": 120,
      "completed_matches": 85,
      "pending_matches": 35,
      "in_progress_matches": 0
    }
  }
}
```

---

#### Tabla de Posiciones del Torneo

**Endpoint:** `GET /public/tournaments/{id}/standings`
**Auth:** No requerida

##### Response (200 OK)

```json
{
  "success": true,
  "data": {
    "tournament": {
      "id": 1,
      "name": "Campeonato Nacional 2024"
    },
    "standings": [
      {
        "position": 1,
        "team_id": 1,
        "team_name": "Águilas FC",
        "team_logo": "https://volleypass.test/storage/teams/logo1.png",
        "matches_played": 10,
        "wins": 9,
        "losses": 1,
        "points": 27,
        "sets_for": 28,
        "sets_against": 5,
        "set_difference": 23,
        "points_for": 750,
        "points_against": 620
      }
    ],
    "updated_at": "2024-12-26T15:45:00Z"
  }
}
```

---

#### Tabla de Posiciones por Grupo

**Endpoint:** `GET /public/tournaments/{id}/groups/{groupId}/standings`
**Auth:** No requerida

##### Response (200 OK)

```json
{
  "success": true,
  "data": {
    "tournament": {
      "id": 1,
      "name": "Campeonato Nacional 2024"
    },
    "group": {
      "id": 1,
      "name": "Grupo A"
    },
    "standings": [
      {
        "position": 1,
        "team_id": 1,
        "team_name": "Águilas FC",
        "matches_played": 5,
        "wins": 5,
        "losses": 0,
        "points": 15
      }
    ]
  }
}
```

---

### Partidos Públicos

#### Listar Partidos Programados

**Endpoint:** `GET /public/matches/scheduled`
**Auth:** No requerida
**Paginación:** 20 por página

##### Query Parameters

| Parámetro | Tipo | Descripción |
|-----------|------|-------------|
| `tournament_id` | integer | Filtrar por torneo |
| `team_id` | integer | Filtrar por equipo |
| `date` | date (YYYY-MM-DD) | Filtrar por fecha |
| `page` | integer | Número de página |

##### Response (200 OK)

```json
{
  "success": true,
  "data": {
    "current_page": 1,
    "data": [
      {
        "id": 1,
        "tournament_id": 1,
        "tournament_name": "Campeonato Nacional 2024",
        "home_team": {
          "id": 1,
          "name": "Águilas FC",
          "logo": "https://volleypass.test/storage/teams/logo1.png"
        },
        "away_team": {
          "id": 2,
          "name": "Tigres Unidos",
          "logo": "https://volleypass.test/storage/teams/logo2.png"
        },
        "scheduled_at": "2024-12-27T10:00:00Z",
        "status": "scheduled",
        "venue": "Estadio Nacional",
        "round_number": 1,
        "match_number": 1
      }
    ],
    "per_page": 20,
    "total": 35,
    "last_page": 2
  }
}
```

---

#### Listar Partidos En Vivo

**Endpoint:** `GET /public/matches/live`
**Auth:** No requerida

##### Response (200 OK)

```json
{
  "success": true,
  "data": [
    {
      "id": 1,
      "tournament_id": 1,
      "tournament_name": "Campeonato Nacional 2024",
      "home_team": {
        "id": 1,
        "name": "Águilas FC",
        "logo": "https://volleypass.test/storage/teams/logo1.png"
      },
      "away_team": {
        "id": 2,
        "name": "Tigres Unidos",
        "logo": "https://volleypass.test/storage/teams/logo2.png"
      },
      "status": "in_progress",
      "home_score": 1,
      "away_score": 0,
      "current_set": 1,
      "sets": [
        {
          "set_number": 1,
          "home_score": 15,
          "away_score": 12,
          "status": "in_progress"
        }
      ],
      "live_stats": {
        "duration_minutes": 25,
        "sets_played": 1,
        "current_set_number": 1,
        "home_sets_won": 0,
        "away_sets_won": 0
      },
      "started_at": "2024-12-26T15:00:00Z"
    }
  ]
}
```

---

#### Listar Partidos Recientes (NUEVO)

**Endpoint:** `GET /public/matches/recent`
**Auth:** No requerida
**Descripción:** Retorna partidos finalizados ordenados por fecha de finalización (más recientes primero)

##### Query Parameters

| Parámetro | Tipo | Descripción |
|-----------|------|-------------|
| `tournament_id` | integer | Filtrar por torneo |
| `team_id` | integer | Filtrar por equipo |
| `limit` | integer | Límite de resultados (default: 20) |

##### Response (200 OK)

```json
{
  "success": true,
  "data": [
    {
      "id": 45,
      "tournament_id": 1,
      "tournament": {
        "id": 1,
        "name": "Torneo Nacional 2024",
        "type": "league"
      },
      "home_team": {
        "id": 3,
        "name": "Club Norte",
        "logo": "https://volleypass.test/storage/teams/logo3.png"
      },
      "away_team": {
        "id": 5,
        "name": "Club Sur",
        "logo": "https://volleypass.test/storage/teams/logo5.png"
      },
      "scheduled_at": "2024-12-26T15:00:00.000000Z",
      "started_at": "2024-12-26T15:05:00.000000Z",
      "finished_at": "2024-12-26T16:45:00.000000Z",
      "status": "finished",
      "home_score": 3,
      "away_score": 1,
      "venue": "Coliseo Norte",
      "round_number": 5,
      "group_name": "Grupo A",
      "winner": "home",
      "sets_breakdown": [
        {"set": 1, "home": 25, "away": 20},
        {"set": 2, "home": 22, "away": 25},
        {"set": 3, "home": 25, "away": 18},
        {"set": 4, "home": 25, "away": 22}
      ]
    }
  ]
}
```

---

#### Contenido Destacado (NUEVO)

**Endpoint:** `GET /public/matches/featured`
**Auth:** No requerida
**Descripción:** Retorna contenido destacado incluyendo próximo partido importante, torneos activos y partidos de hoy

##### Response (200 OK)

```json
{
  "success": true,
  "data": {
    "featured_match": {
      "id": 89,
      "home_team": {
        "id": 1,
        "name": "Club Norte",
        "logo": "https://volleypass.test/storage/teams/logo1.png"
      },
      "away_team": {
        "id": 2,
        "name": "Club Sur",
        "logo": "https://volleypass.test/storage/teams/logo2.png"
      },
      "tournament": {
        "id": 3,
        "name": "Final Nacional 2024",
        "type": "playoff",
        "category": "mayores",
        "gender": "femenino"
      },
      "scheduled_at": "2024-12-29T18:00:00.000000Z",
      "status": "scheduled",
      "match_type": "final"
    },
    "active_tournaments": [
      {
        "id": 3,
        "name": "Torneo Nacional 2024",
        "slug": "torneo-nacional-2024",
        "league_id": 1,
        "league": {
          "id": 1,
          "name": "Liga Nacional de Voleibol"
        },
        "category": "mayores",
        "gender": "femenino",
        "type": "league",
        "total_teams": 12
      }
    ],
    "top_matches_today": [
      {
        "id": 78,
        "home_team": {
          "id": 5,
          "name": "Club Este",
          "logo": "https://volleypass.test/storage/teams/logo5.png"
        },
        "away_team": {
          "id": 8,
          "name": "Club Oeste",
          "logo": "https://volleypass.test/storage/teams/logo8.png"
        },
        "tournament": {
          "id": 2,
          "name": "Copa Regional",
          "type": "cup"
        },
        "scheduled_at": "2024-12-28T15:00:00.000000Z",
        "status": "scheduled"
      }
    ]
  }
}
```

**Uso recomendado en la app móvil:**
- `featured_match`: Mostrar como banner principal en la pantalla de inicio
- `active_tournaments`: Mostrar como carrusel de torneos en curso
- `top_matches_today`: Mostrar como lista de partidos destacados del día

---

#### Obtener Detalles de Partido

**Endpoint:** `GET /public/matches/{id}`
**Auth:** No requerida

##### Response (200 OK)

```json
{
  "success": true,
  "data": {
    "id": 1,
    "tournament_id": 1,
    "tournament": {
      "id": 1,
      "name": "Campeonato Nacional 2024"
    },
    "home_team": {
      "id": 1,
      "name": "Águilas FC",
      "logo": "https://volleypass.test/storage/teams/logo1.png",
      "club": "Club Deportivo ABC"
    },
    "away_team": {
      "id": 2,
      "name": "Tigres Unidos",
      "logo": "https://volleypass.test/storage/teams/logo2.png",
      "club": "Club Deportivo XYZ"
    },
    "status": "finished",
    "home_score": 2,
    "away_score": 1,
    "scheduled_at": "2024-12-27T10:00:00Z",
    "started_at": "2024-12-27T10:05:00Z",
    "finished_at": "2024-12-27T11:25:00Z",
    "venue": "Estadio Nacional",
    "sets": [
      {
        "set_number": 1,
        "home_score": 25,
        "away_score": 22,
        "status": "finished",
        "duration_minutes": 28
      },
      {
        "set_number": 2,
        "home_score": 20,
        "away_score": 25,
        "status": "finished",
        "duration_minutes": 25
      },
      {
        "set_number": 3,
        "home_score": 25,
        "away_score": 18,
        "status": "finished",
        "duration_minutes": 27
      }
    ],
    "statistics": {
      "duration_minutes": 80,
      "sets_played": 3,
      "home_sets_won": 2,
      "away_sets_won": 1,
      "total_events": 145,
      "points_by_set": [
        {"set": 1, "home": 25, "away": 22},
        {"set": 2, "home": 20, "away": 25},
        {"set": 3, "home": 25, "away": 18}
      ]
    }
  }
}
```

---

#### Obtener Jugadores de un Partido

**Endpoint:** `GET /public/matches/{id}/players`
**Auth:** No requerida

##### Response (200 OK)

```json
{
  "success": true,
  "data": {
    "match_id": 1,
    "home_team": {
      "id": 1,
      "name": "Águilas FC",
      "players": [
        {
          "id": 1,
          "name": "Juan Pérez",
          "position": "Setter",
          "jersey_number": 1,
          "is_on_court": true,
          "is_captain": true,
          "photo_url": "https://volleypass.test/storage/players/photo1.jpg"
        },
        {
          "id": 2,
          "name": "María González",
          "position": "Libero",
          "jersey_number": 5,
          "is_on_court": true,
          "is_captain": false,
          "photo_url": "https://volleypass.test/storage/players/photo2.jpg"
        }
      ]
    },
    "away_team": {
      "id": 2,
      "name": "Tigres Unidos",
      "players": [...]
    }
  }
}
```

---

#### Obtener Jugadores de un Equipo en Partido

**Endpoint:** `GET /public/matches/{id}/teams/{teamId}/players`
**Auth:** No requerida

##### Response (200 OK)

```json
{
  "success": true,
  "data": {
    "match_id": 1,
    "team_id": 1,
    "team_name": "Águilas FC",
    "players": [
      {
        "id": 1,
        "name": "Juan Pérez",
        "position": "Setter",
        "jersey_number": 1,
        "height": 1.85,
        "is_on_court": true,
        "is_captain": true
      }
    ]
  }
}
```

---

## 🔒 Endpoints Autenticados

### Gestión de Perfil de Usuario

#### Obtener Perfil Propio

**Endpoint:** `GET /users/profile`
**Auth:** Requerida

##### Response (200 OK)

```json
{
  "success": true,
  "data": {
    "id": 1,
    "name": "Juan Pérez",
    "email": "juan@example.com",
    "first_name": "Juan",
    "last_name": "Pérez",
    "phone": "+57 300 123 4567",
    "birth_date": "1990-05-15",
    "gender": "male",
    "address": "Calle 123 #45-67",
    "roles": ["Player"],
    "user_type": "player",
    "profile": {
      "nickname": "Juancho",
      "bio": "Jugador de voleibol desde 2010",
      "avatar_url": null,
      "emergency_contact_name": "María Pérez",
      "emergency_contact_phone": "+57 300 987 6543",
      "emergency_contact_relationship": "Hermana",
      "blood_type": "O+",
      "allergies": "Ninguna",
      "medical_conditions": "Ninguna",
      "t_shirt_size": "L",
      "social_media": {
        "instagram": "@juancho_volley",
        "facebook": "juan.perez",
        "twitter": "@juancho"
      }
    },
    "player_info": {
      "position": "Libero",
      "jersey_number": 10,
      "height": 1.75,
      "weight": 70.5,
      "current_club": "Club Deportivo ABC",
      "category": "Senior",
      "license_number": "VP2024001",
      "is_active": true
    },
    "location": {
      "city": "Bogotá",
      "department": "Cundinamarca",
      "country": "Colombia"
    }
  }
}
```

---

#### Actualizar Perfil Propio

**Endpoint:** `PUT /users/profile`
**Auth:** Requerida

##### Request

```json
{
  "first_name": "Juan Carlos",
  "last_name": "Pérez García",
  "phone": "+57 301 234 5678",
  "address": "Calle 456 #78-90",
  "nickname": "JC",
  "bio": "Jugador profesional de voleibol",
  "emergency_contact_name": "María Pérez",
  "emergency_contact_phone": "+57 300 987 6543",
  "emergency_contact_relationship": "Hermana",
  "blood_type": "O+",
  "allergies": "Polen",
  "medical_conditions": "Ninguna",
  "t_shirt_size": "XL",
  "social_media": {
    "instagram": "@jc_volley",
    "facebook": "juancarlos.perez"
  }
}
```

##### Validación

- `first_name`: opcional, string, max 100 caracteres
- `last_name`: opcional, string, max 100 caracteres
- `phone`: opcional, string, max 20 caracteres
- `address`: opcional, string, max 255 caracteres
- `nickname`: opcional, string, max 50 caracteres
- `bio`: opcional, string, max 500 caracteres
- `emergency_contact_name`: opcional, string, max 100 caracteres
- `emergency_contact_phone`: opcional, string, max 20 caracteres
- `emergency_contact_relationship`: opcional, string, max 50 caracteres
- `blood_type`: opcional, enum (A+, A-, B+, B-, AB+, AB-, O+, O-)
- `allergies`: opcional, string, max 500 caracteres
- `medical_conditions`: opcional, string, max 500 caracteres
- `t_shirt_size`: opcional, enum (XS, S, M, L, XL, XXL)
- `social_media`: opcional, objeto

##### Response (200 OK)

```json
{
  "success": true,
  "message": "Perfil actualizado exitosamente",
  "data": {
    "id": 1,
    "name": "Juan Carlos Pérez García",
    ...
  }
}
```

---

#### Obtener Perfil Público de Usuario

**Endpoint:** `GET /users/{userId}/profile`
**Auth:** Requerida

##### Response (200 OK)

Retorna información pública limitada del usuario:

```json
{
  "success": true,
  "data": {
    "id": 1,
    "name": "Juan Pérez",
    "first_name": "Juan",
    "last_name": "Pérez",
    "user_type": "player",
    "profile": {
      "nickname": "Juancho",
      "bio": "Jugador de voleibol desde 2010",
      "avatar_url": null
    },
    "location": {
      "city": "Bogotá",
      "department": "Cundinamarca",
      "country": "Colombia"
    },
    "player_info": {
      "position": "Libero",
      "jersey_number": 10,
      "current_club": "Club Deportivo ABC"
    }
  }
}
```

**Nota:** Los datos sensibles como email, teléfono, contacto de emergencia NO se exponen.

---

## 🔍 Sistema de Verificación QR

### Verificación de Carnet por QR (Público)

**Endpoint:** `POST /verify-qr`
**Auth:** No requerida
**Uso:** Verificadores externos con `scanner_id` válido

#### Request

```json
{
  "qr_code": "a1b2c3d4e5f6789012345678901234567890123456789012345678901234abcd",
  "verification_token": "e5f6789012345678901234567890123456789012345678901234567890123456",
  "scanner_id": 5,
  "event_data": {
    "event_type": "match",
    "location": "Estadio Nacional",
    "match_id": 10
  },
  "location": {
    "latitude": 4.6097,
    "longitude": -74.0817
  },
  "device_info": {
    "model": "iPhone 15 Pro",
    "os": "iOS 17.2"
  },
  "notes": "Verificación pre-partido"
}
```

#### Validación

- `qr_code`: **requerido**, string, exactamente 64 caracteres hexadecimales (SHA-256)
- `verification_token`: opcional, string, 64 caracteres hexadecimales
- `scanner_id`: **requerido**, integer, debe existir en `users.id`
- `event_data.event_type`: opcional, enum (match, tournament, training)
- `event_data.location`: opcional, string, max 200 caracteres
- `event_data.match_id`: opcional, integer, debe existir en `match_verifications.id`
- `location.latitude`: opcional, número entre -90 y 90
- `location.longitude`: opcional, número entre -180 y 180
- `device_info`: opcional, objeto
- `notes`: opcional, string, max 500 caracteres

#### Response Exitoso (200 OK)

```json
{
  "status": "success",
  "message": "Carnet válido",
  "can_play": true,
  "response_time_ms": 150,
  "player_info": {
    "id": 1,
    "name": "Juan Pérez",
    "card_number": "VP2024001",
    "club": "Club Deportivo ABC",
    "position": "Libero",
    "category": "Senior",
    "photo_url": "https://volleypass.test/storage/players/photo1.jpg",
    "birth_date": "1990-05-15",
    "age": 34,
    "gender": "male",
    "blood_type": "O+",
    "emergency_contact": "+57 300 987 6543"
  },
  "verification_id": 1234,
  "verified_at": "2024-12-26T15:45:00Z"
}
```

#### Response con Advertencia (200 OK)

```json
{
  "status": "warning",
  "message": "Carnet válido pero el jugador tiene sanciones activas",
  "can_play": false,
  "response_time_ms": 145,
  "player_info": {
    "name": "Juan Pérez",
    "card_number": "VP2024001",
    "club": "Club Deportivo ABC"
  },
  "warnings": [
    {
      "type": "sanction",
      "message": "Jugador tiene sanción activa por mala conducta",
      "details": {
        "sanction_id": 10,
        "type": "suspension",
        "matches_remaining": 2
      }
    }
  ]
}
```

#### Response con Error (400 Bad Request)

```json
{
  "status": "invalid",
  "message": "Carnet suspendido",
  "can_play": false,
  "error_code": "CARD_SUSPENDED",
  "details": {
    "reason": "Falta de pago",
    "suspended_at": "2024-12-01T00:00:00Z"
  }
}
```

#### Códigos de Error

| Código | Descripción |
|--------|-------------|
| `CARD_NOT_FOUND` | QR code no encontrado en el sistema |
| `CARD_EXPIRED` | Carnet expirado |
| `CARD_SUSPENDED` | Carnet suspendido |
| `CARD_INACTIVE` | Carnet inactivo |
| `PLAYER_SANCTIONED` | Jugador tiene sanciones activas |
| `MEDICAL_EXPIRED` | Certificado médico expirado |
| `SYSTEM_ERROR` | Error interno del servidor |

---

### Obtener Información de QR (Sin Verificación)

**Endpoint:** `POST /qr-info`
**Auth:** No requerida
**Uso:** Solo consulta, no genera registro de verificación

#### Request

```json
{
  "qr_code": "a1b2c3d4e5f6789012345678901234567890123456789012345678901234abcd"
}
```

#### Response (200 OK)

```json
{
  "status": "success",
  "data": {
    "card_number": "VP2024001",
    "player_name": "Juan Pérez",
    "club_name": "Club Deportivo ABC",
    "position": "Libero",
    "status": "Activo",
    "photo_url": "https://volleypass.test/storage/players/photo1.jpg",
    "valid_until": "2024-12-31",
    "issued_date": "2024-01-01"
  }
}
```

---

### Verificación por Token de Carnet

**Endpoint:** `GET /card/verify/{token}`
**Auth:** No requerida

#### Ejemplo

```
GET /card/verify/abc123def456
```

#### Response (200 OK)

```json
{
  "valid": true,
  "message": "Carnet válido",
  "data": {
    "player_name": "Juan Pérez",
    "card_number": "VP2024001",
    "league": "Liga Nacional",
    "club": "Club ABC",
    "status": "active",
    "can_play": true,
    "expires_at": "2024-12-31",
    "photo_url": "https://volleypass.test/storage/players/photo1.jpg"
  },
  "verified_at": "2024-12-26T15:45:00Z"
}
```

---

### Verificación por Número de Carnet

**Endpoint:** `GET /card/number/{cardNumber}`
**Auth:** No requerida

#### Ejemplo

```
GET /card/number/VP2024001
```

#### Response

Misma estructura que `/card/verify/{token}`

---

### Detalles de Carnet (Autenticado)

**Endpoint:** `GET /card/details/{token}`
**Auth:** Requerida

#### Response (200 OK)

```json
{
  "valid": true,
  "card": {
    "card_id": 1,
    "card_number": "VP2024001",
    "player_id": 1,
    "player_name": "Juan Pérez",
    "status": "active",
    "issued_at": "2024-01-01T00:00:00Z",
    "expires_at": "2024-12-31T23:59:59Z",
    "qr_code_url": "https://volleypass.test/qr/VP2024001.png"
  },
  "verification_stats": {
    "total_scans": 25,
    "last_scan": "2024-12-26T15:45:00Z",
    "scans_this_month": 8,
    "unique_locations": 5
  }
}
```

---

### Estadísticas de Carnets

**Endpoint:** `GET /card/stats`
**Auth:** Requerida
**Query Params:** `days` (default: 30)

#### Ejemplo

```
GET /card/stats?days=7
```

#### Response (200 OK)

```json
{
  "verification_stats": {
    "total_verifications": 150,
    "successful_verifications": 148,
    "failed_verifications": 2,
    "average_response_time": 145
  },
  "period_days": 7,
  "date_from": "2024-12-19",
  "date_to": "2024-12-26",
  "generated_at": "2024-12-26T15:45:00Z"
}
```

---

### Verificación Batch (Múltiples QR)

**Endpoint:** `POST /verify-batch`
**Auth:** Requerida
**Roles:** Verifier, LeagueAdmin, SuperAdmin
**Límite:** Máximo 50 QR codes por request

#### Request

```json
{
  "qr_codes": [
    {
      "qr_code": "a1b2c3d4e5f6789012345678901234567890123456789012345678901234abcd",
      "verification_token": "e5f6789012345678901234567890123456789012345678901234567890123456"
    },
    {
      "qr_code": "b2c3d4e5f6789012345678901234567890123456789012345678901234abcdef",
      "verification_token": null
    }
  ],
  "scanner_id": 5,
  "event_data": {
    "event_type": "match",
    "location": "Estadio Nacional"
  }
}
```

#### Validación

- `qr_codes`: **requerido**, array, min 1, max 50 elementos
- `qr_codes.*.qr_code`: **requerido**, string, 64 caracteres hex
- `qr_codes.*.verification_token`: opcional, string, 64 caracteres hex
- `scanner_id`: **requerido**, integer
- `event_data`: opcional, objeto

#### Response (200 OK)

```json
{
  "status": "success",
  "summary": {
    "total": 50,
    "approved": 48,
    "rejected": 2,
    "warnings": 3
  },
  "results": [
    {
      "qr_code": "a1b2c3d4...",
      "status": "success",
      "message": "Carnet válido",
      "can_play": true,
      "player_info": {
        "name": "Juan Pérez",
        "card_number": "VP2024001"
      }
    },
    {
      "qr_code": "b2c3d4e5...",
      "status": "invalid",
      "message": "Carnet suspendido",
      "can_play": false,
      "error_code": "CARD_SUSPENDED"
    }
  ],
  "processing_time_ms": 450
}
```

---

### Dashboard de Verificación

**Endpoint:** `GET /stats/dashboard`
**Auth:** Requerida
**Roles:** Verifier, LeagueAdmin, SuperAdmin
**Query Params:** `days` (default: 30)

#### Response (200 OK)

```json
{
  "status": "success",
  "data": {
    "total_verifications": 1250,
    "successful_verifications": 1200,
    "failed_verifications": 50,
    "average_response_time": 142,
    "verifications_by_day": [
      {
        "date": "2024-12-26",
        "total": 125,
        "successful": 120,
        "failed": 5
      }
    ],
    "user_stats": {
      "total_scans": 350,
      "successful_scans": 340,
      "avg_response_time": 138,
      "rank": 3,
      "total_verifiers": 12
    },
    "top_verifiers": [
      {
        "id": 5,
        "name": "Carlos Martínez",
        "total_scans": 450,
        "avg_response_time": 135
      }
    ]
  }
}
```

---

## 📱 Mobile App - Verificación Avanzada

### Verificar QR (Mobile App)

**Endpoint:** `POST /mobile/verify`
**Auth:** Requerida
**Uso:** Para apps móviles con sesión activa

#### Request

```json
{
  "qr_code": "a1b2c3d4e5f6789012345678901234567890123456789012345678901234abcd",
  "match_session_id": 10,
  "device_info": "iPhone 15 Pro - iOS 17.2",
  "location": {
    "latitude": 4.6097,
    "longitude": -74.0817
  }
}
```

#### Validación

- `qr_code`: **requerido**, string, 64 caracteres hex
- `match_session_id`: opcional, integer, debe existir y pertenecer al usuario
- `device_info`: opcional, string
- `location`: opcional, objeto con lat/lng

#### Response (200 OK)

```json
{
  "success": true,
  "verification": {
    "id": 1,
    "result": "eligible",
    "restriction_reason": null,
    "verified_at": "2024-12-26T15:45:00Z",
    "session_id": 10
  },
  "player": {
    "id": 1,
    "card_number": "VP2024001",
    "full_name": "Juan Pérez",
    "photo_url": "https://volleypass.test/storage/players/photo1.jpg",
    "birth_date": "1990-05-15",
    "age": 34,
    "gender": "male",
    "position": "Libero",
    "category": "Senior",
    "club_name": "Club ABC",
    "is_active": true,
    "license_number": "VP2024001",
    "blood_type": "O+",
    "emergency_contact": "+57 300 987 6543"
  }
}
```

---

### Historial de Verificaciones

**Endpoint:** `GET /mobile/verifications`
**Auth:** Requerida
**Paginación:** 20 por página

#### Query Parameters

| Parámetro | Tipo | Descripción |
|-----------|------|-------------|
| `result` | string | Filtrar por resultado (eligible, restricted, not_eligible) |
| `date` | date (YYYY-MM-DD) | Filtrar por fecha |
| `match_session_id` | integer | Filtrar por sesión |
| `per_page` | integer | Items por página (max: 100) |
| `page` | integer | Número de página |

#### Response (200 OK)

```json
{
  "success": true,
  "verifications": [
    {
      "id": 1,
      "player_name": "Juan Pérez",
      "player_photo": "https://volleypass.test/storage/players/photo1.jpg",
      "card_number": "VP2024001",
      "result": "eligible",
      "restriction_reason": null,
      "verified_at": "2024-12-26T15:45:00Z",
      "is_offline": false,
      "match": {
        "id": 1,
        "home_team": "Águilas FC",
        "away_team": "Tigres Unidos",
        "scheduled_at": "2024-12-26T15:00:00Z"
      }
    },
    {
      "id": 2,
      "player_name": "María González",
      "player_photo": "https://volleypass.test/storage/players/photo2.jpg",
      "card_number": "VP2024002",
      "result": "restricted",
      "restriction_reason": "Jugador tiene sanción activa",
      "verified_at": "2024-12-26T15:50:00Z",
      "is_offline": false,
      "match": null
    }
  ],
  "pagination": {
    "total": 150,
    "per_page": 20,
    "current_page": 1,
    "last_page": 8,
    "from": 1,
    "to": 20
  }
}
```

---

### Sincronizar Verificaciones Offline

**Endpoint:** `POST /mobile/verifications/sync`
**Auth:** Requerida
**Uso:** Sincronizar verificaciones realizadas sin conexión

#### Request

```json
{
  "verifications": [
    {
      "qr_code": "a1b2c3d4e5f6789012345678901234567890123456789012345678901234abcd",
      "verified_at": "2024-12-26T15:30:00Z",
      "match_session_id": 10,
      "device_info": "iPhone 15 Pro"
    },
    {
      "qr_code": "b2c3d4e5f6789012345678901234567890123456789012345678901234abcdef",
      "verified_at": "2024-12-26T15:35:00Z",
      "match_session_id": 10,
      "device_info": "iPhone 15 Pro"
    }
  ]
}
```

#### Validación

- `verifications`: **requerido**, array, max 100 elementos
- `verifications.*.qr_code`: **requerido**, string, 64 caracteres hex
- `verifications.*.verified_at`: **requerido**, datetime ISO 8601
- `verifications.*.match_session_id`: opcional, integer
- `verifications.*.device_info`: opcional, string

#### Response (200 OK)

```json
{
  "success": true,
  "synced": 10,
  "failed": 2,
  "synced_ids": [1, 2, 3, 4, 5, 6, 7, 8, 9, 10],
  "errors": [
    {
      "qr_code": "invalid_qr_code",
      "error": "Invalid QR code format"
    },
    {
      "qr_code": "duplicate_qr_code",
      "error": "Verification already exists"
    }
  ],
  "processing_time_ms": 350
}
```

---

### Estadísticas de Verificaciones

**Endpoint:** `GET /mobile/verifications/stats`
**Auth:** Requerida

#### Response (200 OK)

```json
{
  "success": true,
  "stats": {
    "total_verifications": 150,
    "today_verifications": 25,
    "eligible_count": 140,
    "restricted_count": 5,
    "not_eligible_count": 5,
    "offline_count": 10,
    "last_verification": "2024-12-26T15:45:00Z",
    "avg_verifications_per_day": 21.4,
    "most_active_day": "2024-12-25"
  }
}
```

---

## 🎮 Sesiones de Partido (Match Sessions)

### Listar Sesiones

**Endpoint:** `GET /mobile/sessions`
**Auth:** Requerida
**Paginación:** 20 por página

#### Query Parameters

| Parámetro | Tipo | Descripción |
|-----------|------|-------------|
| `status` | string | Filtrar por estado (active, paused, completed) |
| `match_id` | integer | Filtrar por partido |
| `per_page` | integer | Items por página |
| `page` | integer | Número de página |

#### Response (200 OK)

```json
{
  "success": true,
  "sessions": [
    {
      "id": 1,
      "status": "active",
      "started_at": "2024-12-26T15:00:00Z",
      "completed_at": null,
      "paused_at": null,
      "total_verifications": 20,
      "home_team_verifications": 12,
      "away_team_verifications": 8,
      "match": {
        "id": 1,
        "home_team": "Águilas FC",
        "away_team": "Tigres Unidos",
        "tournament": "Torneo 2024",
        "scheduled_at": "2024-12-26T15:00:00Z",
        "venue": "Estadio Nacional"
      }
    }
  ],
  "pagination": {
    "total": 50,
    "per_page": 20,
    "current_page": 1,
    "last_page": 3
  }
}
```

---

### Crear Sesión de Partido

**Endpoint:** `POST /mobile/sessions`
**Auth:** Requerida
**Restricción:** Solo una sesión activa por usuario

#### Request

```json
{
  "match_id": 1,
  "notes": {
    "location": "Cancha Principal",
    "weather": "Soleado"
  }
}
```

#### Validación

- `match_id`: **requerido**, integer, debe existir en `volley_matches`
- `notes`: opcional, objeto JSON

#### Response (201 Created)

```json
{
  "success": true,
  "session": {
    "id": 1,
    "status": "active",
    "started_at": "2024-12-26T15:00:00Z",
    "total_verifications": 0,
    "match": {
      "id": 1,
      "home_team": "Águilas FC",
      "away_team": "Tigres Unidos",
      "tournament": "Torneo 2024",
      "scheduled_at": "2024-12-26T15:00:00Z"
    }
  }
}
```

#### Errores

**400 Bad Request** - Ya existe sesión activa
```json
{
  "success": false,
  "message": "Ya tienes una sesión activa. Complétala primero.",
  "active_session_id": 5
}
```

---

### Obtener Sesión Activa

**Endpoint:** `GET /mobile/sessions/active`
**Auth:** Requerida

#### Response (200 OK)

Si existe sesión activa:
```json
{
  "success": true,
  "session": {
    "id": 1,
    "status": "active",
    "started_at": "2024-12-26T15:00:00Z",
    "total_verifications": 20,
    "match": {...}
  }
}
```

Si NO existe sesión activa:
```json
{
  "success": true,
  "session": null
}
```

---

### Obtener Partidos Disponibles

**Endpoint:** `GET /mobile/sessions/available-matches`
**Auth:** Requerida
**Filtro:** Partidos entre 6 horas atrás y 24 horas adelante

#### Response (200 OK)

```json
{
  "success": true,
  "matches": [
    {
      "id": 1,
      "home_team": "Águilas FC",
      "away_team": "Tigres Unidos",
      "tournament": "Torneo 2024",
      "venue": "Estadio Nacional",
      "scheduled_at": "2024-12-26T15:00:00Z",
      "status": "scheduled"
    },
    {
      "id": 2,
      "home_team": "Leones SC",
      "away_team": "Panteras FC",
      "tournament": "Torneo 2024",
      "venue": "Coliseo Municipal",
      "scheduled_at": "2024-12-26T17:00:00Z",
      "status": "scheduled"
    }
  ]
}
```

---

### Obtener Detalles de Sesión

**Endpoint:** `GET /mobile/sessions/{session}`
**Auth:** Requerida
**Autorización:** Solo el creador puede ver la sesión

#### Response (200 OK)

```json
{
  "success": true,
  "session": {
    "id": 1,
    "status": "active",
    "started_at": "2024-12-26T15:00:00Z",
    "completed_at": null,
    "paused_at": null,
    "total_verifications": 20,
    "home_team_verifications": 12,
    "away_team_verifications": 8,
    "notes": {
      "location": "Cancha Principal"
    },
    "match": {
      "id": 1,
      "home_team": "Águilas FC",
      "away_team": "Tigres Unidos",
      "scheduled_at": "2024-12-26T15:00:00Z"
    },
    "verifications": [
      {
        "id": 1,
        "player_name": "Juan Pérez",
        "card_number": "VP2024001",
        "team": "Águilas FC",
        "result": "eligible",
        "verified_at": "2024-12-26T15:30:00Z"
      }
    ],
    "duration_minutes": 45
  }
}
```

---

### Actualizar Sesión (Pausar/Reanudar)

**Endpoint:** `PUT /mobile/sessions/{session}`
**Auth:** Requerida
**Autorización:** Solo el creador puede actualizar

#### Request

```json
{
  "action": "pause",
  "notes": {
    "reason": "Tiempo fuera"
  }
}
```

#### Validación

- `action`: **requerido**, enum (pause, resume)
- `notes`: opcional, objeto

#### Response (200 OK)

```json
{
  "success": true,
  "session": {
    "id": 1,
    "status": "paused",
    "paused_at": "2024-12-26T16:00:00Z",
    "total_verifications": 20
  }
}
```

---

### Completar Sesión

**Endpoint:** `POST /mobile/sessions/{session}/complete`
**Auth:** Requerida
**Autorización:** Solo el creador puede completar

#### Request

```json
{
  "notes": {
    "final_count": 20,
    "observations": "Sin incidentes"
  }
}
```

#### Response (200 OK)

```json
{
  "success": true,
  "session": {
    "id": 1,
    "status": "completed",
    "started_at": "2024-12-26T15:00:00Z",
    "completed_at": "2024-12-26T16:30:00Z",
    "total_verifications": 20,
    "home_team_verifications": 12,
    "away_team_verifications": 8,
    "duration_minutes": 90
  }
}
```

---

### Iniciar Sesión de Escaneo (Legacy)

**Endpoint:** `POST /scanner/start-session`
**Auth:** Requerida
**Roles:** Verifier, LeagueAdmin, SuperAdmin

#### Request

```json
{
  "event_name": "Partido Final - Torneo 2024",
  "event_type": "match",
  "location": "Estadio Nacional"
}
```

#### Validación

- `event_name`: **requerido**, string, max 200 caracteres
- `event_type`: **requerido**, enum (match, tournament, training)
- `location`: opcional, string, max 200 caracteres

#### Response (200 OK)

```json
{
  "session_id": 1,
  "message": "Sesión iniciada"
}
```

---

### Finalizar Sesión de Escaneo (Legacy)

**Endpoint:** `POST /scanner/end-session/{sessionId}`
**Auth:** Requerida
**Autorización:** Solo el creador

#### Response (200 OK)

```json
{
  "message": "Sesión finalizada",
  "duration_minutes": 45
}
```

---

## 🏐 Gestión de Partidos en Vivo

### Obtener Partidos en Vivo

**Endpoint:** `GET /matches/live`
**Auth:** No requerida

#### Response (200 OK)

```json
[
  {
    "id": 1,
    "home_team_id": 1,
    "away_team_id": 2,
    "home_score": 1,
    "away_score": 0,
    "current_set": 1,
    "status": "in_progress",
    "tournament_id": 1,
    "started_at": "2024-12-26T15:00:00Z"
  }
]
```

---

### Datos en Tiempo Real de Partido

**Endpoint:** `GET /matches/{matchId}/realtime`
**Auth:** No requerida

#### Response (200 OK)

```json
{
  "match_id": 1,
  "status": "in_progress",
  "current_set": 1,
  "home_score": 1,
  "away_score": 0,
  "sets": [
    {
      "set_number": 1,
      "home_score": 15,
      "away_score": 12,
      "status": "in_progress",
      "started_at": "2024-12-26T15:05:00Z"
    }
  ],
  "recent_events": [
    {
      "id": 1,
      "event_type": "point",
      "team": "home",
      "player": "Juan Pérez",
      "timestamp": "2024-12-26T15:25:00Z"
    }
  ],
  "last_updated": "2024-12-26T15:26:00Z"
}
```

---

### Iniciar Partido

**Endpoint:** `POST /matches/{id}/start`
**Auth:** Requerida
**Roles:** Referee, LeagueAdmin, SuperAdmin

#### Response (200 OK)

```json
{
  "success": true,
  "data": {
    "match": {
      "id": 1,
      "status": "in_progress",
      "started_at": "2024-12-26T15:00:00Z"
    },
    "first_set": {
      "set_number": 1,
      "status": "in_progress",
      "home_score": 0,
      "away_score": 0
    }
  },
  "message": "Partido iniciado exitosamente"
}
```

---

### Finalizar Partido

**Endpoint:** `POST /matches/{id}/finish`
**Auth:** Requerida
**Roles:** Referee, LeagueAdmin, SuperAdmin

#### Response (200 OK)

```json
{
  "success": true,
  "data": {
    "match": {
      "id": 1,
      "status": "finished",
      "home_score": 3,
      "away_score": 1,
      "finished_at": "2024-12-26T16:30:00Z"
    }
  },
  "message": "Partido finalizado exitosamente"
}
```

---

### Iniciar Nuevo Set

**Endpoint:** `POST /matches/{id}/sets/start`
**Auth:** Requerida
**Roles:** Referee, LeagueAdmin, SuperAdmin

#### Response (200 OK)

```json
{
  "success": true,
  "data": {
    "set": {
      "id": 2,
      "set_number": 2,
      "status": "in_progress",
      "home_score": 0,
      "away_score": 0,
      "started_at": "2024-12-26T15:35:00Z"
    }
  },
  "message": "Set iniciado exitosamente"
}
```

---

### Finalizar Set

**Endpoint:** `POST /matches/{id}/sets/finish`
**Auth:** Requerida
**Roles:** Referee, LeagueAdmin, SuperAdmin

#### Request

```json
{
  "home_score": 25,
  "away_score": 22
}
```

#### Validación

- `home_score`: **requerido**, integer, min 0
- `away_score`: **requerido**, integer, min 0

#### Response (200 OK)

```json
{
  "success": true,
  "data": {
    "set": {
      "id": 1,
      "set_number": 1,
      "status": "finished",
      "home_score": 25,
      "away_score": 22,
      "finished_at": "2024-12-26T15:32:00Z",
      "duration_minutes": 27
    }
  },
  "message": "Set finalizado exitosamente"
}
```

---

### Actualizar Marcador de Set

**Endpoint:** `POST /matches/{id}/score`
**Auth:** Requerida
**Roles:** Referee, LeagueAdmin, SuperAdmin

#### Request

```json
{
  "home_score": 15,
  "away_score": 12
}
```

#### Response (200 OK)

```json
{
  "success": true,
  "data": {
    "set": {
      "set_number": 1,
      "home_score": 15,
      "away_score": 12,
      "status": "in_progress"
    }
  }
}
```

---

### Actualizar Rotación

**Endpoint:** `POST /matches/{id}/rotation`
**Auth:** Requerida
**Roles:** Referee, LeagueAdmin, SuperAdmin

#### Request

```json
{
  "team": "home",
  "rotation": [1, 5, 8, 12, 15, 20]
}
```

#### Validación

- `team`: **requerido**, enum (home, away)
- `rotation`: **requerido**, array de 6 player IDs

#### Response (200 OK)

```json
{
  "success": true,
  "data": {
    "rotation": {
      "team": "home",
      "positions": [
        {"position": 1, "player_id": 1, "player_name": "Juan Pérez"},
        {"position": 2, "player_id": 5, "player_name": "Carlos Díaz"},
        {"position": 3, "player_id": 8, "player_name": "Luis Gómez"},
        {"position": 4, "player_id": 12, "player_name": "Pedro Sánchez"},
        {"position": 5, "player_id": 15, "player_name": "Miguel Torres"},
        {"position": 6, "player_id": 20, "player_name": "Jorge Ramírez"}
      ]
    }
  }
}
```

---

### Agregar Evento de Partido

**Endpoint:** `POST /matches/{id}/events`
**Auth:** Requerida
**Roles:** Referee, LeagueAdmin, SuperAdmin

#### Request

```json
{
  "event_type": "point",
  "event_subtype": "spike",
  "team_id": 1,
  "player_id": 5,
  "description": "Remate ganador",
  "is_successful": true,
  "points_awarded": 1,
  "coordinates_x": 2.5,
  "coordinates_y": 8.0
}
```

#### Validación

- `event_type`: **requerido**, string
- `event_subtype`: opcional, string
- `team_id`: **requerido**, integer, debe existir en `teams`
- `player_id`: opcional, integer, debe existir en `players`
- `description`: opcional, string, max 500 caracteres
- `is_successful`: opcional, boolean
- `points_awarded`: opcional, integer, min 0
- `coordinates_x`: opcional, número
- `coordinates_y`: opcional, número

#### Response (201 Created)

```json
{
  "success": true,
  "data": {
    "event": {
      "id": 1,
      "event_type": "point",
      "event_subtype": "spike",
      "team": "Águilas FC",
      "player": "Carlos Díaz",
      "created_at": "2024-12-26T15:25:00Z"
    }
  }
}
```

---

### Obtener Eventos de Partido

**Endpoint:** `GET /matches/{id}/events`
**Auth:** Requerida
**Roles:** Referee, LeagueAdmin, SuperAdmin

#### Query Parameters

| Parámetro | Tipo | Descripción |
|-----------|------|-------------|
| `set_number` | integer | Filtrar por set |
| `event_type` | string | Filtrar por tipo de evento |

#### Response (200 OK)

```json
{
  "success": true,
  "data": [
    {
      "id": 1,
      "event_type": "point",
      "event_subtype": "spike",
      "team": "Águilas FC",
      "player": "Carlos Díaz",
      "set_number": 1,
      "created_at": "2024-12-26T15:25:00Z"
    }
  ]
}
```

---

### Obtener Estado de Partido

**Endpoint:** `GET /matches/{id}/status`
**Auth:** No requerida

#### Response (200 OK)

```json
{
  "success": true,
  "data": {
    "match": {
      "id": 1,
      "status": "in_progress",
      "home_score": 1,
      "away_score": 0,
      "current_set": 1
    },
    "sets": [
      {
        "set_number": 1,
        "status": "in_progress",
        "home_score": 15,
        "away_score": 12
      }
    ],
    "current_rotations": {
      "home": [...],
      "away": [...]
    },
    "recent_events": [...]
  }
}
```

---

## 🔄 Control de Rotaciones

### Actualizar Rotación del Equipo

**Endpoint:** `POST /matches/{id}/rotation/update`
**Auth:** Requerida
**Roles:** Referee, LeagueAdmin, SuperAdmin

#### Request

```json
{
  "team_id": 1,
  "rotation_data": {
    "positions": [
      {"position": 1, "player_id": 1},
      {"position": 2, "player_id": 5},
      {"position": 3, "player_id": 8},
      {"position": 4, "player_id": 12},
      {"position": 5, "player_id": 15},
      {"position": 6, "player_id": 20}
    ]
  },
  "set_number": 1
}
```

#### Response (200 OK)

```json
{
  "success": true,
  "data": {
    "rotation": {
      "team_id": 1,
      "set_number": 1,
      "positions": [...]
    }
  }
}
```

---

### Rotar Posiciones

**Endpoint:** `POST /matches/{id}/rotation/rotate`
**Auth:** Requerida
**Roles:** Referee, LeagueAdmin, SuperAdmin

#### Request

```json
{
  "team_id": 1,
  "direction": "clockwise",
  "set_number": 1
}
```

#### Validación

- `team_id`: **requerido**, integer
- `direction`: **requerido**, enum (clockwise, counterclockwise)
- `set_number`: opcional, integer, min 1

#### Response (200 OK)

```json
{
  "success": true,
  "data": {
    "rotation": {
      "team_id": 1,
      "positions": [
        {"position": 1, "player_id": 20},
        {"position": 2, "player_id": 1},
        {"position": 3, "player_id": 5},
        {"position": 4, "player_id": 8},
        {"position": 5, "player_id": 12},
        {"position": 6, "player_id": 15}
      ]
    }
  }
}
```

---

### Obtener Rotación Actual

**Endpoint:** `GET /matches/{id}/rotation/current`
**Auth:** Requerida (opcional para público)

#### Query Parameters

| Parámetro | Tipo | Descripción |
|-----------|------|-------------|
| `team_id` | integer | Obtener rotación de equipo específico |
| `set_number` | integer | Obtener rotación de set específico |

#### Response (200 OK)

```json
{
  "success": true,
  "data": {
    "match_id": 1,
    "set_number": 1,
    "rotations": {
      "home": {
        "team_id": 1,
        "team_name": "Águilas FC",
        "positions": [
          {"position": 1, "player_id": 1, "player_name": "Juan Pérez"},
          {"position": 2, "player_id": 5, "player_name": "Carlos Díaz"},
          {"position": 3, "player_id": 8, "player_name": "Luis Gómez"},
          {"position": 4, "player_id": 12, "player_name": "Pedro Sánchez"},
          {"position": 5, "player_id": 15, "player_name": "Miguel Torres"},
          {"position": 6, "player_id": 20, "player_name": "Jorge Ramírez"}
        ]
      },
      "away": {
        "team_id": 2,
        "team_name": "Tigres Unidos",
        "positions": [...]
      }
    }
  }
}
```

---

### Obtener Historial de Rotaciones

**Endpoint:** `GET /matches/{id}/rotation/history`
**Auth:** Requerida

#### Query Parameters

| Parámetro | Tipo | Descripción |
|-----------|------|-------------|
| `team_id` | integer | Filtrar por equipo |
| `set_number` | integer | Filtrar por set |

#### Response (200 OK)

```json
{
  "success": true,
  "data": [
    {
      "id": 1,
      "team_id": 1,
      "set_number": 1,
      "rotation_number": 1,
      "positions": [...],
      "created_at": "2024-12-26T15:05:00Z"
    },
    {
      "id": 2,
      "team_id": 1,
      "set_number": 1,
      "rotation_number": 2,
      "positions": [...],
      "created_at": "2024-12-26T15:12:00Z"
    }
  ]
}
```

---

### Sustituir Jugador

**Endpoint:** `POST /matches/{id}/rotation/substitute`
**Auth:** Requerida
**Roles:** Referee, LeagueAdmin, SuperAdmin

#### Request

```json
{
  "team_id": 1,
  "player_out_id": 5,
  "player_in_id": 7,
  "position": "2",
  "set_number": 1
}
```

#### Validación

- `team_id`: **requerido**, integer
- `player_out_id`: **requerido**, integer, jugador que sale
- `player_in_id`: **requerido**, integer, jugador que entra
- `position`: **requerido**, string, posición en la rotación
- `set_number`: opcional, integer

#### Response (200 OK)

```json
{
  "success": true,
  "data": {
    "substitution": {
      "player_out": "Carlos Díaz",
      "player_in": "Roberto Ruiz",
      "position": "2",
      "timestamp": "2024-12-26T15:20:00Z"
    },
    "updated_rotation": {
      "positions": [...]
    }
  }
}
```

---

### Validar Rotación

**Endpoint:** `POST /matches/{id}/rotation/validate`
**Auth:** Requerida

#### Request

```json
{
  "team_id": 1,
  "rotation_data": {
    "positions": [
      {"position": 1, "player_id": 1},
      {"position": 2, "player_id": 5},
      {"position": 3, "player_id": 8},
      {"position": 4, "player_id": 12},
      {"position": 5, "player_id": 15},
      {"position": 6, "player_id": 20}
    ]
  }
}
```

#### Response (200 OK)

```json
{
  "success": true,
  "data": {
    "is_valid": true,
    "current_rotation": {
      "positions": [...]
    },
    "proposed_rotation": {
      "positions": [...]
    },
    "validation_message": "Datos de rotación válidos",
    "warnings": []
  }
}
```

#### Response (422 Unprocessable Entity)

```json
{
  "success": false,
  "data": {
    "is_valid": false,
    "validation_message": "Rotación inválida",
    "errors": [
      "Jugador con ID 5 no pertenece al equipo",
      "Posición duplicada: 3"
    ]
  }
}
```

---

### Obtener Posiciones Disponibles

**Endpoint:** `GET /matches/{id}/rotation/positions`
**Auth:** Requerida

#### Response (200 OK)

```json
{
  "success": true,
  "data": {
    "positions": [
      {"id": 1, "name": "Colocador", "zone": 1},
      {"id": 2, "name": "Opuesto", "zone": 2},
      {"id": 3, "name": "Central", "zone": 3},
      {"id": 4, "name": "Receptor", "zone": 4},
      {"id": 5, "name": "Central", "zone": 5},
      {"id": 6, "name": "Líbero", "zone": 6}
    ],
    "rotation_order": ["Zona 1", "Zona 2", "Zona 3", "Zona 4", "Zona 5", "Zona 6"],
    "current_rotations": {
      "home": {
        "team_id": 1,
        "positions": [...]
      },
      "away": {
        "team_id": 2,
        "positions": [...]
      }
    }
  }
}
```

---

## ⚠️ Sistema de Sanciones

### Listar Sanciones

**Endpoint:** `GET /sanctions`
**Auth:** Requerida
**Roles:** Referee, LeagueAdmin, SuperAdmin
**Paginación:** 20 por página

#### Query Parameters

| Parámetro | Tipo | Descripción |
|-----------|------|-------------|
| `player_id` | integer | Filtrar por jugador |
| `team_id` | integer | Filtrar por equipo |
| `tournament_id` | integer | Filtrar por torneo |
| `status` | string | Filtrar por estado (active, completed, appealed, overturned) |
| `include_inactive` | boolean | Incluir sanciones inactivas |
| `page` | integer | Número de página |

#### Response (200 OK)

```json
{
  "success": true,
  "data": {
    "current_page": 1,
    "data": [
      {
        "id": 1,
        "player_id": 1,
        "player": {
          "id": 1,
          "name": "Juan Pérez",
          "card_number": "VP2024001"
        },
        "team": {
          "id": 1,
          "name": "Águilas FC"
        },
        "type": "yellow_card",
        "severity": "minor",
        "reason": "Mala conducta",
        "description": "Reclamo airado al árbitro",
        "match_id": 1,
        "tournament_id": 1,
        "referee_id": 2,
        "referee": {
          "id": 2,
          "name": "Carlos Martínez"
        },
        "status": "active",
        "applied_at": "2024-12-26T15:45:00Z",
        "fine_amount": 0,
        "suspension_matches": 0
      }
    ],
    "per_page": 20,
    "total": 5,
    "last_page": 1
  }
}
```

---

### Crear Sanción

**Endpoint:** `POST /sanctions`
**Auth:** Requerida
**Roles:** Referee, LeagueAdmin, SuperAdmin

#### Request

```json
{
  "player_id": 1,
  "type": "yellow_card",
  "severity": "minor",
  "reason": "Mala conducta",
  "match_id": 1,
  "tournament_id": 1,
  "description": "Reclamo airado al árbitro durante el segundo set",
  "fine_amount": 0,
  "suspension_matches": 0,
  "suspension_days": 0
}
```

#### Validación

- `player_id`: **requerido**, integer, debe existir en `players`
- `type`: **requerido**, enum (yellow_card, red_card, suspension, fine, warning)
- `severity`: **requerido**, enum (minor, moderate, major, severe)
- `reason`: **requerido**, string, max 500 caracteres
- `match_id`: opcional, integer, debe existir en `volley_matches`
- `tournament_id`: opcional, integer, debe existir en `tournaments`
- `description`: opcional, string, max 1000 caracteres
- `fine_amount`: opcional, número, min 0
- `suspension_matches`: opcional, integer, min 0
- `suspension_days`: opcional, integer, min 0

#### Response (201 Created)

```json
{
  "success": true,
  "data": {
    "id": 1,
    "player": {
      "id": 1,
      "name": "Juan Pérez"
    },
    "type": "yellow_card",
    "severity": "minor",
    "reason": "Mala conducta",
    "status": "active",
    "applied_at": "2024-12-26T15:45:00Z"
  },
  "message": "Sanción aplicada exitosamente"
}
```

---

### Obtener Detalles de Sanción

**Endpoint:** `GET /sanctions/{id}`
**Auth:** Requerida
**Roles:** Referee, LeagueAdmin, SuperAdmin

#### Response (200 OK)

```json
{
  "success": true,
  "data": {
    "id": 1,
    "player": {
      "id": 1,
      "name": "Juan Pérez",
      "card_number": "VP2024001",
      "photo_url": "https://volleypass.test/storage/players/photo1.jpg"
    },
    "team": {
      "id": 1,
      "name": "Águilas FC"
    },
    "match": {
      "id": 1,
      "home_team": "Águilas FC",
      "away_team": "Tigres Unidos",
      "scheduled_at": "2024-12-26T15:00:00Z"
    },
    "tournament": {
      "id": 1,
      "name": "Campeonato Nacional 2024"
    },
    "type": "yellow_card",
    "severity": "minor",
    "reason": "Mala conducta",
    "description": "Reclamo airado al árbitro durante el segundo set",
    "status": "active",
    "applied_at": "2024-12-26T15:45:00Z",
    "referee": {
      "id": 2,
      "name": "Carlos Martínez"
    }
  }
}
```

---

### Revocar Sanción

**Endpoint:** `POST /sanctions/{id}/revoke`
**Auth:** Requerida
**Roles:** LeagueAdmin, SuperAdmin

#### Request

```json
{
  "reason": "Error en la aplicación de la sanción"
}
```

#### Validación

- `reason`: **requerido**, string, max 500 caracteres

#### Response (200 OK)

```json
{
  "success": true,
  "message": "Sanción revocada exitosamente",
  "data": {
    "id": 1,
    "status": "overturned",
    "revoked_at": "2024-12-26T16:00:00Z",
    "revoke_reason": "Error en la aplicación de la sanción"
  }
}
```

---

### Apelar Sanción

**Endpoint:** `POST /sanctions/{id}/appeal`
**Auth:** Requerida

#### Request

```json
{
  "reason": "La sanción fue injusta. El jugador no tuvo mala conducta."
}
```

#### Validación

- `reason`: **requerido**, string, max 1000 caracteres

#### Response (200 OK)

```json
{
  "success": true,
  "message": "Apelación registrada exitosamente",
  "data": {
    "id": 1,
    "status": "appealed",
    "appealed_at": "2024-12-26T17:00:00Z",
    "appeal_reason": "La sanción fue injusta. El jugador no tuvo mala conducta."
  }
}
```

---

### Obtener Sanciones Activas de Jugador

**Endpoint:** `GET /sanctions/player/{playerId}/active`
**Auth:** Requerida
**Roles:** Referee, LeagueAdmin, SuperAdmin

#### Response (200 OK)

```json
{
  "success": true,
  "data": {
    "player_id": 1,
    "player_name": "Juan Pérez",
    "is_eligible": false,
    "active_sanctions": [
      {
        "id": 1,
        "type": "suspension",
        "severity": "major",
        "reason": "Agresión física",
        "matches_remaining": 2,
        "applied_at": "2024-12-20T15:00:00Z"
      }
    ],
    "restrictions": [
      "No puede participar en los próximos 2 partidos",
      "Multa de $100.000 pendiente de pago"
    ]
  }
}
```

---

### Obtener Sanciones de un Partido

**Endpoint:** `GET /sanctions/match/{matchId}`
**Auth:** Requerida
**Roles:** Referee, LeagueAdmin, SuperAdmin

#### Response (200 OK)

```json
{
  "success": true,
  "data": [
    {
      "id": 1,
      "player": {
        "id": 1,
        "name": "Juan Pérez",
        "team": "Águilas FC"
      },
      "type": "yellow_card",
      "severity": "minor",
      "reason": "Mala conducta",
      "applied_at": "2024-12-26T15:45:00Z"
    },
    {
      "id": 2,
      "player": {
        "id": 5,
        "name": "Carlos Díaz",
        "team": "Águilas FC"
      },
      "type": "red_card",
      "severity": "major",
      "reason": "Agresión física",
      "applied_at": "2024-12-26T16:10:00Z"
    }
  ]
}
```

---

## 👥 Gestión de Categorías de Jugadores

### Obtener Información de Categoría de Jugador

**Endpoint:** `GET /players/{player}/category`
**Auth:** Requerida

#### Path Parameters

- `player`: ID del jugador

#### Response (200 OK)

```json
{
  "success": true,
  "player": {
    "id": 1,
    "name": "Juan Pérez",
    "age": 34,
    "gender": "male",
    "current_category": {
      "name": "Senior",
      "value": "senior",
      "color": "#1E40AF",
      "icon": "trophy",
      "age_range": "18-99"
    },
    "is_correct_category": true
  }
}
```

#### Explicación

Este endpoint retorna:
- **Categoría actual** del jugador con metadata visual (color, icono)
- **Edad del jugador** calculada automáticamente desde fecha de nacimiento
- **is_correct_category**: `true` si el jugador está en la categoría correcta según su edad, `false` si debería cambiar

---

### Actualizar Categoría de Jugador

**Endpoint:** `PUT /players/{player}/category`
**Auth:** Requerida
**Roles:** LeagueAdmin, SuperAdmin

#### Path Parameters

- `player`: ID del jugador

#### Request

```json
{
  "category": "sub_17",
  "reason": "Cambio por edad, cumplió 17 años"
}
```

#### Validación

- `category`: **requerido**, string, debe ser una categoría válida
  - Valores válidos: `senior`, `junior`, `sub_21`, `sub_19`, `sub_17`, `sub_15`, `sub_13`, `sub_11`
- `reason`: **requerido**, string, max 500 caracteres, justificación del cambio

#### Response (200 OK)

```json
{
  "success": true,
  "message": "Categoría actualizada exitosamente",
  "player": {
    "id": 1,
    "name": "Juan Pérez",
    "old_category": "senior",
    "new_category": "sub_17",
    "reason": "Cambio por edad, cumplió 17 años"
  }
}
```

#### Errores

**422 Validation Error** - Categoría inválida o datos faltantes
```json
{
  "success": false,
  "message": "Datos de validación incorrectos",
  "errors": {
    "category": ["La categoría seleccionada es inválida"],
    "reason": ["El campo reason es obligatorio"]
  }
}
```

**422 Same Category** - El jugador ya está en esa categoría
```json
{
  "success": false,
  "message": "El jugador ya está asignado a esta categoría"
}
```

**500 Internal Server Error** - Error al actualizar
```json
{
  "success": false,
  "message": "Error interno del servidor"
}
```

---

### Categorías Disponibles

| Categoría | Valor API | Rango de Edad |
|-----------|-----------|---------------|
| Senior | `senior` | 18+ años |
| Junior | `junior` | 17-20 años |
| Sub 21 | `sub_21` | Hasta 21 años |
| Sub 19 | `sub_19` | Hasta 19 años |
| Sub 17 | `sub_17` | Hasta 17 años |
| Sub 15 | `sub_15` | Hasta 15 años |
| Sub 13 | `sub_13` | Hasta 13 años |
| Sub 11 | `sub_11` | Hasta 11 años |

### Casos de Uso

#### 1. Verificar si un jugador necesita cambio de categoría

```javascript
const response = await fetch(`https://volleypass.test/api/v1/players/${playerId}/category`, {
  headers: {
    'Authorization': `Bearer ${token}`,
    'Accept': 'application/json'
  }
});

const { player } = await response.json();

if (!player.is_correct_category) {
  alert(`⚠️ ${player.name} debería estar en otra categoría según su edad`);
}
```

#### 2. Actualizar categoría de un jugador

```javascript
const response = await fetch(`https://volleypass.test/api/v1/players/${playerId}/category`, {
  method: 'PUT',
  headers: {
    'Authorization': `Bearer ${token}`,
    'Content-Type': 'application/json',
    'Accept': 'application/json'
  },
  body: JSON.stringify({
    category: 'sub_17',
    reason: 'Cambio automático por edad cumplida'
  })
});

const result = await response.json();

if (result.success) {
  console.log(`✅ Categoría actualizada: ${result.player.old_category} → ${result.player.new_category}`);
}
```

#### 3. Auditoría de cambios

Cada cambio de categoría se registra automáticamente con:
- Usuario que realizó el cambio
- Fecha y hora del cambio
- Categoría anterior y nueva
- Razón del cambio

Esta información queda almacenada en los logs del sistema para auditoría.

---

## 📊 Reportes y Administración

### Reportes de Verificaciones

**Endpoint:** `GET /reports/verifications`
**Auth:** Requerida
**Roles:** LeagueAdmin, SuperAdmin
**Query Params:** `days` (default: 7)

#### Response (200 OK)

```json
{
  "data": [
    {
      "date": "2024-12-26",
      "total_verifications": 150,
      "successful": 145,
      "failed": 5,
      "avg_response_time": 142
    },
    {
      "date": "2024-12-25",
      "total_verifications": 120,
      "successful": 118,
      "failed": 2,
      "avg_response_time": 138
    }
  ]
}
```

---

### Resumen Diario

**Endpoint:** `GET /reports/daily-summary`
**Auth:** Requerida
**Roles:** LeagueAdmin, SuperAdmin

#### Response (200 OK)

```json
{
  "today": {
    "verifications": 125,
    "unique_players": 85,
    "active_verifiers": 12
  },
  "yesterday": {
    "verifications": 110,
    "unique_players": 78,
    "active_verifiers": 10
  }
}
```

---

### Eventos Activos

**Endpoint:** `GET /events/active`
**Auth:** Requerida
**Roles:** LeagueAdmin, SuperAdmin

#### Response (200 OK)

```json
{
  "events": [
    {
      "id": 1,
      "event_name": "Torneo Final",
      "event_type": "match",
      "venue": "Estadio Nacional",
      "event_date": "2024-12-26",
      "verifier": {
        "id": 1,
        "name": "Juan Pérez"
      },
      "status": "in_progress",
      "verification_started_at": "2024-12-26T15:00:00Z",
      "total_verifications": 20
    }
  ]
}
```

---

### Limpiar Cache del Sistema

**Endpoint:** `POST /system/cache/clear`
**Auth:** Requerida
**Roles:** SuperAdmin

#### Response (200 OK)

```json
{
  "message": "Cache limpiado"
}
```

---

### Obtener Información del Sistema

**Endpoint:** `GET /system/info`
**Auth:** Requerida
**Roles:** SuperAdmin

#### Response (200 OK)

```json
{
  "php_version": "8.4.14",
  "laravel_version": "12.24.0",
  "environment": "production",
  "debug": false,
  "timezone": "America/Bogota",
  "database": {
    "connection": "mysql",
    "users_count": 450,
    "players_count": 400,
    "clubs_count": 15
  }
}
```

---

## 📡 Broadcasting

### Autenticación para Broadcasting

**Endpoint:** `POST /broadcasting/auth`
**Auth:** Requerida (Sanctum)

#### Response

Retorna token de autenticación para Pusher/Socket.IO compatible con Laravel Broadcasting.

---

## 🔔 Webhooks

### Webhook: Cambio de Estado de Carnet

**Endpoint:** `POST /webhooks/card-status-changed`
**Auth:** No requerida (validar signature)

#### Payload

```json
{
  "event": "card.status.changed",
  "card_id": 1,
  "old_status": "active",
  "new_status": "suspended",
  "reason": "Falta de pago",
  "timestamp": "2024-12-26T15:45:00Z"
}
```

---

### Webhook: Alerta Médica

**Endpoint:** `POST /webhooks/medical-alert`
**Auth:** No requerida (validar signature)

#### Payload

```json
{
  "event": "medical.alert",
  "player_id": 1,
  "alert_type": "expired_certificate",
  "message": "Certificado médico expirado",
  "timestamp": "2024-12-26T15:45:00Z"
}
```

---

## ❌ Manejo de Errores

### Formato Estándar de Error

Todas las respuestas de error siguen este formato:

```json
{
  "success": false,
  "message": "Descripción del error",
  "error": "Detalles técnicos (opcional)",
  "errors": {
    "campo": ["Error 1", "Error 2"]
  }
}
```

### Códigos de Estado HTTP

| Código | Significado | Uso |
|--------|-------------|-----|
| 200 | OK | Operación exitosa |
| 201 | Created | Recurso creado |
| 400 | Bad Request | Request malformado |
| 401 | Unauthorized | No autenticado |
| 403 | Forbidden | Sin permisos |
| 404 | Not Found | Recurso no encontrado |
| 422 | Unprocessable Entity | Error de validación |
| 429 | Too Many Requests | Rate limit excedido |
| 500 | Internal Server Error | Error del servidor |

### Ejemplos de Errores

#### 401 Unauthorized

```json
{
  "error": "Unauthenticated"
}
```

#### 403 Forbidden

```json
{
  "error": "Sin permisos"
}
```

#### 404 Not Found

```json
{
  "success": false,
  "message": "Recurso no encontrado",
  "error": "No se encontró el carnet con ID 999"
}
```

#### 422 Validation Error

```json
{
  "message": "The given data was invalid.",
  "errors": {
    "email": [
      "El email es requerido",
      "El email debe ser válido"
    ],
    "password": [
      "La contraseña debe tener mínimo 8 caracteres"
    ]
  }
}
```

#### 429 Too Many Requests

```json
{
  "error": "Demasiados intentos de login. Intente en 300 segundos."
}
```

#### 500 Internal Server Error

```json
{
  "success": false,
  "message": "Error interno del servidor",
  "error": "Database connection failed"
}
```

---

## 📐 Formatos y Convenciones

### Headers Requeridos

```http
Accept: application/json
Content-Type: application/json
Authorization: Bearer {token}
X-App-Version: 1.0.0 (opcional)
```

### Formato de Fechas

Todas las fechas usan **ISO 8601**:

```
2024-12-26T15:45:00Z
```

### Paginación

Todos los endpoints paginados retornan:

```json
{
  "current_page": 1,
  "data": [...],
  "per_page": 20,
  "total": 150,
  "last_page": 8,
  "from": 1,
  "to": 20
}
```

### Enumeraciones (Enums)

#### EventType
- `match` - Partido
- `tournament` - Torneo
- `training` - Entrenamiento

#### MatchStatus
- `scheduled` - Programado
- `in_progress` - En progreso
- `finished` - Finalizado
- `cancelled` - Cancelado

#### SanctionType
- `yellow_card` - Tarjeta amarilla
- `red_card` - Tarjeta roja
- `suspension` - Suspensión
- `fine` - Multa
- `warning` - Advertencia

#### SanctionSeverity
- `minor` - Menor
- `moderate` - Moderado
- `major` - Mayor
- `severe` - Severo

#### VerificationResult
- `success` - Éxito
- `warning` - Advertencia
- `error` - Error
- `not_found` - No encontrado

#### PlayerPosition
- `Setter` - Colocador
- `Opposite` - Opuesto
- `Middle_Blocker` - Central
- `Outside_Hitter` - Punta receptor
- `Libero` - Líbero

#### PlayerCategory
- `Senior` - Senior
- `Junior` - Junior
- `Sub_17` - Sub 17
- `Sub_15` - Sub 15
- `Sub_13` - Sub 13

---

## 🚀 Guía de Implementación

### 1. Autenticación en la App Móvil

```javascript
// Login
const loginResponse = await fetch('https://volleypass.test/api/v1/auth/login', {
  method: 'POST',
  headers: {
    'Content-Type': 'application/json',
    'Accept': 'application/json'
  },
  body: JSON.stringify({
    email: 'verificador@volleypass.com',
    password: 'password123',
    device_name: 'iPhone 15 Pro'
  })
});

const { token, user } = await loginResponse.json();

// Guardar token en AsyncStorage/SecureStore
await AsyncStorage.setItem('auth_token', token);
await AsyncStorage.setItem('user', JSON.stringify(user));
```

### 2. Realizar Requests Autenticados

```javascript
// Obtener token almacenado
const token = await AsyncStorage.getItem('auth_token');

// Request autenticado
const response = await fetch('https://volleypass.test/api/v1/users/profile', {
  headers: {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
    'Authorization': `Bearer ${token}`
  }
});

const profile = await response.json();
```

### 3. Verificación QR

```javascript
// Escanear QR y verificar
const qrCode = scannedQRCode; // Desde scanner

const verifyResponse = await fetch('https://volleypass.test/api/v1/mobile/verify', {
  method: 'POST',
  headers: {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
    'Authorization': `Bearer ${token}`
  },
  body: JSON.stringify({
    qr_code: qrCode,
    match_session_id: currentSessionId,
    device_info: 'iPhone 15 Pro - iOS 17.2',
    location: {
      latitude: 4.6097,
      longitude: -74.0817
    }
  })
});

const { success, verification, player } = await verifyResponse.json();

if (success && verification.result === 'eligible') {
  // Jugador puede jugar
  console.log(`✅ ${player.full_name} - APTO`);
} else {
  // Jugador no puede jugar
  console.log(`❌ ${player.full_name} - NO APTO`);
}
```

### 4. Manejo de Errores

```javascript
const response = await fetch(url, options);

if (!response.ok) {
  const error = await response.json();

  switch (response.status) {
    case 401:
      // Token expirado, redirigir a login
      await AsyncStorage.removeItem('auth_token');
      navigation.navigate('Login');
      break;

    case 422:
      // Error de validación
      console.error('Validation errors:', error.errors);
      break;

    case 429:
      // Rate limit excedido
      Alert.alert('Demasiadas solicitudes', 'Intente nuevamente en unos minutos');
      break;

    default:
      Alert.alert('Error', error.message || 'Ha ocurrido un error');
  }
}
```

### 5. Sincronización Offline

```javascript
// Guardar verificación offline
const offlineVerifications = JSON.parse(
  await AsyncStorage.getItem('offline_verifications') || '[]'
);

offlineVerifications.push({
  qr_code: qrCode,
  verified_at: new Date().toISOString(),
  match_session_id: sessionId,
  device_info: deviceInfo
});

await AsyncStorage.setItem(
  'offline_verifications',
  JSON.stringify(offlineVerifications)
);

// Sincronizar cuando hay conexión
if (isOnline) {
  const syncResponse = await fetch('https://volleypass.test/api/v1/mobile/verifications/sync', {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json',
      'Authorization': `Bearer ${token}`
    },
    body: JSON.stringify({
      verifications: offlineVerifications
    })
  });

  const { synced, failed } = await syncResponse.json();

  console.log(`✅ Sincronizadas: ${synced}, ❌ Fallidas: ${failed}`);

  // Limpiar verificaciones sincronizadas
  await AsyncStorage.removeItem('offline_verifications');
}
```

### 6. WebSocket para Partidos en Vivo

```javascript
import Echo from 'laravel-echo';
import Pusher from 'pusher-js/react-native';

// Configurar Laravel Echo
const echo = new Echo({
  broadcaster: 'pusher',
  key: process.env.PUSHER_APP_KEY,
  cluster: process.env.PUSHER_APP_CLUSTER,
  forceTLS: true,
  authEndpoint: 'https://volleypass.test/api/v1/broadcasting/auth',
  auth: {
    headers: {
      Authorization: `Bearer ${token}`,
      Accept: 'application/json'
    }
  }
});

// Escuchar actualizaciones de partido
echo.channel(`match.${matchId}`)
  .listen('ScoreUpdated', (event) => {
    console.log('Nuevo marcador:', event.score);
    updateScore(event.score);
  })
  .listen('SetFinished', (event) => {
    console.log('Set finalizado:', event.set);
    showSetResult(event.set);
  });
```

---

## 📝 Notas Importantes

### Rate Limiting

- **Login:** 5 intentos por 5 minutos por IP
- **Verificación QR:** Sin límite (alto tráfico esperado)
- **API General:** 60 requests por minuto por usuario

### Seguridad

1. **Tokens:** Expiran en 30 días. Implementar refresh o re-login.
2. **QR Codes:** Deben ser SHA-256 (64 caracteres hex).
3. **HTTPS:** Todas las peticiones deben usar HTTPS en producción.
4. **Validación:** Siempre validar datos en cliente Y servidor.

### Performance

1. **Paginación:** Usar `per_page` para controlar tamaño de respuestas.
2. **Caching:** Implementar cache local para datos estáticos (torneos, equipos).
3. **Offline First:** Permitir operaciones sin conexión con sincronización posterior.

### Testing

```bash
# Base URL de prueba
https://volleypass.test/api/v1

# Usuario de prueba
Email: verificador@volleypass.com
Password: password
```

---

## 📞 Soporte

Para reportar bugs o solicitar nuevas funcionalidades, contactar al equipo de desarrollo.

---

**Fin de la Documentación API de VolleyPass**

*Generado: Diciembre 26, 2024*
*Versión: 1.0.0*
