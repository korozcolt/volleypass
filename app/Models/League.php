<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Database\Eloquent\SoftDeletes;
use Spatie\MediaLibrary\HasMedia;
use Spatie\MediaLibrary\InteractsWithMedia;
use Spatie\MediaLibrary\MediaCollections\Models\Media;
use Spatie\Activitylog\Traits\LogsActivity;
use Spatie\Activitylog\LogOptions;
use App\Traits\HasUuid;
use App\Traits\HasSearch;
use App\Enums\UserStatus;

class League extends Model implements HasMedia
{
    use SoftDeletes, InteractsWithMedia, LogsActivity;
    use HasSearch; // SIN HasUuid

    protected $fillable = [
        'name',
        'short_name',
        'description',
        'country_id',
        'department_id',
        'city_id',
        'status',
        'foundation_date',
        'website',
        'email',
        'phone',
        'address',
        'configurations',
        'is_active',
    ];

    protected $casts = [
        'foundation_date' => 'date',
        'configurations' => 'array',
        'is_active' => 'boolean',
        'status' => UserStatus::class,
        'created_at' => 'datetime',
        'updated_at' => 'datetime',
    ];

    protected $searchable = ['name', 'short_name', 'email'];

    // =======================
    // SPATIE CONFIGURATION
    // =======================

    public function getActivitylogOptions(): LogOptions
    {
        return LogOptions::defaults()
            ->logOnly(['name', 'status', 'is_active'])
            ->logOnlyDirty();
    }

    public function registerMediaCollections(): void
    {
        $this->addMediaCollection('logo')
            ->acceptsMimeTypes(['image/jpeg', 'image/png', 'image/svg+xml'])
            ->singleFile();

        $this->addMediaCollection('documents')
            ->acceptsMimeTypes(['application/pdf', 'image/jpeg', 'image/png']);
    }

    public function registerMediaConversions(Media $media = null): void
    {
        $this->addMediaConversion('thumb')
            ->width(150)
            ->height(150)
            ->performOnCollections('logo');
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

    public function clubs(): HasMany
    {
        return $this->hasMany(Club::class);
    }

    public function users(): HasMany
    {
        return $this->hasMany(User::class);
    }

    public function tournaments(): HasMany
    {
        return $this->hasMany(Tournament::class);
    }

    // =======================
    // ACCESSORS
    // =======================

    public function getLogoUrlAttribute(): ?string
    {
        return $this->getFirstMediaUrl('logo');
    }

    public function getActiveClubsCountAttribute(): int
    {
        return $this->clubs()->where('is_active', true)->count();
    }

    public function getActivePlayersCountAttribute(): int
    {
        return User::whereHas('club', function ($query) {
            $query->where('league_id', $this->id);
        })->whereHas('roles', function ($query) {
            $query->where('name', 'Player');
        })->count();
    }

    // =======================
    // SCOPES
    // =======================

    public function scopeActive($query)
    {
        return $query->where('is_active', true);
    }

    public function scopeInDepartment($query, $departmentId)
    {
        return $query->where('department_id', $departmentId);
    }

    // =======================
    // MÉTODOS
    // =======================

    public function getConfiguration(string $key, $default = null)
    {
        return data_get($this->configurations, $key, $default);
    }

    public function setConfiguration(string $key, $value): void
    {
        $configurations = $this->configurations ?? [];
        data_set($configurations, $key, $value);
        $this->update(['configurations' => $configurations]);
    }
}
