use bdTransportesCMD
go
create procedure spServicioEspecialRegistro(
@serEsp_nombre varchar(35),
@serEsp_caracteristicas varchar(85))
as begin
insert into servicioEspecial(serEsp_nombre, serEsp_caracteristicas,serEsp_fecRegistro, serEsp_estado) 
values(@serEsp_nombre,@serEsp_caracteristicas,GETDATE(),1)
end
go

create procedure spServicioListar
as
SELECT S.serEsp_nombre, S.serEsp_caracteristicas, S.serEsp_fecRegistro, S.serEsp_estado, S.serEsp_id
FROM servicioEspecial S
WHERE s.serEsp_estado = 1
go

create procedure spServicioEliminar(
@serEsp_id int)

as begin
	update servicioEspecial set serEsp_estado=0
	where serEsp_id = @serEsp_id
end
go

create procedure spServicioModificar(
@serEsp_id int,
@serEsp_nombre varchar(35),
@serEsp_caracteristicas varchar(85),
@serEsp_estado char(1))
as begin
	update servicioEspecial set serEsp_nombre=@serEsp_nombre,serEsp_caracteristicas=@serEsp_caracteristicas,
	serEsp_estado=@serEsp_estado
	where serEsp_id = @serEsp_id
end
go
CREATE PROCEDURE spServicioXid(@serEsp_id int)
as
Begin
SELECT S.serEsp_nombre, S.serEsp_caracteristicas, S.serEsp_fecRegistro, S.serEsp_estado, S.serEsp_id
FROM servicioEspecial S
WHERE s.serEsp_id=@serEsp_id
end
go