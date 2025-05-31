<?php

namespace App\Notifications;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Notifications\Messages\MailMessage;
use Illuminate\Notifications\Notification;
use Illuminate\Support\Facades\URL;
use App\Enums\NotificationType;
use App\Enums\Priority;

abstract class BaseVolleyPassNotification extends Notification implements ShouldQueue
{
    use Queueable;

    protected NotificationType $type;
    protected Priority $priority = Priority::Medium;
    protected array $data = [];
    protected string $recipientRole = 'player';

    public function __construct(array $data = [], string $recipientRole = 'player')
    {
        $this->data = $data;
        $this->recipientRole = $recipientRole;
        $this->queue = $this->getQueue();
    }

    /**
     * Canales de notificación según el tipo y destinatario
     */
    public function via($notifiable): array
    {
        $channels = ['mail']; // Siempre email por defecto

        // Agregar SMS para notificaciones urgentes
        if ($this->priority === Priority::Urgent) {
            $channels[] = 'sms';
        }

        // Agregar push para usuarios con app móvil
        if ($notifiable->hasAppInstalled()) {
            $channels[] = 'push';
        }

        // WhatsApp para Colombia (muy popular)
        if ($notifiable->prefersWhatsApp()) {
            $channels[] = 'whatsapp';
        }

        return $channels;
    }

    /**
     * Email notification
     */
    public function toMail($notifiable): MailMessage
    {
        $message = (new MailMessage)
            ->subject($this->getSubject())
            ->greeting($this->getGreeting($notifiable))
            ->line($this->getMainMessage())
            ->line($this->getDetailMessage());

        // Agregar acción si existe
        if ($this->hasAction()) {
            $message->action($this->getActionText(), $this->getActionUrl($notifiable));
        }

        // Agregar datos específicos
        if (!empty($this->getAdditionalData())) {
            foreach ($this->getAdditionalData() as $line) {
                $message->line($line);
            }
        }

        return $message
            ->line('¡Gracias por usar VolleyPass!')
            ->salutation('Saludos, El equipo de VolleyPass Sucre');
    }

    /**
     * SMS notification
     */
    public function toSms($notifiable): string
    {
        return sprintf(
            "[VolleyPass] %s. %s %s",
            $this->getMainMessage(),
            $this->hasAction() ? $this->getActionText() : '',
            $this->hasAction() ? $this->getActionUrl($notifiable) : ''
        );
    }

    /**
     * Push notification
     */
    public function toPush($notifiable): array
    {
        return [
            'title' => 'VolleyPass Sucre',
            'body' => $this->getMainMessage(),
            'icon' => asset('images/volleypass-icon.png'),
            'click_action' => $this->getActionUrl($notifiable),
            'data' => [
                'type' => $this->type->value,
                'priority' => $this->priority->value,
                'timestamp' => now()->toISOString(),
            ]
        ];
    }

    /**
     * WhatsApp notification
     */
    public function toWhatsApp($notifiable): array
    {
        return [
            'to' => $notifiable->whatsapp_number,
            'body' => sprintf(
                "🏐 *VolleyPass Sucre*\n\n%s\n\n%s\n\n_%s_",
                $this->getMainMessage(),
                $this->getDetailMessage(),
                'Mensaje automático - No responder'
            )
        ];
    }

    /**
     * Database storage for notification history
     */
    public function toArray($notifiable): array
    {
        return [
            'type' => $this->type->value,
            'priority' => $this->priority->value,
            'recipient_role' => $this->recipientRole,
            'subject' => $this->getSubject(),
            'message' => $this->getMainMessage(),
            'action_url' => $this->hasAction() ? $this->getActionUrl($notifiable) : null,
            'data' => $this->data,
            'sent_at' => now()->toISOString(),
        ];
    }

    // ===============================================
    // MÉTODOS ABSTRACTOS (implementar en cada notificación)
    // ===============================================

    abstract protected function getSubject(): string;
    abstract protected function getMainMessage(): string;
    abstract protected function getDetailMessage(): string;

    // ===============================================
    // MÉTODOS CON IMPLEMENTACIÓN POR DEFECTO
    // ===============================================

    protected function getGreeting($notifiable): string
    {
        $time = now()->hour;
        $greeting = match(true) {
            $time < 12 => 'Buenos días',
            $time < 18 => 'Buenas tardes',
            default => 'Buenas noches'
        };

        return "{$greeting}, {$notifiable->first_name ?? $notifiable->name}";
    }

    protected function hasAction(): bool
    {
        return !empty($this->getActionText()) && !empty($this->getActionUrl(null));
    }

    protected function getActionText(): string
    {
        return '';
    }

    protected function getActionUrl($notifiable): string
    {
        return '';
    }

    protected function getAdditionalData(): array
    {
        return [];
    }

    protected function getQueue(): string
    {
        return match($this->priority) {
            Priority::Urgent => 'urgent',
            Priority::High => 'high',
            Priority::Medium => 'default',
            Priority::Low => 'low'
        };
    }
}
