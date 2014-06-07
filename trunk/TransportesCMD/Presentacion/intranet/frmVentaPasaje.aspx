<%@ Page Title="" Language="C#" MasterPageFile="~/intranet/MDI.Master" AutoEventWireup="true" CodeBehind="frmVentaPasaje.aspx.cs" Inherits="Presentacion.intranet.frmVentaPasaje" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="assets/stylesheets/itinerario.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cuerpo" runat="server">
    <div class="header">
        <h1 class="page-title">Venta de Pasajes</h1>
    </div>
    <div class="container-fluid">
        <div class="row-fluid">
            <div class="block">
                <a href="#page-stats" class="block-heading" data-toggle="collapse">Datos de Itinerario(Salida)</a>
                <div id="page-stats" class="block-body">
                    <div class="stat-widget-container">
                        <span>Origen: </span>
                        <select id="salidaOrigen" data-placeholder="Seleccione Origen" class="span3" tabindex="1">
                            <%-- Aqui Javascript JSON --%>
                        </select>
                        <span>Destino: </span>
                        <select class="span3" id="salidaDestino" tabindex="2">
                            <%-- Aqui Javascript JSON --%>
                        </select>

                        <span>Fecha: </span>
                        <select class="span3" id="itinerarioFecha" tabindex="3">
                            <%-- Aqui Javascript JSON --%>
                        </select>
                    </div>
                </div>
                <div id="tbItinerario" class="block-body">
                    <table id="tbSalidasCss" class="table">
                        <thead>
                            <tr>
                                <th>N°</th>
                                <th>Hora</th>
                                <th>Precio</th>
                                <th>Disponibles</th>
                                <th>Servicio Especial</th>
                            </tr>
                        </thead>
                        <tbody id="tbBodyItinerario">
                            <%-- Aqui Javascript JSON --%>
                        </tbody>                        
                    </table>
                    <label class="lblMensaje" id="lblItinerario"></label>
                </div>
            </div>
        </div>
        <div class="row-fluid">
            <div class="block span6">
                <a href="#widget1container" class="block-heading" data-toggle="collapse">Datos de Boleto </a>
                <div id="widget1container" class="block-body collapse in">

                    <div class="box-content">
                        <br />
                        <div class="well">
                            <form name="frmRegistraVentaPasaje">
                                <div class="hidden">
                                    <input type="text" id="tamNumDocIdentidad" value="" />
                                    <input type="text" id="idItinerario" name="idItinerario" value="" />
                                    <input type="text" id="idPersona" name="idPersona" value="" />
                                </div>
                                <div>Documento de Identidad:</div>
                                <div class="control-group">
                                    <select class="span12" id="tipDocIdentidad" name="tipDocIdentidad">
                                        <%-- Aqui Javascript JSON --%>
                                    </select>
                                </div>
                                <div>Número de Documento:</div>
                                <div class="control-group">
                                    <input type="text" class="span6" id="numDocIdentidad" name="numDocIdentidad" />
                                    <button type="button" class="btn" onclick="buscarPersonaPorNic()"><i class="icon-search"></i>Buscar</button>
                                    <label class="lblMensaje" id="lblNDocumento"></label>
                                </div>
                                <div>Apellidos:</div>
                                <div class="control-group">
                                    <input class="span12" name="apellidos" id="apellidos" />
                                    <label class="lblMensaje" id="lblApellidos"></label>
                                </div>
                                <div>Nombres:</div>
                                <div class="control-group">
                                    <input class="span12" name="nombres" id="nombres" />
                                    <label class="lblMensaje" id="lblMensajeNombres"></label>
                                </div>
                                <div>Sexo:</div>
                                <div class="control-group">
                                    <input type="radio" class="radio" name="sexo" value="m" checked="checked" />
                                    Masculino 
                                    <input type="radio" class="radio" name="sexo" value="f" />
                                    Femenino 
                                </div>
                                <div>Fecha Nacimiento:</div>
                                <div class="control-group">
                                    <input class="span6" name="fecNacimiento" id="fecNacimiento" onfocus="this.blur()" />
                                    <input class="span3" name="edad" id="edad" onfocus="this.blur()" /><span> Años</span>
                                    <label class="lblMensaje" id="lblMensajeFechaNacimiento"></label>
                                </div>
                                <div id="divNumAsiento">
                                    <div>Número de Asiento:</div>
                                    <div class="control-group">
                                        <input type="text" id="numAsiento" class="span12" name="numAsiento" disabled="disabled" />

                                    </div>
                                </div>
                            </form>
                        </div>

                        <div class="btn-toolbar">
                            <div class="span6">                                
                                <label class="lblMensaje" id="lblMsjVentaPasaje"></label>
                            </div>
                            <div class="span6">
                                <button type="submit" class="btn btn-primary" onclick="registrarVenta()">
                                    <i class="icon-ok"></i>
                                    Aceptar
                                </button>
                                <button class="btn btn-ser" name="action" value="Cancelar" onclick="cancelarVenta()">Cancel</button>
                                
                            </div>


                        </div>
                    </div>
                </div>

            </div>
            <div class="block span6">
                <a href="#widget2container" class="block-heading" data-toggle="collapse">Réplica de Bus </a>
                <div id="widget2container" class="block-body collapse in">
                    <label class="lblMensaje" id="lblMensajeNumAsiento"></label>     
                    <div id="replicaBus">
                        <%--Aquí va Javascript y JSON--%>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="javascript" runat="server">
    <script src="assets/lib/ventaPasaje.js"></script>
</asp:Content>
