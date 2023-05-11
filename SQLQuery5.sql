update Estudiantes set FechaNac = '24/05/2003' where ID_estudiante= 4

--Modificando tabla monitores

select * from Monitores

update Monitores set Anio_en_curso = '2024' where ID_monitor= 1
update Monitores set ID_clase = '4', Anio_en_curso = '2022' where ID_monitor= 20
update Monitores set ID_clase = '2', Anio_en_curso = '2020' where ID_monitor= 6
update Monitores set ID_clase = '9', Anio_en_curso = '2022' where ID_monitor= 4
update Monitores set ID_clase = '2', Anio_en_curso = '2021' where ID_monitor= 10

--Eliminando registros de la tabla clases

select * from Clases

delete from Clases where ID_clase = '3'
delete from Clases where ID_clase = '8'
delete from Clases where ID_clase = '5'
delete from Clases where ID_clase = '10'

-- Mostrando los monitores de la carrera de Ingenieria en sistemas

select m.ID_monitor, e.Carrera 
from Estudiantes e, Monitores m where (m.ID_estudiante =  e.ID_estudiante AND e.Carrera = 'Ingenieria en sistemas')

-- Mostrando el nombre completo de los monitores, la clase que van a impartir y su correo electrónico

select m.ID_monitor, e.Nombre, e.Apellido, c.Nombre_clase, e.Correo_electronico
from Estudiantes e, Monitores m, Clases c where (m.ID_estudiante = e.ID_estudiante AND m.ID_clase = c.ID_clase)

-- Mostrando los monitores que cumplen años en el mes de mayo

select e.Nombre, e.FechaNac from Estudiantes e, Monitores m where m.ID_estudiante = e.ID_estudiante
AND DATEPART(MONTH,FechaNac) = 05

-- Monitores que cumplen años durante la semana del 8 al 13 de mayo

select e.Nombre, e.FechaNac 
from Estudiantes e, Monitores m where m.ID_estudiante = e.ID_estudiante
AND (DATEPART(MONTH,FechaNac) = 05 AND DATEPART(DAY,FechaNac) BETWEEN 08 AND 13)

-- Monitores que posean en su nombre la letra u
 select e.Nombre
 from Estudiantes e, Monitores m where m.ID_estudiante = e.ID_estudiante
 AND e.Nombre LIKE '%u%'

 -- Monitores por una clase especifica

 select e.Nombre, c.Nombre_clase
 from Estudiantes e, Monitores m, Clases c where (m.ID_estudiante = e.ID_estudiante AND m.ID_clase = c.ID_clase)
 AND c.Nombre_clase = 'Calculo'

 -- Monitores Contar cuantos monitores hay mayores de edad.

 Select --*, DATEDIFF(YEAR,e.FechaNac,GETDATE()) as Edad 
		 SUM (CASE WHEN DATEDIFF(YEAR,e.FechaNac,GETDATE()) > 18 
		THEN 1 ELSE 0 END) AS 'Mayor'
 from Estudiantes e, Monitores m where m.ID_estudiante = e.ID_estudiante 

 -- Contar cuantos monitores son menores de edad
 Select --*, DATEDIFF(YEAR,e.FechaNac,GETDATE()) as Edad 
		 SUM (CASE WHEN DATEDIFF(YEAR,e.FechaNac,GETDATE()) < 18 
		THEN 1 ELSE 0 END) AS 'Menor'
 from Estudiantes e, Monitores m where m.ID_estudiante = e.ID_estudiante 

 -- Horarios de clases 
 select Horario from Clases 

-- Campo clases
Alter table Clases add Activo bit default 'true'

drop table Monitores
drop table Estudiantes
drop database BDMonitores