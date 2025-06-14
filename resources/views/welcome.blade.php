<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>VolleyPass - Sistema de Carnetización para Volleyball</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Arial', sans-serif;
            line-height: 1.6;
            color: #333;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 20px;
        }

        header {
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(10px);
            padding: 1rem 0;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }

        .logo {
            font-size: 2rem;
            font-weight: bold;
            color: #ff6b35;
            text-align: center;
        }

        .hero {
            text-align: center;
            padding: 4rem 0;
            color: white;
        }

        .hero h1 {
            font-size: 3rem;
            margin-bottom: 1rem;
            text-shadow: 2px 2px 4px rgba(0,0,0,0.3);
        }

        .hero p {
            font-size: 1.2rem;
            margin-bottom: 2rem;
            opacity: 0.9;
        }

        .features {
            background: white;
            padding: 3rem 0;
            margin: 2rem 0;
            border-radius: 20px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.1);
        }

        .features-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 2rem;
            margin-top: 2rem;
        }

        .feature {
            text-align: center;
            padding: 1.5rem;
            border-radius: 10px;
            background: #f8f9fa;
            transition: transform 0.3s ease;
        }

        .feature:hover {
            transform: translateY(-5px);
        }

        .feature-icon {
            font-size: 3rem;
            margin-bottom: 1rem;
        }

        .feature h3 {
            color: #ff6b35;
            margin-bottom: 1rem;
        }

        .cta {
            text-align: center;
            padding: 2rem 0;
        }

        .btn {
            display: inline-block;
            background: #ff6b35;
            color: white;
            padding: 1rem 2rem;
            text-decoration: none;
            border-radius: 50px;
            font-weight: bold;
            font-size: 1.1rem;
            transition: all 0.3s ease;
            box-shadow: 0 4px 15px rgba(255, 107, 53, 0.3);
        }

        .btn:hover {
            background: #e55a2b;
            transform: translateY(-2px);
            box-shadow: 0 6px 20px rgba(255, 107, 53, 0.4);
        }

        footer {
            text-align: center;
            padding: 2rem 0;
            color: white;
            opacity: 0.8;
        }

        @media (max-width: 768px) {
            .hero h1 {
                font-size: 2rem;
            }

            .hero p {
                font-size: 1rem;
            }

            .features {
                margin: 1rem;
                padding: 2rem 1rem;
            }
        }
    </style>
</head>
<body>
    <header>
        <div class="container">
            <div class="logo">🏐 VolleyPass</div>
        </div>
    </header>

    <main>
        <section class="hero">
            <div class="container">
                <h1>VolleyPass</h1>
                <p>Sistema integral de carnetización para jugadores de volleyball</p>
                <p>Gestiona y mantén el historial completo de todos tus jugadores en un solo lugar</p>
            </div>
        </section>

        <section class="features">
            <div class="container">
                <h2 style="text-align: center; color: #333; margin-bottom: 1rem;">¿Qué es VolleyPass?</h2>
                <p style="text-align: center; color: #666; margin-bottom: 2rem;">
                    VolleyPass es la solución completa para la gestión de jugadores de volleyball,
                    permitiendo crear carnets digitales y mantener un registro detallado del historial deportivo.
                </p>

                <div class="features-grid">
                    <div class="feature">
                        <div class="feature-icon">🆔</div>
                        <h3>Carnetización Digital</h3>
                        <p>Crea carnets profesionales para cada jugador con toda su información personal y deportiva.</p>
                    </div>

                    <div class="feature">
                        <div class="feature-icon">📊</div>
                        <h3>Historial Completo</h3>
                        <p>Mantén un registro detallado de estadísticas, equipos, torneos y logros de cada jugador.</p>
                    </div>

                    <div class="feature">
                        <div class="feature-icon">⚡</div>
                        <h3>Gestión Rápida</h3>
                        <p>Interface intuitiva que permite acceder y actualizar información de manera eficiente.</p>
                    </div>
                </div>
            </div>
        </section>

        <section class="cta">
            <div class="container">
                <h2 style="color: white; margin-bottom: 1rem;">¿Listo para digitalizar tu gestión?</h2>
                <a href="#" class="btn">Comenzar Ahora</a>
            </div>
        </section>
    </main>

    <footer>
        <div class="container">
            <p>&copy; 2024 VolleyPass. Simplificando la gestión deportiva.</p>
        </div>
    </footer>
</body>
</html>
