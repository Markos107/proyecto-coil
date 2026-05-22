# 🛣️ Proyecto COIL - Smart Road Design Database

**Proyecto COIL para una base de datos para el diseño vial inteligente.**

A comprehensive database solution designed for intelligent road design and infrastructure planning, developed as part of the COIL (Collaborative Online International Learning) initiative.

---

## 📋 Table of Contents

- [Overview](#overview)
- [Features](#features)
- [Tech Stack](#tech-stack)
- [Prerequisites](#prerequisites)
- [Installation](#installation)
- [Project Structure](#project-structure)
- [Getting Started](#getting-started)
- [Database Setup](#database-setup)
- [Available Scripts](#available-scripts)
- [Contributing](#contributing)
- [Support](#support)
- [License](#license)

---

## 🎯 Overview

Proyecto COIL is a specialized database system built to support intelligent road design initiatives. It enables efficient data management, analysis, and collaboration for road infrastructure planning with a focus on smart city solutions.

### Key Objectives:
- Centralized management of road design data
- Support for intelligent infrastructure planning
- Collaborative development across international teams
- Scalable and maintainable architecture

---

## ✨ Features

- 🗄️ **Supabase Integration** - Cloud-based PostgreSQL database with real-time capabilities
- 📊 **Data Management** - Structured database schema for road design parameters
- 🔗 **RESTful API** - Easy data access and manipulation
- 🤝 **Collaborative** - COIL framework for international collaboration
- 🚀 **Scalable** - Built on modern cloud infrastructure

---

## 🛠️ Tech Stack

- **Runtime**: Node.js (v20.17.0 or v22.9.0+)
- **Package Manager**: npm
- **Database**: [Supabase](https://supabase.com/) v2.98.2
- **Project Type**: CommonJS

---

## 📦 Prerequisites

Before you begin, ensure you have the following installed:

- **Node.js** (v20.17.0 or later, or v22.9.0+)
- **npm** (comes with Node.js)
- **Git** (for version control)
- **Supabase Account** (free tier available at [supabase.com](https://supabase.com))

---

## 🚀 Installation

### 1. Clone the Repository

```bash
git clone https://github.com/Markos107/proyecto-coil.git
cd proyecto-coil
```

### 2. Install Dependencies

```bash
npm install
```

### 3. Set Up Environment Variables

Create a `.env.local` file in the project root with your Supabase credentials:

```env
VITE_SUPABASE_URL=your_supabase_project_url
VITE_SUPABASE_ANON_KEY=your_supabase_anon_key
```

You can find these values in your Supabase project settings under **API**.

### 4. Verify Installation

```bash
npm --version
node --version
```

---

## 📁 Project Structure

```
proyecto-coil/
├── supabase/              # Supabase configuration and migrations
├── src/                   # Source code (to be created)
├── package.json           # Project metadata and dependencies
├── package-lock.json      # Locked dependency versions
├── README.md              # This file
└── .gitignore             # Git ignore rules
```

### Key Directories:
- **`supabase/`** - Database schema, migrations, and Supabase configuration
- **`src/`** - Main application source code (to be developed)

---

## 🏁 Getting Started

### 1. Initialize Your Development Environment

```bash
# Install all dependencies
npm install

# Verify Supabase connection (once integrated)
npm test
```

### 2. Connect to Supabase

Update the Supabase client configuration in your project with your project URL and API key from the `.env.local` file.

### 3. Start Development

Once the development scripts are set up:

```bash
npm start
# or your custom development command
```

---

## 🗄️ Database Setup

### Using Supabase CLI

1. **Install Supabase CLI**:
   ```bash
   npm install -g supabase
   ```

2. **Initialize Your Local Database**:
   ```bash
   supabase init
   ```

3. **Link to Your Project**:
   ```bash
   supabase link --project-ref your_project_ref
   ```

4. **Migrate Database Schema**:
   ```bash
   supabase migration push
   ```

### Database Schema

The database is structured to support road design parameters including:
- Infrastructure data
- Geospatial information
- Design specifications
- Project metadata

Refer to the `/supabase` directory for detailed migration files.

---

## 📝 Available Scripts

### Currently Configured:

```json
{
  "test": "echo \"Error: no test specified\" && exit 1"
}
```

### To Add Scripts:

Update `package.json` to include commands like:

```json
{
  "dev": "node src/index.js",
  "build": "tsc",
  "test": "jest",
  "lint": "eslint src/**/*.js"
}
```

Then run with:
```bash
npm run <script-name>
```

---

## 🤝 Contributing

We welcome contributions from the international COIL community! Here's how to get involved:

### Getting Started with Contributions:

1. **Fork the Repository**
   ```bash
   git clone https://github.com/YOUR_USERNAME/proyecto-coil.git
   cd proyecto-coil
   ```

2. **Create a Feature Branch**
   ```bash
   git checkout -b feature/your-feature-name
   ```

3. **Make Your Changes**
   - Follow the existing code style
   - Add comments for complex logic
   - Update documentation as needed

4. **Commit Your Changes**
   ```bash
   git commit -m "Add: description of your changes"
   ```

5. **Push to Your Fork**
   ```bash
   git push origin feature/your-feature-name
   ```

6. **Submit a Pull Request**
   - Describe your changes clearly
   - Link any related issues
   - Wait for review from maintainers

### Contribution Guidelines:
- Be respectful and collaborative
- Follow the existing code style
- Write clear commit messages
- Test your changes before submitting
- Update documentation for new features

---

## 💬 Support

### Getting Help:

- **Issues**: Report bugs or request features on the [Issues Page](https://github.com/Markos107/proyecto-coil/issues)
- **Discussions**: Join project discussions on the [Discussions Page](https://github.com/Markos107/proyecto-coil/discussions)
- **Documentation**: Check the [Wiki](https://github.com/Markos107/proyecto-coil/wiki)

### Bug Reports:
When reporting a bug, please include:
- Steps to reproduce
- Expected behavior
- Actual behavior
- Environment details (Node.js version, OS, etc.)

---

## 📄 License

This project is licensed under the **ISC License** - see the [LICENSE](LICENSE) file for details.

---

## 🔗 Quick Links

- [GitHub Repository](https://github.com/Markos107/proyecto-coil)
- [Supabase Documentation](https://supabase.com/docs)
- [Node.js Documentation](https://nodejs.org/docs/)
- [COIL Initiative](https://www.coil.com/)

---

## 📞 Contact

- **Project Owner**: [@Markos107](https://github.com/Markos107)
- **Report Issues**: [GitHub Issues](https://github.com/Markos107/proyecto-coil/issues)

---

## 🎓 COIL Initiative

Proyecto COIL is part of the Collaborative Online International Learning initiative, fostering global collaboration in road infrastructure design and intelligent transportation systems.

---

**Last Updated**: May 22, 2026

Happy Coding! 🚀
