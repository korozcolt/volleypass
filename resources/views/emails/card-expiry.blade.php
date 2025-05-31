<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Carnet VolleyPass por Vencer</title>
</head>
<body style="font-family: Arial, sans-serif; margin: 0; padding: 20px; background-color: #f5f5f5;">
    <div style="max-width: 600px; margin: 0 auto; background-color: white; padding: 30px; border-radius: 10px;">
        <div style="text-align: center; margin-bottom: 30px;">
            <h1 style="color: #1e40af; margin: 0;">🏐 VolleyPass Sucre</h1>
        </div>

        <h2 style="color: #dc2626;">⚠️ Tu carnet está por vencer</h2>

        <p>Hola <strong>{{ $player_name }}</strong>,</p>

        <p>Te informamos que tu carnet VolleyPass vencerá en <strong>{{ $days_left }} días</strong>.</p>

        <div style="background-color: #fee2e2; padding: 15px; border-radius: 5px; margin: 20px 0;">
            <p style="margin: 0;"><strong>Detalles del carnet:</strong></p>
            <ul style="margin: 10px 0;">
                <li>Número: {{ $card_number }}</li>
                <li>Vence: {{ $expires_at }}</li>
                @if($club_name)
                <li>Club: {{ $club_name }}</li>
                @endif
            </ul>
        </div>

        <p><strong>¿Qué debes hacer?</strong></p>
        <ol>
            <li>Contacta a tu director de club</li>
            <li>Verifica que tus documentos estén vigentes</li>
            <li>Renueva tu certificado médico si es necesario</li>
        </ol>

        <p style="color: #dc2626;"><strong>Importante:</strong> Sin carnet válido no podrás participar en partidos oficiales.</p>

        <hr style="margin: 30px 0;">
        <p style="text-align: center; color: #6b7280; font-size: 14px;">
            VolleyPass Sucre - Sistema Digital de Carnetización<br>
            Este es un mensaje automático, no responder.
        </p>
    </div>
</body>
</html>
