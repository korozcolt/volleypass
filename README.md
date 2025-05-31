# 🏐 VolleyPass Sucre

<div align="center">

![VolleyPass Logo](https://i.ibb.co/99TJDJRZ/logo-volley-pass-black-back.png)

**Plataforma Integral de Gestión para Ligas de Voleibol**
*Sistema de Digitalización y Carnetización Deportiva*

[![Laravel](https://img.shields.io/badge/Laravel-12.x-FF2D20?style=for-the-badge&logo=laravel&logoColor=white)](https://laravel.com)
[![PHP](https://img.shields.io/badge/PHP-8.2+-777BB4?style=for-the-badge&logo=php&logoColor=white)](https://php.net)
[![Livewire](https://img.shields.io/badge/Livewire-3.x-4E56A6?style=for-the-badge&logo=livewire&logoColor=white)](https://livewire.laravel.com)
[![Filament](https://img.shields.io/badge/Filament-3.x-FDBA74?style=for-the-badge&logo=laravel&logoColor=white)](https://filamentphp.com)
[![MySQL](https://img.shields.io/badge/MySQL-8.0+-4479A1?style=for-the-badge&logo=mysql&logoColor=white)](https://mysql.com)

[🚀 Demo](#) • [📖 Documentación](#) • [🐛 Reportar Bug](#) • [💡 Solicitar Feature](#)

</div>

---

## 📋 Tabla de Contenidos

- [📖 Acerca del Proyecto](#-acerca-del-proyecto)
- [✨ Características](#-características)
- [🏗️ Arquitectura](#-arquitectura)
- [🛠️ Tecnologías](#-tecnologías)
- [⚙️ Instalación](#-instalación)
- [🚀 Inicio Rápido](#-inicio-rápido)
- [📊 Estado del Proyecto](#-estado-del-proyecto)
- [🛡️ Seguridad y Performance](#-seguridad-y-performance)
- [🚀 Comandos Especializados](#-comandos-especializados)
- [🧪 Testing](#-testing)
- [🤝 Contribuir](#-contribuir)
- [📞 Soporte](#-soporte)
- [📄 Licencia](#-licencia)

---

## 📖 Acerca del Proyecto

**VolleyPass Sucre** es una plataforma integral diseñada para digitalizar y modernizar la gestión de la Liga de Voleibol de Sucre, Colombia. El sistema centraliza el registro, verificación y gestión de jugadoras, entrenadores y clubes, garantizando transparencia, eficiencia y control en torneos oficiales.

### 🎯 Objetivo Principal

Reemplazar el sistema tradicional de carnets físicos por una solución digital robusta que permita:

- ✅ **Control centralizado** de jugadoras y documentación
- ✅ **Verificación instantánea** en partidos mediante códigos QR
- ✅ **Historial deportivo y médico** completo
- ✅ **Transparencia** en el cumplimiento de normativas
- ✅ **Estadísticas avanzadas** para desarrollo deportivo

### 👥 Beneficiarios

- **Jugadoras y entrenadores** de la Liga de Voleibol de Sucre
- **Directivos de clubes** y ligas departamentales
- **Organizadores de torneos** y verificadores oficiales
- **Federaciones deportivas** y patrocinadores

---

## ✨ Características

### 🏗️ **Fase 1: Infraestructura Base** ✅ *Completada*

<details>
<summary><strong>🔐 Sistema de Usuarios Multi-Rol</strong></summary>

- **SuperAdmin**: Acceso total al sistema
- **LeagueAdmin**: Administrador de liga departamental
- **ClubDirector**: Director de club deportivo
- **Player**: Jugadora registrada
- **Coach**: Entrenador certificado
- **SportsDoctor**: Médico deportivo
- **Verifier**: Verificador de carnets en partidos

</details>

<details>
<summary><strong>🏛️ Jerarquía Organizacional</strong></summary>

```
Liga (Departamental)
└── Clubes
    ├── Jugadoras
    ├── Entrenadores
    └── Equipos por Categoría
        ├── Mini (8-10 años)
        ├── Pre-Mini (11-12 años)
        ├── Infantil (13-14 años)
        ├── Cadete (15-16 años)
        ├── Juvenil (17-18 años)
        ├── Mayores (19+ años)
        └── Masters (35+ años)
```

</details>

<details>
<summary><strong>🌍 Ubicaciones Geográficas</strong></summary>

- **Colombia completa**: 32 departamentos, 1,100+ municipios
- **Integración nativa** con códigos DANE
- **Búsquedas inteligentes** por ubicación

</details>

### 🚀 **Fase 2: Carnetización Digital** ✅ *Completada*

<details>
<summary><strong>📄 Gestión Completa de Documentos</strong></summary>

- **Tipos soportados**: Cédula, certificados médicos, fotografías, autorizaciones
- **Validación automática**: Formatos, tamaños y vencimientos
- **Estados dinámicos**: Pendiente, aprobado, rechazado, vencido
- **Versionado**: Historial completo de cambios por documento

</details>

<details>
<summary><strong>🆔 Sistema de Carnets Digitales</strong></summary>

- **Generación automática** tras aprobación de documentos
- **QR únicos** con hash SHA-256 y tokens de verificación
- **Estados avanzados**: Activo, vencido, suspendido, restricción médica
- **Renovación automática** por temporadas
- **Historial completo** de cambios y verificaciones

</details>

<details>
<summary><strong>📱 API de Verificación en Tiempo Real</strong></summary>

- **Endpoint REST** optimizado para aplicaciones móviles
- **Verificación instantánea** con resultados en milisegundos
- **Estados de respuesta**:
  - ✅ **Apta**: Verde (documentación al día)
  - ⚠️ **Restricción**: Amarillo (limitaciones específicas)
  - ❌ **No Apta**: Rojo (documentación vencida o suspensión)
- **Verificación por lotes** para eventos grandes
- **Geo-localización** y logging detallado

</details>

<details>
<summary><strong>🏥 Módulo Médico Avanzado</strong></summary>

- **Certificados médicos** con validación profesional
- **Estados médicos**: Apta, Restricción parcial, No apta, En tratamiento, Recuperación
- **Alertas automáticas** de vencimiento (30, 15, 7, 3, 1 días)
- **Restricciones específicas** por posición y tipo de evento
- **Historial médico** completo con seguimiento de lesiones

</details>

<details>
<summary><strong>🔔 Sistema de Notificaciones</strong></summary>

- **Múltiples canales**: Email, base de datos, push (preparado)
- **Notificaciones inteligentes**: Vencimientos, aprobaciones, recordatorios
- **Batching automático** para evitar spam
- **Rate limiting** personalizable por usuario
- **Templates responsive** para todos los dispositivos

</details>

### 🏆 **Fase 3: Gestión Avanzada** *En Desarrollo*

- 📊 **Estadísticas Deportivas**: Rendimiento y rankings por jugadora
- 🏆 **Torneos y Competencias**: Gestión completa de eventos deportivos
- 🏅 **Sistema de Reconocimientos**: MVP, selecciones, premios especiales
- 💰 **Gestión de Pagos**: Inscripciones, cuotas y facturación
- 📱 **App Móvil**: React Native para verificadores en campo

---

## 🏗️ Arquitectura

### 🗂️ Estructura del Proyecto

```
volleypass/
├── 📁 app/
│   ├── 📁 Console/Commands/    # Comandos personalizados
│   ├── 📁 Enums/              # Estados y tipos de datos (25+ enums)
│   ├── 📁 Http/
│   │   ├── 📁 Controllers/    # Controladores principales + API
│   │   └── 📁 Requests/       # Form requests con validación
│   ├── 📁 Jobs/               # Jobs para colas (notificaciones, reportes)
│   ├── 📁 Models/             # Modelos Eloquent (30+ modelos)
│   │   ├── User.php           # Usuario con roles y perfiles
│   │   ├── Player.php         # Jugadora con estadísticas
│   │   ├── PlayerCard.php     # Carnets digitales con QR
│   │   ├── MedicalCertificate.php # Certificados médicos
│   │   ├── QrScanLog.php      # Logs de verificación
│   │   └── ...
│   ├── 📁 Notifications/      # Sistema de notificaciones
│   ├── 📁 Services/           # Servicios de negocio
│   │   ├── QrVerificationService.php # Lógica de verificación
│   │   └── NotificationBatchingService.php
│   ├── 📁 Traits/             # Funcionalidades reutilizables (8 traits)
│   └── 📁 Providers/          # Service providers
├── 📁 config/                 # Configuraciones especializadas
├── 📁 database/
│   ├── 📁 migrations/         # 45+ migraciones funcionales
│   ├── 📁 seeders/            # Datos completos de Colombia
│   └── 📁 factories/          # Factories para testing
├── 📁 resources/
│   ├── 📁 views/              # Vistas Blade + Livewire + Flux
│   │   ├── 📁 emails/         # Templates de notificaciones
│   │   └── 📁 livewire/       # Componentes reactivos
│   └── 📁 js/                 # Frontend assets
└── 📁 routes/                 # Rutas web + API + console
```

### 🔄 Flujo de Verificación de Carnets

```mermaid
graph TD
    A[Verificador escanea QR] --> B[API recibe código]
    B --> C[Validar formato QR]
    C --> D{QR válido?}
    D -->|No| E[❌ Código inválido]
    D -->|Sí| F[Buscar carnet en BD]
    F --> G{Carnet existe?}
    G -->|No| H[❌ Carnet no encontrado]
    G -->|Sí| I[Validar estado del carnet]
    I --> J{Estado válido?}
    J -->|No| K[❌ Carnet vencido/suspendido]
    J -->|Sí| L[Verificar jugadora]
    L --> M[Verificar certificado médico]
    M --> N{Médicamente apta?}
    N -->|No| O[❌ No apta médicamente]
    N -->|Restricciones| P[⚠️ Apta con restricciones]
    N -->|Sí| Q[✅ Apta para jugar]
    
    E --> R[Registrar log]
    H --> R
    K --> R
    O --> R
    P --> R
    Q --> R
    R --> S[Respuesta a verificador]
```

---

## 🛠️ Tecnologías

### 🚀 Core Framework

- **[Laravel 12.x](https://laravel.com)** - Framework PHP moderno
- **[Livewire 3.x](https://livewire.laravel.com)** - Componentes reactivos
- **[Volt](https://livewire.laravel.com/docs/volt)** - Sintaxis simplificada

### 📦 Paquetes Principales

- **[Spatie Permission](https://spatie.be/docs/laravel-permission)** - Sistema completo de roles y permisos
- **[Spatie Media Library](https://spatie.be/docs/laravel-medialibrary)** - Gestión avanzada de archivos multimedia
- **[Spatie Activity Log](https://spatie.be/docs/laravel-activitylog)** - Auditoría completa del sistema
- **[Spatie Backup](https://spatie.be/docs/laravel-backup)** - Respaldos automáticos programados
- **[Simple QR Code](https://www.simplesoftwareio.com/simple-qrcode)** - Generación de códigos QR seguros
- **[Intervention Image](http://image.intervention.io)** - Procesamiento y optimización de imágenes
- **[Maatwebsite Excel](https://laravel-excel.com)** - Exportación de reportes y estadísticas

### 🎨 Frontend

- **[Livewire Flux](https://fluxui.dev)** - Componentes UI modernos y accesibles
- **[Tailwind CSS](https://tailwindcss.com)** - Framework CSS utility-first
- **[Alpine.js](https://alpinejs.dev)** - JavaScript reactivo ligero

### 🗃️ Base de Datos

- **[MySQL 8.0+](https://mysql.com)** - Base de datos relacional principal
- **45+ tablas** con relaciones complejas optimizadas
- **Índices estratégicos** para consultas de alta performance
- **Soft deletes** y auditoría en modelos críticos

### ☁️ Servicios Externos (Preparados)

- **[FCM](https://firebase.google.com/docs/cloud-messaging)** - Push notifications
- **[Twilio](https://www.twilio.com)** - SMS notifications
- **[AWS S3](https://aws.amazon.com/s3)** - Almacenamiento en la nube

### 🛠️ Desarrollo

- **[Laravel Telescope](https://laravel.com/docs/telescope)** - Debugging
- **[Laravel Debugbar](https://github.com/barryvdh/laravel-debugbar)** - Debug bar
- **[PHPStan](https://phpstan.org)** - Análisis estático *(planeado)*

---

## ⚙️ Instalación

### 📋 Prerequisitos

```bash
# Verificar versiones requeridas
php --version    # PHP 8.2+
composer --version # Composer 2.x
mysql --version    # MySQL 8.0+
node --version     # Node.js 18+ (opcional)
```

### 🚀 Instalación Completa

#### 1️⃣ Clonar el Repositorio

```bash
git clone https://github.com/tu-usuario/volleypass.git
cd volleypass
```

#### 2️⃣ Instalar Dependencias

```bash
# Dependencias PHP
composer install

# Dependencias Node.js (opcional)
npm install && npm run build
```

#### 3️⃣ Configurar Entorno

```bash
# Copiar archivo de configuración
cp .env.example .env

# Generar clave de aplicación
php artisan key:generate

# Crear enlace de almacenamiento
php artisan storage:link
```

#### 4️⃣ Configurar Base de Datos

```bash
# Editar .env con tus credenciales de BD
DB_CONNECTION=mysql
DB_HOST=127.0.0.1
DB_PORT=3306
DB_DATABASE=volleypass
DB_USERNAME=tu_usuario
DB_PASSWORD=tu_password
```

#### 5️⃣ Ejecutar Migraciones y Seeders

```bash
# Crear todas las tablas y datos iniciales
php artisan migrate:fresh --seed
```

#### 6️⃣ Configurar Permisos

```bash
# Permisos de almacenamiento
chmod -R 755 storage bootstrap/cache
```

---

## 🚀 Inicio Rápido

### 🖥️ Servidor de Desarrollo

```bash
# Iniciar servidor
php artisan serve

# Acceder a la aplicación
# http://localhost:8000
```

### 👤 Usuarios de Prueba

El seeder crea automáticamente usuarios de ejemplo:

| Email | Contraseña | Rol |
|-------|------------|-----|
| `admin@volleypass.com` | `password` | SuperAdmin |
| `liga@volleypass.com` | `password` | LeagueAdmin |
| `club@volleypass.com` | `password` | ClubDirector |

### 🧪 Verificar Instalación

```bash
# Ejecutar tests (cuando estén implementados)
php artisan test

# Verificar configuración del sistema
php artisan config:show

# Comprobar rutas disponibles
php artisan route:list

# Verificar jobs en cola
php artisan queue:work

# Probar notificaciones
php artisan volleypass:test-notifications 1

# Generar carnets de prueba
php artisan volleypass:generate-season-cards 2025
```

### 📊 Telescope (Debugging)

```bash
# Acceder a Telescope
# http://localhost:8000/telescope
```

---

## 📊 Estado del Proyecto

### ✅ **Fase 1 - Infraestructura Base** (Completada)

| Componente | Estado | Progreso |
|------------|--------|----------|
| 🔐 Sistema de Autenticación | ✅ Completado | 100% |
| 👥 Gestión de Roles (7 roles) | ✅ Completado | 100% |
| 🏛️ Estructura Organizacional | ✅ Completado | 100% |
| 🌍 Ubicaciones Geográficas | ✅ Completado | 100% |
| 📦 Integración Spatie (8 paquetes) | ✅ Completado | 100% |
| 📝 Sistema de Logging | ✅ Completado | 100% |

### ✅ **Fase 2 - Carnetización Digital** (Completada)

| Componente | Estado | Progreso |
|------------|--------|----------|
| 📄 Gestión de Documentos | ✅ Completado | 100% |
| 🆔 Carnets Digitales con QR | ✅ Completado | 100% |
| 🔍 API de Verificación | ✅ Completado | 100% |
| 🏥 Módulo Médico Avanzado | ✅ Completado | 100% |
| 🔔 Sistema de Notificaciones | ✅ Completado | 100% |
| ⚙️ Jobs y Comandos Automáticos | ✅ Completado | 100% |
| 📊 Logging y Auditoría Completa | ✅ Completado | 100% |

### 🚧 **Fase 3 - Gestión Avanzada** (En Desarrollo)

| Componente | Estado | Progreso |
|------------|--------|----------|
| 🏆 Gestión de Torneos | ⏳ Pendiente | 0% |
| 📊 Estadísticas Deportivas | ⏳ Pendiente | 0% |
| 🏅 Sistema de Premios | ⏳ Pendiente | 0% |
| 💰 Gestión de Pagos | ⏳ Pendiente | 0% |
| 📱 App Móvil (React Native) | ⏳ Pendiente | 0% |

### 📅 **Roadmap**

- **✅ Q4 2024**: Fase 1 completada (Infraestructura base)
- **✅ Q1 2025**: Fase 2 completada (Carnetización digital)
- **🚧 Q2 2025**: Fase 3 (Gestión avanzada y estadísticas)
- **📱 Q3 2025**: App Móvil nativa (React Native)
- **🌐 Q4 2025**: Integración con otras ligas departamentales

---

## 🛡️ Seguridad y Performance

### 🔒 **Medidas de Seguridad Implementadas**

- **Hash SHA-256** para códigos QR únicos
- **Tokens de verificación** adicionales
- **Rate limiting** en API de verificación
- **Validación estricta** de documentos
- **Auditoría completa** de todas las acciones
- **Soft deletes** para recuperación de datos

### ⚡ **Optimizaciones de Performance**

- **Cache inteligente** para consultas frecuentes
- **Índices estratégicos** en base de datos
- **Jobs en cola** para operaciones pesadas
- **Batch processing** para notificaciones masivas
- **API optimizada** con respuestas < 100ms
- **Lazy loading** para relaciones complejas

### 📈 **Monitoreo y Mantenimiento**

#### 📊 **Herramientas de Monitoreo**

```bash
# Telescope para debugging en desarrollo
http://localhost:8000/telescope

# Logs detallados por categoría
storage/logs/laravel.log

# Métricas de verificaciones QR
php artisan volleypass:generate-report daily

# Estado de jobs en cola
php artisan queue:monitor
```

#### 🔧 **Mantenimiento Automático**

- **Limpieza de logs** antiguos programada
- **Respaldos automáticos** de base de datos
- **Notificaciones** de vencimientos
- **Reportes estadísticos** programados
- **Validación** de integridad de datos

---

## 🚀 Comandos Especializados

VolleyPass incluye comandos personalizados para gestión automatizada:

```bash
# Enviar notificaciones de vencimiento
php artisan volleypass:send-expiry-notifications --days=30

# Generar carnets para nueva temporada
php artisan volleypass:generate-season-cards 2025

# Limpiar logs antiguos del sistema
php artisan volleypass:cleanup-logs --qr-days=365

# Generar reportes estadísticos
php artisan volleypass:generate-report weekly --email=admin@liga.com

# Probar sistema de notificaciones
php artisan volleypass:test-notifications 1
```

### ⚡ Tareas Programadas

El sistema ejecuta automáticamente:

- **Diario 08:00**: Notificaciones de vencimiento de carnets
- **Diario 06:00**: Verificación de certificados médicos vencidos
- **Lunes 09:00**: Reporte semanal de estadísticas
- **Mensual**: Limpieza de logs antiguos y reportes mensuales

---

## 🧪 Testing

```bash
# Ejecutar todos los tests (cuando estén implementados)
php artisan test

# Tests con cobertura
php artisan test --coverage

# Verificar integridad del sistema
php artisan volleypass:test-notifications 1
```

---

## 🤝 Contribuir

¡Las contribuciones son bienvenidas! Este proyecto sigue las mejores prácticas de desarrollo.

### 📝 Guías de Contribución

1. **Fork** el proyecto
2. **Crea** una rama para tu feature (`git checkout -b feature/AmazingFeature`)
3. **Commit** tus cambios (`git commit -m 'Add some AmazingFeature'`)
4. **Push** a la rama (`git push origin feature/AmazingFeature`)
5. **Abre** un Pull Request

### 📋 Estándares de Código

- **PSR-12** para estilo de código PHP
- **Laravel conventions** para nombres y estructura
- **Eloquent** preferido sobre Query Builder
- **Comentarios en español** para lógica de negocio
- **Enums** para todos los estados y tipos
- **Traits** para funcionalidades reutilizables
- **Services** para lógica de negocio compleja
- **Jobs** para procesamiento asíncrono

### 🏐 **Características Implementadas**

**Sistema Completo de Carnetización Digital:**

- ✅ Generación automática de carnets con QR únicos
- ✅ API REST optimizada para verificación en tiempo real
- ✅ Estados médicos avanzados con restricciones específicas
- ✅ Notificaciones inteligentes multi-canal
- ✅ Gestión completa de documentos con versionado
- ✅ Logging detallado para auditoría y debugging
- ✅ 45+ migraciones con datos reales de Colombia
- ✅ 25+ enums para estados y validaciones
- ✅ 8 traits reutilizables para funcionalidades comunes
- ✅ Comandos automáticos para mantenimiento del sistema

**Flujo Operativo Completo:**

1. Director de club carga documentos de jugadora
2. Liga admin revisa y aprueba documentación
3. Sistema genera carnet digital automáticamente
4. Verificador escanea QR en eventos deportivos
5. API valida instantáneamente y retorna estado
6. Sistema registra toda la actividad para auditoría

---

## 📞 Soporte y Contacto

### 🏐 **Liga de Voleibol de Sucre**

- 📧 **Email**: <liga@volleypass.sucre.gov.co>
- 📱 **WhatsApp**: +57 (5) 282-5555
- 🏢 **Dirección**: Cra. 25 #16-50, Sincelejo, Sucre
- 🌐 **Website**: [volleypass.sucre.gov.co](#)

### 💻 **Soporte Técnico**

- 📧 **Email**: <soporte@volleypass.sucre.gov.co>
- 📋 **Issues**: [GitHub Issues](https://github.com/volleypass/volleypass/issues)
- 📖 **Documentación**: [docs.volleypass.sucre.gov.co](#)
- 🚨 **Emergencias**: +57 300 123 4567 (24/7)

### 🎓 **Capacitación y Recursos**

- 📹 **Tutoriales**: Canal YouTube VolleyPass
- 📚 **Manuales**: Biblioteca digital de recursos
- 🎯 **Webinars**: Capacitaciones mensuales para usuarios
- 💬 **Comunidad**: Grupo WhatsApp de soporte

---

## 📄 Licencia

Este proyecto está licenciado bajo la **Licencia MIT**. Ver [LICENSE](LICENSE) para más detalles.

### 🤝 Uso Permitido

- ✅ Uso comercial y no comercial
- ✅ Modificación y distribución
- ✅ Uso privado y público
- ✅ Inclusión en otros proyectos

### ⚠️ Limitaciones

- ❌ Sin garantía de funcionamiento
- ❌ Los autores no asumen responsabilidad
- ❌ Marca "VolleyPass" es propiedad del desarrollador

---

## 🙏 Agradecimientos Especiales

### 👨‍💻 **Comunidad Técnica**

- **Comunidad Laravel Colombia** - Por el apoyo y feedback
- **Spatie Team** - Por los excelentes paquetes open source
- **Filament PHP** - Por los componentes UI modernos
- **Livewire Team** - Por la reactividad sin complicaciones

### 🏐 **Comunidad Deportiva**

- **Clubes participantes** - Por las pruebas y retroalimentación
- **Jugadoras voluntarias** - Por participar en el piloto
- **Entrenadores** - Por adoptar la nueva tecnología
- **Verificadores** - Por validar el sistema en campo

---

<div align="center">

**🏐 Desarrollado con ❤️ para el voleibol sucreño**

*"Digitalizando el deporte, fortaleciendo la comunidad"*

### 🌟 **Stats del Proyecto**

![GitHub Stars](https://img.shields.io/github/stars/volleypass/volleypass?style=social)
![GitHub Forks](https://img.shields.io/github/forks/volleypass/volleypass?style=social)
![GitHub Issues](https://img.shields.io/github/issues/volleypass/volleypass)
![GitHub Contributors](https://img.shields.io/github/contributors/volleypass/volleypass)

### 📊 **Métricas de Desarrollo**

![Lines of Code](https://img.shields.io/tokei/lines/github/volleypass/volleypass?label=Lines%20of%20Code)
![PHP Version](https://img.shields.io/packagist/php-v/volleypass/volleypass?label=PHP%20Version)
![Laravel Version](https://img.shields.io/badge/Laravel-12.x-FF2D20)
![Last Commit](https://img.shields.io/github/last-commit/volleypass/volleypass)

[⬆️ Volver arriba](#-volleypass-sucre)

</div>
