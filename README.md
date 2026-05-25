# 🛣️ GeoBridge - Proyecto COIL

Una solución integral de base de datos diseñada para el diseño vial inteligente y la planificación de infraestructura (desarrollada como parte de la iniciativa Collaborative Online International Learning).

Página web: https://geobridge-7041b.web.app/

## 📋 Índice

- [Descripción General](#descripción-general)
- [Características](#características)
- [Stack Tecnológico](#stack-tecnológico)
- [Prerrequisitos](#prerrequisitos)
- [Instalación](#instalación)
- [Estructura del Proyecto](#estructura-del-proyecto)
- [Primeros Pasos](#primeros-pasos)
- [Configuración de la Base de Datos](#configuración-de-la-base-de-datos)
- [Scripts Disponibles](#scripts-disponibles)
- [Soporte](#soporte)
- [Licencia](#licencia)

## 🎯 Descripción General

GeoBridge es un sistema de base de datos creado para dar soporte a iniciativas de diseño vial inteligente. Permite una gestión de datos eficiente, análisis y colaboración para la planificación de infraestructura vial, con un enfoque en soluciones para ciudades inteligentes.

### Objetivos del sistema:
- **Gestión centralizada:** Control de datos de diseño vial en un solo lugar.
- **Infraestructura inteligente:** Soporte técnico enfocado en planificación moderna.
- **Colaboración global:** Desarrollo conjunto entre equipos internacionales.
- **Arquitectura limpia:** Estructura escalable y fácil de mantener.

## ✨ Características

- 🗄️ **Integración con Supabase** - Base de datos PostgreSQL en la nube con capacidades en tiempo real.
- 🔥 **Despliegue con Firebase** - Alojamiento e infraestructura en la nube optimizada para un acceso global rápido y seguro.
- 📊 **Gestión de Datos** - Esquema de base de datos estructurado para parámetros de diseño vial.
- 🔗 **API RESTful** - Fácil acceso y manipulación de datos.
- 🤝 **Colaborativo** - Marco de trabajo COIL para la colaboración internacional.
- 🚀 **Escalable** - Construido sobre una infraestructura moderna en la nube.

## 🛠️ Tecnologías utilizadas

- **Entorno de ejecución:** Node.js (v20.17.0 o v22.9.0+)
- **Gestor de paquetes:** npm
- **Base de datos:** [Supabase](https://supabase.com/) v2.98.2
- **Plataforma de Despliegue:** [Firebase](https://firebase.google.com/)
- **Tipo de proyecto:** CommonJS

## 📦 Prerrequisitos

Antes de comenzar, asegúrate de tener instalado lo siguiente:

- **Node.js** (v20.17.0 o posterior, o v22.9.0+)
- **npm** (viene incluido con Node.js)
- **Git** (por control de versiones)
- **Cuenta de Supabase** (plan gratuito disponible en [supabase.com](https://supabase.com))
- **Firebase CLI** (para la gestión del despliegue en la nube)

## 🚀 Instalación

### 1. Clonar el Repositorio

```bash
git clone [https://github.com/Markos107/proyecto-coil.git](https://github.com/Markos107/proyecto-coil.git)
cd proyecto-coil

```

### 2. Instalar Dependencias

```bash
npm install

```

### 3. Configurar Variables de Entorno

Crea un archivo `.env.local` en la raíz del proyecto con tus credenciales de Supabase:

```env
VITE_SUPABASE_URL=tu_url_de_proyecto_supabase
VITE_SUPABASE_ANON_KEY=tu_clave_anon_de_supabase

```

Puedes encontrar estos valores en la configuración de tu proyecto de Supabase, bajo la sección **API**.

### 4. Verificar la Instalación

```bash
npm --version
node --version

```

---

## 📁 Estructura del Proyecto

```
proyecto-coil/
├── supabase/              # Configuración y migraciones de Supabase
├── src/                   # Código fuente (por crear)
├── package.json           # Metadatos del proyecto y dependencias
├── package-lock.json      # Versiones bloqueadas de las dependencias
├── README.md              # Este archivo
└── .gitignore             # Reglas de archivos ignorados por Git

```

### Directorios Clave:

* **`supabase/`** - Esquema de la base de datos, migraciones y configuración de Supabase.
* **`src/`** - Código fuente principal de la aplicación (por desarrollar).

---

## 🏁 Primeros Pasos

### 1. Inicializar tu Entorno de Desarrollo

```bash
# Instalar todas las dependencias
npm install

# Verificar la conexión con Supabase (una vez integrada)
npm test

```

### 2. Conectarse a Supabase

Actualiza la configuración del cliente de Supabase en tu proyecto utilizando la URL del proyecto y la clave API de tu archivo `.env.local`.

### 3. Iniciar el Desarrollo

Una vez que los scripts de desarrollo estén configurados:

```bash
npm start
# o tu comando de desarrollo personalizado

```

---

## 🗄️ Configuración de la Base de Datos

### Usando la CLI de Supabase

1. **Instalar la CLI de Supabase**:

```bash
   npm install -g supabase

```

2. **Inicializar tu Base de Datos Local**:

```bash
   supabase init

```

3. **Vincular a tu Proyecto**:

```bash
   supabase link --project-ref tu_project_ref

```

4. **Aplicar Migraciones al Esquema**:

```bash
   supabase migration push

```

### Esquema de la Base de Datos

La base de datos está estructurada para soportar parámetros de diseño vial, incluyendo:

* Datos de infraestructura
* Información geoespacial
* Especificaciones de diseño
* Metadatos del proyecto

Consulta el directorio `/supabase` para ver los archivos detallados de las migraciones.

---

## 📝 Scripts Disponibles

### Configurado Actualmente:

```json
{
  "test": "echo \"Error: no test specified\" && exit 1"
}

```

### Para Añadir Scripts:

Puedes actualizar el archivo `package.json` para incluir los comandos del entorno de trabajo:

```json
{
  "dev": "node src/index.js",
  "build": "tsc",
  "test": "jest",
  "lint": "eslint src/**/*.js"
}

```

Luego se ejecutan desde la terminal usando:

```bash
npm run <nombre-del-script>

```

## 💬 Soporte

### Obtener Ayuda:

* **Issues:** Reporta errores o solicita nuevas funciones en la [Página de Issues](https://github.com/Markos107/proyecto-coil/issues).
* **Discussions:** Únete a las discusiones del proyecto en la [Página de Discusiones](https://github.com/Markos107/proyecto-coil/discussions).
* **Documentación:** Consulta la [Wiki del proyecto](https://github.com/Markos107/proyecto-coil/wiki).


### Reportes de Errores (Bug Reports):

Al reportar un error, por favor incluye en el Issue:

1. Pasos claros para reproducirlo.
2. Comportamiento esperado vs. comportamiento real observado.
3. Detalles del entorno (versión de Node.js, Sistema Operativo, etc.).


## 📄 Licencia

Este proyecto está bajo la **Licencia ISC** - consulta el archivo [LICENSE](https://www.google.com/search?q=LICENSE) para más detalles.


## 🔗 Enlaces Rápidos

* [Repositorio de GitHub](https://github.com/Markos107/proyecto-coil)
* [Documentación de Supabase](https://supabase.com/docs)
* [Documentación de Node.js](https://nodejs.org/docs/)
* [Documentación de Firebase](https://firebase.google.com/docs)
* [Iniciativa COIL](https://www.coil.com/)


## 📞 Contacto

* **Propietario del Proyecto:** [@Markos107](https://github.com/Markos107)
* **Reportar Problemas:** [GitHub Issues](https://github.com/Markos107/proyecto-coil/issues)


Este proyecto es parte de la iniciativa Collaborative Online International Learning (Aprendizaje Internacional Colaborativo en Línea).

**Última Actualización**: 22 de mayo de 2026
