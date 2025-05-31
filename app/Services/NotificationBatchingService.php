<?php

namespace App\Services;

use Illuminate\Support\Facades\Queue;
use Illuminate\Support\Facades\Cache;
use App\Jobs\SendBatchNotifications;

class NotificationBatchingService
{
    public function batchNotifications(string $type, array $recipients, array $data): void
    {
        $batches = array_chunk($recipients, 50); // 50 por batch

        foreach ($batches as $batch) {
            SendBatchNotifications::dispatch($type, $batch, $data)
                ->delay(now()->addSeconds(rand(1, 30))); // Delay aleatorio
        }
    }

    public function respectRateLimit(int $userId, string $channel): bool
    {
        $key = "notification_rate_limit_{$userId}_{$channel}";
        $hourlyLimit = config('notify.rate_limiting.per_user_per_hour', 10);

        $current = Cache::get($key, 0);

        if ($current >= $hourlyLimit) {
            return false;
        }

        Cache::put($key, $current + 1, 3600); // 1 hora
        return true;
    }
}
