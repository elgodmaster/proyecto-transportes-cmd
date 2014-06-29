use bdTransportesCMD
--##################################################################################################################################


-------------------------------------------------------- SP MILER -----------------------------------------------------------------


--##################################################################################################################################
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
--PROCEDIMIENTOS Y LLENADO INICIAL
--insert into mensajes values('MS-0001','Error al Registrar',GETDATE())
--insert into mensajes values('MS-0002','¡Registro de Correcto!',GETDATE())
--insert into mensajes values('RN-0001','No debe haber Itinerarios con las misma ruta, fecha y hora de salida. Por lo menos debe diferenciarse en lo último.',GETDATE())
--insert into mensajes values('RN-0003','No se puede registrar a otra persona que su Número de Documento de Identidad ya esté en la base de datos.',GETDATE())
--go
--if object_id('spMostrarMensaje', 'p') is not null
--drop procedure spMostrarMensaje
--go
--create procedure spMostrarMensaje(
--@men_codigo char(7))
--as begin
--	select men_descripcion from mensajes where men_codigo=@men_codigo
--end
--declare @contador int,@res int, @msg varchar(100)
--begin try
--	begin tran
		
--		set @res=1
--		set @msg='Registro de Ruta Correcto'
--	commit
--end	try
--begin catch
--	set @res=0
--	set @msg='Error en bd al registrar ruta'
--	ROLLBACK
--	PRINT ERROR_MESSAGE()
--end catch
--go
go
insert into generales(gen_clase,gen_correlativo,gen_descripcion,gen_valor,gen_estado) 
values(1,-1,'Estado','0',1),(1,0,'Inactivo','0',1),(1,1,'Activo','0',1)
go
insert into documentoIdentidad(docIde_descripcion,docIde_longitud,docIde_valor) 
values('PASAPORTE',12,'^[0-9a-zA-Z]*|-'),('DNI',8,'^[0-9]*'),('LIBRETA MILITAR',8,'^[0-9]*')
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
@docIdentidad_id int,
@numDocIden int output)
as
begin
	declare @contador int,@res int, @msg varchar(100)
	select @contador=count(per_numDocIdentidad) from persona where per_numDocIdentidad=@per_numDocIdentidad and docIdentidad_id=@docIdentidad_id
	if @contador>0
		begin
			set @numDocIden=0
			set @res=0
			set @msg='El número de Documento de Identidad ya existe con el mismo tipo'	
		end
	else
	begin try
		begin tran
			insert into persona(per_nombres,per_apellidos,per_numDocIdentidad,per_fecNacimiento,per_telefono,per_sexo,per_direccion,per_email,per_img,per_fecRegistro,per_estado,docIdentidad_id ) 
				values(@per_nombres,@per_apellidos,@per_numDocIdentidad,@per_fecNacimiento,'n',@per_sexo,'n','n','n',GETDATE(),1,@docIdentidad_id )	
				set @numDocIden=@@IDENTITY
			set @res=1
			set @msg='Registro de Persona Correcto'
		commit
		end	try
		begin catch
			set @res=0
			set @msg='Error en bd al registrar persona ' +ERROR_MESSAGE()
			ROLLBACK
	end catch
		
	select @res,@msg,@numDocIden	
end
go
spPersonaRegistrarBasico 'MILER','ROQUE LAIZA','123456789012','12/01/1990','m',1,0
go
spPersonaRegistrarBasico 'CARLOS','BOCANEGRA BOLAÑOS','12345678','29/12/1992','m',2,0
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
spPersonaXNumeroDocumentoIdentidad '12345678'
go
if object_id('spPersonaXApellidos', 'p') is not null
drop procedure spPersonaXApellidos
go
create procedure spPersonaXApellidos(
@per_nomApellidos varchar(15))
as begin
	select top 4 per_id,per_nombres, per_apellidos,per_sexo, DATEDIFF(yy,per_fecNacimiento, GETDATE()) 'Edad', CONVERT(CHAR(10), per_fecNacimiento, 103), docIdentidad_id, per_numDocIdentidad
	from persona where per_apellidos +' '+per_nombres  like '%'+@per_nomApellidos+'%'
	end
