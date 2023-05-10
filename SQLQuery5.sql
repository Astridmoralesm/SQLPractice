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