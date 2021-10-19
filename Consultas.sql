--consulta 4 

select total1.PAIS, TOTAL1.region, TOTAL1.maximo
from (select temp1.pais pais, temp1.region region, max(temp1.suma) maximo
      from (select p.nombre_pais                                            pais,
                   r.nombre_Region                                          region,
                   RAZA.rAZA,
                   (sum(resultado.Alfabetas) + sum(resultado.Analafabetas)) SUMA
            FROM raza
                     inner join resultado on raza.Id_Raza = resultado.id_raza

                     inner join municipio m on resultado.Id_Municipio = m.ID_Municipio
                     inner join departamento d on m.ID_departamento = d.ID_Departamento
                     inner join region r on d.ID_REGION = r.ID_Region
                     inner join pais p on r.ID_PAIS = p.ID_PAIS
                     inner join eleccion e on p.ID_PAIS = e.id_pais

            group by p.nombre_pais, r.nombre_Region, RAZA.RAZA
            order by p.nombre_pais) as temp1

      group by temp1.pais, temp1.region
      order by temp1.pais, temp1.region
     ) total1
         inner join
     (select p.nombre_pais                                            pais,
             r.nombre_Region                                          region,
             RAZA.rAZA,
             (sum(resultado.Alfabetas) + sum(resultado.Analafabetas)) SUMA
      FROM raza
               inner join resultado on raza.Id_Raza = resultado.id_raza

               inner join municipio m on resultado.Id_Municipio = m.ID_Municipio
               inner join departamento d on m.ID_departamento = d.ID_Departamento
               inner join region r on d.ID_REGION = r.ID_Region
               inner join pais p on r.ID_PAIS = p.ID_PAIS
               inner join eleccion e on p.ID_PAIS = e.id_pais

      group by p.nombre_pais, r.nombre_Region, RAZA.RAZA
      order by p.nombre_pais) total2
     on total1.pais = total2.pais and total1.region = total2.region and total1.maximo = total2.SUMA and
        total2.RAZA = 'INDIGENAS'

ORDER BY total1.PAIs

--consulta7
select total1.pais,total1.region , total1.SUMA/total2.nDepartamentos
from (
         select p.nombre_pais                                            pais,
                r.nombre_Region                                          region,

                (sum(resultado.Alfabetas) + sum(resultado.Analafabetas)) SUMA
         from resultado
                  inner join municipio m on resultado.Id_Municipio = m.ID_Municipio
                  inner join departamento d on m.ID_departamento = d.ID_Departamento
                  inner join region r on d.ID_REGION = r.ID_Region
                  inner join pais p on r.ID_PAIS = p.ID_PAIS
                  inner join eleccion e on p.ID_PAIS = e.id_pais

         group by p.nombre_pais, r.nombre_Region
         order by p.nombre_pais) as total1
         inner join

     (
         select pais.nombre_pais pais , r.nombre_Region region, count(*) as nDepartamentos
         from pais
                  inner join region r on pais.ID_PAIS = r.ID_PAIS
                  inner join departamento d on r.ID_Region = d.ID_REGION
         group by pais.nombre_pais, r.nombre_Region
     ) as total2

     on total1.pais= total2.pais and total1.region = total2.region

   order by total1.pais


--consulta 8


select tu.pais, tu.TOTALuniversitarios,tu.TOTALnivelMedio,tu.TOTALPrimario  from  (
select distinct pais.nombre_pais as pais, SUM(resultado.Universitarios) TOTALuniversitarios,SUM(resultado.Nivel_Medio) TOTALnivelMedio,SUM(resultado.Primaria) TOTALPrimario
               from pais
                        join eleccion on pais.id_pais = Eleccion.id_pais
                        join resultado on Eleccion.ID_Eleccion = Resultado.Id_Eleccion


                 group by  pais.nombre_pais

               order by pais.nombre_pais
) as tU;

--consulta 9 
select total1.pais, total2.raza, total2.total_raza / total1.totalpais *100  as porcentaje
from (select temp2.pais as pais, temp2.raza as raza, sum(temp2.total_raza1) as total_raza
      from (
               select distinct pais.nombre_pais as pais, raza.RAZA as raza, count(*) total_raza1
               from pais
                        join eleccion on pais.id_pais = Eleccion.id_pais
                        join resultado on Eleccion.ID_Eleccion = Resultado.Id_Eleccion
                        join raza on raza.Id_Raza = Resultado.id_raza
               group by pais.nombre_pais, raza.RAZA
               order by pais.nombre_pais) as temp2

      group by temp2.pais, temp2.raza
      order by temp2.pais
     ) as total2
        ,


     (
         select temp.pais, sum(totalpais) as totalpais
         from (
                  select distinct pais.nombre_pais as pais, raza.RAZA, count(*) totalpais
                  from pais
                           join eleccion on pais.id_pais = Eleccion.id_pais
                           join resultado on Eleccion.ID_Eleccion = Resultado.Id_Eleccion
                           join raza on raza.Id_Raza = Resultado.id_raza
                  group by pais.nombre_pais
                  order by pais.nombre_pais
              ) temp
         group by temp.pais
     ) total1

