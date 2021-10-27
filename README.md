
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

### TERCERA  Normalización

Como segunda Normalización podemos observar que tanto en las columnas RAZA , como en la columna SEXO  se logra ver con claridad que  es necesario aplicar la primera regla Normal  y así eliminar todos  aquellos datos que se encuentran repetidos así relacionar  todos estos campos con nuestra tabla "RESULTADO" que fue creada con anterioridad  y así manejar de una mejor manera los datos  .


 ![efe](https://github.com/Juandi22001/Predicas/blob/master/Temporal_raza_sexo.JPG?raw=true)

_Con  la normalización aplicada se crearan las siguientes tablas:

## TABLA RAZA

 ![efe](https://github.com/Juandi22001/Predicas/blob/master/RAZA.JPG?raw=true)

## TABLA  SEXO

 ![efe](https://github.com/Juandi22001/Predicas/blob/master/SEXO.JPG?raw=true)


_Bien ahora analizando la tabla DEPTO podemos notar que aun hay redundancia de datos por lo cual aplicaremos 2da forma normal generando 3 nuevas tablas PAIS, DEPTO y REGION_



## Generación del ER
_Con todas las tablas ya normalizadas ya podemos continuar con la generación de la Entidad relación quedandonos de la siguiente manera_

![](./IMG/ER.png)
