<?php

return [
    'channels' => [
        'mail' => [
            'driver' => 'mail',
            'from' => [
                'address' => env('MAIL_FROM_ADDRESS', 'noreply@volleypass.sucre.gov.co'),
                'name' => env('MAIL_FROM_NAME', 'VolleyPass Sucre'),
            ],
            'templates' => [
                'card_expiry' => 'emails.card-expiry',
                'medical_expiry' => 'emails.medical-expiry',
                'document_approved' => 'emails.document-approved',
                'registration_welcome' => 'emails.welcome',
            ]
        ],
        'sms' => [
            'driver' => 'sms',
            'provider' => env('SMS_PROVIDER', 'twilio'), // twilio, nexmo, local
            'from' => env('SMS_FROM', 'VolleyPass'),
        ],
        'push' => [
            'driver' => 'fcm',
            'server_key' => env('FCM_SERVER_KEY'),
            'sender_id' => env('FCM_SENDER_ID'),
        ],
        'whatsapp' => [
            'driver' => 'whatsapp',
            'api_url' => env('WHATSAPP_API_URL'),
            'token' => env('WHATSAPP_TOKEN'),
        ]
    ],

    'templates' => [
        'default_language' => 'es',
        'fallback_language' => 'es',
        'cache_templates' => true,
    ],

    'rate_limiting' => [
        'per_user_per_day' => 50,
        'per_user_per_hour' => 10,
        'emergency_override' => true,
    ]
];
