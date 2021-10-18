
--LLENANDO LA TABLA PAIS 6 paises

Insert into PAIS(  nombre_pais )
Select distinct  temporal.pais from temporal;

--LLENANDO LA TABLA REGION 22 regiones



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
where  temporal.Departamento= Departamento.nombre_Departamento

--LLENANDO LA TABLA PARTIDO 18
Insert into partido(  Nombre_Partido, Partido, ID_Pais)
Select distinct temporal.Nombre_paritdo,temporal.Partido,PAIS.ID_PAIS
from temporal,
     PAIS
where  TEMPORAL.PAIS= PAIS.nombre_pais;

--LLENANDO LA TABLA TIPO DE ELECCION 1

Insert into tipo_eleccion( TipoEleccion )
Select distinct  temporal.nombre_eleccion
from temporal;

--LLENANDO TABLA ELECCION 6

Insert into eleccion( AÑO_ELECCION, TipoEleccion, id_pais )
Select distinct  temporal.anio_eleccion ,temporal.nombre_eleccion,pais.id_pais
from temporal,pais
where  temporal.pais=pais.nombre_pais

;


-- Llenando la tabla    resultados 


select count(*)
from (
         Select distinct temporal.Analfabetos,
                         temporal.Alfabetos,
                         TEMPORAL.Primaria,
                         temporal.Nivel_Medio,
                         temporal.Universitarios,


                         Municipio.ID_Municipio,

                         eleccion.ID_Eleccion
         from temporal
                  inner join pais on temporal.pais = pais.nombre_pais
                  inner join region on temporal.region = region.nombre_Region and region.ID_PAIS = pais.ID_PAIS
                  inner join departamento on Departamento.nombre_Departamento = temporal.Departamento and
                                             Departamento.ID_REGION = region.ID_Region
                  inner join municipio on Municipio.nombre_Municipio = temporal.Municipio and
                                          departamento.ID_Departamento = municipio.ID_departamento
                  inner join eleccion
                             on Eleccion.TipoEleccion = temporal.nombre_eleccion and
                                eleccion.id_pais = pais.ID_PAIS) as efe;
