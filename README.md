# 🏐 VolleyPass Sucre

<div align="center">

![VolleyPass Logo](https://i.ibb.co/99TJDJRZ/logo-volley-pass-black-back.png)

**Plataforma Integral de Gestión para Ligas de Voleibol**

[![Laravel](https://img.shields.io/badge/Laravel-10.x-red.svg)](https://laravel.com)
[![PHP](https://img.shields.io/badge/PHP-8.2+-blue.svg)](https://php.net)
[![Filament](https://img.shields.io/badge/Filament-3.x-yellow.svg)](https://filamentphp.com)
[![License](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)

*Sistema de carnetización digital y gestión deportiva para la Liga de Voleibol de Sucre*

---

**Desarrollado por:** [Kristian Orozco](https://github.com/korozcolt)  
**Auspiciado por:** [Club Athletic Sincelejo](https://www.instagram.com/athletic_sincelejo/)

</div>

## 📋 Tabla de Contenidos

- [Descripción del Proyecto](#-descripción-del-proyecto)
- [Características Principales](#-características-principales)
- [Estado del Desarrollo](#-estado-del-desarrollo)
- [Arquitectura del Sistema](#️-arquitectura-del-sistema)
- [Dependencias de Terceros](#-dependencias-de-terceros)
- [Instalación](#-instalación)
- [Uso](#-uso)
- [Roadmap](#-roadmap)
- [Contribución](#-contribución)
- [Licencia](#-licencia)

## 🎯 Descripción del Proyecto

**VolleyPass Sucre** es una plataforma integral diseñada para digitalizar y modernizar la gestión de la Liga de Voleibol de Sucre, Colombia. El sistema permite el registro, verificación y gestión completa de jugadoras, entrenadores y clubes, garantizando transparencia, eficiencia y control en torneos oficiales.

### 🌟 Objetivos Principales

- **Digitalizar** el proceso de carnetización deportiva
- **Centralizar** la información de jugadoras y equipos técnicos
- **Automatizar** verificaciones en competencias oficiales
- **Generar** estadísticas y reportes avanzados
- **Garantizar** transparencia en el deporte organizado

## ✨ Características Principales

### 🏅 Gestión Deportiva
- **Registro completo** de jugadoras por categorías de edad
- **Sistema de clubes y ligas** con jerarquía organizacional
- **Gestión de entrenadores** y personal técnico
- **Control de transferencias** entre clubes

### 🏥 Módulo Médico
- **Certificados médicos** con validación automática
- **Historial de lesiones** y recuperaciones
- **Estados de aptitud** médica en tiempo real
- **Alertas automáticas** por vencimientos

### 🎫 Carnetización Digital
- **Carnets digitales** con códigos QR únicos
- **Verificación instantánea** en competencias
- **Estados dinámicos** (Activo, Vencido, Suspendido)
- **Historial completo** de validaciones

### 📊 Estadísticas y Reportes
- **Estadísticas individuales** por jugadora
- **Métricas por equipo** y temporada
- **Ranking automático** por categorías
- **Reportes exportables** en Excel/PDF

### 🔐 Sistema de Seguridad
- **Roles granulares** por nivel organizacional
- **Permisos específicos** por módulo
- **Auditoría completa** de todas las acciones
- **Autenticación robusta** con múltiples niveles

## 📈 Estado del Desarrollo

### ✅ Completado (25%)

#### **Fase 1: Fundamentos**
- [x] **Arquitectura base** definida y validada
- [x] **27 Enumerables** completos con interfaces Filament
- [x] **10 Traits especializados** para funcionalidades comunes
- [x] **Sistema de ubicaciones** (Colombia: 32 departamentos, 1100+ municipios)
- [x] **Dependencias de terceros** instaladas y configuradas
- [x] **Base de datos** estructurada con migraciones

#### **Enumerables Implementados**
- [x] Estados de usuario (UserStatus, CardStatus, DocumentStatus)
- [x] Roles del sistema (UserRole, AccessLevel)
- [x] Deportivos (PlayerPosition, PlayerCategory, Gender)
- [x] Competencias (TournamentType, TournamentStatus, MatchStatus)
- [x] Médicos (MedicalStatus, InjuryType, InjurySeverity)
- [x] Documentos (DocumentType, DocumentFormat)
- [x] Estadísticas (StatisticType, AwardType)
- [x] Sistema (NotificationType, LogLevel, PaymentStatus)
- [x] Configuración (ConfigurationType, Priority)

#### **Traits Desarrollados**
- [x] `HasUuid` - Identificadores únicos
- [x] `HasSearch` - Búsquedas avanzadas
- [x] `HasValidation` - Validaciones específicas colombianas
- [x] `HasStatus` - Gestión de estados
- [x] `HasTimestamps` - Auditoría de cambios
- [x] `HasPermissions` - Control de acceso
- [x] `EnumHelpers` - Utilidades para enumerables

### 🔄 En Progreso (15%)

#### **Fase 1 Extendida: Integración con Spatie**
- [ ] **Migración a Spatie ActivityLog** (en proceso)
- [ ] **Configuración de Spatie Permission** con teams
- [ ] **Integración de Spatie MediaLibrary** para archivos
- [ ] **Actualización de modelos** base con nuevas funcionalidades

### ⏳ Planificado (60%)

#### **Fase 2: Organización Deportiva (20%)**
- [ ] Modelos de Liga y Club
- [ ] Sistema de roles y permisos
- [ ] Perfiles extendidos de usuario
- [ ] Gestión de archivos multimedia

#### **Fase 3: Usuarios Deportivos (25%)**
- [ ] Modelo completo de Jugadoras
- [ ] Sistema de documentación
- [ ] Validaciones específicas de voleibol
- [ ] Upload funcional de archivos

#### **Fase 4: Módulo Médico y Carnetización (20%)**
- [ ] Sistema médico integral
- [ ] Carnetización digital con QR
- [ ] Validaciones médicas automatizadas
- [ ] Estados y transiciones médicas

#### **Fase 5: Competencias y Estadísticas (30%)**
- [ ] Sistema completo de torneos
- [ ] Gestión de partidos y equipos
- [ ] Estadísticas avanzadas
- [ ] Algoritmos de ranking

#### **Fase 6: Servicios Avanzados (25%)**
- [ ] Sistema de verificación QR
- [ ] Gestión de transferencias
- [ ] Notificaciones automáticas
- [ ] Sistema de pagos

#### **Fase 7: Interfaz Administrativa (30%)**
- [ ] Dashboard completo en Filament
- [ ] Resources para todos los modelos
- [ ] Widgets y estadísticas
- [ ] Sistema de permisos en UI

#### **Fase 8: Frontend Público (25%)**
- [ ] Portal para jugadoras
- [ ] Sistema de consulta de carnets
- [ ] APIs públicas
- [ ] Aplicación móvil (futuro)

## 🏗️ Arquitectura del Sistema

### **Stack Tecnológico**
- **Backend:** Laravel 10.x + PHP 8.2+
- **Frontend Admin:** Filament 3.x
- **Base de Datos:** MySQL 8.0+
- **Cache:** Redis (recomendado)
- **Files:** Almacenamiento local/S3

### **Patrones de Diseño**
- **Repository Pattern** para acceso a datos
- **Service Pattern** para lógica de negocio
- **Observer Pattern** para auditoría
- **Strategy Pattern** para validaciones

### **Estructura de Datos**
```
Country -> Department -> City
    ↓         ↓         ↓
   League -> Club -> User -> Player
    ↓         ↓       ↓
Tournament -> Team -> Statistics
```

## 📦 Dependencias de Terceros

### **Spatie Ecosystem**
| Paquete | Versión | Propósito |
|---------|---------|-----------|
| [spatie/laravel-permission](https://github.com/spatie/laravel-permission) | ^6.0 | Sistema de roles y permisos |
| [spatie/laravel-medialibrary](https://github.com/spatie/laravel-medialibrary) | ^11.0 | Gestión de archivos multimedia |
| [spatie/laravel-activitylog](https://github.com/spatie/laravel-activitylog) | ^4.0 | Auditoría y logs de actividad |
| [spatie/laravel-backup](https://github.com/spatie/laravel-backup) | ^8.0 | Respaldos automatizados |
| [spatie/image-optimizer](https://github.com/spatie/image-optimizer) | ^1.0 | Optimización de imágenes |
| [spatie/laravel-responsecache](https://github.com/spatie/laravel-responsecache) | ^7.0 | Cache de respuestas HTTP |
| [spatie/laravel-settings](https://github.com/spatie/laravel-settings) | ^3.0 | Configuraciones dinámicas |

### **Funcionalidades Especializadas**
| Paquete | Versión | Propósito |
|---------|---------|-----------|
| [simplesoftwareio/simple-qrcode](https://github.com/SimpleSoftwareIO/simple-qrcode) | ^4.0 | Generación de códigos QR |
| [intervention/image](https://github.com/Intervention/image) | ^3.0 | Manipulación de imágenes |
| [maatwebsite/excel](https://github.com/SpartnerNL/Laravel-Excel) | ^3.0 | Exportación Excel/CSV |
| [laravel-notification-channels/fcm](https://github.com/laravel-notification-channels/fcm) | ^4.0 | Notificaciones push |

### **Herramientas de Desarrollo**
| Paquete | Versión | Propósito |
|---------|---------|-----------|
| [laravel/telescope](https://github.com/laravel/telescope) | ^4.0 | Debugging y monitoreo |
| [barryvdh/laravel-ide-helper](https://github.com/barryvdh/laravel-ide-helper) | ^2.0 | Autocompletado IDE |
| [barryvdh/laravel-debugbar](https://github.com/barryvdh/laravel-debugbar) | ^3.0 | Debug toolbar |

## 🚀 Instalación

### **Requisitos del Sistema**
- PHP 8.2 o superior
- Composer 2.x
- Node.js 18+ y NPM
- MySQL 8.0+ o PostgreSQL 13+
- Redis (opcional, recomendado)

### **Instalación Paso a Paso**

```bash
# 1. Clonar el repositorio
git clone https://github.com/korozcolt/volleypass-sucre.git
cd volleypass-sucre

# 2. Instalar dependencias PHP
composer install

# 3. Instalar dependencias Node.js
npm install

# 4. Configurar archivo de entorno
cp .env.example .env
php artisan key:generate

# 5. Configurar base de datos en .env
DB_CONNECTION=mysql
DB_HOST=127.0.0.1
DB_PORT=3306
DB_DATABASE=volleypass
DB_USERNAME=root
DB_PASSWORD=

# 6. Ejecutar migraciones y seeders
php artisan migrate:fresh --seed

# 7. Crear enlace de storage
php artisan storage:link

# 8. Compilar assets
npm run build

# 9. Iniciar servidor de desarrollo
php artisan serve
```

### **Configuración Adicional**

```bash
# Configurar permisos de storage
chmod -R 775 storage/
chmod -R 775 bootstrap/cache/

# Configurar cache (opcional)
php artisan config:cache
php artisan route:cache
php artisan view:cache
```

## 💡 Uso

### **Acceso Administrativo**
```
URL: http://localhost:8000/admin
Usuario: admin@volleypass.com (será creado en seeders)
```

### **Gestión de Jugadoras**
1. **Registro:** Admin/Club Director registra jugadora
2. **Documentación:** Upload de documentos requeridos
3. **Validación Médica:** Doctor deportivo aprueba certificado
4. **Carnetización:** Sistema genera carnet digital con QR
5. **Verificación:** Scan QR en competencias oficiales

### **Comandos Artisan Personalizados**
```bash
# Generar carnets masivos
php artisan volleypass:generate-cards

# Verificar documentos vencidos
php artisan volleypass:check-expired-docs

# Backup automático
php artisan backup:run

# Limpiar logs antiguos
php artisan activitylog:clean
```

## 🗺️ Roadmap

### **Q2 2025 - Fase Fundacional**
- [x] Arquitectura base y dependencias
- [ ] Sistema de organizaciones (Ligas/Clubes)
- [ ] Gestión básica de usuarios

### **Q3 2025 - Core Deportivo**
- [ ] Registro completo de jugadoras
- [ ] Sistema médico integral
- [ ] Carnetización digital funcional

### **Q4 2025 - Competencias**
- [ ] Gestión de torneos
- [ ] Sistema de estadísticas
- [ ] Verificación QR en tiempo real

### **Q1 2026 - Expansión**
- [ ] APIs públicas
- [ ] Dashboard analítico avanzado
- [ ] Aplicación móvil

### **Futuro**
- [ ] Integración con otras disciplinas deportivas
- [ ] IA para análisis de rendimiento
- [ ] Blockchain para certificación de logros

## 🤝 Contribución

### **Guía de Contribución**

1. **Fork** el repositorio
2. **Crea** una rama para tu feature (`git checkout -b feature/nueva-funcionalidad`)
3. **Commit** tus cambios (`git commit -am 'Agrega nueva funcionalidad'`)
4. **Push** a la rama (`git push origin feature/nueva-funcionalidad`)
5. **Abre** un Pull Request

### **Estándares de Código**
- **PSR-12** para PHP
- **PHPStan Level 8** para análisis estático
- **Tests unitarios** obligatorios para nuevas funcionalidades
- **Documentación** en código y README

### **Estructura de Commits**
```
tipo(scope): descripción

feat(player): agregar validación de edad por categoría
fix(cards): corregir generación de QR duplicados
docs(readme): actualizar guía de instalación
```

## 📄 Licencia

Este proyecto está bajo la Licencia MIT. Ver [LICENSE](LICENSE) para más detalles.

## 👨‍💻 Desarrollador

**Kristian Orozco**
- GitHub: [@korozcolt](https://github.com/korozcolt)
- LinkedIn: [Kristian Orozco](https://linkedin.com/in/korozcolt)
- Email: ing.korozco@gmail.com

## 🏆 Auspicio

**Club Athletic Sincelejo**
- Instagram: [@athletic_sincelejo](https://www.instagram.com/athletic_sincelejo/)
- Ubicación: Sincelejo, Sucre, Colombia

---

<div align="center">

**¿Te gusta el proyecto? ¡Dale una ⭐!**

[🐛 Reportar Bug](../../issues) · [✨ Solicitar Feature](../../issues) · [📖 Documentación](../../wiki)

</div>
