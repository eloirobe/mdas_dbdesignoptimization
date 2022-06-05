# MDAS Diseño y Optimización Base de Datos MySQL :tada:

Bienvenidos a la imagen de MySQL para a la asignatura de Bases de datos no estructuradas del master [Máster en Desarrollo y Arquitectura de Software (MDAS)](https://www.salleurl.edu/es/estudios/master-en-desarrollo-y-arquitectura-software)

Para levantar un MySQL realizaremos los siguientes pasos:

:wave: *Requisitos previos tener instalado docker*

1) Clonar el reposiorio
```bash
git clone
```
2) Levantar el MySQL
```bash
make init
```
3) Consultar el help para realizar las siguientes acciones 
```bash
make help
```

## Acceso remoto

Host: 127.0.0.1

Usuario: root

Contraseña: example


## Usuarios Windows

Para hacer funcionar el Makefile es recomendable instalarse una distribución linux con el wsl , estos son los pasos:

```bash
 wsl --set-default-version 2

 wsl --install -d Ubuntu
 ```
 
 Depues activar la integración con docker en Docker Desktop Settings -> Resources -> wsl integration y activar ubuntu


 Abrir terminal ubuntu e instalar make con:
``` 
sudo apt-get install make
```

Acceder al directorio donde este descargado el repositorio dentro de la terminal de ubuntu. Hay que ir a /mnt/c para acceder al disco de windows e ir al directorio donde se encuentra el repo descargado.

Ojo es posible que haya que ejecutar con sudo los comandos de make