<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use App\Models\User;
use App\Models\PlayerCard;
use App\Notifications\CardExpiryNotification;

class TestNotifications extends Command
{
    protected $signature = 'volleypass:test-notifications
                           {user_id : ID del usuario}';

    protected $description = 'Probar envío de notificaciones';

    public function handle(): int
    {
        $userId = $this->argument('user_id');
        $user = User::find($userId);

        if (!$user) {
            $this->error("Usuario {$userId} no encontrado");
            return 1;
        }

        try {
            // Crear un carnet de prueba si no existe
            $card = PlayerCard::factory()->create([
                'player_id' => $user->player?->id ?? 1,
                'expires_at' => now()->addDays(7),
            ]);

            $user->notify(new CardExpiryNotification($card, 7));
            $this->info("Notificación enviada a {$user->email}");

            return 0;

        } catch (\Exception $e) {
            $this->error("Error: {$e->getMessage()}");
            return 1;
        }
    }
}
