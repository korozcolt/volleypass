<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class NotificationPreference extends Model
{
    protected $fillable = [
        'user_id',
        'channel',
        'notification_type',
        'is_enabled',
        'schedule_time',
        'frequency',
        'metadata',
    ];

    protected $casts = [
        'is_enabled' => 'boolean',
        'schedule_time' => 'datetime',
        'metadata' => 'array',
    ];

    public function user(): BelongsTo
    {
        return $this->belongsTo(User::class);
    }

    public static function getPreferencesFor(User $user, string $type): array
    {
        return self::where('user_id', $user->id)
            ->where('notification_type', $type)
            ->where('is_enabled', true)
            ->pluck('channel')
            ->toArray();
    }
}
