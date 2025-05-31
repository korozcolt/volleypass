<?php

namespace App\Jobs;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Foundation\Bus\Dispatchable;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Queue\SerializesModels;
use Illuminate\Support\Facades\Log;
use App\Models\Player;
use App\Models\PlayerCard;
use App\Services\CardGenerationService;

class GenerateSeasonCards implements ShouldQueue
{
    use Dispatchable, InteractsWithQueue, Queueable, SerializesModels;

    public int $tries = 3;
    public int $timeout = 600; // 10 minutos

    public function __construct(
        private int $season,
        private bool $onlyEligible = true
    ) {}

    public function handle(CardGenerationService $cardService): void
    {
        Log::info('Iniciando generación de carnets para temporada', [
            'season' => $this->season
        ]);

        try {
            $query = Player::with(['user', 'currentClub', 'medicalCertificates'])
                ->where('status', 'active')
                ->whereHas('user', function($q) {
                    $q->where('status', 'active');
                });

            if ($this->onlyEligible) {
                $query->where('is_eligible', true);
            }

            $players = $query->get();
            $cardsGenerated = 0;
            $errors = 0;

            foreach ($players as $player) {
                try {
                    // Verificar si ya tiene carnet para esta temporada
                    $existingCard = PlayerCard::where('player_id', $player->id)
                        ->where('season', $this->season)
                        ->whereIn('status', ['active', 'pending_approval'])
                        ->first();

                    if ($existingCard) {
                        continue; // Ya tiene carnet
                    }

                    // Verificar elegibilidad médica
                    if (!$this->hasValidMedicalCertificate($player)) {
                        Log::warning('Jugadora sin certificado médico válido', [
                            'player_id' => $player->id,
                            'player_name' => $player->user->full_name
                        ]);
                        continue;
                    }

                    // Generar carnet
                    $card = $cardService->generateCardForPlayer($player, $this->season);
                    $cardsGenerated++;

                    Log::info('Carnet generado', [
                        'player_id' => $player->id,
                        'card_id' => $card->id,
                        'card_number' => $card->card_number
                    ]);

                } catch (\Exception $e) {
                    $errors++;
                    Log::error('Error generando carnet', [
                        'player_id' => $player->id,
                        'player_name' => $player->user->full_name,
                        'error' => $e->getMessage()
                    ]);
                }
            }

            Log::info('Generación de carnets completada', [
                'season' => $this->season,
                'total_players' => $players->count(),
                'cards_generated' => $cardsGenerated,
                'errors' => $errors
            ]);

        } catch (\Exception $e) {
            Log::error('Error en GenerateSeasonCards', [
                'season' => $this->season,
                'error' => $e->getMessage()
            ]);
            throw $e;
        }
    }

    private function hasValidMedicalCertificate(Player $player): bool
    {
        return $player->medicalCertificates()
            ->current()
            ->where('status', 'approved')
            ->where('expires_at', '>', now()->addMonths(3)) // Válido por al menos 3 meses
            ->exists();
    }
}