where total1.pais = total2.pais

group by total1.pais, total2.raza
order by total1.pais


--consulta 11


select total1.pais,TOTAL1.SUMA AS MUJERES_ANALFABETAS, total1.SUMA*100/total2.SUMA  AS PORCENTAJE  from (

select p.nombre_pais                                            pais,

             RAZA.rAZA,
            s.sexo,
             ( sum(resultado.Alfabetas)) SUMA
      FROM raza
               inner join resultado on raza.Id_Raza = resultado.id_raza

               inner join municipio m on resultado.Id_Municipio = m.ID_Municipio
               inner join departamento d on m.ID_departamento = d.ID_Departamento
               inner join region r on d.ID_REGION = r.ID_Region
               inner join pais p on r.ID_PAIS = p.ID_PAIS
               inner join sexo s on resultado.id_sexo = s.Id_Sexo
    where s.sexo='mujeres' and  raza.raza='INDIGENAS'

      group by p.nombre_pais,  RAZA.RAZA,s.sexo
      order by p.nombre_pais) as total1 ,


(

select p.nombre_pais                                            pais,


             ( sum(resultado.Alfabetas)+sum(resultado.Analafabetas)) SUMA
      FROM raza
               inner join resultado on raza.Id_Raza = resultado.id_raza

               inner join municipio m on resultado.Id_Municipio = m.ID_Municipio
               inner join departamento d on m.ID_departamento = d.ID_Departamento
               inner join region r on d.ID_REGION = r.ID_Region
               inner join pais p on r.ID_PAIS = p.ID_PAIS
               inner join sexo s on resultado.id_sexo = s.Id_Sexo


      group by p.nombre_pais
      order by p.nombre_pais) as total2
WHERE TOTAL1.pais=TOTAL2.PAIS
;

--consulta 12 



select total1.pais pais , total2.SUMA *100 / total1.SUMA as efe
from (select p.nombre_pais                                            pais,

             (sum(resultado.Alfabetas) + sum(resultado.Analafabetas)) SUMA
      from resultado
               inner join municipio m on resultado.Id_Municipio = m.ID_Municipio
               inner join departamento d on m.ID_departamento = d.ID_Departamento
               inner join region r on d.ID_REGION = r.ID_Region
               inner join pais p on r.ID_PAIS = p.ID_PAIS


      group by p.nombre_pais
      order by p.nombre_pais) as total1,

     (


select p.nombre_pais               pais,

       sum(resultado.Analafabetas) SUMA
from resultado
         inner join municipio m on resultado.Id_Municipio = m.ID_Municipio
         inner join departamento d on m.ID_departamento = d.ID_Departamento
         inner join region r on d.ID_REGION = r.ID_Region
         inner join pais p on r.ID_PAIS = p.ID_PAIS


group by p.nombre_pais
order by p.nombre_pais) as total2

WHERE total1.pais=total2.pais

group by  total1.pais order by  efe desc
limit 1
-- consulta 13


select  total1.pais,total1.nombre_Departamento,total1.suma from (
select p.nombre_pais                                            pais,
               d.nombre_Departamento,

                (sum(resultado.Alfabetas) + sum(resultado.Analafabetas)) SUMA
         from resultado
                  inner join municipio m on resultado.Id_Municipio = m.ID_Municipio
                  inner join departamento d on m.ID_departamento = d.ID_Departamento
                  inner join region r on d.ID_REGION = r.ID_Region
                  inner join pais p on r.ID_PAIS = p.ID_PAIS

         where nombre_pais='GUATEMALA'

         group by p.nombre_pais, d.nombre_Departamento
         order by p.nombre_pais) as total1
,



(
select p.nombre_pais                                            pais,
               d.nombre_Departamento,

                (sum(resultado.Alfabetas) + sum(resultado.Analafabetas)) SUMA
         from resultado
                  inner join municipio m on resultado.Id_Municipio = m.ID_Municipio
                  inner join departamento d on m.ID_departamento = d.ID_Departamento
                  inner join region r on d.ID_REGION = r.ID_Region
                  inner join pais p on r.ID_PAIS = p.ID_PAIS

         where nombre_pais='GUATEMALA'  and nombre_Departamento ='Guatemala'

         group by p.nombre_pais, d.nombre_Departamento
         order by p.nombre_pais) as total2

where total1.SUMA>total2.SUMA

order by total1.nombre_Departamento

