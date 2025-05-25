<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\HasOne;
use Illuminate\Database\Eloquent\SoftDeletes;
use Spatie\Permission\Traits\HasRoles;
use Spatie\MediaLibrary\HasMedia;
use Spatie\MediaLibrary\InteractsWithMedia;
use Spatie\MediaLibrary\MediaCollections\Models\Media;
use Spatie\Activitylog\Traits\LogsActivity;
use Spatie\Activitylog\LogOptions;
use App\Traits\HasUuid;
use App\Traits\HasSearch;
use App\Traits\HasValidation;
use App\Enums\UserStatus;

class User extends Authenticatable implements HasMedia
{
    use HasFactory, Notifiable, SoftDeletes;
    use HasRoles, InteractsWithMedia, LogsActivity; // Spatie traits
    use HasSearch, HasValidation; // Nuestros traits personalizados (SIN HasUuid)

    protected $fillable = [
        'name',
        'email',
        'password',
        'document_type',
        'document_number',
        'first_name',
        'last_name',
        'birth_date',
        'gender',
        'phone',
        'phone_secondary',
        'address',
        'country_id',
        'department_id',
        'city_id',
        'status',
        'league_id',
        'club_id',
        'preferences',
    ];

    protected $hidden = [
        'password',
        'remember_token',
    ];

    protected function casts(): array
    {
        return [
            'email_verified_at' => 'datetime',
            'password' => 'hashed',
            'birth_date' => 'date',
            'status' => UserStatus::class,
            'preferences' => 'array',
            'last_login_at' => 'datetime',
            'created_at' => 'datetime',
            'updated_at' => 'datetime',
        ];
    }

    protected $searchable = ['name', 'email', 'first_name', 'last_name', 'document_number'];

    // =======================
    // SPATIE ACTIVITY LOG CONFIGURATION
    // =======================

    public function getActivitylogOptions(): LogOptions
    {
        return LogOptions::defaults()
            ->logOnly([
                'name', 'email', 'first_name', 'last_name',
                'document_number', 'status', 'league_id', 'club_id'
            ])
            ->logOnlyDirty()
            ->dontSubmitEmptyLogs()
            ->setDescriptionForEvent(fn(string $eventName) => match($eventName) {
                'created' => 'Usuario registrado en el sistema',
                'updated' => 'Información de usuario actualizada',
                'deleted' => 'Usuario eliminado del sistema',
                default => "Usuario {$eventName}"
            });
    }

    // =======================
    // SPATIE MEDIA LIBRARY CONFIGURATION
    // =======================

    public function registerMediaCollections(): void
    {
        $this->addMediaCollection('avatar')
            ->acceptsMimeTypes(['image/jpeg', 'image/png', 'image/webp'])
            ->singleFile();

        $this->addMediaCollection('documents')
            ->acceptsMimeTypes(['application/pdf', 'image/jpeg', 'image/png']);
    }

    public function registerMediaConversions(Media $media = null): void
    {
        $this->addMediaConversion('thumb')
            ->width(150)
            ->height(150)
            ->sharpen(10)
            ->performOnCollections('avatar');

        $this->addMediaConversion('profile')
            ->width(300)
            ->height(300)
            ->quality(90)
            ->performOnCollections('avatar');
    }

    // =======================
    // RELACIONES
    // =======================

    public function country(): BelongsTo
    {
        return $this->belongsTo(Country::class);
    }

    public function department(): BelongsTo
    {
        return $this->belongsTo(Department::class);
    }

    public function city(): BelongsTo
    {
        return $this->belongsTo(City::class);
    }

    public function league(): BelongsTo
    {
        return $this->belongsTo(League::class);
    }

    public function club(): BelongsTo
    {
        return $this->belongsTo(Club::class);
    }

    // Relación jugadora (si es jugadora)
    public function player(): HasOne
    {
        return $this->hasOne(Player::class);
    }

    // Relación entrenador (si es entrenador)
    public function coach(): HasOne
    {
        return $this->hasOne(Coach::class);
    }

    // Relación médico deportivo (si es médico)
    public function sportsDoctor(): HasOne
    {
        return $this->hasOne(SportsDoctor::class);
    }

    // =======================
    // ACCESSORS MEJORADOS CON SPATIE
    // =======================

    public function getFullNameAttribute(): string
    {
        return trim("{$this->first_name} {$this->last_name}") ?: $this->name;
    }

    public function getAgeAttribute(): ?int
    {
        return $this->birth_date ? $this->calculateAge($this->birth_date->format('Y-m-d')) : null;
    }

    public function getStatusBadgeAttribute(): string
    {
        return $this->status->getLabelHtml();
    }

    public function getAvatarUrlAttribute(): ?string
    {
        return $this->getFirstMediaUrl('avatar', 'profile');
    }

    public function getAvatarThumbAttribute(): ?string
    {
        return $this->getFirstMediaUrl('avatar', 'thumb');
    }

    // =======================
    // MÉTODOS DE ROLES ESPECÍFICOS
    // =======================

    public function isPlayer(): bool
    {
        return $this->hasRole('Player');
    }

    public function isCoach(): bool
    {
        return $this->hasRole('Coach');
    }

    public function isClubDirector(): bool
    {
        return $this->hasRole('ClubDirector');
    }

    public function isLeagueAdmin(): bool
    {
        return $this->hasRole('LeagueAdmin');
    }

    public function isSuperAdmin(): bool
    {
        return $this->hasRole('SuperAdmin');
    }

    public function canAccessClub($club): bool
    {
        if ($this->isSuperAdmin()) {
            return true;
        }

        if ($this->isLeagueAdmin() && $this->league_id === $club->league_id) {
            return true;
        }

        return $this->club_id === $club->id;
    }

    // =======================
    // SCOPES
    // =======================

    public function scopeActive($query)
    {
        return $query->where('status', UserStatus::Active);
    }

    public function scopeInLeague($query, $leagueId)
    {
        return $query->where('league_id', $leagueId);
    }

    public function scopeInClub($query, $clubId)
    {
        return $query->where('club_id', $clubId);
    }

    public function scopePlayers($query)
    {
        return $query->whereHas('roles', function ($q) {
            $q->where('name', 'Player');
        });
    }

    public function scopeCoaches($query)
    {
        return $query->whereHas('roles', function ($q) {
            $q->where('name', 'Coach');
        });
    }

    // =======================
    // MÉTODOS ADICIONALES
    // =======================

    public function updateLastLogin(): void
    {
        $this->update([
            'last_login_at' => now(),
            'last_login_ip' => request()->ip(),
        ]);
    }

    public function uploadAvatar($file): void
    {
        $this->addMediaFromRequest('avatar')
            ->toMediaCollection('avatar');
    }

    public function getPlayerProfile(): ?Player
    {
        return $this->player;
    }

    public function createPlayerProfile(array $data): Player
    {
        return $this->player()->create($data);
    }
}
