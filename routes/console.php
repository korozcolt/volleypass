<?php

use Illuminate\Support\Facades\Schedule;
use App\Jobs\ProcessCardExpiryNotifications;
use App\Jobs\ProcessMedicalCertificateExpiry;
use App\Jobs\GenerateStatisticsReport;
use App\Jobs\CleanupOldLogs;
use Illuminate\Support\Facades\Cache;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Artisan;

// ==============================================
// COMMANDS CORREGIDOS
// ==============================================

Artisan::command('volleypass:send-expiry-notifications
                  {--days=30 : Días antes del vencimiento para notificar}
                  {--type=all : Tipo de notificación (cards, medical, all)}',
    function () {
        $days = (int) $this->option('days');
        $type = $this->option('type');

        $this->info("Enviando notificaciones de vencimiento ({$days} días)...");

        try {
            if ($type === 'cards' || $type === 'all') {
                $this->info('Procesando carnets...');
                ProcessCardExpiryNotifications::dispatch($days);
            }

            if ($type === 'medical' || $type === 'all') {
                $this->info('Procesando certificados médicos...');
                ProcessMedicalCertificateExpiry::dispatch();
            }

            $this->info('Jobs de notificación encolados exitosamente');
            return 0;

        } catch (\Exception $e) {
            $this->error('Error enviando notificaciones: ' . $e->getMessage());
            return 1;
        }
    })
    ->purpose('Enviar notificaciones de vencimiento de carnets y certificados médicos');

Artisan::command('volleypass:generate-season-cards
                  {season? : Año de la temporada}
                  {--all : Incluir jugadoras no elegibles}',
    function () {
        $season = $this->argument('season') ?? now()->year;
        $onlyEligible = !$this->option('all');

        if (!$this->confirm("¿Generar carnets para la temporada {$season}?")) {
            $this->info('Operación cancelada');
            return 0;
        }

        $this->info("Generando carnets para temporada {$season}...");

        try {
            \App\Jobs\GenerateSeasonCards::dispatch($season, $onlyEligible);

            $this->info('Job de generación de carnets encolado exitosamente');
            $this->info('Puedes seguir el progreso en los logs');
            return 0;

        } catch (\Exception $e) {
            $this->error('Error generando carnets: ' . $e->getMessage());
            return 1;
        }
    })
    ->purpose('Generar carnets para una nueva temporada');

Artisan::command('volleypass:cleanup-logs
                  {--qr-days=365 : Días a mantener logs QR}
                  {--activity-days=180 : Días a mantener activity logs}
                  {--force : No pedir confirmación}',
    function () {
        $qrDays = (int) $this->option('qr-days');
        $activityDays = (int) $this->option('activity-days');
        $force = $this->option('force');

        if (!$force) {
            $this->warn("Se eliminarán:");
            $this->line("- Logs QR anteriores a {$qrDays} días");
            $this->line("- Activity logs anteriores a {$activityDays} días");

            if (!$this->confirm('¿Continuar con la limpieza?')) {
                $this->info('Operación cancelada');
                return 0;
            }
        }

        $this->info('Iniciando limpieza de logs...');

        try {
            CleanupOldLogs::dispatch($qrDays, $activityDays);
            $this->info('Job de limpieza encolado exitosamente');
            return 0;

        } catch (\Exception $e) {
            $this->error('Error en limpieza: ' . $e->getMessage());
            return 1;
        }
    })
    ->purpose('Limpiar logs antiguos del sistema');

Artisan::command('volleypass:generate-report
                  {type=weekly : Tipo de reporte (daily, weekly, monthly)}
                  {--email= : Email para enviar el reporte}',
    function () {
        $type = $this->argument('type');
        $email = $this->option('email');

        $this->info("Generando reporte {$type}...");

        try {
            GenerateStatisticsReport::dispatch($type, $email);

            $message = "Reporte {$type} encolado exitosamente";
            if ($email) {
                $message .= " (se enviará a {$email})";
            }

            $this->info($message);
            return 0;

        } catch (\Exception $e) {
            $this->error('Error generando reporte: ' . $e->getMessage());
            return 1;
        }
    })
    ->purpose('Generar reportes estadísticos del sistema');

