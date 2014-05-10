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
@docIdentidad_id int)
as
begin
	insert into persona(per_nombres,per_apellidos,per_numDocIdentidad,per_telefono,per_sexo,per_direccion,per_email,per_img,per_fecRegistro,per_estado,docIdentidad_id ) 
	values(@per_nombres,@per_apellidos,@per_numDocIdentidad,'n',@per_sexo,'n','n','n',GETDATE(),'a',@docIdentidad_id )	
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
@persona_id int)
as begin
	insert into usuario(usu_user,usu_pass,usu_fecRegistro,usu_estado,persona_id) 
	values(@usu_user,dbo.fnCifrarClave(@usu_pass),GETDATE(),'a',@persona_id)
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
insert into ciudad(ciu_nomCiudad,departamento_id) values('Trujillo',1)
insert into ciudad(ciu_nomCiudad,departamento_id) values('Lima',1)
insert into ciudad(ciu_nomCiudad,departamento_id) values('Cajabamba',1)
insert into ciudad(ciu_nomCiudad,departamento_id) values('Huaraz',1)
insert into ciudad(ciu_nomCiudad,departamento_id) values('Huamachuco',1)
go
insert into sucursal(suc_nombre,suc_direccion,suc_telefono,ciudad_id) values('Vallejo','Av. Prolongación Vallejo 1135','231215',1)
insert into sucursal(suc_nombre,suc_direccion,suc_telefono,ciudad_id) values('Balta','Jr. Balta 510','232323',5)
insert into sucursal(suc_nombre,suc_direccion,suc_telefono,ciudad_id) values('America Sur','Av. América Sur 1145','312312',1)
insert into sucursal(suc_nombre,suc_direccion,suc_telefono,ciudad_id) values('Sur América','Av. Sur América 1231','123456',4)
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
@persona_id int,
@cargo_id int,
@sucursal_id int)
as begin
	insert into personal(per_estCivil,per_fecContrato,per_fecFinContrato,per_fecRegistro,per_estado,persona_id,cargo_id,sucursal_id)
	values(@per_estCivil,@per_fecContrato,@per_fecFinContrato,GETDATE(),'a',@persona_id,@cargo_id,@sucursal_id)
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
@veh_placa varchar(15),
@veh_numAsiPrimer int,
@veh_numAsiSegundo int,
@vehMarca_id int,
@serEspecial_id int)
as begin
	insert into vehiculo(veh_modelo,veh_placa,veh_numAsiPrimer,veh_numAsiSegundo,veh_img,veh_fecRegistro,veh_estado,vehMarca_id,serEspecial_id) 
	values(@veh_modelo,@veh_placa,@veh_numAsiPrimer,@veh_numAsiSegundo,'n',GETDATE(),'a',@vehMarca_id,@serEspecial_id)
end
go
spVehiculoRegistrar 'MB001','MGS-23',16,54,1,1
go
spVehiculoRegistrar 'MB002','MGS-24',54,0,1,1
gO
spVehiculoRegistrar 'MB003','MGS-25',12,50,1,1
go
spVehiculoRegistrar 'MB004','MGS-26',50,0,1,1
go
spVehiculoRegistrar 'MB005','MGS-27',20,58,1,1
go
spVehiculoRegistrar 'MB006','MGS-28',58,0,1,1
go
spVehiculoRegistrar 'MB007','MGS-29',16,58,1,1
go
spVehiculoRegistrar 'MB008','MGS-10',12,54,2,1
go
spVehiculoRegistrar 'MB008','MGS-11',12,54,2,1
go
if object_id('spLlenarAsientos', 'p') is not null
drop procedure spLlenarAsientos
go
 create procedure spLlenarAsientos(
 @vehiculo_id int,
 @itinerario_id int )
 as begin 
	declare @contador int
	set @contador=1
	while @contador<=(select veh_numAsiPrimer from vehiculo where veh_id=@vehiculo_id)		
		begin
			insert into controlAsiento(conAsi_piso,conAsi_numAsiento,conAsi_estAsiento,itinerario_id)
			values(1,@contador,'d',@itinerario_id) 
			set @contador=@contador+1
		end
	while @contador<=(select veh_numAsiSegundo from vehiculo where veh_id=@vehiculo_id)		
		begin
			insert into controlAsiento(conAsi_piso,conAsi_numAsiento,conAsi_estAsiento,itinerario_id)
			values(2,@contador,'d',@itinerario_id) 
			set @contador=@contador+1
		end
 end
