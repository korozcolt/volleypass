# =======================
# INSTALACIÓN DE DEPENDENCIAS DE TERCEROS - VOLLEYPASS (WINDOWS)
# =======================
# Ejecutar en PowerShell como Administrador o en CMD

# Función para mostrar mensajes con colores (PowerShell)
function Write-ColorOutput($ForegroundColor) {
    $fc = $host.UI.RawUI.ForegroundColor
    $host.UI.RawUI.ForegroundColor = $ForegroundColor
    if ($args) {
        Write-Output $args
    } else {
        $input | Write-Output
    }
    $host.UI.RawUI.ForegroundColor = $fc
}

# Verificar que estamos en el directorio del proyecto Laravel
if (!(Test-Path "artisan")) {
    Write-ColorOutput Red "❌ Error: No se encuentra el archivo 'artisan'. Asegúrate de estar en el directorio raíz del proyecto Laravel."
    exit 1
}

Write-ColorOutput Green "🚀 Iniciando instalación de dependencias para VolleyPass..."

# 1. PAQUETES DE SPATIE
Write-ColorOutput Cyan "📦 Instalando paquetes de Spatie..."

# Sistema de permisos y roles
Write-ColorOutput White "Instalando spatie/laravel-permission..."
composer require spatie/laravel-permission

# Manejo de archivos multimedia
Write-ColorOutput White "Instalando spatie/laravel-medialibrary..."
composer require spatie/laravel-medialibrary

# Sistema de respaldos
Write-ColorOutput White "Instalando spatie/laravel-backup..."
composer require spatie/laravel-backup

# Logs de actividad
Write-ColorOutput White "Instalando spatie/laravel-activitylog..."
composer require spatie/laravel-activitylog

# Optimización de imágenes
Write-ColorOutput White "Instalando spatie/image-optimizer..."
composer require spatie/image-optimizer

# Cache de respuestas HTTP
Write-ColorOutput White "Instalando spatie/laravel-responsecache..."
composer require spatie/laravel-responsecache

# Configuraciones del sistema
Write-ColorOutput White "Instalando spatie/laravel-settings..."
composer require spatie/laravel-settings

# 2. GENERACIÓN DE CÓDIGOS QR
Write-ColorOutput Cyan "📱 Instalando generador de QR..."
composer require simplesoftwareio/simple-qrcode

# 3. PAQUETES ADICIONALES ÚTILES
Write-ColorOutput Cyan "⚙️ Instalando paquetes complementarios..."

# Para manipulación de imágenes
Write-ColorOutput White "Instalando intervention/image..."
composer require intervention/image

# Para exportar datos (Excel, PDF)
Write-ColorOutput White "Instalando maatwebsite/excel..."
composer require maatwebsite/excel

# Para notificaciones push
Write-ColorOutput White "Instalando laravel-notification-channels/fcm..."
composer require laravel-notification-channels/fcm

# Para APIs REST robustas
Write-ColorOutput White "Instalando spatie/laravel-fractal..."
composer require spatie/laravel-fractal

# Para slugs automáticos
Write-ColorOutput White "Instalando spatie/laravel-sluggable..."
composer require spatie/laravel-sluggable

# Para validaciones avanzadas
Write-ColorOutput White "Instalando spatie/laravel-validation-rules..."
composer require spatie/laravel-validation-rules

# Para manejo de coordenadas GPS
Write-ColorOutput White "Instalando spatie/geocoder..."
composer require spatie/geocoder

# Para cache de consultas pesadas
Write-ColorOutput White "Instalando spatie/laravel-query-builder..."
composer require spatie/laravel-query-builder

# 4. HERRAMIENTAS DE DESARROLLO
Write-ColorOutput Cyan "🛠️ Instalando herramientas de desarrollo..."

# IDE Helper para autocompletado
Write-ColorOutput White "Instalando barryvdh/laravel-ide-helper..."
composer require --dev barryvdh/laravel-ide-helper

# Debugbar para desarrollo
Write-ColorOutput White "Instalando barryvdh/laravel-debugbar..."
composer require --dev barryvdh/laravel-debugbar

# Telescope para debugging avanzado
Write-ColorOutput White "Instalando laravel/telescope..."
composer require laravel/telescope --dev

# 5. PUBLICAR CONFIGURACIONES Y MIGRACIONES
Write-ColorOutput Cyan "📋 Publicando configuraciones..."

# Spatie Permission
Write-ColorOutput White "Publicando Spatie Permission..."
php artisan vendor:publish --provider="Spatie\Permission\PermissionServiceProvider"

# Spatie Media Library
Write-ColorOutput White "Publicando Spatie Media Library..."
php artisan vendor:publish --provider="Spatie\MediaLibrary\MediaLibraryServiceProvider" --tag="medialibrary-migrations"

# Spatie Backup
Write-ColorOutput White "Publicando Spatie Backup..."
php artisan vendor:publish --provider="Spatie\Backup\BackupServiceProvider"

