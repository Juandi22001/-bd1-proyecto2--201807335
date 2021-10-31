use proyecto2bases;

Insert into PAIS(  nombre_pais )
Select distinct  temporal.pais from temporal;

##LLENANDO LA TABLA REGION 22 regiones



Insert into Region(  nombre_region, id_pais )
Select distinct  temporal.region,pais.ID_PAIS  from temporal,pais
where pais.nombre_pais = temporal.pais

;


--LLENANDO LA TABLA DEPARTAMENTOS  81





Insert into departamento(nombre_Departamento, ID_REGION)
Select distinct temporal.Departamento, REGION.ID_REGION
from temporal,
     REGION,PAIS
where  temporal.pais = PAIS.nombre_pais AND region.ID_PAIS = PAIS.ID_PAIS AND REGION.nombre_Region= temporal.region
;

--LLENANDO LA TABLA MUNICIPIOS 1170


Insert into municipio( nombre_Municipio, ID_departamento)
Select distinct temporal.Municipio,Departamento.ID_DEPARTAMENTO
from temporal,
     departamento
where  temporal.Departamento= Departamento.nombre_Departamento;

--LLENANDO LA TABLA PARTIDO 18

Insert into partido(  Nombre_Partido, Partido)
Select distinct temporal.Nombre_paritdo,temporal.Partido
from temporal;


--LLENANDO TABLA ELECCION 6

Insert into eleccion( AÑO_ELECCION, TipoEleccion, id_pais )
Select distinct  temporal.anio_eleccion ,temporal.nombre_eleccion,pais.id_pais
from temporal,pais
where  temporal.pais=pais.nombre_pais

;

--LLENANDO LA TABLA SEXO  2
INSERT INTO SEXO( SEXO) SELECT  DISTINCT  TEMPORAL.SEXO FROM TEMPORAL;
--LLENANDO LA TABLA RAZA 3 RESULTADOS
INSERT INTO RAZA( RAZA) SELECT  DISTINCT  TEMPORAL.RAZA FROM TEMPORAL;

-- Llenando la tabla    resultados  20970



INSERT INTO Resultado(analafabetas, alfabetas, primaria, nivel_medio, universitarios, id_municipio, id_eleccion, id_sexo, id_raza,Id_Partido
                    )
Select temporal.Analfabetos,
       TEMPORAL.Alfabetos,
       TEMPORAL.Primaria,
       TEMPORAL.Nivel_Medio,
       TEMPORAL.Universitarios,

       Municipio.ID_Municipio,

       eleccion.ID_Eleccion,
        s.id_sexo,r.id_raza,p.ID_partido

from temporal
         inner join pais on temporal.pais = pais.nombre_pais
         inner join region on temporal.region = region.nombre_Region and region.ID_PAIS = pais.ID_PAIS
         inner join departamento on Departamento.nombre_Departamento = temporal.Departamento and
                                    Departamento.ID_REGION = region.ID_Region
         inner join municipio on Municipio.nombre_Municipio = temporal.Municipio and
                                 departamento.ID_Departamento = municipio.ID_departamento
         inner join eleccion
                    on Eleccion.TipoEleccion = temporal.nombre_eleccion and
                       eleccion.id_pais = pais.ID_PAIS

         inner join sexo s on temporal.Sexo = s.sexo
         inner join raza r on temporal.Raza = r.RAZA
          inner join partido p on temporal.Partido = p.Partido

;
