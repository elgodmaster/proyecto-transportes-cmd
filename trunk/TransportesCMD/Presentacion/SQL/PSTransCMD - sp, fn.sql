use bdTransportesCMD
go
--FUNCIONES
create function fnCifrarClave(
@clave varchar(25))
RETURNS VarBinary(8000)
as begin
	declare @pass VarBinary(8000)
	set @pass = ENCRYPTBYPASSPHRASE(@clave,@clave)
	return @pass
end
go
create function fnDescifrarClave(
@clave VarBinary(8000))
RETURNS varchar(25)
as begin
	declare @pass varchar(25)
	set @pass = DECRYPTBYPASSPHRASE(@clave,@clave)
	return @pass
end
go
insert into documentoIdentidad(docIde_descripcion) values('PASAPORTE')
insert into documentoIdentidad(docIde_descripcion) values('DNI')
insert into documentoIdentidad(docIde_descripcion) values('LIBRETA MILITAR')
go
if object_id('spPersonaRegistrarBasico', 'p') is not null
drop procedure spPersonaRegistrarBasico
go
create procedure spPersonaRegistrarBasico(
@per_nombres varchar(35),
@per_apellidos varchar(55),
@per_numDocIdentidad varchar(15),
@per_sexo char(1),
@docIde_id int)
as
begin
	insert into persona(per_nombres,per_apellidos,per_numDocIdentidad,per_telefono,per_sexo,per_direccion,per_email,per_img,per_fecRegistro,per_estado,docIde_id ) 
	values(@per_nombres,@per_apellidos,@per_numDocIdentidad,'n',@per_sexo,'n','n','n',GETDATE(),'a',@docIde_id )	
end
go
spPersonaRegistrarBasico 'Miler Ivan','Roque Laiza','47540732','m',2
go
if object_id('spUsuarioRegistrar', 'p') is not null
drop procedure spUsuarioRegistrar
go
create procedure spUsuarioRegistrar(
@usu_user varchar(45),
@usu_pass varchar(45),
@per_id int)
as begin
	insert into usuario(usu_user,usu_pass,usu_fecRegistro,usu_estado,per_id) 
	values(@usu_user,dbo.fnCifrarClave(@usu_pass),GETDATE(),'a',@per_id)
end
go
spUsuarioRegistrar 'admin','123',1
go
insert into departamento(dep_nombre) values('La Libertad')
insert into departamento(dep_nombre) values('Lima')
insert into departamento(dep_nombre) values('Cajamarca')
insert into departamento(dep_nombre) values('Piura')
insert into departamento(dep_nombre) values('Ancash')
insert into departamento(dep_nombre) values('Arequipa')
go
insert into ciudad(ciu_nomCiudad,dep_id) values('Trujillo',1)
insert into ciudad(ciu_nomCiudad,dep_id) values('Lima',1)
insert into ciudad(ciu_nomCiudad,dep_id) values('Cajabamba',1)
insert into ciudad(ciu_nomCiudad,dep_id) values('Huaraz',1)
insert into ciudad(ciu_nomCiudad,dep_id) values('Huamachuco',1)
go
insert into sucursal(suc_nombre,suc_direccion,suc_telefono,ciu_id) values('Vallejo','Av. Prolongación Vallejo 1135','231215',1)
insert into sucursal(suc_nombre,suc_direccion,suc_telefono,ciu_id) values('Balta','Jr. Balta 510','232323',5)
insert into sucursal(suc_nombre,suc_direccion,suc_telefono,ciu_id) values('America Sur','Av. América Sur 1145','312312',1)
insert into sucursal(suc_nombre,suc_direccion,suc_telefono,ciu_id) values('Sur América','Av. Sur América 1231','123456',4)
go
insert into cargo(car_nomCargo,car_desCargo)values('SYSTEM ADMIN','Administrador del Sistema')
go
if object_id('spPersonalRegistrar', 'p') is not null
drop procedure spPersonalRegistrar
go
create procedure spPersonalRegistrar(
@per_estCivil char(1),
@per_fecContrato date,
@per_fecFinContrato date,
@Per_id int,
@car_id int,
@suc_id int)
as begin
	insert into personaPersonal(perPer_estCivil,perPer_fecContrato,perPer_fecFinContrato,perPer_fecRegistro,perPer_estado,per_id,car_id,suc_id)
	values(@per_estCivil,@per_fecContrato,@per_fecFinContrato,GETDATE(),'a',@per_id,@car_id,@suc_id)