# Spatie Activity Log
Write-ColorOutput White "Publicando Spatie Activity Log..."
php artisan vendor:publish --provider="Spatie\Activitylog\ActivitylogServiceProvider" --tag="activitylog-migrations"

# Spatie Settings
Write-ColorOutput White "Publicando Spatie Settings..."
php artisan vendor:publish --provider="Spatie\LaravelSettings\LaravelSettingsServiceProvider" --tag="migrations"

# Spatie Response Cache
Write-ColorOutput White "Publicando Spatie Response Cache..."
php artisan vendor:publish --provider="Spatie\ResponseCache\ResponseCacheServiceProvider"

# Telescope
Write-ColorOutput White "Instalando Telescope..."
php artisan telescope:install

# IDE Helper
Write-ColorOutput White "Generando IDE Helper..."
php artisan ide-helper:generate

# 6. CREAR DIRECTORIOS NECESARIOS
Write-ColorOutput Cyan "📁 Creando directorios necesarios..."

# Crear directorios de almacenamiento
if (!(Test-Path "storage\app\media")) {
    New-Item -ItemType Directory -Path "storage\app\media" -Force
    Write-ColorOutput Green "✅ Directorio storage\app\media creado"
}

if (!(Test-Path "storage\app\backups")) {
    New-Item -ItemType Directory -Path "storage\app\backups" -Force
    Write-ColorOutput Green "✅ Directorio storage\app\backups creado"
}

if (!(Test-Path "storage\app\qrcodes")) {
    New-Item -ItemType Directory -Path "storage\app\qrcodes" -Force
    Write-ColorOutput Green "✅ Directorio storage\app\qrcodes creado"
}

if (!(Test-Path "storage\app\exports")) {
    New-Item -ItemType Directory -Path "storage\app\exports" -Force
    Write-ColorOutput Green "✅ Directorio storage\app\exports creado"
}

# Crear enlace de almacenamiento
Write-ColorOutput White "Creando enlace de storage..."
php artisan storage:link

# 7. EJECUTAR MIGRACIONES DE TERCEROS
Write-ColorOutput Cyan "🗄️ Ejecutando migraciones de terceros..."
php artisan migrate --force

# 8. CONFIGURACIONES PARA .ENV
Write-ColorOutput Cyan "📝 Configuraciones para agregar al archivo .env:"
Write-ColorOutput Yellow ""
Write-ColorOutput Yellow "# Spatie Media Library"
Write-ColorOutput Yellow "MEDIA_DISK=public"
Write-ColorOutput Yellow ""
Write-ColorOutput Yellow "# Spatie Backup"
Write-ColorOutput Yellow "BACKUP_DISK=local"
Write-ColorOutput Yellow "BACKUP_NOTIFICATION_MAIL_FROM=admin@volleypass.sucre.gov.co"
Write-ColorOutput Yellow ""
Write-ColorOutput Yellow "# Response Cache"
Write-ColorOutput Yellow "RESPONSE_CACHE_ENABLED=true"
Write-ColorOutput Yellow "RESPONSE_CACHE_DRIVER=file"
Write-ColorOutput Yellow ""
Write-ColorOutput Yellow "# QR Code Settings"
Write-ColorOutput Yellow "QR_CODE_DISK=public"
Write-ColorOutput Yellow "QR_CODE_PATH=qrcodes"
Write-ColorOutput Yellow ""
Write-ColorOutput Yellow "# Image Optimization"
Write-ColorOutput Yellow "IMAGE_OPTIMIZER_ENABLED=true"
Write-ColorOutput Yellow ""
Write-ColorOutput Yellow "# FCM (Push Notifications)"
Write-ColorOutput Yellow "FCM_SERVER_KEY=your-fcm-server-key"
Write-ColorOutput Yellow "FCM_SENDER_ID=your-sender-id"

# 9. CONFIGURACIONES ESPECÍFICAS REQUERIDAS
Write-ColorOutput Cyan ""
Write-ColorOutput Cyan "⚙️ Configuraciones específicas requeridas:"
Write-ColorOutput White ""
Write-ColorOutput White "1. SPATIE PERMISSION - config\permission.php"
Write-ColorOutput White "   - Cambiar 'teams' => true (para múltiples ligas)"
Write-ColorOutput White "   - Configurar cache driver apropiado"
Write-ColorOutput White ""
Write-ColorOutput White "2. SPATIE MEDIA LIBRARY - config\media-library.php"
Write-ColorOutput White "   - Configurar disk por defecto"
Write-ColorOutput White "   - Habilitar optimización de imágenes"
Write-ColorOutput White "   - Configurar conversiones automáticas"
Write-ColorOutput White ""
Write-ColorOutput White "3. SPATIE BACKUP - config\backup.php"
Write-ColorOutput White "   - Configurar directorios a respaldar"
Write-ColorOutput White "   - Configurar notificaciones por email"
Write-ColorOutput White "   - Configurar limpieza automática"

