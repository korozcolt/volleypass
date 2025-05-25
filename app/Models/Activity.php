<?php

namespace App\Models;

namespace App\Models;

use Spatie\Activitylog\Models\Activity as SpatieActivity;
use Illuminate\Database\Eloquent\Builder;
use App\Enums\LogLevel;
use Illuminate\Support\Facades\Auth;

class Activity extends SpatieActivity
{
    /**
     * Campos adicionales que podemos llenar
     */
    protected $fillable = [
        'log_name',
        'description',
        'subject_type',
        'subject_id',
        'causer_type',
        'causer_id',
        'properties',
        'event',
        'batch_uuid',
        'ip_address',
        'user_agent',
        'url',
        'method',
        'meta',
    ];

    /**
     * Casts para trabajar correctamente con UUIDs y JSON
     */
    protected $casts = [
        'properties' => 'collection',
        'meta' => 'array',
        'subject_id' => 'string', // UUID como string
        'causer_id' => 'string',  // UUID como string
        'created_at' => 'datetime',
        'updated_at' => 'datetime',
    ];

    /**
     * Boot del modelo para agregar información automática
     */
    protected static function boot()
    {
        parent::boot();

        static::creating(function ($activity) {
            // Agregar información de contexto automáticamente
            if (request()) {
                $activity->ip_address = $activity->ip_address ?? request()->ip();
                $activity->user_agent = $activity->user_agent ?? request()->userAgent();
                $activity->url = $activity->url ?? request()->fullUrl();
                $activity->method = $activity->method ?? request()->method();
            }
        });
    }

    // =======================
    // SCOPES ADICIONALES PARA VOLLEYPASS
    // =======================

    /**
     * Filtrar por evento específico
     */
    public function scopeForEvent(Builder $query, string $event): Builder
    {
        return $query->where('event', $event);
    }

    /**
     * Filtrar por lote UUID
     */
    public function scopeInBatch(Builder $query, string $batchUuid): Builder
    {
        return $query->where('batch_uuid', $batchUuid);
    }

    /**
     * Filtrar actividades recientes
     */
    public function scopeRecent(Builder $query, int $days = 7): Builder
    {
        return $query->where('created_at', '>=', now()->subDays($days));
    }

    /**
     * Filtrar por tipo de modelo
     */
    public function scopeForModel(Builder $query, string $modelType): Builder
    {
        return $query->where('subject_type', $modelType);
    }

    /**
     * Filtrar por usuario que causó la acción
     */
    public function scopeByCauser(Builder $query, $user): Builder
    {
        return $query->where('causer_type', get_class($user))
            ->where('causer_id', $user->getKey());
    }

    // =======================
    // ACCESSORS ÚTILES
    // =======================

    /**
     * Obtener el nombre del usuario que causó la acción
     */
    public function getCauserNameAttribute(): ?string
    {
        return $this->causer?->name ?? $this->causer?->full_name ?? 'Sistema';
    }

    /**
     * Obtener descripción del modelo afectado
     */
    public function getSubjectDescriptionAttribute(): ?string
    {
        if (!$this->subject) {
            return "Registro eliminado ({$this->subject_type})";
        }

        $modelName = class_basename($this->subject_type);
        $identifier = $this->subject->name ??
            $this->subject->title ??
            $this->subject->full_name ??
            $this->subject->id;

        return "{$modelName}: {$identifier}";
    }

    /**
     * Obtener fecha formateada para humanos
     */
    public function getTimeAgoAttribute(): string
    {
        return $this->created_at->diffForHumans();
    }

    /**
     * Verificar si es del día actual
     */
    public function isToday(): bool
    {
        return $this->created_at->isToday();
    }

    /**
     * Obtener actividades relacionadas del mismo lote
     */
    public function getBatchActivities()
    {
        if (!$this->batch_uuid) {
            return collect();
        }

        return self::inBatch($this->batch_uuid)
            ->where('id', '!=', $this->id)
            ->latest()
            ->get();
    }

    // =======================
    // MÉTODOS ESTÁTICOS ÚTILES
    // =======================

    /**
     * Crear un lote de actividades relacionadas
     */
    public static function startBatch(): string
    {
        return (string) \Illuminate\Support\Str::uuid();
    }

    /**
     * Registrar actividad con lote específico
     */
    public static function logInBatch(
        string $batchUuid,
        $subject,
        string $event,
        string $description,
        array $properties = []
    ): self {
        return self::create([
            'batch_uuid' => $batchUuid,
            'subject_type' => get_class($subject),
            'subject_id' => $subject->getKey(),
            'causer_type' => Auth::check() ? get_class(Auth::user()) : null,
            'causer_id' => Auth::id(),
            'event' => $event,
            'description' => $description,
            'properties' => $properties,
            'log_name' => 'default',
        ]);
    }
}