go
spPersonaXApellidos 'car'
go

insert into ciudad(ciu_departamento,ciu_ciudad) values
('La Libertad','Trujillo'),('Lima','Lima'),('Cajamarca','Cajabamba'),('Ancash','Huaraz'),('La Libertad','Huamachuco')
go
insert into sucursal(suc_nombre,suc_direccion,suc_telefono,ciudad_id) values('Vallejo','Av. Prolongación Vallejo 1135','231215',1)
insert into sucursal(suc_nombre,suc_direccion,suc_telefono,ciudad_id) values('Balta','Jr. Balta 510','232323',5)
insert into sucursal(suc_nombre,suc_direccion,suc_telefono,ciudad_id) values('Sur América','Av. Sur América 1231','123456',4)
go
insert into cargo(car_nomCargo,car_desCargo)values('SYSTEM ADMIN','Administrador del Sistema')
go
if object_id('spSucursalListar', 'p') is not null
drop procedure spSucursalListar
go
 create procedure spSucursalListar
as begin	
	select S.suc_id, C.ciu_ciudad, S.suc_nombre from sucursal S, ciudad C
	where S.ciudad_id = C.ciu_id
end
go
spSucursalListar
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
	declare @contador int,@res int, @msg varchar(100)
	select @contador=count(*) from personal p where p.persona_id=@persona_id
	if @contador>0
		begin
				set @res=0
				set @msg='El personal ya está registrado.'	
		end
	else
	begin 
		insert into personal(per_estCivil,per_fecContrato,per_fecFinContrato,per_fecRegistro,per_estado,persona_id,cargo_id,sucursal_id)
			values(@per_estCivil,@per_fecContrato,@per_fecFinContrato,GETDATE(),1,@persona_id,@cargo_id,@sucursal_id)
			set @msg='Registro de personal correcto.'
			set @res=1
	end
	select @res,@msg
end
go
spPersonalRegistrar 'c','12/04/2014','17/07/2014',1,1,1
go
spPersonalRegistrar 'c','12/04/2014','17/07/2014',2,1,2
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
	values(@usu_user,dbo.fnCifrarClave(@usu_pass),GETDATE(),1,@persona_id)
end
go
spUsuarioRegistrar 'admin','123',1
go
spUsuarioRegistrar 'cadmin','321',2
go
if object_id('spUsuarioAministrativoLogin', 'p') is not null
drop procedure spUsuarioAministrativoLogin
go
create procedure spUsuarioAministrativoLogin(
@usu_user varchar(45),
@usu_pass varchar(45))
as begin
	select U.usu_id, U.usu_user,p.per_id 'idPersona' ,P.per_nombres, P.per_apellidos,pl.per_id 'idPersonal',ca.car_id,ca.car_nomCargo from persona P 
	inner join usuario U on u.persona_id=p.per_id
	inner join personal pl on pl.persona_id=p.per_id 
	inner join cargo ca on ca.car_id=pl.cargo_id
	where U.usu_user=@usu_user and dbo.fnDescifrarClave(u.usu_pass,@usu_pass)=@usu_pass
end
go 
spUsuarioAministrativoLogin 'admin','123'

