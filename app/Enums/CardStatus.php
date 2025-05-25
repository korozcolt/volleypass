<?php

namespace App\Enums;

use Filament\Support\Contracts\HasColor;
use Filament\Support\Contracts\HasLabel;
use Filament\Support\Contracts\HasIcon;

enum CardStatus: string implements HasLabel, HasColor, HasIcon {
    case Active = 'active';
    case Expired = 'expired';
    case Pending = 'pending';
    case Suspended = 'suspended';
    case Medical_Restriction = 'medical_restriction';

    public function getLabel(): ?string
    {
        return match ($this) {
            self::Active => 'Activo',
            self::Expired => 'Vencido',
            self::Pending => 'Pendiente',
            self::Suspended => 'Suspendido',
            self::Medical_Restriction => 'Restricción Médica',
        };
    }

    public function getColor(): string | array | null
    {
        return match ($this) {
            self::Active => 'success',
            self::Expired => 'danger',
            self::Pending => 'warning',
            self::Suspended => 'danger',
            self::Medical_Restriction => 'warning',
        };
    }

    public function getIcon(): string | null
    {
        return match ($this) {
            self::Active => 'heroicon-o-check-badge',
            self::Expired => 'heroicon-o-x-circle',
            self::Pending => 'heroicon-o-clock',
            self::Suspended => 'heroicon-o-pause-circle',
            self::Medical_Restriction => 'heroicon-o-exclamation-triangle',
        };
    }

    public function getColorHtml(): ?string
    {
        return match ($this) {
            self::Active => 'bg-green-100 text-green-800',
            self::Expired => 'bg-red-100 text-red-800',
            self::Pending => 'bg-yellow-100 text-yellow-800',
            self::Suspended => 'bg-red-100 text-red-800',
            self::Medical_Restriction => 'bg-orange-100 text-orange-800',
        };
    }

    public function getLabelHtml(): ?string
    {
        return '<span class="py-1 px-3 rounded-full text-xs font-medium '.$this->getColorHtml().'">'.$this->getLabel().'</span>';
    }

    public function isPlayable(): bool
    {
        return match($this) {
            self::Active => true,
            self::Medical_Restriction => true, // Restricción parcial
            default => false,
        };
    }
}