end
go
spPersonalRegistrar 'c','12/04/2014','17/07/2014',1,1,1
go
if object_id('spServicioEspecialRegistrar', 'p') is not null
drop procedure spServicioEspecialRegistrar
go
create procedure spServicioEspecialRegistrar(
@serEsp_nombre varchar(35),
@serEsp_caracteristicas varchar(85))
as begin
	insert into servicioEspecial(serEsp_nombre,serEsp_caracteristicas,serEsp_fecRegistro,serEsp_estado)
	values(@serEsp_nombre,@serEsp_caracteristicas,GETDATE(),'a')
end
go
spServicioEspecialRegistrar 'Bus Cama','Asientos de 160°'
go
spServicioEspecialRegistrar 'Bus Cama Cold','Asientos de 180°'
go
spServicioEspecialRegistrar 'Vip','Asientos de 180°'
go
if object_id('spVehiculoRegistrar', 'p') is not null
drop procedure spVehiculoRegistrar
go
insert into vehiculoMarca(vehMar_descripcion) values('Mercedes Bens');
insert into vehiculoMarca(vehMar_descripcion) values('Volkswagen');
go
create procedure spVehiculoRegistrar(
@veh_modelo varchar(30),
@veh_numAsiPrimer int,
@veh_numAsiSegundo int,
@vehMar_id int)
as begin
	insert into vehiculo(veh_modelo,veh_numAsiPrimer,veh_numAsiSegundo,veh_img,veh_fecRegistro,veh_estado,vehMar_id) 
	values(@veh_modelo,@veh_numAsiPrimer,@veh_numAsiSegundo,'n',GETDATE(),'a',@vehMar_id)
end
go
spVehiculoRegistrar 'MB001',16,54,1
go
spVehiculoRegistrar 'MB002',54,0,1
go
spVehiculoRegistrar 'MB003',12,50,1
go
spVehiculoRegistrar 'MB004',50,0,1
go
spVehiculoRegistrar 'MB005',20,58,1
go
spVehiculoRegistrar 'MB006',58,0,1
go
spVehiculoRegistrar 'MB007',16,58,1
go
spVehiculoRegistrar 'MB008',12,54,2
go
spVehiculoRegistrar 'MB008',12,54,2
go
if object_id('spItinerarioRegistrar', 'p') is not null
drop procedure spItinerarioRegistrar
go
 create procedure spItinerarioRegistrar(
@iti_origen_id int,
@iti_destino_id int,
@iti_horSalida datetime,
@iti_horLlegada datetime,
@veh_id int,
@serEsp_id int)
as begin
	declare @res nvarchar(500)
	select @res=COUNT(I.veh_id) from vehiculo V, itinerario I 
	where V.veh_id=I.veh_id and I.iti_estado='a' and I.veh_id=@veh_id
	if cast(@res as int)<=1
		begin
			insert into itinerario(iti_origen_id,iti_destino_id,iti_horSalida,iti_horLlegada,iti_fecRegistro,iti_estado,veh_id,serEsp_id) 
			values(@iti_origen_id,@iti_destino_id,@iti_horSalida,@iti_horLlegada,GETDATE(),'a',@veh_id,@serEsp_id)
			if cast(@res as int)=1
				update vehiculo set veh_estado='o' where veh_id=@veh_id
			set @res= 'Registro Correcto'
		end
	else
		set @res= 'Ha ocurrido un error, puede que la unidad no esté activa. Por favor seleccione otra unidad disponible.'		
	select @res		
end
go
spItinerarioRegistrar 1,2,'07/06/2013 8:00 AM','07/06/2013 1:00 PM',1,1
go
spItinerarioRegistrar 1,2,'07/06/2013 9:30 AM','07/06/2013 2:30 PM',2,1
go
spItinerarioRegistrar 1,2,'07/06/2013 1:00 PM','07/06/2013 7:30 PM',3,1
go
spItinerarioRegistrar 1,2,'07/06/2013 4:00 PM','07/06/2013 10:30 PM',4,1
go
spItinerarioRegistrar 1,2,'07/06/2013 9:00 PM','08/06/2013 1:00 AM',5,2
go
spItinerarioRegistrar 1,2,'07/06/2013 10:30 PM','08/06/2013 3:00 AM',6,2
go
spItinerarioRegistrar 1,4,'07/06/2013 9:00 PM','08/06/2013 3:00 AM',7,2
go
spItinerarioRegistrar 1,4,'07/06/2013 11:00 AM','08/06/2013 5:00 AM',8,2
go
spItinerarioRegistrar 1,2,'08/06/2013 9:00 AM','07/06/2013 2:30 PM',9,2
go
select CONVERT(CHAR(10), iti_horSalida, 103)
+' ' +RIGHT(CONVERT(CHAR(17), iti_horSalida, 109), 5)
+' ' +RIGHT(CONVERT(CHAR(26), iti_horSalida, 109), 2) 'Fecha y Horario de itinerario'
from itinerario
go
select 
 +' ' +RIGHT(CONVERT(CHAR(17), iti_horSalida, 109), 5)
 +' ' +RIGHT(CONVERT(CHAR(26), iti_horSalida, 109), 2) 'Horario de itinerario'
