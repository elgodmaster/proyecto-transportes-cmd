--------NO EJECUTAR ESTE SCRIPT--------------
--------NO EJECUTAR ESTE SCRIPT--------------
--------NO EJECUTAR ESTE SCRIPT--------------
--------NO EJECUTAR ESTE SCRIPT--------------
--------NO EJECUTAR ESTE SCRIPT--------------
--------NO EJECUTAR ESTE SCRIPT--------------
--------NO EJECUTAR ESTE SCRIPT--------------
--------NO EJECUTAR ESTE SCRIPT--------------
--------NO EJECUTAR ESTE SCRIPT--------------
--------NO EJECUTAR ESTE SCRIPT--------------
--------NO EJECUTAR ESTE SCRIPT--------------
--------NO EJECUTAR ESTE SCRIPT--------------
--------NO EJECUTAR ESTE SCRIPT--------------
--------NO EJECUTAR ESTE SCRIPT--------------
--------NO EJECUTAR ESTE SCRIPT--------------
--------NO EJECUTAR ESTE SCRIPT--------------
--------NO EJECUTAR ESTE SCRIPT--------------
--------NO EJECUTAR ESTE SCRIPT--------------
--------NO EJECUTAR ESTE SCRIPT--------------
--------NO EJECUTAR ESTE SCRIPT--------------
--------NO EJECUTAR ESTE SCRIPT--------------
--------NO EJECUTAR ESTE SCRIPT--------------
--------NO EJECUTAR ESTE SCRIPT--------------
--------NO EJECUTAR ESTE SCRIPT--------------
--------NO EJECUTAR ESTE SCRIPT--------------
--------NO EJECUTAR ESTE SCRIPT--------------
--------NO EJECUTAR ESTE SCRIPT--------------

use bdTransportesCMD
go
--create table mensajes(
--men_id int primary key identity not null,
--men_codigo char(7) unique,
--men_descripcion text,
--men_fecRegistro datetime)
--go

--if object_id('spMostrarMensaje', 'p') is not null
--drop procedure spMostrarMensaje
--go
-- create procedure spMostrarMensaje(
--@men_codigo char(7))
--as begin
--	select men_descripcion from mensajes where men_codigo=@men_codigo
--end
--go

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
go
---------------------------------POBLAR PERSONAS------------------------

CREATE VIEW seeder
AS
	SELECT RAND(CONVERT(VARBINARY, NEWID())) seed
GO
CREATE FUNCTION fnGetNumeroAleatorioEntre
(
	@lower DECIMAL(18,4),
	@upper DECIMAL(18,4)
)
RETURNS DECIMAL(18,4)
AS
BEGIN
	DECLARE @random DECIMAL(18,2)
	SELECT @random = ((@upper - @lower) * seed + @lower) FROM dbo.seeder
	RETURN @random
END
go
select cast(dbo.fnGetNumeroAleatorioEntre(19000000,99999999) as int)
go
CREATE FUNCTION fnGenerarFechaAleatoriaEntre
(
	@lower DATE,
	@upper DATE
)
RETURNS DATE
AS
BEGIN
	DECLARE @random DATE
	SELECT @random = DATEADD(day, DATEDIFF(DAY, @lower, @upper) * seed, @lower) FROM dbo.seeder
	RETURN @random
END
go
SELECT dbo.fnGenerarFechaAleatoriaEntre('1970-01-01', '2013-12-31')
go
if object_id('spImportarPersonas', 'p') is not null
drop procedure spImportarPersonas
go
 create procedure spImportarPersonas
as begin
	declare @nom varchar(50), @ape varchar(100),@ema varchar(50), @sex char(1)
	declare curPersona cursor for 
		select PP.per_nombres, PP.per_apePaterno +' '+ PP.per_apeMaterno, PP.per_email
		from bdPruebas.dbo.persona PP
	
	open curPersona 
	fetch curPersona into @nom, @ape, @ema
	while @@FETCH_STATUS=0		
		begin
			set @sex='f'
			if cast(dbo.fnGetNumeroAleatorioEntre(19000000,99999999) as int)>47000098
			set @sex='m'			
			insert into persona(per_nombres,per_apellidos,per_numDocIdentidad,per_fecNacimiento,per_telefono,per_sexo,per_direccion,
			per_email,per_img,per_fecRegistro,per_estado,docIdentidad_id ) 
				values(@nom,@ape,cast(dbo.fnGetNumeroAleatorioEntre(19000000,99999999) as int),dbo.fnGenerarFechaAleatoriaEntre('1970-01-01', '2013-12-31'),'n',@sex,'n','n','n',GETDATE(),'a',2 )
			fetch curPersona into @nom, @ape, @ema
		end	
	close curPersona
	DEALLOCATE curPersona;
end
go

spImportarPersonas