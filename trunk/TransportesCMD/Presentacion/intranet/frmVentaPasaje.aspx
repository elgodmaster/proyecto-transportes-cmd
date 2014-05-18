<%@ Page Title="TCMD - Venta de Pasaje" Language="C#" MasterPageFile="~/intranet/MDI.Master" AutoEventWireup="true" CodeBehind="frmVentaPasaje.aspx.cs" Inherits="Presentacion.frmVentaPasaje1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="assets/css/itinerario.css" type="text/css" media="screen, projection" rel="stylesheet" />
    <link rel="stylesheet" href="pruebas/chosen.css" />  

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cuerpo" runat="server">
    <div class="row">
        <div class="span16">
            <div class="box pattern pattern-sandstone">
                <div class="box-header">
                    <i class="icon-list"></i>
                    <h5>Venta de Pasajes</h5>
                    <button class="btn btn-box-right" data-toggle="collapse" data-target=".box-list">
                        <i class="icon-reorder"></i>
                    </button>
                </div>
                <div class="box-content box-list collapse in">
                    <div class="box-content">
                        <div class="row-fluid">

                            <div class="control-group span15">
                                <div class="span2"></div>
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
                            <div class="span1"></div>
                            <div id="tbSalidas" class="span13">
                                <div class="box">
                                    <div class="box-content box-table">                                        
                                        <div>
                                            <div class="span5"></div><div class="span3"><h4>Lista de Itinerarios</h4></div>
                                            <div id="divTableScroll">
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
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="span8">
            <div class="box pattern pattern-sandstone">
                <div class="box-header">
                    <i class="icon-list"></i>
                    <h5>Venta de Pasajes</h5>
                    <button class="btn btn-box-right" data-toggle="collapse" data-target=".box-cliente">
                        <i class="icon-reorder"></i>
                    </button>
                </div>
                <div class="box-content box-cliente collapse in">
                    <div class="box-content">
                        <div class="row-fluid">
                            <form name="frmRegistraVentaPasaje">
                                <fieldset>
                                    <legend></legend>
                                    <div class="span3">Documento de Identidad:</div>
                                    <div class="control-group">
                                        <select class="span4" id="selDocIdentidad">
                                             <%-- Aqui Javascript JSON --%>                                     
                                        </select>
                                    </div>
                                    <div class="span3">Número de Documento:</div>
                                    <div class="control-group">
                                        <input class="span3" id="impDocIdentidad" name="" value="" />
                                        <button class="btn" onclick="fnEnviarDatosPersonBusqueda()"><i class="icon-search"></i>Buscar</button>
                                    </div>


                                    <div class="span3">Nombres:</div>
                                    <div class="control-group">
                                        <input class="span4" name=""  id="impNombres"/>
                                    </div>
                                    <div class="span3">Apellidos:</div>
                                    <div class="control-group">
                                        <input class="span4" name="" id="impApellidos"/>
                                    </div>
                                    <div class="span3">Sexo:</div>
                                    <div class="control-group">
                                        <input type="radio" class="radio" name="sexo" value="m" checked="checked"/>  Masculino 
                                        <input type="radio" class="radio" name="sexo"  value="f"/>  Femenino 
                                    </div>
                                    <div class="span3">Edad:</div>
                                    <div class="control-group">
                                        <input class="span4" name=""  id="impEdad"/>
                                    </div>
                                    <div id="divControlAsiento" class="span8">
                                        <div class="span3">Número de Asiento:</div>
                                        <div class="divControlAsiento control-group">
                                            <input id="numAsiento" class="span2" name="" disabled="disabled" />
                                        </div>
                                    </div>
                                </fieldset>
                            </form>
                        </div>
                    </div>
                    <div class="box-footer ">
                        <div class="span4"></div>
                        <button type="submit" class="btn btn-primary">
                            <i class="icon-ok"></i>
                            Aceptar
                        </button>
                        <button type="submit" class="btn btn-ser" name="action" value="CANCEL">Cancel</button>
                    </div>
                </div>
            </div>
        </div>
        <div class="span8">
            <div class="box">
                <div class="box-header">
                    <i class="icon-book"></i>
                    <h5>Selección de Asientos</h5>
                </div>
                <div class="box-content">
                    <div id="replicaBus">
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="javascript" runat="server">
    <script src="assets/js/fnVentaPasaje.js"></script>
</asp:Content>
