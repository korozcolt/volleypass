# Plan de Implementación: Dashboards Personalizados

## Objetivo
Implementar dashboards personalizados por rol con información relevante para cada tipo de usuario.

---

## FASE 1: Dashboard Básico (Con API Actual)

### Para TODOS los usuarios - Sección Deportiva

**Endpoints disponibles:**
- `GET /public/tournaments` - Torneos
- `GET /public/matches/live` - Partidos en vivo
- `GET /public/matches/scheduled` - Próximos partidos
- `GET /public/league-stats` - Estadísticas generales

**Componentes a crear:**
1. **LiveMatchesCarousel** - Carrusel de partidos en vivo con marcadores
2. **UpcomingMatchesWidget** - Lista de próximos partidos (hoy y mañana)
3. **TournamentsWidget** - Torneos activos/próximos
4. **LeagueStatsCard** - Card con estadísticas generales:
   - Total jugadores
   - Clubes registrados
   - Verificaciones hoy

**Layout:**
```
┌─────────────────────────────────────┐
│  PARTIDOS EN VIVO (si hay)          │
│  [Carrusel horizontal]              │
└─────────────────────────────────────┘
┌─────────────────────────────────────┐
│  PRÓXIMOS PARTIDOS                  │
│  [Lista vertical - max 3]           │
└─────────────────────────────────────┘
┌─────────────────────────────────────┐
│  TORNEOS ACTIVOS                    │
│  [Grid 2x2]                         │
└─────────────────────────────────────┘
┌─────────────────────────────────────┐
│  ESTADÍSTICAS GENERALES             │
│  [Card con números]                 │
└─────────────────────────────────────┘
```

---

### Para Verificadores

**Endpoint disponible:**
- `GET /stats/dashboard` - Dashboard de verificación

**Componentes adicionales:**
1. **VerificationStatsCard** - Mis verificaciones:
   - Total escaneadas
   - Exitosas/Fallidas
   - Tiempo promedio
   - Ranking
2. **TopVerifiersWidget** - Top 5 verificadores

**Layout:**
```
┌─────────────────────────────────────┐
│  MIS ESTADÍSTICAS                   │
│  [Card con números y ranking]       │
└─────────────────────────────────────┘
┌─────────────────────────────────────┐
│  PARTIDOS EN VIVO (común)           │
└─────────────────────────────────────┘
┌─────────────────────────────────────┐
│  TOP VERIFICADORES                  │
│  [Lista con avatares]               │
└─────────────────────────────────────┘
```

---

## FASE 2: Dashboards Completos (Requiere Nuevos Endpoints)

### Endpoints a implementar en Backend

#### 1. **GET /admin/dashboard**
**Para:** SuperAdmin
**Respuesta:**
```json
{
  "status": "success",
  "data": {
    "users": {
      "total_active": 450,
      "by_role": {
        "Referee": 25,
        "Coach": 80,
        "Player": 320,
        "ClubAdmin": 15,
        "Verifier": 10
      },
      "new_last_30_days": 45,
      "online_now": 23
    },
    "subscriptions": {
      "active": 15,
      "expired": 3,
      "expiring_soon": 2,
      "total_revenue_month": 15000,
      "pending_payments": 3
    },
    "system": {
      "total_verifications": 5420,
      "verifications_today": 125,
      "total_matches": 350,
      "matches_today": 5,
      "storage_used_mb": 2048,
      "api_calls_today": 15420
    },
    "clubs": {
      "total": 15,
      "active": 14,
      "with_pending_payments": 3
    }
  }
}
```

#### 2. **GET /club/dashboard**
**Para:** ClubAdmin, Coach
**Respuesta:**
```json
{
  "status": "success",
  "data": {
    "club": {
      "id": 1,
      "name": "Club ABC",
      "logo_url": "...",
      "total_players": 35,
      "active_players": 32,
      "federados": 28,
      "no_federados": 4
    },
    "payments": {
      "pending_count": 8,
      "pending_amount": 2400,
      "overdue_count": 3,
      "players_in_mora": [
        {
          "player_id": 1,
          "name": "Juan Pérez",
          "amount_due": 300,
          "days_overdue": 15
        }
      ]
    },
    "upcoming_matches": [
      {
        "id": 1,
        "date": "2024-12-27T10:00:00Z",
        "tournament": "Campeonato Nacional",
        "opponent": "Club XYZ",
        "venue": "Estadio A"
      }
    ],
    "stats": {
      "position_in_tournament": 3,
      "matches_played": 12,
      "wins": 8,
      "losses": 4,
      "sets_won": 26,
      "sets_lost": 18
    },
    "alerts": [
      {
        "type": "payment_overdue",
        "message": "3 jugadores con pagos vencidos",
        "severity": "high"
      }
    ]
  }
}
```