# 10. COMANDOS DE VERIFICACIÓN
Write-ColorOutput Cyan ""
Write-ColorOutput Cyan "🔍 Comandos de verificación:"
Write-ColorOutput White ""
Write-ColorOutput White "# Verificar que todos los paquetes están instalados:"
Write-ColorOutput White "composer show | findstr spatie"
Write-ColorOutput White ""
Write-ColorOutput White "# Verificar configuraciones publicadas:"
Write-ColorOutput White "dir config\ | findstr /E 'permission media backup activitylog'"
Write-ColorOutput White ""
Write-ColorOutput White "# Verificar migraciones:"
Write-ColorOutput White "php artisan migrate:status"
Write-ColorOutput White ""
Write-ColorOutput White "# Verificar storage:"
Write-ColorOutput White "dir storage\app\"

# RESUMEN FINAL
Write-ColorOutput Green ""
Write-ColorOutput Green "🎉 ¡Instalación completada!"
Write-ColorOutput Green ""
Write-ColorOutput Green "📋 PRÓXIMOS PASOS:"
Write-ColorOutput White "1. Agregar las configuraciones .ENV mostradas arriba"
Write-ColorOutput White "2. Modificar archivos de configuración según necesidades"
Write-ColorOutput White "3. Ejecutar: php artisan config:cache"
Write-ColorOutput White "4. Ejecutar: php artisan route:cache"
Write-ColorOutput White "5. Continuar con la Fase 2 de modelos"
Write-ColorOutput Green ""
Write-ColorOutput Green "✅ Sistema listo para usar Spatie packages!"

# =======================
# VERSIÓN ALTERNATIVA PARA CMD (Command Prompt)
# =======================

<#
VERSIÓN PARA CMD - Guardar como install_dependencies.bat

@echo off
echo 🚀 Iniciando instalación de dependencias para VolleyPass...

REM Verificar que estamos en el directorio correcto
if not exist "artisan" (
    echo ❌ Error: No se encuentra el archivo 'artisan'.
    echo Asegúrate de estar en el directorio raíz del proyecto Laravel.
    pause
    exit /b 1
)

echo 📦 Instalando paquetes de Spatie...
composer require spatie/laravel-permission
composer require spatie/laravel-medialibrary
composer require spatie/laravel-backup
composer require spatie/laravel-activitylog
composer require spatie/image-optimizer
composer require spatie/laravel-responsecache
composer require spatie/laravel-settings

echo 📱 Instalando generador de QR...
composer require simplesoftwareio/simple-qrcode

echo ⚙️ Instalando paquetes complementarios...
composer require intervention/image
composer require maatwebsite/excel
composer require laravel-notification-channels/fcm
composer require spatie/laravel-fractal
composer require spatie/laravel-sluggable
composer require spatie/laravel-validation-rules
composer require spatie/geocoder
composer require spatie/laravel-query-builder

echo 🛠️ Instalando herramientas de desarrollo...
composer require --dev barryvdh/laravel-ide-helper
composer require --dev barryvdh/laravel-debugbar
composer require laravel/telescope --dev

echo 📋 Publicando configuraciones...
php artisan vendor:publish --provider="Spatie\Permission\PermissionServiceProvider"
php artisan vendor:publish --provider="Spatie\MediaLibrary\MediaLibraryServiceProvider" --tag="medialibrary-migrations"
php artisan vendor:publish --provider="Spatie\Backup\BackupServiceProvider"
php artisan vendor:publish --provider="Spatie\Activitylog\ActivitylogServiceProvider" --tag="activitylog-migrations"
php artisan vendor:publish --provider="Spatie\LaravelSettings\LaravelSettingsServiceProvider" --tag="migrations"
php artisan vendor:publish --provider="Spatie\ResponseCache\ResponseCacheServiceProvider"
php artisan telescope:install
php artisan ide-helper:generate

echo 📁 Creando directorios...
if not exist "storage\app\media" mkdir "storage\app\media"
if not exist "storage\app\backups" mkdir "storage\app\backups"
if not exist "storage\app\qrcodes" mkdir "storage\app\qrcodes"
if not exist "storage\app\exports" mkdir "storage\app\exports"

echo Creando enlace de storage...
php artisan storage:link

echo 🗄️ Ejecutando migraciones...
php artisan migrate --force

echo.
echo 🎉 ¡Instalación completada!
echo.
echo 📝 Agregar al archivo .env:
echo MEDIA_DISK=public
echo BACKUP_DISK=local
echo BACKUP_NOTIFICATION_MAIL_FROM=admin@volleypass.sucre.gov.co
echo RESPONSE_CACHE_ENABLED=true
echo RESPONSE_CACHE_DRIVER=file
echo QR_CODE_DISK=public
echo QR_CODE_PATH=qrcodes
echo IMAGE_OPTIMIZER_ENABLED=true
echo.
pause
#>
