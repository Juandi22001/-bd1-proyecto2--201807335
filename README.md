
# Proyecto 2

## Sistemas de Bases de Datos 1

### Estudiante:

|    Nombre    Juan Diego Alvarado Salguero  |   201807335   |



En el siguiente proyecto se solicito desarrollar un modelo relacional para así cubrir la necesidad de tener un sistema totalmente escalable y que sea totalmente optimo.
En esta ocasión el Instituto Centroamericano electoral (ICE) solicito ayuda para poder realizar la reingeniería del proceso de almacenamiento debido que actualmente existe una gran inconsistencia que en un futuro les presentara serios problemas legales. 


---

## Alcance

_La entidad relación será optimizada por medio de normas de normalización presentadas y explicadas en el documento esto con el objetivo de mejorar la respuesta de las consultas y a su vez evitar problemas de redundancia de datos y aumento en el tamaño de almacenamiento de los datos pudiendo así de esta forma almacenar más datos y consultarlos de una manera más rápida y optima estas se veran reflejadas sobre todo a largo plazo cuando haya una carga de datos de gran tamaño._

---

## Normalización


### Primera Normalización

Para comenzar , primero que nada analizaremos las columnas que se encuentran seleccionadas que son las de PAIS, REGION , DEPARTAMENTO  Y MUNICIPIO  aplicando una regla de normalización se crearan tablas para cada una de las columnas seleccionadas  y aplicando  la segunda forma normal se agregara una única clave que logre unir las tablas .
 ![efe](https://github.com/Juandi22001/Predicas/blob/master/proyecto2_imagen1.JPG?raw=true)
Gracias a la normalización aplicada tendremos la creación de las siguientes tablas:

## TABLA  PAIS

 ![efe](https://github.com/Juandi22001/Predicas/blob/master/PAIS.JPG?raw=true)
## TABLA  REGION

 ![efe](https://github.com/Juandi22001/Predicas/blob/master/REGION.JPG?raw=true)





## TABLA  DEPARTAMENTO

 ![efe](https://github.com/Juandi22001/Predicas/blob/master/DEPARTAMENTO.JPG?raw=true)
## TABLA  MUNICIPIO

 ![efe](https://github.com/Juandi22001/Predicas/blob/master/MUNICIPIO.JPG?raw=true)

### Segunda  Normalización

Para comenzar , primero que nada analizaremos las columnas que se encuentran seleccionadas que son las de PAIS, REGION , DEPARTAMENTO  Y MUNICIPIO  aplicando una regla de normalización se crearan tablas para cada una de las columnas seleccionadas  y aplicando  la segunda forma normal se agregara una única clave que logre unir las tablas .
 

_Bien ahora continuando el analisis podemos notar que las tablas PAIS, REGION y DEPTO repiten datos con el mismo nombre entre las filas por lo cual aplicando la segunda normalización debemos separarlas y colocar un codigo en su lugar en la tabla principal obteniendo asi 2 tablas la tabla votos y la tabla DEPTO_

![](./IMG/IMG9.png)
![](./IMG/IMG10.png)

_Bien ahora analizando la tabla DEPTO podemos notar que aun hay redundancia de datos por lo cual aplicaremos 2da forma normal generando 3 nuevas tablas PAIS, DEPTO y REGION_

#### DEPTO
![](./IMG/IMG6.png)
#### REGION

![](./IMG/IMG7.png)
#### PAIS

![](./IMG/IMG8.png)

_Con la aplicación anterior nos queda la siguiente tabla voto_

![](./IMG/IMG11.png)


_Ahora podemos notar que el Partido y el Nombre\_partido se relacionan y generan a su vez redundancia de datos por lo cual incumplen la primera forma normal por la cual la aplicaremos y crearemos su propia tabla, obteniendo asi la tabla Partido_

#### Partido
![](./IMG/img12.png)

_Ahora nuestra tabla queda de la siguiente manera_

![](./IMG/IMG13.png)

_Ahora aplicando nuevamente la primera forma normal vamos a separar en diferentes tablas los datos ELECCION, AÑO\_ELECCION, SEXO Y RAZA generando asi 2 tablas distintas. en este caso en especifico sexo unicamente tendra 2 campos siempre por lo cual no lo separamos en otra tabla si no lo dejamos como un campo_

#### ELECCION
![](./IMG/IMG14.png)

#### RAZA
![](./IMG/IMG15.png)

_Ahora eliminaremos los datos repetidos en las tablas_

#### ELECCION
![](./IMG/IMG16.png)

#### RAZA
![](./IMG/IMG17.png)

#### Partido
![](./IMG/IMG18.png)

_Nos queda la tabla voto de esta forma_

![](./IMG/IMG19.png)

_Ahora podemos observar que nos quedan los campos PARTIDO, RAZA, NOMBRE\_ELECCION, ANO\_ELECCION que no depende de la tabla si no de otras tablas ya generadas por lo cual aplicaremos la 2da forma normal y colocaremos sus codigos de identificación_

![](./IMG/IMG20.png)

_Analizando nuevamente la tabla de elección, podemos notar que el año cambia generando redundancia en el nombre de las elecciones por lo cual es necesario separarlo utilizamos la 2da forma normal para esto. generando una segunda tabla llamada tipo\_eleccion_

![](./IMG/IMG21.png)

_La separación quedaria asi_

#### Eleccion
![](./IMG/IMG23.png)
#### Tipo_eleccion
![](./IMG/IMG22.png)

_Analizando nuevamente la tabla de voto podemos observar que el campo de MUNICIPIO no pertenece exacamente a esta tabla si no depende tambien de otra por lo cual crearemos una nueva tabla y haremos la 3ra normalización quedando la siguiente tabla_

#### MUNICIPIO

![](./IMG/IMG24.png)

_Y finalmente asi quedaria la tabla de voto_
![](./IMG/img25.png)


## Generación del ER
_Con todas las tablas ya normalizadas ya podemos continuar con la generación de la Entidad relación quedandonos de la siguiente manera_

![](./IMG/ER.png)
