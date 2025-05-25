<?php

namespace App\Enums;

use Filament\Support\Contracts\HasColor;
use Filament\Support\Contracts\HasLabel;
use Filament\Support\Contracts\HasIcon;

enum DocumentStatus: string implements HasLabel, HasColor, HasIcon {
    case Pending = 'pending';
    case Approved = 'approved';
    case Rejected = 'rejected';
    case Expired = 'expired';
    case Under_Review = 'under_review';

    public function getLabel(): ?string
    {
        return match ($this) {
            self::Pending => 'Pendiente',
            self::Approved => 'Aprobado',
            self::Rejected => 'Rechazado',
            self::Expired => 'Vencido',
            self::Under_Review => 'En Revisión',
        };
    }

    public function getColor(): string | array | null
    {
        return match ($this) {
            self::Pending => 'gray',
            self::Approved => 'success',
            self::Rejected => 'danger',
            self::Expired => 'warning',
            self::Under_Review => 'info',
        };
    }

    public function getIcon(): string | null
    {
        return match ($this) {
            self::Pending => 'heroicon-o-clock',
            self::Approved => 'heroicon-o-check-circle',
            self::Rejected => 'heroicon-o-x-circle',
            self::Expired => 'heroicon-o-exclamation-triangle',
            self::Under_Review => 'heroicon-o-eye',
        };
    }

    public function getColorHtml(): ?string
    {
        return match ($this) {
            self::Pending => 'bg-gray-100 text-gray-800',
            self::Approved => 'bg-green-100 text-green-800',
            self::Rejected => 'bg-red-100 text-red-800',
            self::Expired => 'bg-yellow-100 text-yellow-800',
            self::Under_Review => 'bg-blue-100 text-blue-800',
        };
    }

    public function getLabelHtml(): ?string
    {
        return '<span class="py-1 px-3 rounded-full text-xs font-medium '.$this->getColorHtml().'">'.$this->getLabel().'</span>';
    }
}