#### 3. **GET /league/dashboard**
**Para:** LeagueAdmin
**Respuesta:**
```json
{
  "status": "success",
  "data": {
    "clubs": {
      "total": 15,
      "by_category": {
        "senior": 8,
        "junior": 5,
        "sub_17": 2
      },
      "by_gender": {
        "male": 7,
        "female": 5,
        "mixed": 3
      }
    },
    "players": {
      "total": 450,
      "federados": 380,
      "no_federados": 70,
      "percentage_federados": 84.4,
      "by_club": [
        {
          "club_name": "Club ABC",
          "total": 35,
          "federados": 32,
          "no_federados": 3
        }
      ]
    },
    "tournaments": {
      "active": 3,
      "scheduled": 2,
      "finished_this_year": 8,
      "active_list": [
        {
          "id": 1,
          "name": "Campeonato Nacional 2024",
          "teams_count": 16,
          "matches_played": 45,
          "matches_remaining": 23
        }
      ]
    },
    "sanctions": {
      "active": 12,
      "by_type": {
        "yellow_card": 8,
        "red_card": 3,
        "suspension": 1
      }
    },
    "verifications": {
      "pending_sync": 5,
      "total_this_month": 1250,
      "failed_this_month": 45
    }
  }
}
```

#### 4. **GET /public/featured**
**Para:** Todos
**Respuesta:**
```json
{
  "status": "success",
  "data": {
    "featured_match": {
      "id": 1,
      "title": "Final del Campeonato Nacional",
      "home_team": "Águilas FC",
      "away_team": "Tigres Unidos",
      "scheduled_at": "2024-12-30T15:00:00Z",
      "venue": "Estadio Nacional",
      "is_live": false,
      "banner_url": "..."
    },
    "upcoming_big_events": [
      {
        "type": "tournament_start",
        "name": "Copa Regional 2025",
        "date": "2025-01-15",
        "description": "Inicia el torneo regional"
      }
    ]
  }
}
```

---

## Componentes a Crear (FASE 1)

### 1. Widgets Comunes (features/dashboard/presentation/widgets/)

#### `live_matches_carousel.dart`
```dart
class LiveMatchesCarousel extends ConsumerWidget {
  // Carrusel horizontal de partidos en vivo
  // Muestra: equipos, marcador, sets, tiempo transcurrido
  // Al tocar: navega a detalles del partido
}
```

#### `upcoming_matches_list.dart`
```dart
class UpcomingMatchesList extends ConsumerWidget {
  // Lista vertical de próximos partidos (max 3)
  // Muestra: equipos, fecha/hora, torneo
  // Al tocar: navega a detalles del partido
}
```

#### `tournaments_grid.dart`
```dart
class TournamentsGrid extends ConsumerWidget {
  // Grid 2x2 de torneos activos
  // Muestra: nombre, logo, equipos, fecha
  // Al tocar: navega a detalles del torneo
}
```

#### `league_stats_card.dart`
```dart
class LeagueStatsCard extends ConsumerWidget {
  // Card con estadísticas generales
  // 4 números principales en grid 2x2
}
```

#### `verification_stats_card.dart`
```dart
class VerificationStatsCard extends ConsumerWidget {
  // Card con estadísticas de verificación del usuario
  // Muestra: total, exitosas, tiempo promedio, ranking
}
```

---

### 2. Providers (features/dashboard/presentation/providers/)

