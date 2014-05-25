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
@clave VarBinary(8000),
@llave varchar(45))
RETURNS varchar(55)
as begin
	declare @pass varchar(25)
	set @pass = DECRYPTBYPASSPHRASE(@llave,@clave)
	return @pass
end
go
--PROCEDIMIENTOS Y LLENADO INICIAL
insert into mensajes values('MS-0001','Error al Registrar',GETDATE())
insert into mensajes values('MS-0002','¡Registro de Correcto!',GETDATE())
insert into mensajes values('RN-0001','No debe haber Itinerarios con las misma ruta, fecha y hora de salida. Por lo menos debe diferenciarse en lo último.',GETDATE())
insert into mensajes values('RN-0003','No se puede registrar a otra persona que su Número de Documento de Identidad ya esté en la base de datos.',GETDATE())
go
if object_id('spMostrarMensaje', 'p') is not null
drop procedure spMostrarMensaje
go
create procedure spMostrarMensaje(
@men_codigo char(7))
as begin
	select men_descripcion from mensajes where men_codigo=@men_codigo
end
go
insert into documentoIdentidad(docIde_descripcion,docIde_longitud) values('PASAPORTE',12)
insert into documentoIdentidad(docIde_descripcion,docIde_longitud) values('DNI',8)
insert into documentoIdentidad(docIde_descripcion,docIde_longitud) values('LIBRETA MILITAR',8)
go
if object_id('spDocumentoIdentidadLista', 'p') is not null
drop procedure spDocumentoIdentidadLista
go
create procedure spDocumentoIdentidadLista
as begin
	select * from documentoIdentidad order by docIde_descripcion
end
go
if object_id('spPersonaRegistrarBasico', 'p') is not null
drop procedure spPersonaRegistrarBasico
go
create procedure spPersonaRegistrarBasico(
@per_nombres varchar(35),
@per_apellidos varchar(55),
@per_numDocIdentidad varchar(15),
@per_fecNacimiento date,
@per_sexo char(1),
@docIdentidad_id int)
as
begin
	declare @numDocIden int
	select @numDocIden=count(per_numDocIdentidad) from persona where per_numDocIdentidad=@per_numDocIdentidad
	if @numDocIden > 0
		exec spMostrarMensaje 'RN-0003'			
	else
		begin
			insert into persona(per_nombres,per_apellidos,per_numDocIdentidad,per_fecNacimiento,per_telefono,per_sexo,per_direccion,per_email,per_img,per_fecRegistro,per_estado,docIdentidad_id ) 
			values(@per_nombres,@per_apellidos,@per_numDocIdentidad,@per_fecNacimiento,'n',@per_sexo,'n','n','n',GETDATE(),'a',@docIdentidad_id )	
			set @numDocIden=@@IDENTITY	
			select @numDocIden
			exec spMostrarMensaje 'MS-0002'		
		end	
end
go
spPersonaRegistrarBasico 'MILER','ROQUE LAIZA','123456789012','12/01/1990','m',1
go
if object_id('spPersonaXNumeroDocumentoIdentidad', 'p') is not null
drop procedure spPersonaXNumeroDocumentoIdentidad
go
create procedure spPersonaXNumeroDocumentoIdentidad(
@per_numDocIdentidad varchar(15))
as begin
	select per_id,per_nombres, per_apellidos,per_sexo, DATEDIFF(yy,per_fecNacimiento, GETDATE()) 'Edad', CONVERT(CHAR(10), per_fecNacimiento, 103), docIdentidad_id, per_numDocIdentidad
	from persona where per_numDocIdentidad=@per_numDocIdentidad
end
go
spPersonaXNumeroDocumentoIdentidad '123456789012'
go
if object_id('spPersonaXApellidos', 'p') is not null
drop procedure spPersonaXApellidos
go
create procedure spPersonaXApellidos(
@per_nomApellidos varchar(15))
as begin
	select top 4 per_id,per_nombres, per_apellidos,per_sexo, DATEDIFF(yy,per_fecNacimiento, GETDATE()) 'Edad', CONVERT(CHAR(10), per_fecNacimiento, 103), docIdentidad_id, per_numDocIdentidad
	from persona where per_apellidos like '%'+@per_nomApellidos+'%'
	end
