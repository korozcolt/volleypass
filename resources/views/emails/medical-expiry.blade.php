<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Certificado Médico por Vencer</title>
</head>
<body style="font-family: Arial, sans-serif; margin: 0; padding: 20px; background-color: #f5f5f5;">
    <div style="max-width: 600px; margin: 0 auto; background-color: white; padding: 30px; border-radius: 10px;">
        <div style="text-align: center; margin-bottom: 30px;">
            <h1 style="color: #1e40af; margin: 0;">🏥 VolleyPass Sucre</h1>
        </div>

        <h2 style="color: #dc2626;">⚠️ Certificado médico por vencer</h2>

        <p>Hola <strong>{{ $player_name }}</strong>,</p>

        <p>Tu certificado médico deportivo vencerá en <strong>{{ $days_left }} días</strong>.</p>

        <div style="background-color: #fef3c7; padding: 15px; border-radius: 5px; margin: 20px 0;">
            <p style="margin: 0;"><strong>Detalles del certificado:</strong></p>
            <ul style="margin: 10px 0;">
                <li>Médico: {{ $doctor_name }}</li>
                <li>Estado: {{ $medical_status }}</li>
                <li>Vence: {{ $expires_at }}</li>
            </ul>
        </div>

        <p><strong>Renovación urgente:</strong></p>
        <p>Debes renovar tu certificado médico antes del vencimiento. Sin certificado válido, tu carnet será suspendido automáticamente.</p>

        <hr style="margin: 30px 0;">
        <p style="text-align: center; color: #6b7280; font-size: 14px;">
            VolleyPass Sucre - Sistema Digital de Carnetización<br>
            Este es un mensaje automático, no responder.
        </p>
    </div>
</body>
</html>
