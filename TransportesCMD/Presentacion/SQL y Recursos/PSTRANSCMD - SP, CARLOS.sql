use bdTransportesCMD
go

CREATE PROCEDURE spVehiculoListar
as
SELECT C.veh_placa, C.veh_modelo,C.veh_marca,C.veh_numAsiPrimer,C.veh_numAsiSegundo,C.veh_estado,
		S.serEsp_nombre,c.veh_id
FROM vehiculo C, servicioEspecial S
WHERE C.serEspecial_id = S.serEsp_id
and c.veh_estado = 'a'
go

CREATE PROCEDURE spVehiculoXid(@veh_id int)
as
Begin
SELECT C.veh_placa, C.veh_modelo,C.veh_marca,C.veh_numAsiPrimer,C.veh_numAsiSegundo,C.veh_estado,
		S.serEsp_nombre,c.veh_id
FROM vehiculo C, servicioEspecial S
WHERE C.serEspecial_id = S.serEsp_id
and c.veh_id=@veh_id
end
go

create procedure spVehiculoModificar(
@veh_id int,
@veh_marca varchar(35),
@veh_modelo varchar(30),
@veh_placa varchar(15),
@veh_numAsiPrimer int,
@veh_numAsiSegundo int,
@veh_estado char(1),
@serEspecial_id int)
as begin
	update vehiculo set veh_marca=@veh_marca,veh_modelo=@veh_modelo,veh_placa=@veh_placa,
	veh_numAsiPrimer=@veh_numAsiPrimer,veh_numAsiSegundo=@veh_numAsiSegundo,veh_estado=@veh_estado,
	serEspecial_id=@serEspecial_id
	where veh_id = @veh_id
end
go


create procedure spVehiculoEliminar(
@veh_id int)

as begin
	update vehiculo set veh_estado='e'
	where veh_id = @veh_id
end
go









create procedure spServicioEspecialRegistro(
@serEsp_nombre varchar(35),
@serEsp_caracteristicas varchar(85),
@serEsp_estado int)
as begin
insert into servicioEspecial(serEsp_nombre, serEsp_caracteristicas,serEsp_fecRegistro, serEsp_estado) 
values(@serEsp_nombre,@serEsp_caracteristicas,GETDATE(),@serEsp_estado)
end