go
if object_id('spServicioEspecialRegistrar', 'p') is not null
drop procedure spServicioEspecialRegistrar
go
create procedure spServicioEspecialRegistrar(
@serEsp_nombre varchar(35),
@serEsp_caracteristicas varchar(85))
as begin
	declare @contador int,@res int, @msg varchar(100)
	select @contador=count(*) from servicioEspecial p where p.serEsp_nombre=@serEsp_nombre
	if @contador>0
		begin
				set @res=0
				set @msg='El servicio ya se encuentra registrado.'	
		end
	else
	begin 
	insert into servicioEspecial(serEsp_nombre,serEsp_caracteristicas,serEsp_fecRegistro,serEsp_estado)
	values(@serEsp_nombre,@serEsp_caracteristicas,GETDATE(),1)
			set @msg='Registro de servicio especial correcto.'
			set @res=1
	end
	select @res,@msg
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
create procedure spVehiculoRegistrar(
@veh_marca varchar(35),
@veh_modelo varchar(30),
@veh_placa varchar(15),
@veh_numAsiPrimer int,
@veh_numAsiSegundo int,
@serEspecial_id int)
as begin
declare @contador int,@res int, @msg varchar(100)
	select @contador=count(*) from vehiculo p where p.veh_placa=@veh_placa
	if @contador>0
		begin
				set @res=0
				set @msg='El bus con placa '+@veh_placa+' ya se encuentra registrado.'	
		end
	else
	begin 
	insert into vehiculo(veh_marca,veh_modelo,veh_placa,veh_numAsiPrimer,veh_numAsiSegundo,veh_img,veh_fecRegistro,veh_estado,serEspecial_id) 
	values(@veh_marca,@veh_modelo,@veh_placa,@veh_numAsiPrimer,@veh_numAsiSegundo,'n',GETDATE(),1,@serEspecial_id)
			set @msg='Registro de bus correcto.'
			set @res=1
	end
	select @res,@msg
	
end
go
spVehiculoRegistrar 'Mercedes Bens','MB001','MGS223',16,56,1
go
spVehiculoRegistrar 'Mercedes Bens','MB002','MGS224',52,0,1
gO
spVehiculoRegistrar 'Mercedes Bens','MB003','MGS125',16,56,1
go
spVehiculoRegistrar 'Mercedes Bens','MB004','MGS226',52,0,1
go
spVehiculoRegistrar 'Mercedes Bens','MB005','MGS227',16,56,1
go
spVehiculoRegistrar 'Mercedes Bens','MB006','MGS228',48,0,1
go
spVehiculoRegistrar 'Mercedes Bens','MB007','MGS229',16,56,1
go
spVehiculoRegistrar 'Mercedes Bens','MB008','MGS310',16,56,2
go
spVehiculoRegistrar 'Mercedes Bens','MB008','MGS311',52,0,2
go
if object_id('spLlenarAsientos', 'p') is not null
drop procedure spLlenarAsientos
go
 create procedure spLlenarAsientos(
 @vehiculo_id int,
 @itinerario_id int )
 as begin 
	declare @conPri int,@conSeg int
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

if object_id('spRutaRegistrar', 'p') is not null
drop procedure spRutaRegistrar
go
create procedure spRutaRegistrar(
@rut_horSalida varchar(15),
@rut_horViaje int,
@sucOrigen_id int,
@sucDestino_id int)
as begin
	declare @contador int,@res int, @msg varchar(100)
	select @contador=count(*) from ruta r where r.rut_horSalida=@rut_horSalida and r.sucOrigen_id=@sucOrigen_id and r.sucDestino_id=@sucDestino_id
	if @sucOrigen_id=@sucDestino_id
		begin
			set @res=0
			set @msg='La ciudad de origen no puede ser la misma que la de destino.'
		end
	else if @contador>0 
		begin
			set @res=0
			set @msg='La ruta y hora de salida ya se encuentra registrada'
		end
	else
	begin
		begin try
			begin tran
				insert into ruta(rut_horSalida,rut_horViaje,rut_estado,sucOrigen_id,sucDestino_id) 
				values(@rut_horSalida,@rut_horViaje,1,@sucOrigen_id,@sucDestino_id)	
				set @res=1
				set @msg='Registro de Ruta Correcto'
			commit
		end	try
		begin catch
			set @res=0
			set @msg='Error en bd al registrar ruta ' +ERROR_MESSAGE()
			ROLLBACK
		end catch	
	end
	select @res,@msg
