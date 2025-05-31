<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use App\Models\User;
use App\Models\PlayerCard;
use Illuminate\Support\Facades\Mail;

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
            // Buscar carnet existente o crear uno de prueba
            $card = PlayerCard::where('player_id', $user->player?->id)
                ->first();

            if (!$card) {
                $this->error("Usuario no tiene carnet asociado");
                return 1;
            }

            // Enviar email de prueba
            Mail::send('emails.card-expiry', [
                'player_name' => $user->full_name,
                'card_number' => $card->card_number,
                'expires_at' => $card->expires_at->format('d/m/Y'),
                'days_left' => 7,
                'club_name' => $user->club?->name ?? 'Sin club',
            ], function($message) use ($user) {
                $message->to($user->email, $user->full_name)
                        ->subject('🏐 Prueba de notificación VolleyPass');
            });

            $this->info("Notificación de prueba enviada a {$user->email}");
            return 0;

        } catch (\Exception $e) {
            $this->error("Error: {$e->getMessage()}");
            return 1;
        }
    }
}
