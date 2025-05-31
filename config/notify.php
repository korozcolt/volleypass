<?php

return [
    /*
    |--------------------------------------------------------------------------
    | Rate Limiting
    |--------------------------------------------------------------------------
    |
    | Configuración para limitar el número de notificaciones por usuario
    |
    */
    'rate_limiting' => [
        'per_user_per_hour' => env('NOTIFY_RATE_LIMIT_HOUR', 10),
        'per_user_per_day' => env('NOTIFY_RATE_LIMIT_DAY', 50),
        'emergency_override' => env('NOTIFY_EMERGENCY_OVERRIDE', true),
    ],

    /*
    |--------------------------------------------------------------------------
    | Channels Configuration
    |--------------------------------------------------------------------------
    |
    | Configuración de canales de notificación disponibles
    |
    */
    'channels' => [
        'mail' => [
            'enabled' => true,
            'from_address' => env('MAIL_FROM_ADDRESS', 'noreply@volleypass.sucre.gov.co'),
            'from_name' => env('MAIL_FROM_NAME', 'VolleyPass Sucre'),
        ],
        'database' => [
            'enabled' => true,
        ],
        'sms' => [
            'enabled' => env('SMS_ENABLED', false),
            'provider' => env('SMS_PROVIDER', 'twilio'),
        ],
        'push' => [
            'enabled' => env('PUSH_ENABLED', false),
            'fcm_server_key' => env('FCM_SERVER_KEY'),
        ],
    ],

    /*
    |--------------------------------------------------------------------------
    | Templates
    |--------------------------------------------------------------------------
    |
    | Configuración de plantillas de notificación
    |
    */
    'templates' => [
        'card_expiry' => [
            'subject' => '🏐 Carnet VolleyPass por vencer',
            'template' => 'emails.card-expiry',
        ],
        'medical_expiry' => [
            'subject' => '🏥 Certificado médico por vencer',
            'template' => 'emails.medical-expiry',
        ],
        'document_approved' => [
            'subject' => '✅ Documento aprobado - VolleyPass',
            'template' => 'emails.document-approved',
        ],
    ],
];
