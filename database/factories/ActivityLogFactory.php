<?php

namespace Database\Factories;

use App\Models\ActivityLog;
use App\Models\User;
use App\Enums\LogLevel;
use Illuminate\Database\Eloquent\Factories\Factory;

class ActivityLogFactory extends Factory
{
    protected $model = ActivityLog::class;

    public function definition(): array
    {
        return [
            'subject_type' => User::class,
            'subject_id' => User::factory(),
            'causer_type' => User::class,
            'causer_id' => User::factory(),
            'action' => $this->faker->randomElement(['created', 'updated', 'deleted', 'viewed']),
            'description' => $this->faker->sentence(),
            'properties' => [],
            'level' => $this->faker->randomElement(LogLevel::cases()),
            'ip_address' => $this->faker->ipv4(),
            'user_agent' => $this->faker->userAgent(),
            'url' => $this->faker->url(),
            'method' => $this->faker->randomElement(['GET', 'POST', 'PUT', 'DELETE']),
        ];
    }

    public function critical(): self
    {
        return $this->state(fn (array $attributes) => [
            'level' => LogLevel::Critical,
            'action' => 'error',
            'description' => 'Error crítico en el sistema',
        ]);
    }

    public function forUser(User $user): self
    {
        return $this->state(fn (array $attributes) => [
            'subject_type' => User::class,
            'subject_id' => $user->id,
        ]);
    }
}
