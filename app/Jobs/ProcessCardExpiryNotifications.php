<?php

namespace App\Jobs;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Foundation\Bus\Dispatchable;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Queue\SerializesModels;
use Illuminate\Support\Facades\Log;
use App\Models\PlayerCard;
use App\Models\User;
use App\Notifications\CardExpiryNotification;
use Carbon\Carbon;

class ProcessCardExpiryNotifications implements ShouldQueue
{
    use Dispatchable, InteractsWithQueue, Queueable, SerializesModels;

    public int $tries = 3;
    public int $timeout = 300; // 5 minutos

    public function __construct(
        private int $daysBeforeExpiry = 30
    ) {}

    public function handle(): void
    {
        Log::info('Iniciando procesamiento de notificaciones de vencimiento de carnets', [
            'days_before_expiry' => $this->daysBeforeExpiry
        ]);

        try {
            // Obtener carnets que vencen en X días
            $expiringCards = PlayerCard::with(['player.user', 'player.currentClub'])
                ->where('status', 'active')
                ->whereBetween('expires_at', [
                    now()->addDays($this->daysBeforeExpiry - 1),
                    now()->addDays($this->daysBeforeExpiry + 1)
                ])
                ->whereDoesntHave('notifications', function($query) {
                    $query->where('type', 'card_expiry')
                          ->where('created_at', '>=', now()->subDays(7)); // No notificar si ya se notificó en la semana
                })
                ->get();

            $notificationsSent = 0;
            $errors = 0;

            foreach ($expiringCards as $card) {
                try {
                    $this->sendExpiryNotification($card);
                    $notificationsSent++;
                } catch (\Exception $e) {
                    $errors++;
                    Log::error('Error enviando notificación de vencimiento', [
                        'card_id' => $card->id,
                        'player_name' => $card->player->user->full_name,
                        'error' => $e->getMessage()
                    ]);
                }
            }

            // Marcar carnets vencidos
            $this->markExpiredCards();

            Log::info('Procesamiento de notificaciones completado', [
                'cards_expiring' => $expiringCards->count(),
                'notifications_sent' => $notificationsSent,
                'errors' => $errors
            ]);

        } catch (\Exception $e) {
            Log::error('Error en ProcessCardExpiryNotifications', [
                'error' => $e->getMessage(),
                'trace' => $e->getTraceAsString()
            ]);
            throw $e;
        }
    }

    private function sendExpiryNotification(PlayerCard $card): void
    {
        $daysLeft = $card->expires_at->diffInDays(now());

        // Notificar a la jugadora
        $card->player->user->notify(new CardExpiryNotification($card, $daysLeft));

        // Notificar al director del club
        if ($card->player->currentClub && $card->player->currentClub->director) {
            $card->player->currentClub->director->notify(
                new CardExpiryNotification($card, $daysLeft, 'director')
            );
        }

        // Registrar la notificación
        $card->notifications()->create([
            'type' => 'card_expiry',
            'title' => 'Carnet próximo a vencer',
            'message' => "El carnet vence en {$daysLeft} días",
            'data' => [
                'days_left' => $daysLeft,
                'expires_at' => $card->expires_at->toISOString()
            ]
        ]);
    }

    private function markExpiredCards(): void
    {
        $expiredCount = PlayerCard::where('status', 'active')
            ->where('expires_at', '<', now())
            ->update([
                'status' => 'expired',
                'updated_at' => now()
            ]);

        if ($expiredCount > 0) {
            Log::info("Marcados {$expiredCount} carnets como vencidos");
        }
    }
}
