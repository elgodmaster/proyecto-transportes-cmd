use master
go
create database bdTransportesCMD
go
use bdTransportesCMD
go
create table generales(
gen_id int primary key identity not null,
gen_clase int,
gen_correlativo int,
gen_descripcion varchar(200),
gen_valor text,
gen_estado int)
go
--Pasaporte, DNI, Libreta Militar
create table documentoIdentidad(
docIde_id int primary key identity not null,
docIde_longitud int,
docIde_descripcion varchar(25),
docIde_valor varchar(50))
go
--Todo se registrarán
create table persona(
per_id int primary key identity not null,
per_nombres varchar(35),
per_apellidos varchar(55),
per_numDocIdentidad varchar(15),
per_fecNacimiento date,
per_telefono varchar(25),
per_sexo char(1),
per_direccion varchar(80),
per_email varchar(50),
per_img varchar(50),
per_fecRegistro datetime, --Para Control Interno
per_estado int, --Para Control Interno
docIdentidad_id int)
go
alter table persona add constraint fk_persona_docIdentidad foreign key (docIdentidad_id) references documentoIdentidad(docIde_id)
go
create table usuario(
usu_id int primary key identity not null,
usu_user varchar(50) unique,
usu_pass varbinary(8000),
usu_fecRegistro datetime,
usu_estado int,
persona_id int)
alter table usuario add constraint fk_usuario_persona foreign key (persona_id) references persona(per_id)
go
--Registro de ciudades 
create table ciudad(
ciu_id int primary key identity not null,
ciu_departamento varchar(35),
ciu_ciudad varchar(35))
go
create table sucursal(
suc_id int primary key identity not null,
suc_nombre varchar(55),
suc_direccion varchar(75),
suc_telefono varchar(15),
ciudad_id int)
go
alter table sucursal add constraint fk_sucursal_ciudad foreign key (ciudad_id) references ciudad(ciu_id)
go
create table cargo(
car_id int primary key identity not null,
car_nomCargo varchar(35),
car_desCargo varchar(45))
go
create table personal(
per_id int primary key identity not null,
per_estCivil char(1),
per_fecContrato date,
per_fecFinContrato date,
per_fecRegistro datetime,
per_estado int,
cargo_id int,
persona_id int,
sucursal_id int)
alter table personal add constraint fk_personal_persona foreign key (persona_id) references persona(per_id)
alter table personal add constraint fk_personal_cargo foreign key (cargo_id) references cargo(car_id)
alter table personal add constraint fk_personal_sucursal foreign key (sucursal_id) references sucursal(suc_id)
go
create table servicioEspecial(
serEsp_id int primary key identity not null,
serEsp_nombre varchar(35),
serEsp_caracteristicas varchar(85),
serEsp_fecRegistro datetime,
serEsp_estado int)
go
create table vehiculo(
veh_id int primary key identity not null,
veh_placa varchar(15),
veh_modelo varchar(30),
veh_marca varchar(35),
veh_numAsiPrimer int,
veh_numAsiSegundo int,
veh_img varchar(50),
veh_fecRegistro datetime,
veh_estado int,
serEspecial_id int)
go
alter table vehiculo add constraint fk_vehiculo_serEspecial foreign key (serEspecial_id) references servicioEspecial(serEsp_id)
go
create table ruta(
rut_id int primary key identity not null,
rut_horSalida varchar(15),
rut_horViaje int,
rut_estado int,
sucOrigen_id int,
sucDestino_id int)
go
alter table ruta add constraint fk_rutaOrigen_sucursal foreign key (sucOrigen_id) references sucursal(suc_id)
alter table ruta add constraint fk_rutaDestino_sucursal foreign key (sucDestino_id) references sucursal(suc_id)
go
create table itinerario(
iti_id int primary key identity not null,
iti_fecSalida date,
iti_fecRegistro date,
iti_precio decimal(4,2),
iti_estado int,
ruta_id int,
vehiculo_id int,
personal_id int)
alter table itinerario add constraint fk_itinerario_ruta foreign key (ruta_id) references ruta(rut_id)
alter table itinerario add constraint fk_itinerario_vehiculo foreign key (vehiculo_id) references vehiculo(veh_id)
alter table itinerario add constraint fk_itinerario_personal foreign key (personal_id) references personal(per_id)
go
create table itinerarioPersonal(
itiPer_id int primary key identity not null,
itiPer_fecRegistro datetime,
itiPer_estado int,
personal_id int,
itinerario_id int)
go
alter table itinerarioPersonal add constraint fk_itiPersonal_personal foreign key (personal_id) references personal(per_id)
alter table itinerarioPersonal add constraint fk_itiPersonal_itinerario foreign key (itinerario_id) references itinerario(iti_id)
go
create table controlAsiento(
conAsi_id int primary key identity not null,
conAsi_control int,
conAsi_piso int,
conAsi_numAsiento int,
conAsi_estAsiento char(1),
itinerario_id int)
alter table controlAsiento add constraint fk_conAsiento_itinerario foreign key (itinerario_id) references itinerario(iti_id)
go
create table comprobante(
com_id int primary key identity not null,
com_descripcion varchar(45))
go
create table comprobanteSerie(
comSer_id int primary key identity not null,
comSer_serie int,
comSer_correlativo int,
comSer_estado int,
comprobante_id int,
sucursal_id int)
alter table comprobanteSerie add constraint fk_comSerie_sucursal foreign key (sucursal_id) references sucursal(suc_id)
alter table comprobanteSerie add constraint fk_comSerie_comprobante foreign key (comprobante_id) references comprobante(com_id)
go
create table boletoViaje(
bolVia_id int primary key identity not null,
bolVia_fecha datetime,
bolVia_estado int,
bolVia_asiento int,
persona_id int,
personal_id int,
itinerario_id int,
comSerie_id int)
alter table boletoViaje add constraint fk_bolViaje_persona foreign key (persona_id) references persona(per_id)
alter table boletoViaje add constraint fk_bolViaje_personal foreign key (personal_id) references personal(per_id)
alter table boletoViaje add constraint fk_bolViaje_itinerario foreign key (itinerario_id) references itinerario(iti_id)
alter table boletoViaje add constraint fk_bolViaje_comSerie foreign key (comSerie_id) references comprobanteSerie(comSer_id)
go
create table ordenTraslado(
ordTra_id int primary key identity not null,
ordTra_fecEnvio datetime,
ordTra_fecEntrega datetime,
ordTra_fecRegistro datetime,
ordTra_estado int,
sucursal_origen_id  int,
sucursal_destino_id  int,
remitente_id int,
destinatario_id int,
personal_id int,
comSerie_id int,
vehiculo_id int)
go
alter table ordenTraslado add constraint fk_ordTraOrigen_sucursal foreign key (sucursal_origen_id) references sucursal(suc_id)
alter table ordenTraslado add constraint fk_ordTraDestino_sucursal foreign key (sucursal_destino_id) references sucursal(suc_id)
alter table ordenTraslado add constraint fk_ordTraRemitente_persona foreign key (remitente_id) references persona(per_id)
alter table ordenTraslado add constraint fk_ordTraDestinatario_persona foreign key (destinatario_id) references persona(per_id)
alter table ordenTraslado add constraint fk_ordTraslado_personal foreign key (personal_id) references personal(per_id)
alter table ordenTraslado add constraint fk_ordTraslado_comSerie foreign key (comSerie_id) references comprobanteSerie(comSer_id)
alter table ordenTraslado add constraint fk_ordTraslado_vehiculo foreign key (vehiculo_id) references vehiculo(veh_id)
go
create table ordenTrasladoDetalle(
ordTraDet_id int primary key identity not null,
ordTraDet_cantidad int,
ordTraDet_descripcion varchar(45),
ordTraDet_importe decimal(18,2),
ordTra_id int)
go
alter table ordenTrasladoDetalle add constraint fk_ordTraDetalle_ordTraslado foreign key (ordTra_id) references ordenTraslado(ordTra_id)
go
--OTRA POSIBLES TABLAS
/*create table mensajes(
men_id int primary key identity not null,
men_codigo char(7) unique,
men_descripcion text,
men_fecRegistro datetime)*/
go
create trigger trCrearSerieXComprobante
on comprobante after insert
as 
begin	
	declare @contador int, @idNueComprobante int,@idSucursal int,@serie int
	select @contador=count(*) from sucursal
	if @contador>0 	
		begin
			set @idNueComprobante = (select com_id from INSERTED)
			declare curSucursal cursor for select suc_id from sucursal	
			open curSucursal 
			fetch curSucursal into @idSucursal
			set @serie =1
			while @@FETCH_STATUS=0		
				begin
					insert into comprobanteSerie(comSer_serie,comSer_correlativo,comprobante_id,sucursal_id,comSer_estado) 
					values(@serie,0,@idNueComprobante,@idSucursal,1)			
					fetch curSucursal into @idSucursal
					set @serie+=1
				end	
			close curSucursal
			DEALLOCATE curSucursal	
		end 
	
end
go
create trigger trCrearSerieXSucursal
on sucursal after insert
as 
begin
	declare @contador int, @idNueSucursal int,@idComprabante int,@serie int
	select @contador=count(*) from sucursal
	if @contador>0 
		begin	
			set @idNueSucursal = (select suc_id from INSERTED)
			declare curComprobante cursor for select com_id from comprobante	
			open curComprobante 
			fetch curComprobante into @idComprabante
			set @serie =1
			while @@FETCH_STATUS=0		
				begin
					insert into comprobanteSerie(comSer_serie,comSer_correlativo,comprobante_id,sucursal_id,comSer_estado) 
					values(@serie,0,@idComprabante,@idNueSucursal,1)			
					fetch curComprobante into @idComprabante
					set @serie+=1
				end	
			close curComprobante
			DEALLOCATE curComprobante
		end
end