end
go
spRutaRegistrar '8:00 AM',5,1,1
go
spRutaRegistrar '9:00 AM',5,1,2
go
spRutaRegistrar '9:30 AM',5,1,2
go
spRutaRegistrar '1:00 PM',5,1,2
go
spRutaRegistrar '4:00 PM',5,1,2
go
spRutaRegistrar '9:00 PM',5,1,2
go
spRutaRegistrar '10:30 PM',5,1,2
go
spRutaRegistrar '9:00 PM',5,1,3
go
spRutaRegistrar '11:00 AM',5,1,3
go
spRutaRegistrar '9:00 AM',5,2,1
go
if object_id('spItinerarioRegistrar', 'p') is not null
drop procedure spItinerarioRegistrar
go
create procedure spItinerarioRegistrar(
@iti_fecSalida datetime,
@iti_precio decimal(4,2),
@ruta_id int,
@vehiculo_id int,
@personal_id int)
as begin
	declare @contador int, @res int,@msg varchar(100),@PKCreado int	
	select @contador=count(*) from itinerario i where i.iti_fecSalida=@iti_fecSalida and i.ruta_id=@ruta_id
	if @contador>0
		begin
			set @res=0
			set @msg='El itinerario ya se encuentra registrado'
		end
	else
		begin try
			begin tran
				insert into itinerario(iti_fecSalida,iti_precio,iti_fecRegistro,ruta_id,iti_estado,vehiculo_id,personal_id) 
				values(@iti_fecSalida,@iti_precio,GETDATE(),@ruta_id,1,@vehiculo_id,@personal_id)
				set @PKCreado=@@IDENTITY
				exec spLlenarAsientos @vehiculo_id,@PKCreado

				set @res=1
				set @msg='Registro de itinerario Correcto'
			commit
		end	try
		begin catch
			set @res=0
			set @msg='Error en bd al registrar itinerario ' +ERROR_MESSAGE()
			ROLLBACK
		end catch
	select @res,@msg,@PKCreado
end
go
spItinerarioRegistrar '07/07/2014',20.00,1,1,1
go
spItinerarioRegistrar '07/07/2014',30.00,2,2,1
go
spItinerarioRegistrar '07/07/2014',31.00,3,3,1
go
spItinerarioRegistrar '07/07/2014',32.00,4,4,1
go
spItinerarioRegistrar '07/07/2014',33.00,5,5,1
go
spItinerarioRegistrar '07/07/2014',34.00,6,6,1
go
spItinerarioRegistrar '07/07/2014',35.00,7,7,1
go
spItinerarioRegistrar '07/07/2014',36.00,8,8,1
go
spItinerarioRegistrar '08/07/2014',37.00,9,9,1
go
spItinerarioRegistrar '08/07/2014',37.00,10,2,1
go
if object_id('spIntinerarioOrigenXNombre', 'p') is not null
drop procedure spIntinerarioOrigenXNombre
go
 create procedure spIntinerarioOrigenXNombre(
@iti_origen varchar(100))
as begin
	select distinct r.sucOrigen_id, SO.suc_direccion, C.ciu_ciudad
	from itinerario I 
	inner join ruta R on I.ruta_id=R.rut_id 
	inner join sucursal SO on SO.suc_id=R.sucOrigen_id 
	inner join ciudad C on C.ciu_id=SO.ciudad_id
	where  I.iti_estado=1 and (C.ciu_ciudad+' '+SO.suc_nombre) like '%'+@iti_origen+'%'
end
go
spIntinerarioOrigenXNombre ''
go
if object_id('spIntinerarioDestinoXIdOrigen', 'p') is not null
drop procedure spIntinerarioDestinoXIdOrigen
go
 create procedure spIntinerarioDestinoXIdOrigen(
@sucOrigen_id int)
as begin
	select distinct r.sucDestino_id,C.ciu_ciudad,SD.ciudad_id,r.sucOrigen_id
	from itinerario I 
	inner join ruta r on r.rut_id=i.ruta_id
	inner join sucursal SD on sd.suc_id=r.sucDestino_id 
	inner join ciudad C on c.ciu_id=sd.ciudad_id
	where I.iti_estado=1 
	and r.sucOrigen_id=@sucOrigen_id	
