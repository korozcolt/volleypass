<?php

namespace App\Enums;

use Filament\Support\Contracts\HasColor;
use Filament\Support\Contracts\HasLabel;
use Filament\Support\Contracts\HasIcon;

enum NotificationType: string implements HasLabel, HasColor, HasIcon {
    case Document_Expiry = 'document_expiry';
    case Medical_Checkup = 'medical_checkup';
    case Tournament_Registration = 'tournament_registration';
    case Match_Reminder = 'match_reminder';
    case Card_Renewal = 'card_renewal';
    case Document_Approved = 'document_approved';

    public function getLabel(): ?string
    {
        return match ($this) {
            self::Document_Expiry => 'Vencimiento de Documento',
            self::Medical_Checkup => 'Chequeo Médico',
            self::Tournament_Registration => 'Inscripción a Torneo',
            self::Match_Reminder => 'Recordatorio de Partido',
            self::Card_Renewal => 'Renovación de Carnet',
            self::Document_Approved => 'Documento Aprobado',
        };
    }

    public function getColor(): string | array | null
    {
        return match ($this) {
            self::Document_Expiry => 'danger',
            self::Medical_Checkup => 'warning',
            self::Tournament_Registration => 'success',
            self::Match_Reminder => 'info',
            self::Card_Renewal => 'purple',
            self::Document_Approved => 'success',
        };
    }

    public function getIcon(): string | null
    {
        return match ($this) {
            self::Document_Expiry => 'heroicon-o-exclamation-triangle',
            self::Medical_Checkup => 'heroicon-o-heart',
            self::Tournament_Registration => 'heroicon-o-trophy',
            self::Match_Reminder => 'heroicon-o-bell-alert',
            self::Card_Renewal => 'heroicon-o-identification',
            self::Document_Approved => 'heroicon-o-check-circle',
        };
    }

    public function getColorHtml(): ?string
    {
        return match ($this) {
            self::Document_Expiry => 'bg-red-100 text-red-800',
            self::Medical_Checkup => 'bg-yellow-100 text-yellow-800',
            self::Tournament_Registration => 'bg-green-100 text-green-800',
            self::Match_Reminder => 'bg-blue-100 text-blue-800',
            self::Card_Renewal => 'bg-purple-100 text-purple-800',
            self::Document_Approved => 'bg-green-100 text-green-800',
        };
    }

    public function getLabelHtml(): ?string
    {
        return '<span class="py-1 px-3 rounded-full text-xs font-medium '.$this->getColorHtml().'">'.$this->getLabel().'</span>';
    }
}
