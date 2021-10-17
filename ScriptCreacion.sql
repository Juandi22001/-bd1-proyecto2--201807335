
use Proyecto2Bases;
CREATE TABLE
    temporal
(


    nombre_eleccion varchar(100),

    anio_eleccion   varchar(100),

    pais            varchar(100),

    region          varchar(100),

    Departamento    varchar(100),

    Municipio       varchar(100),
    Partido         varchar(100),

    Nombre_paritdo  varchar(100),

    Sexo            varchar(100),

    Raza            varchar(100),

    Analfabetos     int,
    Alfabetos       int,
    Primaria        int,

    Nivel_Medio     int,
    Universitarios  int


);


create table Pais (
    ID_PAIS  INT AUTO_INCREMENT,
  nombre_pais VARCHAR(100),
  PRIMARY KEY (ID_PAIS)



);



create table Region (
    ID_Region  INT AUTO_INCREMENT,
  nombre_Region VARCHAR(100),
  ID_PAIS INT,
  PRIMARY KEY (ID_Region),
  FOREIGN KEY  (ID_PAIS) REFERENCES  PAIS(ID_PAIS)



);
create table Departamento (
    ID_Departamento  INT AUTO_INCREMENT,
  nombre_Departamento VARCHAR(100),
  ID_REGION INT,
  PRIMARY KEY (ID_Departamento),
  FOREIGN KEY  (ID_REGION) REFERENCES  region (ID_region)



);

create table Municipio (
    ID_Municipio  INT AUTO_INCREMENT,
  nombre_Municipio VARCHAR(100),
  ID_departamento INT,
  PRIMARY KEY (ID_Municipio),
  FOREIGN KEY  (ID_departamento) REFERENCES  departamento (ID_Departamento)



);
create table Partido (
    ID_partido  INT AUTO_INCREMENT,
  Nombre_Partido VARCHAR(100),
  Partido VARCHAR(100),

  ID_Pais INT,
  PRIMARY KEY (ID_partido),
  FOREIGN KEY  (ID_Pais) REFERENCES  Pais (ID_Pais)



);

create table Tipo_Eleccion (
    ID_TipoEleccion  INT AUTO_INCREMENT,
 TipoEleccion VARCHAR(100),
  PRIMARY KEY (ID_TipoEleccion)



);
create table Eleccion
(
    ID_Eleccion  INT AUTO_INCREMENT,
    AÑO_ELECCION VARCHAR(100),
    TipoEleccion INT,
    id_pais      INT,


    PRIMARY KEY (ID_Eleccion),

    Foreign key (TipoEleccion) references Tipo_Eleccion(ID_TipoEleccion),
    Foreign key (id_pais) references Pais(id_pais)


);

use Proyecto2Bases;

create table Resultado
(
    Id_Resultado   INT AUTO_INCREMENT,
    Analafabetas   INT,
    Alfabetas      INT,
    Primaria       INT,
    Nivel_Medio    INT,
    Universitarios INT,
    Id_Municipio   INT,
    Id_Eleccion    INT,

    PRIMARY KEY (Id_Resultado),

    Foreign key (Id_Eleccion) references eleccion (ID_Eleccion),
    Foreign key (Id_Municipio) references municipio (id_municipio)


);