go
spPersonaXApellidos 'ro'
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
if object_id('spUsuarioLogin', 'p') is not null
drop procedure spUsuarioLogin
go
create procedure spUsuarioLogin(
@usu_user varchar(45),
@usu_pass varchar(45))
as begin
	select U.usu_id,P.per_nombres, P.per_apellidos, U.usu_user from persona P, usuario U
	where P.per_id=U.persona_id and dbo.fnDescifrarClave(U.usu_pass,@usu_pass)=@usu_pass and U.usu_user=@usu_user
end
go
spUsuarioLogin 'admin','123'
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
spVehiculoRegistrar 'MB001','MGS-23',16,56,1,1
go
spVehiculoRegistrar 'MB002','MGS-24',52,0,1,1
gO
spVehiculoRegistrar 'MB003','MGS-25',16,56,1,1
go
spVehiculoRegistrar 'MB004','MGS-26',52,0,1,1
go
spVehiculoRegistrar 'MB005','MGS-27',16,56,1,1
go
spVehiculoRegistrar 'MB006','MGS-28',48,0,1,1
go
spVehiculoRegistrar 'MB007','MGS-29',16,56,1,1
go
spVehiculoRegistrar 'MB008','MGS-10',16,56,2,1
go
spVehiculoRegistrar 'MB008','MGS-11',52,0,2,1
go
if object_id('spLlenarAsientos', 'p') is not null
drop procedure spLlenarAsientos
go
 create procedure spLlenarAsientos(
 @vehiculo_id int,
 @itinerario_id int )
 as begin 
	declare @conPri int
	declare @conSeg int
	set @conPri=1
	set @conSeg=1
	while @conPri<=(select veh_numAsiPrimer from vehiculo where veh_id=@vehiculo_id)		
		begin
			insert into controlAsiento(conAsi_piso,conAsi_numAsiento,conAsi_estAsiento,itinerario_id)
			values(1,@conPri,'d',@itinerario_id) 
			set @conPri=@conPri+1
		end
	while @conSeg<=(select veh_numAsiSegundo from vehiculo where veh_id=@vehiculo_id)		
		begin
			insert into controlAsiento(conAsi_piso,conAsi_numAsiento,conAsi_estAsiento,itinerario_id)
			values(2,@conPri,'d',@itinerario_id) 
			set @conPri=@conPri+1
			set @conSeg=@conSeg+1
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
@iti_precio decimal(4,2),
@vehiculo_id int,
@personal_id int)
as begin
	declare @res int
	declare @PKCreado int
	
	select @res=I.iti_id from itinerario I 
	where I.sucursal_origen_id=@sucursal_origen_id and I.sucursal_destino_id=@sucursal_destino_id
		and I.iti_horSalida=@iti_horSalida 	
	if @res>0	
		exec spMostrarMensaje 'RN-0001'			
	else		
		begin
			insert into itinerario(sucursal_origen_id,sucursal_destino_id,iti_horSalida,iti_horLlegada,
				iti_precio,iti_fecRegistro,iti_estado,vehiculo_id,personal_id) 
			values(@sucursal_origen_id,@sucursal_destino_id,@iti_horSalida,@iti_horLlegada,@iti_precio,GETDATE(),'a',@vehiculo_id,@personal_id)
			set @PKCreado=@@IDENTITY
			exec spMostrarMensaje 'MS-0002'
			exec spLlenarAsientos @vehiculo_id,@PKCreado
		end