from itinerario
go
if object_id('spIntinerarioOrigenBusquedaNombre', 'p') is not null
drop procedure spIntinerarioOrigenBusquedaNombre
go
 create procedure spIntinerarioOrigenBusquedaNombre(
@iti_origen varchar(100))
as begin
	select distinct I.iti_origen_id, C.ciu_nomCiudad,SO.suc_direccion 
	from itinerario I, sucursal SO, ciudad C
	where I.iti_origen_id=SO.suc_id  and SO.ciu_id=C.ciu_id and I.iti_estado='a' 
	and (C.ciu_nomCiudad+' '+SO.suc_nombre) like '%'+@iti_origen+'%'
end
go
spIntinerarioOrigenBusquedaNombre ''
go
if object_id('spIntinerarioDestinoBusquedaIdOrigen', 'p') is not null
drop procedure spIntinerarioDestinoBusquedaIdOrigen
go
 create procedure spIntinerarioDestinoBusquedaIdOrigen(
@iti_origen_id int)
as begin
	select distinct I.iti_destino_id,C.ciu_nomCiudad,SD.ciu_id,I.iti_origen_id
	from itinerario I, sucursal SD, ciudad C
	where I.iti_destino_id=SD.suc_id  and SD.ciu_id=C.ciu_id and I.iti_estado='a' 
	and I.iti_origen_id=@iti_origen_id	
end
go
spIntinerarioDestinoBusquedaIdOrigen 2
go
if object_id('spIntinerarioHoraSalidaBusquedaIdOrigenDestino', 'p') is not null
drop procedure spIntinerarioHoraSalidaBusquedaIdOrigenDestino
go
 create procedure spIntinerarioHoraSalidaBusquedaIdOrigenDestino(
@iti_origen_id int,
@iti_destino_id int)
as begin
	select distinct CONVERT(CHAR(10), I.iti_horSalida, 103) 
	from itinerario I, sucursal SO, sucursal SD, ciudad CO, ciudad CD
	where I.iti_origen_id=SO.suc_id and SO.ciu_id=CO.ciu_id  and 
	I.iti_destino_id=SD.suc_id and SD.ciu_id=CD.ciu_id and I.iti_estado='a' 
	and I.iti_origen_id=@iti_origen_id and I.iti_destino_id=@iti_destino_id
end
go
spIntinerarioHoraSalidaBusquedaIdOrigenDestino 1,2
go
if object_id('spIntinerarioHoraSalidaBusquedaIdOrigenDestinoFecha', 'p') is not null
drop procedure spIntinerarioHoraSalidaBusquedaIdOrigenDestinoFecha
go
 create procedure spIntinerarioHoraSalidaBusquedaIdOrigenDestinoFecha(
@iti_origen_id int,
@iti_destino_id int,
@iti_horSalida datetime)
as begin
	select distinct iti_id,RIGHT(CONVERT(CHAR(17), iti_horSalida, 109), 5)
 +' ' +RIGHT(CONVERT(CHAR(26), iti_horSalida, 109), 2)
	from itinerario I, sucursal SO, sucursal SD, ciudad CO, ciudad CD
	where I.iti_origen_id=SO.suc_id and SO.ciu_id=CO.ciu_id  and 
	I.iti_destino_id=SD.suc_id and SD.ciu_id=CD.ciu_id and I.iti_estado='a' 
	and I.iti_origen_id=@iti_origen_id and I.iti_destino_id=@iti_destino_id and CONVERT(CHAR(10), I.iti_horSalida, 103)=@iti_horSalida
end
go
spIntinerarioHoraSalidaBusquedaIdOrigenDestinoFecha 1,2,'07/06/2013'
go

if object_id('spIntinerarioOrigenDestino', 'p') is not null
drop procedure spIntinerarioOrigenDestino
go
 create procedure spIntinerarioOrigenDestino
as begin
	select distinct I.iti_origen_id,I.iti_destino_id, CO.ciu_nomCiudad,CD.ciu_nomCiudad
	from itinerario I, sucursal SO, sucursal SD,ciudad CO,ciudad CD
	where 
	I.iti_origen_id=SO.suc_id and 
	SO.ciu_id=CO.ciu_id and 
	I.iti_destino_id=SD.suc_id and SD.ciu_id=CD.ciu_id and I.iti_estado='a' 	
end
go
spIntinerarioOrigenDestino

 