# GuitarKinal - Tienda de Guitarras y Amplificadores


GuitarKinal es una tienda en línea desarrollada con tecnologías Java EE, dedicada a la venta de guitarras eléctricas, acústicas y amplificadores. La aplicación permite a los usuarios navegar por el sitio, registrarse, iniciar sesión.

--------------------

## ---- Características principales


### Menú principal:

Navegación clara y moderna.

Opciones de Iniciar Sesión o Crear Cuenta.

### Autenticación de usuarios:

Registro de nuevos usuarios con validaciones.

Inicio de sesión con credenciales verificadas desde la base de datos.

Redirección automática al menú de inicio tras ingresar correctamente.

### Menú de inicio personalizado:

Visualización de productos destacados (guitarras y amplificadores).

Opciones para explorar detalles de productos.

### Diseño responsivo con Bootstrap:

Interfaz moderna y adaptable a cualquier dispositivo.

### Mantenibilidad de entidades:

Sistema de mantenimiento (edición y gestión) de entidades como usuarios, productos, etc...

--------------------

## ---- Tecnologías utilizadas

Lenguaje de programación -> Java (Java EE)

Interfaz de usuario -> JSP (JavaServer Pages), Bootstrap 5, CSS

Base de datos -> MySQL

Persistencia de datos -> DAO (Data Access Object)

Servidor de aplicaciones -> GlassFish 5.0

Estándares Java EE:

Servlets
    
JNDI

--------------------

## ---- Instrucciones para ejecutar el proyecto

Clona el repositorio:

`git clone https://github.com/milian-rm/VentaEnLinea.git`

O descarga el repositorio.

Importa el proyecto en tu IDE Java EE (Tu IDE de preferencia, NetBeans recomendado).

Configura la base de datos MySQL:

Ejecuta el script SQL incluido en el TRELLO (también agregado hasta abajo de este README) para crear las tablas necesarias.

Ejecuta el proyecto con el servidor GlassFish 5.0 de NetBeans.

Estas son las credenciales de prueba (O puedes crear tus propias credenciales desde el register):

**<ins>Correo</ins>** -- cramirez@gmail.com
|| **<ins>Contraseña</ins>** -- 12345

Para acceder al mantenimiento de entidades puedes usar las siguientes credenciales:

**<ins>Correo</ins>** -- lgomez@gmail.com
|| **<ins>Contraseña</ins>** -- pass123

--------------------

## ---- Posibles mejoras futuras

~~Mantenimiento de las entidades~~

Sistema de carrito de compras



## ---- Base de datos

[DBconexionGuitarras.zip](https://github.com/user-attachments/files/21521700/DBconexionGuitarras.zip)