end
go
spIntinerarioDestinoXIdOrigen 1
go
if object_id('spIntinerarioFechaSalidaXIdOrigenIdDestino', 'p') is not null
drop procedure spIntinerarioFechaSalidaXIdOrigenIdDestino
go
 create procedure spIntinerarioFechaSalidaXIdOrigenIdDestino(
@sucOrigen_id int,
@sucDestino_id int)
as begin
	select distinct CONVERT(CHAR(10), i.iti_fecSalida, 103) 
	from itinerario I 
	inner join ruta r on r.rut_id=i.ruta_id
	inner join sucursal SO on SO.suc_id=r.sucOrigen_id
	inner join sucursal SD on SD.suc_id=r.sucDestino_id 
	inner join ciudad CO on CO.ciu_id=SO.ciudad_id 
	inner join ciudad CD on CD.ciu_id=SD.ciudad_id
	where  I.iti_estado=1 
	and R.sucOrigen_id=@sucOrigen_id and r.sucDestino_id=@sucDestino_id
end
go
spIntinerarioFechaSalidaXIdOrigenIdDestino 1,2
go
if object_id('spIntinerarioHoraSalidaXIdOrigenIdDestinoFecha', 'p') is not null
drop procedure spIntinerarioHoraSalidaXIdOrigenIdDestinoFecha
go
 create procedure spIntinerarioHoraSalidaXIdOrigenIdDestinoFecha(
@sucOrigen_id int,
@sucDestino_id int,
@iti_fecSalida datetime)
as begin
	select distinct  iti_id,r.rut_horSalida
	from itinerario I 
	inner join ruta r on r.rut_id=i.ruta_id
	inner join sucursal SO on SO.suc_id=r.sucOrigen_id
	inner join sucursal SD on SD.suc_id=r.sucDestino_id 
	inner join ciudad CO on CO.ciu_id=SO.ciudad_id 
	inner join ciudad CD on CD.ciu_id=SD.ciudad_id
	where I.iti_estado=1 
	and r.sucOrigen_id=@sucOrigen_id and r.sucDestino_id=@sucDestino_id and i.iti_fecSalida=@iti_fecSalida
end
go
spIntinerarioHoraSalidaXIdOrigenIdDestinoFecha 1,2,'07/07/2014'
go
if object_id('spIntinerarioResumenXIdOrigenIdDestinoFecha', 'p') is not null
drop procedure spIntinerarioResumenXIdOrigenIdDestinoFecha
go
 create procedure spIntinerarioResumenXIdOrigenIdDestinoFecha(
@sucOrigen_id int,
@sucDestino_id int,
@iti_fecSalida datetime)
as begin
	select I.iti_id,r.rut_horSalida, SE.serEsp_nombre, I.iti_precio, CA.disponibles  
	from 
	itinerario I
	inner join ruta r on r.rut_id=i.ruta_id
	inner join sucursal SO on SO.suc_id=r.sucOrigen_id
	inner join sucursal SD on SD.suc_id=r.sucDestino_id 
	inner join ciudad CO on CO.ciu_id=SO.ciudad_id 
	inner join ciudad CD on CD.ciu_id=SD.ciudad_id
	inner join vehiculo V on V.veh_id=i.vehiculo_id
	inner join servicioEspecial SE on SE.serEsp_id=v.serEspecial_id
	inner join (select CA.itinerario_id, COUNT(CA.conAsi_numAsiento) as disponibles from controlAsiento CA where conAsi_estAsiento='d' group by itinerario_id ) CA on CA.itinerario_id=i.iti_id
	where I.iti_estado=1 and r.sucOrigen_id=@sucOrigen_id and r.sucDestino_id=@sucDestino_id and i.iti_fecSalida=@iti_fecSalida
