<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>VolleyPass Sucre - Plataforma Integral de Gestión para Ligas de Voleibol</title>
    <meta name="description" content="Sistema de digitalización y carnetización deportiva para la Liga de Voleibol de Sucre. Verificación instantánea con códigos QR, gestión médica avanzada y control centralizado.">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            line-height: 1.6;
            color: #333;
            overflow-x: hidden;
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 20px;
        }

        /* Header */
        header {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            padding: 1rem 0;
            position: fixed;
            width: 100%;
            top: 0;
            z-index: 1000;
            backdrop-filter: blur(10px);
            box-shadow: 0 2px 20px rgba(0,0,0,0.1);
        }

        .nav-container {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .logo {
            display: flex;
            align-items: center;
            font-size: 1.5rem;
            font-weight: bold;
        }

        .logo img {
            width: 40px;
            height: 40px;
            margin-right: 10px;
            border-radius: 8px;
        }

        .nav-menu {
            display: flex;
            list-style: none;
            gap: 2rem;
        }

        .nav-menu a {
            color: white;
            text-decoration: none;
            transition: opacity 0.3s ease;
        }

        .nav-menu a:hover {
            opacity: 0.8;
        }

        /* Hero Section */
        .hero {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            padding: 8rem 0 4rem;
            text-align: center;
            position: relative;
            overflow: hidden;
        }

        .hero::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: url('data:image/svg+xml,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 100 100"><defs><pattern id="grain" width="100" height="100" patternUnits="userSpaceOnUse"><circle cx="25" cy="25" r="1" fill="white" opacity="0.1"/><circle cx="75" cy="75" r="1" fill="white" opacity="0.1"/><circle cx="50" cy="10" r="0.5" fill="white" opacity="0.1"/></pattern></defs><rect width="100" height="100" fill="url(%23grain)"/></svg>');
            opacity: 0.3;
        }

        .hero-content {
            position: relative;
            z-index: 2;
        }

        .hero h1 {
            font-size: 3.5rem;
            margin-bottom: 1rem;
            text-shadow: 2px 2px 4px rgba(0,0,0,0.3);
        }

        .hero .subtitle {
            font-size: 1.3rem;
            margin-bottom: 0.5rem;
            opacity: 0.9;
            font-weight: 300;
        }

        .hero .description {
            font-size: 1.1rem;
            margin-bottom: 2rem;
            opacity: 0.8;
            max-width: 600px;
            margin-left: auto;
            margin-right: auto;
        }

        .tech-badges {
            display: flex;
            justify-content: center;
            gap: 1rem;
            margin: 2rem 0;
            flex-wrap: wrap;
        }

        .tech-badge {
            background: rgba(255,255,255,0.2);
            padding: 0.5rem 1rem;
            border-radius: 20px;
            font-size: 0.9rem;
            backdrop-filter: blur(10px);
        }

        .cta-buttons {
            display: flex;
            gap: 1rem;
            justify-content: center;
            margin-top: 2rem;
            flex-wrap: wrap;
        }

        .btn {
            display: inline-block;
            padding: 1rem 2rem;
            text-decoration: none;
            border-radius: 50px;
            font-weight: bold;
            font-size: 1.1rem;
            transition: all 0.3s ease;
            border: none;
            cursor: pointer;
        }

        .btn-primary {
            background: #ff6b35;
            color: white;
            box-shadow: 0 4px 15px rgba(255, 107, 53, 0.3);
        }

        .btn-primary:hover {
            background: #e55a2b;
            transform: translateY(-2px);
            box-shadow: 0 6px 20px rgba(255, 107, 53, 0.4);
        }

        .btn-secondary {
            background: transparent;
            color: white;
            border: 2px solid white;
        }

        .btn-secondary:hover {
            background: white;
            color: #667eea;
        }

        /* Stats Section */
        .stats {
            background: white;
            padding: 3rem 0;
            box-shadow: 0 -5px 20px rgba(0,0,0,0.1);
        }

        .stats-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 2rem;
            text-align: center;
        }

        .stat-item h3 {
            font-size: 2.5rem;
            color: #ff6b35;
            margin-bottom: 0.5rem;
        }

        .stat-item p {
            color: #666;
            font-weight: 500;
        }

        /* Features Section */
        .features {
            padding: 4rem 0;
            background: #f8f9fa;
        }

        .section-header {
            text-align: center;
            margin-bottom: 3rem;
        }

        .section-header h2 {
            font-size: 2.5rem;
            color: #333;
            margin-bottom: 1rem;
        }

        .section-header p {
            font-size: 1.1rem;
            color: #666;
            max-width: 600px;
            margin: 0 auto;
        }

        .features-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(350px, 1fr));
            gap: 2rem;
            margin-top: 3rem;
        }

        .feature-card {
            background: white;
            padding: 2rem;
            border-radius: 15px;
            box-shadow: 0 5px 20px rgba(0,0,0,0.1);
            transition: transform 0.3s ease;
            border-left: 4px solid #ff6b35;
        }

        .feature-card:hover {
            transform: translateY(-5px);
        }

        .feature-header {
            display: flex;
            align-items: center;
            margin-bottom: 1rem;
        }

        .feature-icon {
            font-size: 2rem;
            margin-right: 1rem;
            width: 60px;
            height: 60px;
            background: linear-gradient(135deg, #ff6b35, #e55a2b);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .feature-card h3 {
            color: #333;
            font-size: 1.3rem;
        }

        .feature-list {
            list-style: none;
            margin-top: 1rem;
        }

        .feature-list li {
            padding: 0.3rem 0;
            color: #666;
            position: relative;
            padding-left: 1.5rem;
        }

        .feature-list li::before {
            content: '✓';
            position: absolute;
            left: 0;
            color: #28a745;
            font-weight: bold;
        }

        /* Architecture Section */
        .architecture {
            padding: 4rem 0;
            background: white;
        }

        .architecture-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 3rem;
            align-items: center;
            margin-top: 2rem;
        }

        .flow-diagram {
            background: #f8f9fa;
            padding: 2rem;
            border-radius: 15px;
            border: 2px dashed #ddd;
        }

        .flow-step {
            display: flex;
            align-items: center;
            margin: 1rem 0;
            padding: 1rem;
            background: white;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }

        .step-number {
            background: #ff6b35;
            color: white;
            width: 30px;
            height: 30px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-right: 1rem;
            font-weight: bold;
        }

        /* Technology Stack */
        .tech-stack {
            padding: 4rem 0;
            background: #f8f9fa;
        }

        .tech-categories {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 2rem;
            margin-top: 2rem;
        }

        .tech-category {
            background: white;
            padding: 2rem;
            border-radius: 15px;
            box-shadow: 0 5px 20px rgba(0,0,0,0.1);
        }

        .tech-category h3 {
            color: #ff6b35;
            margin-bottom: 1rem;
            display: flex;
            align-items: center;
        }

        .tech-category h3::before {
            content: '⚡';
            margin-right: 0.5rem;
        }

        .tech-list {
            list-style: none;
        }

        .tech-list li {
            padding: 0.5rem 0;
            color: #666;
            border-bottom: 1px solid #eee;
        }

        .tech-list li:last-child {
            border-bottom: none;
        }

        /* Security Section */
        .security {
            padding: 4rem 0;
            background: linear-gradient(135deg, #2c3e50 0%, #34495e 100%);
            color: white;
        }

        .security-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 2rem;
            margin-top: 2rem;
        }

        .security-item {
            text-align: center;
            padding: 2rem;
            background: rgba(255,255,255,0.1);
            border-radius: 15px;
            backdrop-filter: blur(10px);
        }

        .security-item h3 {
            color: #ff6b35;
            margin-bottom: 1rem;
        }

        /* CTA Section */
        .final-cta {
            padding: 4rem 0;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            text-align: center;
        }

        .final-cta h2 {
            font-size: 2.5rem;
            margin-bottom: 1rem;
        }

        .final-cta p {
            font-size: 1.2rem;
            margin-bottom: 2rem;
            opacity: 0.9;
        }

        /* Footer */
        footer {
            background: #2c3e50;
            color: white;
            padding: 3rem 0 1rem;
        }

        .footer-content {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 2rem;
            margin-bottom: 2rem;
        }

        .footer-section h3 {
            color: #ff6b35;
            margin-bottom: 1rem;
        }

        .footer-section ul {
            list-style: none;
        }

        .footer-section ul li {
            padding: 0.3rem 0;
        }

        .footer-section ul li a {
            color: #bdc3c7;
            text-decoration: none;
            transition: color 0.3s ease;
        }

        .footer-section ul li a:hover {
            color: white;
        }

        .footer-bottom {
            text-align: center;
            padding-top: 2rem;
            border-top: 1px solid #34495e;
            color: #bdc3c7;
        }

        /* Responsive */
        @media (max-width: 768px) {
            .hero h1 {
                font-size: 2.5rem;
            }

            .nav-menu {
                display: none;
            }

            .architecture-grid {
                grid-template-columns: 1fr;
            }

            .cta-buttons {
                flex-direction: column;
                align-items: center;
            }

            .features-grid {
                grid-template-columns: 1fr;
            }
        }

        /* Animations */
        @keyframes fadeInUp {
            from {
                opacity: 0;
                transform: translateY(30px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .fade-in-up {
            animation: fadeInUp 0.6s ease-out;
        }
    </style>
</head>
<body>
    <header>
        <div class="container">
            <nav class="nav-container">
                <div class="logo">
                    🏐 VolleyPass Sucre
                </div>
                <ul class="nav-menu">
                    <li><a href="#inicio">Inicio</a></li>
                    <li><a href="#caracteristicas">Características</a></li>
                    <li><a href="#tecnologia">Tecnología</a></li>
                    <li><a href="#seguridad">Seguridad</a></li>
                    <li><a href="#contacto">Contacto</a></li>
                </ul>
            </nav>
        </div>
    </header>

    <main>
        <section id="inicio" class="hero">
            <div class="container">
                <div class="hero-content fade-in-up">
                    <h1>VolleyPass Sucre</h1>
                    <p class="subtitle">Plataforma Integral de Gestión para Ligas de Voleibol</p>
                    <p class="description">
                        Sistema de digitalización y carnetización deportiva que revoluciona la gestión
                        de jugadores, entrenadores y clubes con verificación instantánea mediante códigos QR.
                    </p>

                    <div class="tech-badges">
                        <span class="tech-badge">Laravel 12.x</span>
                        <span class="tech-badge">Livewire 3.x</span>
                        <span class="tech-badge">API REST</span>
                        <span class="tech-badge">QR Verification</span>
                        <span class="tech-badge">MySQL 8.0+</span>
                    </div>

                    <div class="cta-buttons">
                        <a href="#demo" class="btn btn-primary">Ver Demo</a>
                        <a href="#caracteristicas" class="btn btn-secondary">Conocer Más</a>
                    </div>
                </div>
            </div>
        </section>

        <section class="stats">
            <div class="container">
                <div class="stats-grid">
                    <div class="stat-item">
                        <h3>45+</h3>
                        <p>Migraciones de Base de Datos</p>
                    </div>
                    <div class="stat-item">
                        <h3>25+</h3>
                        <p>Enums para Validaciones</p>
                    </div>
                    <div class="stat-item">
                        <h3>7</h3>
                        <p>Roles de Usuario</p>
                    </div>
                    <div class="stat-item">
                        <h3>100%</h3>
                        <p>Fase 2 Completada</p>
                    </div>
                </div>
            </div>
        </section>

        <section id="caracteristicas" class="features">
            <div class="container">
                <div class="section-header">
                    <h2>Características Principales</h2>
                    <p>Sistema completo de carnetización digital con tecnología de punta para la gestión deportiva moderna</p>
                </div>

                <div class="features-grid">
                    <div class="feature-card">
                        <div class="feature-header">
                            <div class="feature-icon">🆔</div>
                            <h3>Carnetización Digital</h3>
                        </div>
                        <p>Sistema completo de carnets digitales con códigos QR únicos y verificación instantánea.</p>
                        <ul class="feature-list">
                            <li>Generación automática de carnets</li>
                            <li>QR únicos con hash SHA-256</li>
                            <li>Estados dinámicos (Activo, Vencido, Suspendido)</li>
                            <li>Renovación automática por temporadas</li>
                        </ul>
                    </div>

                    <div class="feature-card">
                        <div class="feature-header">
                            <div class="feature-icon">🔍</div>
                            <h3>API de Verificación</h3>
                        </div>
                        <p>API REST optimizada para verificación en tiempo real con respuestas en milisegundos.</p>
                        <ul class="feature-list">
                            <li>Verificación instantánea < 100ms</li>
                            <li>Estados: Apta, Restricción, No Apta</li>
                            <li>Verificación por lotes</li>
                            <li>Geo-localización y logging</li>
                        </ul>
                    </div>

                    <div class="feature-card">
                        <div class="feature-header">
                            <div class="feature-icon">🏥</div>
                            <h3>Módulo Médico Avanzado</h3>
                        </div>
                        <p>Gestión completa de certificados médicos con validación profesional y alertas automáticas.</p>
                        <ul class="feature-list">
                            <li>Certificados médicos con validación</li>
                            <li>Estados médicos específicos</li>
                            <li>Alertas de vencimiento automáticas</li>
                            <li>Historial médico completo</li>
                        </ul>
                    </div>

                    <div class="feature-card">
                        <div class="feature-header">
                            <div class="feature-icon">📄</div>
                            <h3>Gestión de Documentos</h3>
                        </div>
                        <p>Sistema completo de gestión documental con versionado y validación automática.</p>
                        <ul class="feature-list">
                            <li>Múltiples tipos de documentos</li>
                            <li>Validación automática de formatos</li>
                            <li>Estados dinámicos</li>
                            <li>Versionado completo</li>
                        </ul>
                    </div>

                    <div class="feature-card">
                        <div class="feature-header">
                            <div class="feature-icon">🔔</div>
                            <h3>Sistema de Notificaciones</h3>
                        </div>
                        <p>Notificaciones inteligentes multi-canal con batching automático y rate limiting.</p>
                        <ul class="feature-list">
                            <li>Email, base de datos, push</li>
                            <li>Notificaciones inteligentes</li>
                            <li>Batching automático</li>
                            <li>Templates responsive</li>
                        </ul>
                    </div>

                    <div class="feature-card">
                        <div class="feature-header">
                            <div class="feature-icon">👥</div>
                            <h3>Sistema Multi-Rol</h3>
                        </div>
                        <p>Gestión completa de usuarios con 7 roles específicos y permisos granulares.</p>
                        <ul class="feature-list">
                            <li>SuperAdmin, LeagueAdmin, ClubDirector</li>
                            <li>Player, Coach, SportsDoctor</li>
                            <li>Verifier para eventos</li>
                            <li>Permisos granulares</li>
                        </ul>
                    </div>
                </div>
            </div>
        </section>

        <section class="architecture">
            <div class="container">
                <div class="section-header">
                    <h2>Flujo de Verificación</h2>
                    <p>Proceso optimizado para verificación instantánea en eventos deportivos</p>
                </div>

                <div class="architecture-grid">
                    <div class="flow-diagram">
                        <div class="flow-step">
                            <div class="step-number">1</div>
                            <div>Verificador escanea código QR</div>
                        </div>
                        <div class="flow-step">
                            <div class="step-number">2</div>
                            <div>API valida formato y busca carnet</div>
                        </div>
                        <div class="flow-step">
                            <div class="step-number">3</div>
                            <div>Verifica estado del carnet y jugadora</div>
                        </div>
                        <div class="flow-step">
                            <div class="step-number">4</div>
                            <div>Valida certificado médico</div>
                        </div>
                        <div class="flow-step">
                            <div class="step-number">5</div>
                            <div>Retorna estado: Apta/Restricción/No Apta</div>
                        </div>
                        <div class="flow-step">
                            <div class="step-number">6</div>
                            <div>Registra log para auditoría</div>
                        </div>
                    </div>

                    <div>
                        <h3>Jerarquía Organizacional</h3>
                        <div style="background: #f8f9fa; padding: 2rem; border-radius: 15px; margin-top: 1rem;">
                            <div style="margin-bottom: 1rem;"><strong>Liga (Departamental)</strong></div>
                            <div style="margin-left: 1rem; margin-bottom: 1rem;">└── <strong>Clubes</strong></div>
                            <div style="margin-left: 2rem; margin-bottom: 0.5rem;">├── Jugadoras</div>
                            <div style="margin-left: 2rem; margin-bottom: 0.5rem;">├── Entrenadores</div>
                            <div style="margin-left: 2rem; margin-bottom: 0.5rem;">└── Equipos por Categoría:</div>
                            <div style="margin-left: 3rem; font-size: 0.9rem; color: #666;">
                                Mini (8-10) • Pre-Mini (11-12) • Infantil (13-14)<br>
                                Cadete (15-16) • Juvenil (17-18) • Mayores (19+) • Masters (35+)
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <section id="tecnologia" class="tech-stack">
            <div class="container">
                <div class="section-header">
                    <h2>Stack Tecnológico</h2>
                    <p>Tecnologías modernas y robustas para máximo rendimiento y escalabilidad</p>
                </div>

                <div class="tech-categories">
                    <div class="tech-category">
                        <h3>Core Framework</h3>
                        <ul class="tech-list">
                            <li><strong>Laravel 12.x</strong> - Framework PHP moderno</li>
                            <li><strong>Livewire 3.x</strong> - Componentes reactivos</li>
                            <li><strong>Volt</strong> - Sintaxis simplificada</li>
                        </ul>
                    </div>

                    <div class="tech-category">
                        <h3>Paquetes Spatie</h3>
                        <ul class="tech-list">
                            <li><strong>Permission</strong> - Roles y permisos</li>
                            <li><strong>Media Library</strong> - Gestión multimedia</li>
                            <li><strong>Activity Log</strong> - Auditoría completa</li>
                            <li><strong>Backup</strong> - Respaldos automáticos</li>
                        </ul>
                    </div>

                    <div class="tech-category">
                        <h3>Frontend</h3>
                        <ul class="tech-list">
                            <li><strong>Livewire Flux</strong> - Componentes UI</li>
                            <li><strong>Tailwind CSS</strong> - Framework CSS</li>
                            <li><strong>Alpine.js</strong> - JavaScript reactivo</li>
                        </ul>
                    </div>

                    <div class="tech-category">
                        <h3>Base de Datos</h3>
                        <ul class="tech-list">
                            <li><strong>MySQL 8.0+</strong> - Base principal</li>
                            <li><strong>45+ tablas</strong> - Relaciones optimizadas</li>
                            <li><strong>Índices estratégicos</strong> - Alta performance</li>
                        </ul>
                    </div>
                </div>
            </div>
        </section>

        <section id="seguridad" class="security">
            <div class="container">
                <div class="section-header">
                    <h2 style="color: white;">Seguridad y Performance</h2>
                    <p style="color: rgba(255,255,255,0.8);">Medidas avanzadas de seguridad y optimizaciones para máximo rendimiento</p>
                </div>

                <div class="security-grid">
                    <div class="security-item">
                        <h3>🔒 Seguridad</h3>
                        <ul style="list-style: none; text-align: left;">
                            <li>• Hash SHA-256 para QR únicos</li>
                            <li>• Tokens de verificación adicionales</li>
                            <li>• Rate limiting en API</li>
                            <li>• Auditoría completa</li>
                        </ul>
                    </div>

                    <div class="security-item">
                        <h3>⚡ Performance</h3>
                        <ul style="list-style: none; text-align: left;">
                            <li>• Cache inteligente</li>
                            <li>• API < 100ms respuesta</li>
                            <li>• Jobs en cola</li>
                            <li>• Batch processing</li>
                        </ul>
                    </div>

                    <div class="security-item">
                        <h3>📊 Monitoreo</h3>
                        <ul style="list-style: none; text-align: left;">
                            <li>• Laravel Telescope</li>
                            <li>• Logs detallados</li>
                            <li>• Métricas de verificación</li>
                            <li>• Reportes automáticos</li>
                        </ul>
                    </div>

                    <div class="security-item">
                        <h3>🔧 Mantenimiento</h3>
                        <ul style="list-style: none; text-align: left;">
                            <li>• Limpieza automática</li>
                            <li>• Respaldos programados</li>
                            <li>• Comandos especializados</li>
                            <li>• Validación de integridad</li>
                        </ul>
                    </div>
                </div>
            </div>
        </section>

        <section class="final-cta">
            <div class="container">
                <h2>¿Listo para Digitalizar tu Liga?</h2>
                <p>Únete a la revolución digital del voleibol con VolleyPass Sucre</p>
                <div class="cta-buttons">
                    <a href="mailto:liga@volleypass.sucre.gov.co" class="btn btn-primary">Solicitar Demo</a>
                    <a href="#contacto" class="btn btn-secondary">Más Información</a>
                </div>
            </div>
        </section>
    </main>

    <footer id="contacto">
        <div class="container">
            <div class="footer-content">
                <div class="footer-section">
                    <h3>Liga de Voleibol de Sucre</h3>
                    <ul>
                        <li>📧 liga@volleypass.sucre.gov.co</li>
                        <li>📱 +57 (5) 282-5555</li>
                        <li>🏢 Cra. 25 #16-50, Sincelejo, Sucre</li>
                        <li>🌐 volleypass.sucre.gov.co</li>
                    </ul>
                </div>

                <div class="footer-section">
                    <h3>Soporte Técnico</h3>
                    <ul>
                        <li><a href="mailto:soporte@volleypass.sucre.gov.co">📧 Soporte Email</a></li>
                        <li><a href="#">📋 GitHub Issues</a></li>
                        <li><a href="#">📖 Documentación</a></li>
                        <li>🚨 +57 300 123 4567 (24/7)</li>
                    </ul>
                </div>

                <div class="footer-section">
                    <h3>Recursos</h3>
                    <ul>
                        <li><a href="#">📹 Tutoriales YouTube</a></li>
                        <li><a href="#">📚 Manuales Digitales</a></li>
                        <li><a href="#">🎯 Webinars Mensuales</a></li>
                        <li><a href="#">💬 Comunidad WhatsApp</a></li>
                    </ul>
                </div>

                <div class="footer-section">
                    <h3>Estado del Proyecto</h3>
                    <ul>
                        <li>✅ Fase 1: Completada (100%)</li>
                        <li>✅ Fase 2: Completada (100%)</li>
                        <li>🚧 Fase 3: En Desarrollo</li>
                        <li>📱 App Móvil: Q3 2025</li>
                    </ul>
                </div>
            </div>

            <div class="footer-bottom">
                <p>&copy; 2024 VolleyPass Sucre. Desarrollado con ❤️ para el voleibol sucreño.</p>
                <p><em>"Digitalizando el deporte, fortaleciendo la comunidad"</em></p>
            </div>
        </div>
    </footer>
</body>
</html>