go
if object_id('spItinerarioRegistrar', 'p') is not null
drop procedure spItinerarioRegistrar
go
 create procedure spItinerarioRegistrar(
@sucursal_origen_id int,
@sucursal_destino_id int,
@iti_horSalida datetime,
@iti_horLlegada datetime,
@vehiculo_id int,
@personal_id int)
as begin
	declare @res nvarchar(500)
	declare @PKCreado int
	select @res=COUNT(I.vehiculo_id) from vehiculo V, itinerario I 
	where V.veh_id=I.vehiculo_id and I.iti_estado='a' and I.vehiculo_id=@vehiculo_id
	if cast(@res as int)<=1
		begin
			insert into itinerario(sucursal_origen_id,sucursal_destino_id,iti_horSalida,iti_horLlegada,iti_fecRegistro,iti_estado,vehiculo_id,personal_id) 
			values(@sucursal_origen_id,@sucursal_destino_id,@iti_horSalida,@iti_horLlegada,GETDATE(),'a',@vehiculo_id,@personal_id)
			if cast(@res as int)=1
				update vehiculo set veh_estado='o' where veh_id=@vehiculo_id
			set @PKCreado=@@IDENTITY 
			set @res= 'OK: Registro Correcto'
		end
	else
		set @res= 'ER: Ha ocurrido un error, puede que la unidad no esté activa. Por favor seleccione otra unidad disponible.'	
	if LEFT(@res,2)='OK'
		execute spLlenarAsientos @vehiculo_id,@PKCreado	
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
spItinerarioRegistrar 1,2,'07/06/2013 9:00 PM','08/06/2013 1:00 AM',5,1
go
spItinerarioRegistrar 1,2,'07/06/2013 10:30 PM','08/06/2013 3:00 AM',6,1
go
spItinerarioRegistrar 1,4,'07/06/2013 9:00 PM','08/06/2013 3:00 AM',7,1
go
spItinerarioRegistrar 1,4,'07/06/2013 11:00 AM','08/06/2013 5:00 AM',8,1
go
spItinerarioRegistrar 1,2,'08/06/2013 9:00 AM','07/06/2013 2:30 PM',9,1
go
if object_id('spIntinerarioOrigenXNombre', 'p') is not null
drop procedure spIntinerarioOrigenXNombre
go
 create procedure spIntinerarioOrigenXNombre(
@iti_origen varchar(100))
as begin
	select distinct I.sucursal_origen_id, C.ciu_nomCiudad,SO.suc_direccion 
	from itinerario I, sucursal SO, ciudad C
	where I.sucursal_origen_id=SO.suc_id  and SO.ciudad_id=C.ciu_id and I.iti_estado='a' 
	and (C.ciu_nomCiudad+' '+SO.suc_nombre) like '%'+@iti_origen+'%'
end
go
spIntinerarioOrigenXNombre ''
go
if object_id('spIntinerarioDestinoXIdOrigen', 'p') is not null
drop procedure spIntinerarioDestinoXIdOrigen
go
 create procedure spIntinerarioDestinoXIdOrigen(
@sucursal_origen_id int)
as begin
	select distinct I.sucursal_destino_id,C.ciu_nomCiudad,SD.ciudad_id,I.sucursal_origen_id
	from itinerario I, sucursal SD, ciudad C
	where I.sucursal_destino_id=SD.suc_id  and SD.ciudad_id=C.ciu_id and I.iti_estado='a' 
	and I.sucursal_origen_id=@sucursal_origen_id	
end
go
spIntinerarioDestinoXIdOrigen 2
go
if object_id('spIntinerarioFechaSalidaXIdOrigenIdDestino', 'p') is not null
drop procedure spIntinerarioFechaSalidaXIdOrigenIdDestino
go
 create procedure spIntinerarioFechaSalidaXIdOrigenIdDestino(
@sucursal_origen_id int,
@sucursal_destino_id int)
as begin
	select distinct CONVERT(CHAR(10), I.iti_horSalida, 103) 
	from itinerario I, sucursal SO, sucursal SD, ciudad CO, ciudad CD
	where I.sucursal_origen_id=SO.suc_id and SO.ciudad_id=CO.ciu_id  and 
	I.sucursal_destino_id=SD.suc_id and SD.ciudad_id=CD.ciu_id and I.iti_estado='a' 
	and I.sucursal_origen_id=@sucursal_origen_id and I.sucursal_destino_id=@sucursal_destino_id
end
go
spIntinerarioFechaSalidaXIdOrigenIdDestino 1,2
go
if object_id('spIntinerarioHoraSalidaXIdOrigenIdDestinoFecha', 'p') is not null
drop procedure spIntinerarioHoraSalidaXIdOrigenIdDestinoFecha
go
 create procedure spIntinerarioHoraSalidaXIdOrigenIdDestinoFecha(
@sucursal_origen_id int,
@sucursal_destino_id int,
@iti_horSalida datetime)
as begin
	select distinct iti_id,RIGHT(CONVERT(CHAR(17), iti_horSalida, 109), 5)
 +' ' +RIGHT(CONVERT(CHAR(26), iti_horSalida, 109), 2)
	from itinerario I, sucursal SO, sucursal SD, ciudad CO, ciudad CD
	where I.sucursal_origen_id=SO.suc_id and SO.ciudad_id=CO.ciu_id  and 
	I.sucursal_destino_id=SD.suc_id and SD.ciudad_id=CD.ciu_id and I.iti_estado='a' 
	and I.sucursal_origen_id=@sucursal_origen_id and I.sucursal_destino_id=@sucursal_destino_id and CONVERT(CHAR(10), I.iti_horSalida, 103)=@iti_horSalida
end
go
spIntinerarioHoraSalidaXIdOrigenIdDestinoFecha 1,2,'07/06/2013'
go
