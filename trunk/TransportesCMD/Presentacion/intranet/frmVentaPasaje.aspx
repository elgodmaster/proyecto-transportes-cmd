﻿<%@ Page Title="" Language="C#" MasterPageFile="~/intranet/MDI.Master" AutoEventWireup="true" CodeBehind="frmVentaPasaje.aspx.cs" Inherits="Presentacion.intranet.frmVentaPasaje" %>
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
                </div>
            </div>
        </div>
        <div class="row-fluid">
            <div class="block span6">
                <a href="#widget1container" class="block-heading" data-toggle="collapse"> Datos de Boleto </a>
                <div id="widget1container" class="block-body collapse in">

                    <div class="box-content">
                        <br />
                        <div class="well">
                            <form name="frmRegistraVentaPasaje">
                                <div class="hiddens">
                                    <input type="text" id="tamNumDocIdentidad" value="" />
                                    <input type="text" id="idItinerario" name="idItinerario" value="" />
                                    <input type="text" id="idPersona" name="idPersona" value="" />
                                </div>
                                <div class="span5">Documento de Identidad:</div>
                                <div class="control-group">
                                    <select class="span6" id="tipDocIdentidad" name="tipDocIdentidad">
                                        <%-- Aqui Javascript JSON --%>
                                    </select>
                                </div>
                                <div class="span5">Número de Documento:</div>
                                <div class="control-group">
                                    <input type="text" class="span4" id="numDocIdentidad" name="numDocIdentidad" />
                                    <button type="button" class="btn" onclick="buscarPersonaPorNic()"><i class="icon-search"></i>Buscar</button>
                                </div>
                                <div class="span5">Apellidos:</div>
                                <div class="control-group">
                                    <input class="span6" name="apellidos" id="apellidos" />
                                </div>
                                <div class="span5">Nombres:</div>
                                <div class="control-group">
                                    <input class="span6" name="nombres" id="nombres" />
                                </div>
                                <div class="span5">Sexo:</div>
                                <div class="control-group">
                                    <input type="radio" class="radio" name="sexo" value="m" checked="checked" />
                                    Masculino 
                                    <input type="radio" class="radio" name="sexo" value="f" />
                                    Femenino 
                                </div>
                                <div class="span5">Fecha Nacimiento:</div>
                                <div class="control-group">
                                    <input class="span4" name="fecNacimiento" id="fecNacimiento" onfocus="this.blur()" />
                                    <input class="span2" name="edad" id="edad" /><span> Años</span>
                                </div>
                                <div id="divNumAsiento">
                                    <div class="span5">Número de Asiento:</div>
                                    <div class="control-group">
                                        <input type="text" id="numAsiento" class="span6" name="numAsiento" disabled="disabled" />
                                    </div>
                                </div>
                            </form>
                        </div>
                        <div class="btn-toolbar">
                            <button type="submit" class="btn btn-primary" onclick="spBoletoViajeRegistro()">
                                <i class="icon-ok"></i>
                                Aceptar
                            </button>
                            <button class="btn btn-ser" name="action" value="Cancelar" onclick="cancelarVenta()">Cancel</button>
                            <label class="lblMensaje" id="lblMensaje"></label>
                        </div>
                    </div>
                </div>

            </div>
            <div class="block span6">
                <a href="#widget2container" class="block-heading" data-toggle="collapse">Réplica de Bus </a>
                <div id="widget2container" class="block-body collapse in">
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
