<?php

namespace App\Jobs;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Foundation\Bus\Dispatchable;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Queue\SerializesModels;
use Illuminate\Support\Facades\Log;
use App\Models\QrScanLog;
use App\Models\PlayerCard;
use App\Models\Player;
use App\Models\MedicalCertificate;
use App\Services\ReportGenerationService;
use Carbon\Carbon;

class GenerateStatisticsReport implements ShouldQueue
{
    use Dispatchable, InteractsWithQueue, Queueable, SerializesModels;

    public int $tries = 2;
    public int $timeout = 600;

    public function __construct(
        private string $reportType = 'weekly', // daily, weekly, monthly
        private ?string $notifyEmail = null
    ) {}

    public function handle(ReportGenerationService $reportService): void
    {
        Log::info('Generando reporte estadístico', [
            'report_type' => $this->reportType
        ]);

        try {
            $period = $this->getReportPeriod();
            $statistics = $this->generateStatistics($period);

            // Generar reporte
            $report = $reportService->generateStatisticsReport($statistics, $this->reportType);

            // Enviar por email si se especifica
            if ($this->notifyEmail) {
                $reportService->sendReportByEmail($report, $this->notifyEmail);
            }

            // Guardar reporte en storage
            $reportService->saveReport($report, $this->reportType);

            Log::info('Reporte estadístico generado exitosamente', [
                'report_type' => $this->reportType,
                'period' => $period
            ]);

        } catch (\Exception $e) {
            Log::error('Error generando reporte estadístico', [
                'report_type' => $this->reportType,
                'error' => $e->getMessage()
            ]);
            throw $e;
        }
    }

    private function getReportPeriod(): array
    {
        return match($this->reportType) {
            'daily' => [
                'start' => now()->startOfDay(),
                'end' => now()->endOfDay()
            ],
            'weekly' => [
                'start' => now()->startOfWeek(),
                'end' => now()->endOfWeek()
            ],
            'monthly' => [
                'start' => now()->startOfMonth(),
                'end' => now()->endOfMonth()
            ],
            default => [
                'start' => now()->startOfWeek(),
                'end' => now()->endOfWeek()
            ]
        };
    }

    private function generateStatistics(array $period): array
    {
        return [
            'verification_stats' => $this->getVerificationStats($period),
            'card_stats' => $this->getCardStats(),
            'medical_stats' => $this->getMedicalStats(),
            'player_stats' => $this->getPlayerStats(),
            'top_locations' => $this->getTopVerificationLocations($period),
            'top_verifiers' => $this->getTopVerifiers($period),
        ];
    }

    private function getVerificationStats(array $period): array
    {
        $logs = QrScanLog::whereBetween('scanned_at', [$period['start'], $period['end']]);

        return [
            'total_verifications' => $logs->count(),
            'successful_verifications' => $logs->clone()->where('scan_result', 'success')->count(),
            'failed_verifications' => $logs->clone()->where('scan_result', 'error')->count(),
            'warnings' => $logs->clone()->where('scan_result', 'warning')->count(),
            'unique_players' => $logs->clone()->distinct('player_id')->count('player_id'),
            'unique_verifiers' => $logs->clone()->distinct('scanned_by')->count('scanned_by'),
            'avg_response_time' => $logs->clone()->whereNotNull('response_time_ms')->avg('response_time_ms'),
            'verifications_by_day' => $this->getVerificationsByDay($period),
        ];
    }

    private function getCardStats(): array
    {
        return [
            'total_active_cards' => PlayerCard::where('status', 'active')->count(),
            'expiring_soon' => PlayerCard::where('status', 'active')
                ->where('expires_at', '<=', now()->addDays(30))->count(),
            'expired_cards' => PlayerCard::where('status', 'expired')->count(),
            'suspended_cards' => PlayerCard::where('status', 'suspended')->count(),
            'cards_by_season' => PlayerCard::selectRaw('season, count(*) as count')
                ->groupBy('season')->pluck('count', 'season')->toArray(),
        ];
    }

    private function getMedicalStats(): array
    {
        return [
            'valid_certificates' => MedicalCertificate::current()->valid()->count(),
            'expiring_certificates' => MedicalCertificate::current()
                ->where('expires_at', '<=', now()->addDays(30))->count(),
            'expired_certificates' => MedicalCertificate::where('status', 'expired')->count(),
            'certificates_by_status' => MedicalCertificate::selectRaw('medical_status, count(*) as count')
                ->where('is_current', true)
                ->groupBy('medical_status')->pluck('count', 'medical_status')->toArray(),
        ];
    }

    private function getPlayerStats(): array
    {
        return [
            'total_active_players' => Player::active()->count(),
            'eligible_players' => Player::active()->where('is_eligible', true)->count(),
            'players_by_category' => Player::active()
                ->selectRaw('category, count(*) as count')
                ->groupBy('category')->pluck('count', 'category')->toArray(),
            'players_by_position' => Player::active()
                ->selectRaw('position, count(*) as count')
                ->groupBy('position')->pluck('count', 'position')->toArray(),
        ];
    }

    private function getTopVerificationLocations(array $period): array
    {
        return QrScanLog::whereBetween('scanned_at', [$period['start'], $period['end']])
            ->whereNotNull('scan_location')
            ->selectRaw('scan_location, count(*) as count')
            ->groupBy('scan_location')
            ->orderBy('count', 'desc')
            ->limit(10)
            ->pluck('count', 'scan_location')
            ->toArray();
    }

    private function getTopVerifiers(array $period): array
    {
        return QrScanLog::whereBetween('scanned_at', [$period['start'], $period['end']])
            ->with('scanner')
            ->selectRaw('scanned_by, count(*) as count')
            ->groupBy('scanned_by')
            ->orderBy('count', 'desc')
            ->limit(10)
            ->get()
            ->mapWithKeys(function($item) {
                return [$item->scanner->name => $item->count];
            })
            ->toArray();
    }

    private function getVerificationsByDay(array $period): array
    {
        return QrScanLog::whereBetween('scanned_at', [$period['start'], $period['end']])
            ->selectRaw('DATE(scanned_at) as date, count(*) as count')
            ->groupBy('date')
            ->orderBy('date')
            ->pluck('count', 'date')
            ->toArray();
    }
}
