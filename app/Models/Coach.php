<?php

// ======================
// app/Models/Coach.php
// ======================

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\SoftDeletes;
use Spatie\Activitylog\Traits\LogsActivity;
use Spatie\Activitylog\LogOptions;
use App\Traits\HasSearch;

class Coach extends Model
{
    use SoftDeletes, LogsActivity, HasSearch;

    protected $fillable = [
        'user_id',
        'club_id',
        'license_number',
        'license_level',
        'specialization',
        'experience_years',
        'status',
        'notes',
    ];

    protected $casts = [
        'experience_years' => 'integer',
        'created_at' => 'datetime',
        'updated_at' => 'datetime',
    ];

    protected $searchable = ['user.name', 'license_number', 'specialization'];

    public function getActivitylogOptions(): LogOptions
    {
        return LogOptions::defaults()
            ->logOnly(['license_number', 'license_level', 'status'])
            ->logOnlyDirty();
    }

    public function user(): BelongsTo
    {
        return $this->belongsTo(User::class);
    }

    public function club(): BelongsTo
    {
        return $this->belongsTo(Club::class);
    }

    public function getFullNameAttribute(): string
    {
        return $this->user->full_name;
    }
}

// ======================
// app/Models/SportsDoctor.php
// ======================

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\SoftDeletes;
use Spatie\Activitylog\Traits\LogsActivity;
use Spatie\Activitylog\LogOptions;
use App\Traits\HasSearch;

class SportsDoctor extends Model
{
    use SoftDeletes, LogsActivity, HasSearch;

    protected $fillable = [
        'user_id',
        'medical_license',
        'specialization',
        'institution',
        'status',
        'notes',
    ];

    protected $casts = [
        'created_at' => 'datetime',
        'updated_at' => 'datetime',
    ];

    protected $searchable = ['user.name', 'medical_license', 'specialization'];

    public function getActivitylogOptions(): LogOptions
    {
        return LogOptions::defaults()
            ->logOnly(['medical_license', 'specialization', 'status'])
            ->logOnlyDirty();
    }

    public function user(): BelongsTo
    {
        return $this->belongsTo(User::class);
    }

    public function getFullNameAttribute(): string
    {
        return $this->user->full_name;
    }
}

// ======================
// app/Models/Team.php
// ======================

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Database\Eloquent\SoftDeletes;
use Spatie\Activitylog\Traits\LogsActivity;
use Spatie\Activitylog\LogOptions;
use App\Traits\HasSearch;
use App\Enums\PlayerCategory;
use App\Enums\Gender;

class Team extends Model
{
    use SoftDeletes, LogsActivity, HasSearch;

    protected $fillable = [
        'club_id',
        'name',
        'category',
        'gender',
        'coach_id',
        'status',
        'notes',
    ];

    protected $casts = [
        'category' => PlayerCategory::class,
        'gender' => Gender::class,
        'created_at' => 'datetime',
        'updated_at' => 'datetime',
    ];

    protected $searchable = ['name', 'club.name'];

    public function getActivitylogOptions(): LogOptions
    {
        return LogOptions::defaults()
            ->logOnly(['name', 'category', 'gender', 'status'])
            ->logOnlyDirty();
    }

    public function club(): BelongsTo
    {
        return $this->belongsTo(Club::class);
    }

    public function coach(): BelongsTo
    {
        return $this->belongsTo(Coach::class);
    }

    public function teamPlayers(): HasMany
    {
        return $this->hasMany(TeamPlayer::class);
    }

    public function players()
    {
        return $this->belongsToMany(Player::class, 'team_players');
    }
}

// ======================
// app/Models/TeamPlayer.php
// ======================

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class TeamPlayer extends Model
{
    protected $fillable = [
        'team_id',
        'player_id',
        'jersey_number',
        'position',
        'is_captain',
        'joined_at',
        'left_at',
    ];

    protected $casts = [
        'is_captain' => 'boolean',
        'joined_at' => 'date',
        'left_at' => 'date',
    ];

    public function team(): BelongsTo
    {
        return $this->belongsTo(Team::class);
    }

    public function player(): BelongsTo
    {
        return $this->belongsTo(Player::class);
    }
}