Artisan::command('volleypass:test-notifications
                  {user_id : ID del usuario}',
    function () {
        $userId = $this->argument('user_id');

        try {
            $exitCode = Artisan::call('volleypass:test-notifications', [
                'user_id' => $userId
            ]);

            if ($exitCode === 0) {
                $this->info('Notificación de prueba enviada exitosamente');
            } else {
                $this->error('Error enviando notificación de prueba');
            }

            return $exitCode;

        } catch (\Exception $e) {
            $this->error("Error: {$e->getMessage()}");
            return 1;
        }
    })
    ->purpose('Probar envío de notificaciones');

// ==============================================
// SCHEDULES CORREGIDOS
// ==============================================

// Notificaciones de vencimiento - todos los días a las 8:00 AM
Schedule::command('volleypass:send-expiry-notifications')
    ->dailyAt('08:00')
    ->withoutOverlapping()
    ->onOneServer()
    ->timezone('America/Bogota')
    ->onSuccess(function () {
        Log::info('Notificaciones de vencimiento procesadas exitosamente');
    })
    ->onFailure(function () {
        Log::error('Error procesando notificaciones de vencimiento');
    })
    ->name('daily-expiry-notifications');

// Verificar certificados médicos vencidos - diario a las 6:00 AM
Schedule::job(new ProcessMedicalCertificateExpiry())
    ->dailyAt('06:00')
    ->withoutOverlapping()
    ->onOneServer()
    ->timezone('America/Bogota')
    ->name('medical-certificate-expiry-check');

// Reporte semanal - lunes a las 9:00 AM
Schedule::job(new GenerateStatisticsReport('weekly'))
    ->weeklyOn(1, '09:00')
    ->withoutOverlapping()
    ->onOneServer()
    ->timezone('America/Bogota')
    ->name('weekly-statistics-report');

// Reporte mensual - primer día del mes a las 10:00 AM
Schedule::job(new GenerateStatisticsReport('monthly'))
    ->monthlyOn(1, '10:00')
    ->withoutOverlapping()
    ->onOneServer()
    ->timezone('America/Bogota')
    ->name('monthly-statistics-report');

// Limpieza de logs - primer domingo de cada mes a las 2:00 AM
Schedule::command('volleypass:cleanup-logs --force')
    ->monthlyOn(1, '02:00')
    ->when(function() {
        return now('America/Bogota')->dayOfWeek === 0; // Domingo
    })
    ->withoutOverlapping()
    ->onOneServer()
    ->timezone('America/Bogota')
    ->name('monthly-logs-cleanup');

// Verificación cada 5 minutos de carnets críticos por vencer (solo los que vencen en 3 días)
Schedule::job(new ProcessCardExpiryNotifications(3))
    ->everyFiveMinutes()
    ->between('08:00', '18:00') // Solo en horario laboral
    ->weekdays() // Solo días de semana
    ->withoutOverlapping()
    ->name('critical-card-expiry-check');

// Estadísticas diarias para dashboard - cada hora en horario laboral
Schedule::call(function () {
    try {
        $stats = [
            'active_cards' => \App\Models\PlayerCard::where('status', 'active')->count(),
            'verifications_today' => \App\Models\QrScanLog::whereDate('scanned_at', today())->count(),
            'expiring_cards' => \App\Models\PlayerCard::where('status', 'active')
                ->where('expires_at', '<=', now()->addDays(30))->count(),
            'generated_at' => now()->toISOString(),
        ];

        Cache::put('daily_stats', $stats, 3600); // Cache por 1 hora
        Log::info('Dashboard stats updated', $stats);

    } catch (\Exception $e) {
        Log::error('Error updating dashboard stats: ' . $e->getMessage());
    }
})
    ->hourly()
    ->between('07:00', '19:00')
    ->weekdays()
    ->name('update-dashboard-cache');
