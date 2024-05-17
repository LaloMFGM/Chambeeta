
# Chambeeta

Documentación Técnica para la aplicación Chambeeta de flutter para dispositivos mobiles.

### Índice
- [Guía de instalación](#enlace1)
- [Documentación de API](#enlace2)
- [Guía de desarrollo](#enlace3)
- [Ejemplos y Tutoriales](#enlace4)
- [Referencias](#enlace5)


<!-- headings -->
<a id="enlace1"></a>
## Guía de instalación

Para generar un archivo APK (Android Package) desde el proyecto Flutter, se pueden seguir los siguientes pasos

### Configura tu Proyecto Flutter

Abre el proyecto Flutter en un editor de código (como Visual Studio Code o Android Studio). Asegúrate de que tu archivo android/app/build.gradle esté configurado correctamente. De ser necesario ajustar configuraciones como minSdkVersion, targetSdkVersion y applicationId.

### Construye el APK

Abre una terminal o línea de comandos. Navega hasta el directorio de tu proyecto Flutter usando el comando cd. Ejecuta el siguiente comando para construir el APK. 

```
flutter build apk
```

### Localiza el APK

Una vez que el proceso de construcción esté completo, navega hasta el directorio build/app/outputs/apk/release dentro de tu directorio de proyecto Flutter. El archivo APK generado tendrá un nombre similar a app-release.apk.

### Descarga e Instala el APK

Transfiere el archivo APK a un dispositivo Android. Instala el APK abriéndolo en el dispositivo Android. De ser necesario habilita la instalación desde fuentes desconocidas en la configuración de tu dispositivo. 

<a id="enlace2"></a>
## Documentación de API

Las tecnologías utilizadas para el desarrollo de endpoints de la API que son consumidos por nuestra aplicación son .NET, SQL Server y Postman. El desarrollo backend fue realizado en C#.

### Configuración del Entorno de Desarrollo

Para el desarrollo se requiere: 
- [Instalación de Visual Studio para el desarrollo .NET.](#https://visualstudio.microsoft.com/vs/getting-started/)
- [Configuración de un servidor SQL Server local](#https://learn.microsoft.com/en-us/sql/database-engine/install-windows/install-sql-server?view=sql-server-ver16)

### Configuración de la Base de Datos

Aquí hay una breve explicación para la creación de la base de datos
- [Instrucciones para crear la base de datos en SQL Server](#https://learn.microsoft.com/en-us/sql/relational-databases/databases/create-a-database?view=sql-server-ver16)

### Desarrollo de los Endpoints de API

Se utilizó Entity Framework o ADO.NET para interactuar con la base de datos SQL Server. Implementando patrones de acceso a datos como el patrón repositorio para mantener un código limpio y modular. El proyecto utiliza ASP.NET Web API o ASP.NET Core MVC para crear los endpoints de la API. Se definieron  rutas, controladores y acciones para manejar las solicitudes HTTP y realizar operaciones CRUD en la base de datos. Además de implementar autenticación y autorización en los endpoints de la API utilizando JSON Web Tokens (JWT).


<a id="enlace3"></a>
## Guía de desarrollo

Para el desarrollo en el proyecto, asegúrate de tener Flutter instalado en tu máquina de desarrollo. Puedes seguir la guía oficial de instalación de Flutter. Clona el repositorio del proyecto desde la url. Abre el proyecto en tu editor de código.

### Estructura del Proyecto

```
.
├── models
├── providers
├── routes
├── screens
|   ├── login
|   ├── sigin
|   ├── tabs
|   constants.dart
|   main.dart
└── ...
```

### Dependencias

Todas las dependencias del proyecto están listadas en el archivo pubspec.yaml. Antes de agregar nuevas dependencias, asegúrate de que sean compatibles con la versión actual de Flutter y cumplan con los requisitos del proyecto.

Para agregar una nueva dependencia, actualiza la sección dependencies del archivo pubspec.yaml y ejecuta flutter pub get para instalar la dependencia.

### Convenciones de Dart

Sigue la guía de estilo de Dart (https://dart.dev/guides/language/effective-dart/style) para escribir código limpio y mantenible. Utiliza nombres de variables y funciones significativos para mejorar la legibilidad del código. Documenta tu código utilizando comentarios para explicar lógica compleja o detalles importantes.

### Desarrollo de la Interfaz de Usuario (UI)

Utiliza el enfoque basado en widgets de Flutter para construir componentes de UI. Familiarízate con widgets comúnmente utilizados como StatelessWidget, StatefulWidget, Container, Column, Row, etc. Sigue las convenciones de Material Design (https://material.io/design) para diseñar elementos de UI. 

### Control de Versiones

Sigue las mejores prácticas de Git para el control de versiones, incluyendo mensajes de commit significativos, commits frecuentes y estrategias de ramificación. Asegúrate de que tu código sea revisado correctamente antes de realizar un merge en la rama principal.

### Documentación

Mantén la documentación del código actualizada para ayudar a otros desarrolladores a entender la arquitectura del proyecto, las APIs y las convenciones. Documenta cualquier guía o patrón específico del proyecto que los desarrolladores deban seguir.

<a id="enlace4"></a>
## Ejemplos y Tutoriales

Para funciones básicas de la aplicación podemos crear una cuenta, al entrar a la aplicación tendremos la opción de realizar un login, en caso de que ya tenga una cuenta puedo utilizar mi correo y contraseña previamente establecida para acceder a mi cuenta.

<img src="images\login.jpeg" width="200" height="450">

En caso de que no tenga una, puedo acceder por medio de signin a la creación de una nueva cuenta donde al llenar los datos se creará un perfil.

<img src="images\signin.jpeg" width="200" height="450">

Al tener un perfil tengo acceso al resto de la aplicación lo que vendría siendo el feed, donde puedo explorar trabajos y mi vista de mis trabajos.

<img src="images\feed.jpeg" width="200" height="450">

También tengo la opción de editar el contenido de mi perfil.

<img src="images\profile.jpeg" width="200" height="450">

<a id="enlace5"></a>
## Referencias

La documentación oficial de Flutter (https://flutter.dev/docs)

La documentación oficial de Material Design (https://material.io/design)