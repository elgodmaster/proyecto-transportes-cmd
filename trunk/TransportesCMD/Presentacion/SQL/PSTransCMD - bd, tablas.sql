use master
go
create database bdTransportesCMD
go
use bdTransportesCMD
go
--Pasaporte, DNI, Libreta Militar
create table documentoIdentidad(
docIde_id int primary key identity not null,
docIde_descripcion varchar(25))
go
--Todo se registrarán
create table persona(
per_id int primary key identity not null,
per_nombres varchar(35),
per_apellidos varchar(55),
per_numDocIdentidad varchar(15),
per_telefono varchar(25),
per_sexo char(1),
per_direccion varchar(80),
per_email varchar(50),
per_img varchar(50),
per_fecRegistro datetime, --Para Control Interno
per_estado char, --Para Control Interno
docIde_id int)
go
alter table persona add constraint fk_persona_documentoIdentidad foreign key (docIde_id) references documentoIdentidad(docIde_id)
go
create table usuario(
usu_id int primary key identity not null,
usu_user varchar(50) unique,
usu_pass varbinary(8000),
usu_fecRegistro datetime,
usu_estado char(1),
per_id int)
alter table usuario add constraint fk_usuario_persona foreign key (per_id) references persona(per_id)
go
create table departamento(
dep_id int primary key identity not null,
dep_nombre varchar(35))
go
--Registro de ciudades 
create table ciudad(
ciu_id int primary key identity not null,
ciu_nomCiudad varchar(35),
dep_id int)
go
alter table ciudad add constraint fk_ciudad_departamento foreign key (dep_id) references departamento(dep_id)
go
create table sucursal(
suc_id int primary key identity not null,
suc_nombre varchar(55),
suc_direccion varchar(75),
suc_telefono varchar(15),
ciu_id int)
go
alter table sucursal add constraint fk_sucursal_departamento foreign key (ciu_id) references ciudad(ciu_id)
go
create table Cargo(
car_id int primary key identity not null,
car_nomCargo varchar(35),
car_desCargo varchar(45))
go
create table personaPersonal(
perPer_id int primary key identity not null,
perPer_estCivil char(1),
perPer_fecContrato date,
perPer_fecFinContrato date,
perPer_fecRegistro datetime,
perPer_estado char(1),
car_id int,
per_id int,
suc_id int)
alter table personaPersonal add constraint fk_personal_persona foreign key (per_id) references persona(per_id)
alter table personaPersonal add constraint fk_personal_cargo foreign key (car_id) references Cargo(car_id)
alter table personaPersonal add constraint fk_personal_sucursal foreign key (suc_id) references sucursal(suc_id)
go
create table servicioEspecial(
serEsp_id int primary key identity not null,
serEsp_nombre varchar(35),
serEsp_caracteristicas varchar(85),
serEsp_fecRegistro datetime,
serEsp_estado char(1))
go
create table vehiculoMarca(
vehMar_id  int primary key identity not null,
vehMar_descripcion varchar(35))
go
create table vehiculo(
veh_id int primary key identity not null,
veh_marca varchar(35),
veh_modelo varchar(30),
veh_numAsiPrimer int,
veh_numAsiSegundo int,
veh_img varchar(50),
veh_fecRegistro datetime,
veh_estado char(1),
vehMar_id int)
go
alter table vehiculo add constraint fk_vehiculo_vehMarca foreign key (vehMar_id) references vehiculoMarca(vehMar_id)
go
create table itinerario(
iti_id int primary key identity not null,
iti_origen_id int,
iti_destino_id int,
iti_horSalida datetime,
iti_horLlegada datetime,
iti_fecRegistro datetime,
iti_estado char(1),
serEsp_id int,
veh_id int)
alter table itinerario add constraint fk_itinerario_serEspecial foreign key (serEsp_id) references servicioEspecial(serEsp_id)
alter table itinerario add constraint fk_itiOrigen_ciudad foreign key (iti_origen_id) references sucursal(suc_id)
alter table itinerario add constraint fk_itiDestino_ciudad foreign key (iti_destino_id) references sucursal(suc_id)
alter table itinerario add constraint fk_itinerario_vehiculo foreign key (veh_id) references vehiculo(veh_id)

