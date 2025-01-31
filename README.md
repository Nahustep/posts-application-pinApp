# 📱 Post App

Post App es una aplicación Flutter que permite visualizar una lista de posts, marcar posts como favoritos usando `SharedPreferences`, eliminarlos y ver los detalles de cada post.

## 🚀 Características
- 📌 **Lista de posts** obtenidos desde una API.
- ⭐ **Guardar posts como favoritos** con `SharedPreferences`.
- ❌ **Eliminar posts** de la lista de favoritos.
- 🔍 **Ver detalles de un post** con más información.

## 🎥 Video Demostración

El video está disponible en la carpeta de recursos y en Google Drive:

- [Ver video Local](assets/videos/Demo.mp4)
- [Ver video en Google Drive](https://drive.google.com/file/d/11IJ7lfnrqjppGQ4AOKTrHfDmsr-r7vRL/view?usp=sharing)

## 🛠️ Tecnologías Utilizadas
- **Flutter** (3.27.0) - Framework principal.
- **Dart** (3.6.0) - Lenguaje de programación.
- **Retrofit & Dio** - Cliente HTTP para consumir la API.
- **Bloc & Flutter Bloc** - Gestión del estado.
- **GoRouter** - Navegación declarativa.
- **SharedPreferences** - Almacenamiento local de favoritos.
- **Get It** - Inyección de dependencias.
- **Responsive Framework** - Diseño adaptable.

## 📱 Plataformas Probadas
La aplicación ha sido testeada en:
- ✅ **Web** (Chrome)
- ✅ **Android** (Emuladores)

No ha sido probada en iOS o Windows. ⚠️

## 📥 Instalación
1. Cloná este repositorio:
   ```bash
   git clone https://github.com/Nahustep/posts-application-pinApp.git
   cd posts-application-pinApp
2. Instalá las dependencias:
   ```bash
   flutter pub get
3. Ejecutá la aplicación:
   ```bash
   flutter run
