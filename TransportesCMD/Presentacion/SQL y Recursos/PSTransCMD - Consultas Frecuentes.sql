use bdTransportesCMD
go

--Consultas frecuentes
select CONVERT(CHAR(10), iti_horSalida, 103)
+' ' +RIGHT(CONVERT(CHAR(17), iti_horSalida, 109), 5)
+' ' +RIGHT(CONVERT(CHAR(26), iti_horSalida, 109), 2) 'Fecha y Horario de itinerario'
from itinerario
go
select 
 +' ' +RIGHT(CONVERT(CHAR(17), iti_horSalida, 109), 5)
 +' ' +RIGHT(CONVERT(CHAR(26), iti_horSalida, 109), 2) 'Horario de itinerario'
from itinerario
--------------------------------------------------------------------------------------

declare @var varchar(100)  
set @var= 'OK: Registro Correcto'
if LEFT(@var,2)='OK'
	set @var=LEFT(@var,2)
select @var