go
create table itinerarioPersonaPersonal(
itiPerPer_id int primary key identity not null,
itiPerPer_fecRegistro datetime,
itiPerPer_estado char(1),
perPer_id int,
iti_id int)
go
alter table itinerarioPersonaPersonal add constraint fk_itiPerPersonal_perPersonal foreign key (perPer_id) references personaPersonal(perPer_id)
alter table itinerarioPersonaPersonal add constraint fk_itiPerPersonal_itinerario foreign key (iti_id) references itinerario(iti_id)
--alter table itinerarioPersonal add constraint fk_itiPersonal_itiPerCargo foreign key (itiPerCar_id) references itinerarioPersonalCargo(itiPerCar_id)
go
create table controlAsiento(
conAsi_id int primary key identity not null,
conAsi_control int,
conAsi_piso int,
conAsi_numAsiento int,
conAsi_estAsiento char(1),
iti_id int)
alter table controlAsiento add constraint fk_conAsiento_itinerario foreign key (iti_id) references itinerario(iti_id)
go
create table boletoViajeSerie(
bolViaSer_id int primary key identity not null,
bolViaSer_serie int,
bolViaSer_numero int,
suc_id int)
alter table boletoViajeSerie add constraint fk_bolViaSerie_sucursal foreign key (suc_id) references sucursal(suc_id)
go
create table boletoViaje(
venPas_id int primary key identity not null,
venPas_cliente_id int,
venPas_personal_id int,
venPas_fecha datetime,
venPas_numAsiento int,
venPas_fecRegistro datetime,
venPas_estado char(1),
iti_id int,
bolViaSer_id int)
alter table boletoViaje add constraint fk_bolViaje_persona foreign key (venPas_cliente_id) references persona(per_id)
alter table boletoViaje add constraint fk_bolViaje_perPersonal foreign key (venPas_personal_id) references personaPersonal(perPer_id)
alter table boletoViaje add constraint fk_bolViaje_itinerario foreign key (iti_id) references itinerario(iti_id)
alter table boletoViaje add constraint fk_bolViaje_bolViaSerie foreign key (bolViaSer_id) references boletoViajeSerie(bolViaSer_id)
go
create table ordenTrasladoSerie(
ordTraSer_id int primary key identity not null,
ordTraSer_serie int,
ordTraSer_numero int,
suc_id int)
go
alter table ordenTrasladoSerie add constraint fk_ordTraSerie_sucursal foreign key (suc_id) references sucursal(suc_id)
go
create table ordenTraslado(
ordTra_id int primary key identity not null,
ordTra_fecEnvio datetime,
ordTra_fecEntrega datetime,
ordTra_origen_id  int,
ordTra_destino_id  int,
ordTra_remitente_id int,
ordTra_destinatario_id int,
ordTra_fecRegistro datetime,
ordTra_estado char(1),
perPer_id int,
ordTraSer_id int)
go
alter table ordenTraslado add constraint fk_ordTraOrigen_sucursal foreign key (ordTra_origen_id) references sucursal(suc_id)
alter table ordenTraslado add constraint fk_ordTraDestino_sucursal foreign key (ordTra_destino_id) references sucursal(suc_id)
alter table ordenTraslado add constraint fk_ordTraRemitente_persona foreign key (ordTra_remitente_id) references persona(per_id)
alter table ordenTraslado add constraint fk_ordTraDestinatario_persona foreign key (ordTra_destinatario_id) references persona(per_id)
alter table ordenTraslado add constraint fk_ordTraslado_perPersonal foreign key (perPer_id) references personaPersonal(perPer_id)
alter table ordenTraslado add constraint fk_ordTraslado_ordTraSerie foreign key (ordTraSer_id) references ordenTrasladoSerie(ordTraSer_id)
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
