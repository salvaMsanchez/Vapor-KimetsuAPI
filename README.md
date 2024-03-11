<a name="top"></a>

<h1 align="center">
  <strong><span>💧 Vapor </span></strong>
</h1>

---

<p align="center">
  <strong><span style="font-size:20px;">Server-side Swift HTTP web framework</span></strong>
</p>

---

<p align="center">
  <strong>Autor:</strong> Salva Moreno Sánchez
</p>

<p align="center">
  <a href="https://www.linkedin.com/in/salvador-moreno-sanchez/">
    <img src="https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white" alt="LinkedIn">
  </a>
</p>

## Índice
 
* [⚔️ Kimetsu no Yaiba API ⚔️](#kimetsu)
	* [Descripción](#descripcion)
		* [Características principales](#caracteristicas)
	* [Instalación](#instalacion)
	* [Uso](#uso)
	* [Endpoints](#endpoints)
* [Licencia](#licencia)

<a name="kimetsu"></a>
## ⚔️ Kimetsu no Yaiba API ⚔️

![Kimetsu no Yaiba image](imagesReadme/kimetsu.jpeg)

<a name="descripcion"></a>
### Descripción

Esta API Rest ha sido desarrollada utilizando el framework Vapor y está inspirada en el mundo de Kimetsu no Yaiba. El objetivo principal de este proyecto es proporcionar una interfaz de programación de aplicaciones fácil de usar para interactuar con datos[^datos] relacionados con la famosa serie de manga y anime.

<a name="caracteristicas"></a>
#### Características principales

* **Routing:** se emplea el sistema de enrutamiento de Vapor para definir los endpoints de la API y manejar las solicitudes entrantes de manera eficiente.
* **Manejo de Errores:** se ha implementado un sistema robusto para manejar errores de manera adecuada y proporcionar respuestas claras en caso de que ocurran problemas durante el procesamiento de las solicitudes.
* **Fluent:** se usa Fluent, el ORM de Vapor, para manejar modelos de datos, definir relaciones entre ellos, realizar transacciones de bases de datos, ejecutar migraciones y realizar consultas complejas de manera eficiente.
* **Seguridad con JWT:** se ha desarrollado la autenticación y autorización utilizando JSON Web Tokens (JWT) para proteger los endpoints sensibles de la API. Se ha configurado el proyecto pensando en garantizar la seguridad de los datos, aplicando medidas de seguridad en los endpoints según sea necesario.

<a name="instalacion"></a>
### Instalación

Para comenzar a utilizar esta API Rest de Kimetsu no Yaiba, sigue estos sencillos pasos:

1. **Requisitos previos**

	* Swift 5.9
	* Vapor 4.92.4
	* Vapor Toolbox 18.7.4

2. **Clonar el Repositorio**

	```bash
	git clone <url-del-repositorio>
	```

	Asegurarse de tener instalado Git en el sistema antes de clonar el repositorio. 	Esto descargará el código fuente de la API en tu máquina local.
	
3. **Crear BBDD local**

	Asegurarse de tener una base de datos PostgreSQL activa en tu máquina local.

4. **Configuración de Variables de Entorno**

	Crea un archivo `.env` en la raíz del proyecto y rellena la siguiente 	información:
	
	```bash
	JWT_KEY=
	API_KEY=
	DATABASE_URL=postgresql://<usuario>@<host>/<nombre_de_la_base_de_datos>
	APP_BUNDLE_ID=

	```
	Asegurarse de completar cada variable con los valores correspondientes 	necesarios para el funcionamiento de la aplicación. 
	
	La URL de la base de datos debe seguir el formato `postgresql://	<usuario>@<host>/<nombre_de_la_base_de_datos>`.

5. **Configuración de Xcode**

	* Abre el proyecto en Xcode.
	* Edita el esquema (Scheme) del proyecto.
	* Activa la opción de "Use custom working directory" y enlaza la carpeta donde 	se encuentra el proyecto recién clonado.

6. **Ejecución del Proyecto**

	* Ejecuta el proyecto en Xcode.
	* Verifica en la terminal que el servidor se ha inicializado correctamente.

<a name="uso"></a>
### Uso

// TODO:

Explicar cómo usar la API, incluyendo cómo iniciar el servidor.
Proporcionar ejemplos de solicitudes y respuestas para mostrar cómo interactuar con los endpoints.
Explicar cómo se realiza la autenticación o autorización.

<a name="endpoints"></a>
### Endpoints

// TODO:

Enumerar y describir todos los endpoints disponibles en la API.
Proporcionar detalles sobre los parámetros aceptados y los formatos de respuesta.

<a name="licencia"></a>
## Licencia

Este proyecto está bajo la Licencia MIT - ver el archivo [LICENSE.md](https://github.com/salvaMsanchez/Vapor-Servers/blob/main/LICENSE.md) para más detalles.

---

[Subir ⬆️](#top)

[^datos]: Los datos estáticos almacenados en la BBDD que se presentan como respuesta en la API han sido generados con ChatGPT, por lo que su información puede ser inexacta.


