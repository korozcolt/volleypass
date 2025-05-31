<?php

namespace App\Jobs;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Foundation\Bus\Dispatchable;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Queue\SerializesModels;
use Illuminate\Support\Facades\Log;
use App\Models\MedicalCertificate;
use App\Notifications\MedicalCertificateExpiryNotification;

class ProcessMedicalCertificateExpiry implements ShouldQueue
{
    use Dispatchable, InteractsWithQueue, Queueable, SerializesModels;

    public int $tries = 3;
    public int $timeout = 300;

    public function __construct(
        private array $notificationDays = [30, 15, 7, 3, 1]
    ) {}

    public function handle(): void
    {
        Log::info('Iniciando procesamiento de certificados médicos por vencer');

        try {
            foreach ($this->notificationDays as $days) {
                $this->processExpiringCertificates($days);
            }

            // Marcar certificados vencidos
            $this->markExpiredCertificates();

        } catch (\Exception $e) {
            Log::error('Error en ProcessMedicalCertificateExpiry', [
                'error' => $e->getMessage()
            ]);
            throw $e;
        }
    }

    private function processExpiringCertificates(int $days): void
    {
        $certificates = MedicalCertificate::with(['player.user', 'player.currentClub'])
            ->where('status', 'approved')
            ->where('is_current', true)
            ->whereDate('expires_at', now()->addDays($days))
            ->where('expiry_notification_sent', false)
            ->get();

        foreach ($certificates as $certificate) {
            try {
                // Notificar a la jugadora
                $certificate->player->user->notify(
                    new MedicalCertificateExpiryNotification($certificate, $days)
                );

                // Notificar al director del club
                if ($certificate->player->currentClub?->director) {
                    $certificate->player->currentClub->director->notify(
                        new MedicalCertificateExpiryNotification($certificate, $days, 'director')
                    );
                }

                // Marcar como notificado
                $certificate->sendExpiryNotification();

                Log::info('Notificación médica enviada', [
                    'certificate_id' => $certificate->id,
                    'player_name' => $certificate->player->user->full_name,
                    'days_left' => $days
                ]);

            } catch (\Exception $e) {
                Log::error('Error enviando notificación médica', [
                    'certificate_id' => $certificate->id,
                    'error' => $e->getMessage()
                ]);
            }
        }
    }

    private function markExpiredCertificates(): void
    {
        $expiredCount = MedicalCertificate::where('status', 'approved')
            ->where('is_current', true)
            ->where('expires_at', '<', now())
            ->update([
                'status' => 'expired',
                'is_current' => false,
                'updated_at' => now()
            ]);

        if ($expiredCount > 0) {
            Log::info("Marcados {$expiredCount} certificados médicos como vencidos");
        }
    }
}
