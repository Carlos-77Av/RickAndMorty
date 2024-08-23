# RickAndMorty con Clean Architecture (SwiftUI, Combine, GraphQL)

Esta aplicación de RickAndMorty ha sido desarrollada utilizando un enfoque basado en Clean Architecture, integrando tecnologías modernas como SwiftUI, Combine y GraphQL a través de ApolloClient. La arquitectura y el diseño se han implementado siguiendo las mejores prácticas para asegurar una base de código robusta, modular y fácil de mantener.

### Instrucciones para clonar y configurar el proyecto

1. **Clonar el repositorio:**
   - Abre la terminal y navega hasta el directorio donde desees clonar el proyecto.
   - Clona el repositorio utilizando el siguiente comando: `git clone [URL_DEL_REPOSITORIO]`.

2. **Instalar dependencias:**
   - Una vez clonado el proyecto, navega hasta la carpeta del proyecto: `cd NombreDelProyecto`.
   - Ejecuta `pod install` para instalar todas las dependencias necesarias.

3. **Configurar el endpoint de GraphQL:**
   - Durante el proceso de instalación, se te pedirá que ingreses la clave correspondiente al endpoint de GraphQL proporcionado para la prueba.

4. **Solución de problemas comunes (en caso de errores de compilación):**
   - Si se produce un error relacionado con el `minimum deployment` debido al paquete `Keys`, sigue estos pasos:
     - En Xcode, navega a `Pods` -> `Keys`.
     - Selecciona el target `Keys` y ajusta el `Minimum Deployment` a `iOS 15.0`.