end
go
spItinerarioRegistrar 1,2,'07/07/2014 8:00 AM','07/07/2014 1:00 PM',20.00,1,1
go
spItinerarioRegistrar 1,2,'07/07/2014 9:30 AM','07/07/2014 2:30 PM',30.00,2,1
go
spItinerarioRegistrar 1,2,'07/07/2014 1:00 PM','07/07/2014 7:30 PM',31.00,3,1
go
spItinerarioRegistrar 1,2,'07/07/2014 4:00 PM','07/07/2014 10:30 PM',32.00,4,1
go
spItinerarioRegistrar 1,2,'07/07/2014 9:00 PM','08/07/2014 1:00 AM',33.00,5,1
go
spItinerarioRegistrar 1,2,'07/07/2014 10:30 PM','08/07/2014 3:00 AM',34.00,6,1
go
spItinerarioRegistrar 1,4,'07/07/2014 9:00 PM','08/07/2014 3:00 AM',35.00,7,1
go
spItinerarioRegistrar 1,4,'07/07/2014 11:00 AM','08/07/2014 5:00 AM',36.00,8,1
go
spItinerarioRegistrar 1,2,'08/07/2014 9:00 AM','07/07/2014 2:30 PM',37.00,9,1
go
spItinerarioRegistrar 2,1,'08/07/2014 9:00 AM','08/07/2014 2:30 PM',37.00,9,1
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
	select distinct  iti_id,RIGHT(CONVERT(CHAR(17), iti_horSalida, 109), 5)
 +' ' +RIGHT(CONVERT(CHAR(26), iti_horSalida, 109), 2)
	from itinerario I, sucursal SO, sucursal SD, ciudad CO, ciudad CD
	where I.sucursal_origen_id=SO.suc_id and SO.ciudad_id=CO.ciu_id  and 
	I.sucursal_destino_id=SD.suc_id and SD.ciudad_id=CD.ciu_id and I.iti_estado='a' 
	and I.sucursal_origen_id=@sucursal_origen_id and I.sucursal_destino_id=@sucursal_destino_id and CONVERT(CHAR(10), I.iti_horSalida, 103)=@iti_horSalida
end
go
spIntinerarioHoraSalidaXIdOrigenIdDestinoFecha 1,2,'07/06/2014'
go
if object_id('spIntinerarioResumenXIdOrigenIdDestinoFecha', 'p') is not null
drop procedure spIntinerarioResumenXIdOrigenIdDestinoFecha
go
 create procedure spIntinerarioResumenXIdOrigenIdDestinoFecha(
@sucursal_origen_id int,
@sucursal_destino_id int,
@iti_horSalida datetime)
as begin
	select I.iti_id,RIGHT(CONVERT(CHAR(17), iti_horSalida, 109), 5)
 +' ' +RIGHT(CONVERT(CHAR(26), iti_horSalida, 109), 2), SE.serEsp_nombre, I.iti_precio, CA.disponibles  
	from itinerario I, sucursal SO, sucursal SD, ciudad CO, ciudad CD,vehiculo V, servicioEspecial SE,
	(select CA.itinerario_id, COUNT(CA.conAsi_numAsiento) as disponibles from controlAsiento CA where conAsi_estAsiento='d' group by itinerario_id ) CA
	where I.sucursal_origen_id=SO.suc_id and SO.ciudad_id=CO.ciu_id 
	and I.vehiculo_id=V.veh_id and V.serEspecial_id=SE.serEsp_id and CA.itinerario_id=I.iti_id and
	I.sucursal_destino_id=SD.suc_id and SD.ciudad_id=CD.ciu_id and I.iti_estado='a' 	
	and I.sucursal_origen_id=@sucursal_origen_id and I.sucursal_destino_id=@sucursal_destino_id and CONVERT(CHAR(10), I.iti_horSalida, 103)=@iti_horSalida
end
go
spIntinerarioResumenXIdOrigenIdDestinoFecha 1,2,'07/06/2014'
go
if object_id('spControlAsientoXIdItinerario', 'p') is not null
drop procedure spControlAsientoXIdItinerario
go
 create procedure spControlAsientoXIdItinerario(
@iti_id int)
as begin
	select CA.conAsi_piso,CA.conAsi_numAsiento, CA.conAsi_estAsiento 
	from controlAsiento CA, itinerario I
	where CA.itinerario_id=I.iti_id  and I.iti_id=@iti_id
end
go
spControlAsientoXIdItinerario 2
go
if object_id('spBoletoViajeRegistro', 'p') is not null
drop procedure spBoletoViajeRegistro
go
 create procedure spBoletoViajeRegistro(
@iti_id int)
as begin
	select CA.conAsi_piso,CA.conAsi_numAsiento, CA.conAsi_estAsiento 
	from controlAsiento CA, itinerario I
	where CA.itinerario_id=I.iti_id  and I.iti_id=@iti_id
end
go
spBoletoViajeRegistro 2
go
select * from boletoViaje