end
go
spIntinerarioResumenXIdOrigenIdDestinoFecha 1,2,'07/07/2014'
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
insert into comprobante(com_descripcion) values('Boleto de Viaje')
insert into comprobante(com_descripcion) values('Orden de Traslado')
go
if object_id('spGenerarSerieDocumento', 'p') is not null
drop procedure spGenerarSerieDocumento
go
create procedure spGenerarSerieDocumento(
@sucursal_id int,
@comprobante_id int,
@PKCreado int output)
as begin
	declare @serie int, @numero int
	select @serie=comSer_serie, @numero=max(comSer_correlativo+1) from comprobanteSerie 
	where sucursal_id=@sucursal_id and comprobante_id=@comprobante_id and comSer_estado=1
	group by comSer_serie	
	insert into comprobanteSerie(comSer_serie,comSer_correlativo,comprobante_id,sucursal_id,comSer_estado)
	values (@serie,@numero,@comprobante_id,@sucursal_id,1)
	set @PKCreado=@@IDENTITY 
end
go
if object_id('spBoletoViajeRegistro', 'p') is not null
drop procedure spBoletoViajeRegistro
go
create procedure spBoletoViajeRegistro(
@bolVia_asiento int,
@cliente_id int,
@personal_id int,
@itinerario_id int)
as begin
	declare @contador int,@res int, @msg varchar(100),@numAsiento int,@pkBoleto int
	select @numAsiento=conAsi_numAsiento from controlAsiento C
	where C.conAsi_numAsiento=@bolVia_asiento and C.itinerario_id=@itinerario_id and C.conAsi_estAsiento='o'
	select @contador=count(*) from boletoViaje bv where bv.itinerario_id=@itinerario_id and bv.persona_id=@cliente_id
	if @contador>=1
		begin
			set @res=0
			set @msg='No puede registrar más de un boleto para una persona con un mismo itinerario.'
			set @pkBoleto=0
		end
	else
		begin
			if @numAsiento is null 
			begin try
				begin tran
					DECLARE @numSerie int,@sucursal_id int
					select @sucursal_id=S.suc_id from sucursal S, personal P 
					where S.suc_id = P.sucursal_id and P.per_id=@personal_id
					EXEC spGenerarSerieDocumento @sucursal_id,1, @numSerie output
					insert into boletoViaje(bolVia_fecha,bolVia_estado,bolVia_asiento,persona_id, personal_id, itinerario_id, comSerie_id)
					values(GETDATE(),1, @bolVia_asiento,@cliente_id,@personal_id,@itinerario_id,@numSerie)
					set @pkBoleto=@@IDENTITY 
					update controlAsiento set conAsi_estAsiento='o' where itinerario_id=@itinerario_id and conAsi_numAsiento=@bolVia_asiento
					set @res=1
					set @msg='Registro de boleto correcto.'
				commit			
			end	try
			begin catch
				set @res=0
				set @msg='Error en bd al registrar boleto viaje ' +ERROR_MESSAGE()
				set @pkBoleto=0	
				ROLLBACK
			end catch
		else
			begin
				set @res=0
				set @msg='Error, puede ser que el n° asiento seleccionado ya haya sido comprado.'
				set @pkBoleto=0	
			end		
		end
	select @res,@msg,@pkBoleto
