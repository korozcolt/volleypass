# VolleyPass Mobile

![Flutter](https://img.shields.io/badge/Flutter-3.10+-02569B?logo=flutter)
![Dart](https://img.shields.io/badge/Dart-3.0+-0175C2?logo=dart)
![Platform](https://img.shields.io/badge/Platform-iOS%20%7C%20Android-lightgrey)
![License](https://img.shields.io/badge/License-MIT-green)

> Aplicación móvil para gestión de ligas de voleibol - Verificación de carnets QR, torneos y partidos en vivo

---

## 🎯 Sobre el Proyecto

VolleyPass Mobile es una aplicación nativa Flutter para verificadores de torneos de voleibol. Permite:

- ✅ **Verificación QR de carnets** de jugadores en tiempo real
- 📴 **Modo Offline** para trabajar sin conexión
- 🔄 **Sincronización automática** cuando hay conexión
- 🏐 **Gestión de sesiones** de verificación por partido
- 🏆 **Consulta de torneos** y tablas de posiciones
- 📊 **Partidos en vivo** con marcadores actualizados
- 👤 **Gestión de perfil** y estadísticas personales

---

## 📚 Documentación

**🚨 IMPORTANTE:** Este proyecto está completamente documentado. **DEBES leer la documentación** antes de comenzar a desarrollar.

### 📖 Guía de Inicio

**👉 [README DE DESARROLLO](.doc/README_DEVELOPMENT.md) 👈**

**Empieza aquí.** Esta es tu guía principal que te indica qué leer y en qué orden.

---

### 📑 Documentación Completa

Todos los documentos están en la carpeta `.doc/`:

| Documento | Descripción | Cuándo Leer |
|-----------|-------------|-------------|
| **[README_DEVELOPMENT.md](.doc/README_DEVELOPMENT.md)** | Guía principal de desarrollo | **SIEMPRE primero** |
| **[DEVELOPMENT_STANDARDS.md](.doc/DEVELOPMENT_STANDARDS.md)** | Normas y estándares del proyecto | Antes de escribir código |
| **[MVP_PLAN.md](.doc/MVP_PLAN.md)** | Plan del producto mínimo viable | Al iniciar el proyecto |
| **[SCREENS_AND_FEATURES.md](.doc/SCREENS_AND_FEATURES.md)** | Detalle de pantallas y funcionalidades | Al implementar features |
| **[TECHNICAL_ARCHITECTURE.md](.doc/TECHNICAL_ARCHITECTURE.md)** | Arquitectura técnica completa | Al diseñar soluciones |
| **[API_DOCUMENTATION.MD](.doc/API_DOCUMENTATION.MD)** | Documentación completa de la API | Al consumir endpoints |

---

## 🏗️ Arquitectura

Este proyecto sigue **Clean Architecture** con enfoque **Feature-First**:

```
lib/
├── core/                   # Infraestructura core
│   ├── config/             # Configuración por entorno
│   ├── network/            # Cliente HTTP, interceptores
│   ├── auth/               # Gestión de autenticación
│   ├── storage/            # Almacenamiento (secure, offline)
│   └── utils/              # Utilidades
│
├── features/               # Features de la app
│   ├── auth/               # Autenticación
│   │   ├── data/           # Modelos, repos, datasources
│   │   ├── domain/         # Entidades, casos de uso
│   │   └── presentation/   # UI, state, providers
│   │
│   ├── qr_verification/    # Verificación QR
│   ├── tournaments/        # Torneos
│   ├── matches/            # Partidos
│   └── profile/            # Perfil
│
└── shared/                 # Componentes compartidos
    ├── widgets/
    └── theme/
```

**Más detalles:** [TECHNICAL_ARCHITECTURE.md](.doc/TECHNICAL_ARCHITECTURE.md)

---

## 🚀 Quick Start

### Prerrequisitos

- Flutter 3.10+
- Dart 3.0+
- Android Studio / VS Code
- Xcode (para iOS)

### Instalación

```bash
# 1. Clonar el repositorio
git clone [url]
cd volleypass

# 2. Instalar dependencias
flutter pub get

# 3. Generar código (freezed, json_serializable)
flutter pub run build_runner build --delete-conflicting-outputs

# 4. Ejecutar
flutter run
```

### Comandos Útiles

```bash
# Tests
flutter test
flutter test --coverage

# Análisis
flutter analyze

# Formato
dart format .

# Generar código
flutter pub run build_runner build --delete-conflicting-outputs
```

---

## 📱 Funcionalidades

### MVP (Versión 1.0)

#### ✅ Core Features
1. **Autenticación**
   - Login con email/password
   - Sesión persistente
   - Gestión de tokens

2. **Verificación QR**
   - Escaneo de carnets
   - Verificación online/offline
   - Resultado visual (apto/no apto)
   - Información de jugador

3. **Modo Offline**
   - Almacenamiento local
   - Sincronización automática
   - Indicador de estado

4. **Sesiones de Partido**
   - Crear sesión para partido
   - Tracking de verificaciones
   - Resumen de sesión

5. **Torneos Públicos**
   - Lista de torneos
   - Tablas de posiciones
   - Partidos programados

6. **Partidos en Vivo**
   - Lista de partidos live
   - Marcador en tiempo real
   - Detalles de partido

7. **Perfil de Usuario**
   - Ver y editar perfil
   - Estadísticas personales
   - Gestión de sesiones activas

**Detalles completos:** [MVP_PLAN.md](.doc/MVP_PLAN.md)

---

## 🛠️ Stack Tecnológico

### Core
- **Flutter** 3.10+ - Framework multiplataforma
- **Dart** 3.0+ - Lenguaje de programación

### State Management
- **Riverpod** 2.4+ - Gestión de estado

### Networking
- **Dio** 5.4+ - Cliente HTTP

### Storage
- **flutter_secure_storage** - Tokens y credenciales
- **Hive** - Datos offline
- **SharedPreferences** - Configuración

### Otros
- **mobile_scanner** - Escaneo QR
- **freezed** - Clases inmutables
- **json_serializable** - Serialización JSON
- **dartz** - Programación funcional
- **connectivity_plus** - Detección de red

**Dependencias completas:** [pubspec.yaml](./pubspec.yaml)

---

## 🧪 Testing

### Coverage Mínimo
- **Unit tests:** 80%
- **Widget tests:** 70%
- **Integration tests:** Flujos críticos

### Ejecutar Tests

```bash
# Todos los tests
flutter test

# Con coverage
flutter test --coverage

# Ver coverage HTML
genhtml coverage/lcov.info -o coverage/html
open coverage/html/index.html
```

---

## 📋 Workflow de Desarrollo

### Antes de Empezar
1. ✅ Lee [README_DEVELOPMENT.md](.doc/README_DEVELOPMENT.md)
2. ✅ Lee [DEVELOPMENT_STANDARDS.md](.doc/DEVELOPMENT_STANDARDS.md)
3. ✅ Revisa la sección relevante en [SCREENS_AND_FEATURES.md](.doc/SCREENS_AND_FEATURES.md)
4. ✅ Crea un plan técnico

### Durante el Desarrollo
1. ✅ Sigue Clean Architecture
2. ✅ NO hagas hardcoding
3. ✅ Escribe tests
4. ✅ Documenta tu código

### Antes del PR
1. ✅ Todos los tests pasan
2. ✅ Coverage > 70%
3. ✅ Sin warnings
4. ✅ Código formateado
5. ✅ Documentación actualizada

---

## 🎯 Principios del Proyecto

### 1. CERO Hardcoding
Todo valor configurable debe estar en configuración, NO en el código.

### 2. Todo con Fundamento
Cada decisión técnica debe estar justificada y documentada.

### 3. Nivel Senior
El código debe reflejar SOLID, Clean Architecture, y best practices.

### 4. Manejabilidad
Todo debe ser configurable, observable, debuggable y actualizable.

### 5. Transparencia en API
La UI no conoce la API. Solo se comunica con el dominio.

**Más detalles:** [DEVELOPMENT_STANDARDS.md](.doc/DEVELOPMENT_STANDARDS.md)

---

## 🚨 Reglas de Oro

1. **SIEMPRE** lee la documentación antes de escribir código
2. **NUNCA** hagas hardcoding
3. **SIEMPRE** escribe tests
4. **SIEMPRE** sigue Clean Architecture
5. **SIEMPRE** documenta
6. **NUNCA** bypasses la arquitectura
7. **SIEMPRE** maneja errores
8. **SIEMPRE** piensa en offline
9. **NUNCA** commitees código roto
10. **SIEMPRE** pide code review

---

## 📞 Soporte

¿Tienes dudas?

1. **Primero:** Lee la documentación relevante
2. **Segundo:** Busca en el código existente
3. **Tercero:** Pregunta al equipo

---

## 📄 Licencia

MIT License - ver [LICENSE](LICENSE)

---

## 👥 Equipo

Desarrollado por el equipo de VolleyPass

---

## 🔗 Enlaces

- **API Backend:** VolleyPass API v1.0.0
- **Documentación API:** [API_DOCUMENTATION.MD](.doc/API_DOCUMENTATION.MD)
- **Guía de Desarrollo:** [README_DEVELOPMENT.md](.doc/README_DEVELOPMENT.md)

---

## 📝 Notas Importantes

### ⚠️ ANTES DE DESARROLLAR

**Este proyecto requiere planificación previa a la implementación.**

No se debe escribir código sin:
1. Haber leído la documentación completa
2. Haber creado un plan técnico
3. Haber diseñado la solución

**Ver:** [README_DEVELOPMENT.md](.doc/README_DEVELOPMENT.md) para el workflow completo.

---

## 🎓 Filosofía del Proyecto

Este proyecto es un ejercicio de **excelencia técnica**. Cada línea de código debe:

- Ser **mantenible** - Fácil de entender y modificar
- Ser **testeable** - Con tests automatizados
- Ser **escalable** - Preparado para crecer
- Ser **seguro** - Sin vulnerabilidades
- Tener **fundamento** - Decisiones justificadas

**No se trata de escribir código rápido, se trata de escribir código BIEN.**

---

**Let's build something great! 🚀**

---

**Última actualización:** Diciembre 26, 2024
**Versión:** 1.0.0
