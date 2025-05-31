<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>{{ $subject ?? 'Notificación VolleyPass' }}</title>
</head>
<body style="font-family: Arial, sans-serif; margin: 0; padding: 20px; background-color: #f5f5f5;">
    <div style="max-width: 600px; margin: 0 auto; background-color: white; padding: 30px; border-radius: 10px;">
        <div style="text-align: center; margin-bottom: 30px;">
            <h1 style="color: #1e40af; margin: 0;">🏐 VolleyPass Sucre</h1>
        </div>

        <h2>{{ $title ?? 'Notificación' }}</h2>

        <p>Estimado/a <strong>{{ $recipient_name ?? 'Usuario' }}</strong>,</p>

        <p>{{ $message ?? 'Tiene una nueva notificación en VolleyPass.' }}</p>

        @if(isset($details) && is_array($details))
        <div style="background-color: #f3f4f6; padding: 15px; border-radius: 5px; margin: 20px 0;">
            <p style="margin: 0;"><strong>Detalles:</strong></p>
            <ul style="margin: 10px 0;">
                @foreach($details as $key => $value)
                <li>{{ ucfirst(str_replace('_', ' ', $key)) }}: {{ $value }}</li>
                @endforeach
            </ul>
        </div>
        @endif

        @if(isset($action_url))
        <div style="text-align: center; margin: 30px 0;">
            <a href="{{ $action_url }}" style="background-color: #1e40af; color: white; padding: 12px 24px; text-decoration: none; border-radius: 5px; display: inline-block;">
                {{ $action_text ?? 'Ver Dashboard' }}
            </a>
        </div>
        @endif

        <hr style="margin: 30px 0;">
        <p style="text-align: center; color: #6b7280; font-size: 14px;">
            VolleyPass Sucre - Sistema Digital de Carnetización<br>
            Este es un mensaje automático, no responder.
        </p>
    </div>
</body>
</html>