end
go
spBoletoViajeRegistro 8,2,1,4
go
if object_id('spBoletoViajeRegistroPersona', 'p') is not null
drop procedure spBoletoViajeRegistroPersona
go
create procedure spBoletoViajeRegistroPersona(
@per_nombres varchar(35),
@per_apellidos varchar(55),
@per_numDocIdentidad varchar(15),
@per_fecNacimiento date,
@per_sexo char(1),
@docIdentidad_id int,
@bolVia_asiento int,
@personal_id int,
@itinerario_id int)
as begin
	declare @res int, @msg varchar(100), @numAsiento int,@pkBoleto int
	select @numAsiento=conAsi_numAsiento from controlAsiento C
	where C.conAsi_numAsiento=@bolVia_asiento and C.itinerario_id=@itinerario_id and C.conAsi_estAsiento='o'	
	if @numAsiento is null 
		begin try
			begin tran
				DECLARE @numSerie int,@sucursalVenta int,@cliente_id int
				exec spPersonaRegistrarBasico @per_nombres,@per_apellidos,@per_numDocIdentidad,@per_fecNacimiento,@per_sexo,@docIdentidad_id,@cliente_id output
				select @sucursalVenta=S.suc_id from sucursal S, personal P where S.suc_id = P.sucursal_id and P.per_id=@personal_id
				EXEC spGenerarSerieDocumento @sucursalVenta,1, @numSerie output

				insert into boletoViaje(bolVia_fecha,bolVia_estado,bolVia_asiento,persona_id, personal_id, itinerario_id, comSerie_id)
				values(GETDATE(),1, @bolVia_asiento,@cliente_id,@personal_id,@itinerario_id,@numSerie)
				set @pkBoleto=@@IDENTITY 				
				update controlAsiento set conAsi_estAsiento='o' where itinerario_id=@itinerario_id and conAsi_numAsiento=@bolVia_asiento
				set @res=1
				set @msg='Registro de boleto correcto.'
			commit			
		end	try
		begin catch
			set @res=0
			set @msg='Error en bd al registrar boleto viaje ' +ERROR_MESSAGE()
			set @pkBoleto=0	
			ROLLBACK
		end catch
	else
		begin
			set @res=0
			set @msg='Error, puede ser que el n° asiento seleccionado ya haya sido comprado.'
			set @pkBoleto=0	
		end		
	select @res,@msg,@pkBoleto
end
go
if object_id('spRutasListarAll', 'p') is not null
drop procedure spRutasListarXIdSucursalOrigen
go
create procedure spRutasListarAll(
@idSucOrigen int
)
as begin
	select r.rut_id, r.rut_horSalida, r.rut_horViaje,so.suc_id ,so.suc_nombre, co.ciu_ciudad,sd.suc_id ,sd.suc_nombre, cd.ciu_ciudad
	from ruta r inner join sucursal so on so.suc_id=r.sucOrigen_id inner join ciudad co on co.ciu_id=so.ciudad_id
	inner join sucursal sd on sd.suc_id=r.sucDestino_id inner join ciudad cd on cd.ciu_id=sd.ciudad_id
end
go

select * from itinerario
--select * from boletoViaje
--spBoletoViajeRegistroPersona 'nombre','asdas','97667777','12/12/2014','m',2,1,1,1

--spBoletoViajeRegistro 23,1,1,1,1

--go
--if object_id('spBoleto', 'p') is not null
--drop procedure spPersonalRegistroXML
--go
--create procedure spPersonalRegistroXML(
--@prmPersonalXML ntext)
--as begin
--	declare @h int
--	declare @PKCreado int
--	begin Transaction
--		EXEC sp_xml_preparedocument @h output, @prmPersonalXML
		
--			--Inserta Salida			
--			insert into PL_personal(per_id,per_nombres,per_apellidos,per_dni,per_telefono,per_fecNacimiento,per_estado) 
--			select X.per_id,X.per_nombres, X.per_apellidos, X.per_dni, X.per_telefono, X.per_fecNacimiento,1		
--			from openXML(@h,'/root/vendedor',1) with(
--				per_id int,
--				per_nombres varchar(25),
--				per_apellidos varchar(35),
--				per_dni char(8),
--				per_telefono varchar(15),
--				per_fecNacimiento date,
--				accionXML int)X
--				where X.accionXML=1
--		set @PKCreado=@@IDENTITY 				
--		EXEC sp_xml_removedocument @h
--		if @@ERROR <>0	
--			begin
--				rollback transaction
--				return -1;
--			end					
--	commit Transaction	
--	select @PKCreado
--end
--go
--spPersonalRegistroXML
--'<root>
--	<vendedor per_id="0" per_nombres="Admin" per_apellidos="Administrador" per_dni="00000000" per_telefono="000" per_fecNacimiento="01/01/2000" accionXML="1"/>
--</root>'
--go



--SELECT * FROM persona