```dart
// Dashboard data providers
final liveMatchesProvider = FutureProvider<List<Match>>((ref) async {
  // GET /public/matches/live
});

final upcomingMatchesProvider = FutureProvider<List<Match>>((ref) async {
  // GET /public/matches/scheduled?date=today
});

final tournamentsProvider = FutureProvider<List<Tournament>>((ref) async {
  // GET /public/tournaments?status=in_progress
});

final leagueStatsProvider = FutureProvider<LeagueStats>((ref) async {
  // GET /public/league-stats
});

final verificationStatsProvider = FutureProvider<VerificationStats>((ref) async {
  // GET /stats/dashboard (solo para verificadores)
});
```

---

### 3. Dashboard Personalizado por Rol

#### `dashboard_page.dart` (actualizar)
```dart
class DashboardPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(currentUserProvider);

    return Scaffold(
      appBar: AppBar(title: Text('VolleyPass')),
      drawer: AppDrawer(),
      body: RefreshIndicator(
        onRefresh: () => _refresh(ref),
        child: _buildDashboardForRole(user),
      ),
    );
  }

  Widget _buildDashboardForRole(User? user) {
    if (user == null) return LoadingWidget();

    // Sección común para todos
    final commonWidgets = [
      LiveMatchesCarousel(),
      UpcomingMatchesList(),
      TournamentsGrid(),
      LeagueStatsCard(),
    ];

    // Widgets específicos por rol
    if (PermissionsHelper.canVerifyQR(user)) {
      return ListView(
        children: [
          VerificationStatsCard(), // Primero sus stats
          ...commonWidgets,         // Luego lo común
        ],
      );
    }

    // Para otros roles, solo widgets comunes
    return ListView(children: commonWidgets);
  }
}
```

---

## Arquitectura de Carpetas

```
lib/features/dashboard/
├── data/
│   ├── datasources/
│   │   └── dashboard_remote_datasource.dart
│   ├── models/
│   │   ├── live_match_model.dart
│   │   ├── upcoming_match_model.dart
│   │   ├── tournament_model.dart
│   │   └── league_stats_model.dart
│   └── repositories/
│       └── dashboard_repository_impl.dart
├── domain/
│   ├── entities/
│   │   ├── live_match.dart
│   │   ├── upcoming_match.dart
│   │   ├── tournament.dart
│   │   └── league_stats.dart
│   ├── repositories/
│   │   └── dashboard_repository.dart
│   └── usecases/
│       ├── get_live_matches_usecase.dart
│       ├── get_upcoming_matches_usecase.dart
│       ├── get_tournaments_usecase.dart
│       └── get_league_stats_usecase.dart
└── presentation/
    ├── pages/
    │   └── dashboard_page.dart (actualizar)
    ├── providers/
    │   └── dashboard_providers.dart
    └── widgets/
        ├── live_matches_carousel.dart
        ├── upcoming_matches_list.dart
        ├── tournaments_grid.dart
        ├── league_stats_card.dart
        └── verification_stats_card.dart
```

---

## Estimación de Tiempo

### FASE 1 (Con API actual):
- **Entities y Models**: 1h
- **Repositories y DataSources**: 1.5h
- **Use Cases**: 1h
- **Providers**: 30min
- **Widgets comunes**: 3h
- **Actualizar DashboardPage**: 1h
- **Testing manual**: 1h

**Total FASE 1: ~9 horas**

### FASE 2 (Requiere backend):
- **Backend endpoints**: 8-12h (backend developer)
- **Integración mobile**: 4-6h
- **Dashboards específicos**: 6-8h
- **Testing**: 2h

**Total FASE 2: ~20-28 horas** (incluyendo backend)

---

## Próximos Pasos

1. ✅ **Revisar API** - Completado
2. ⏭️ **Decidir**: ¿Empezamos con FASE 1 (dashboard básico común)?
3. ⏭️ **Backend**: Coordinar implementación de endpoints faltantes para FASE 2
4. ⏭️ **Implementar**: Dashboard básico mientras backend trabaja en endpoints

---

## Notas

- FASE 1 se puede implementar **AHORA** sin cambios en backend
- FASE 2 requiere coordinación con backend developer
- Dashboards personalizados (FASE 2) son más valiosos pero requieren más tiempo
- Considerar implementar FASE 1 primero para tener algo funcional rápido
