<%@ Page Title="TCMD - Venta de Pasaje" Language="C#" MasterPageFile="~/intranet/MDI.Master" AutoEventWireup="true" CodeBehind="frmVentaPasaje.aspx.cs" Inherits="Presentacion.frmVentaPasaje1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="assets/css/css_roque.css" type="text/css" media="screen, projection" rel="stylesheet" />
    <link rel="stylesheet" href="pruebas/chosen.css" />
    <style>
#tbSalidasCss tbody tr:nth-child(odd):hover,#tbSalidasCss tbody tr:nth-child(even):hover{ 
    color:red;
    font-weight:100;
    cursor: pointer;
}

    </style>

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
                                <span >Origen: </span>
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
                                <div id="Person-1" class="box">                                    
                                    <div class="box-content box-table">
                                        <div style="width:100%; ">
                                        <table id="tbSalidasCss" class="table table-hover tablesorter">
                                            <thead>
                                                <tr>
                                                    <%--<th>Origen</th>
                                                    <th>Destino</th>
                                                    <th>Fecha</th>--%>
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
                            <div class="span2"></div>
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
                            <fieldset>
                                <legend></legend>
                                <div class="span3">Documento de Identidad:</div>
                                <div class="control-group">
                                    <select class="span4" id="Select1">
                                        <option>DNI</option>
                                        <option>PASAPORTE</option>
                                        <option>LIBRETA MILITAR</option>
                                    </select>
                                </div>
                                <div class="span3">Número</div>
                                <div class="control-group">
                                    <input class="span4" name="" value="" />
                                </div>


                                <div class="span3">Nombres:</div>
                                <div class="control-group">
                                    <input class="span4" name="" />
                                </div>
                                <div class="span3">Apellidos:</div>
                                <div class="control-group">
                                    <input class="span4" name="" />
                                </div>
                                <div class="span3">Edad:</div>
                                <div class="control-group">
                                    <input class="span4" name="" />
                                </div>
                            </fieldset>

                        </div>
                    </div>
                    <div class="box-footer ">
                        <button type="submit" class="btn btn-primary">
                            <i class="icon-ok"></i>
                            Aceptar
                        </button>
                        <button type="submit" class="btn" name="action" value="CANCEL">Cancel</button>
                    </div>
                </div>
            </div>
        </div>
        <div class="span8">
            <div class="box">
                <div class="box-header">
                    <i class="icon-book"></i>
                    <h5>Selección de Asientos - Ida</h5>
                </div>
                <div class="box-content">
                    <div id="intinerario-ida">
                        <div class="mr-fila">
                            <div class="mr-asiento"><a class="mr-asiento-d" data-toggle="modal" href="#chat_modal" onclick="fn">1</a></div>
                            <div class="mr-asiento"><a class="mr-asiento-d" data-toggle="modal" href="#chat_modal" onclick="fn">2</a></div>
                            <div class="mr-asiento"></div>
                            <div class="mr-asiento"><a class="mr-asiento-d" data-toggle="modal" href="#chat_modal" onclick="fn">3</a></div>
                            <div class="mr-asiento"><a class="mr-asiento-d" data-toggle="modal" href="#chat_modal" onclick="fn">4</a></div>
                        </div>
                        <div class="mr-fila">
                            <div class="mr-asiento"><a class="mr-asiento-d" data-toggle="modal" href="#chat_modal" onclick="fn">5</a></div>
                            <div class="mr-asiento"><a class="mr-asiento-d" data-toggle="modal" href="#chat_modal" onclick="fn">6</a></div>
                            <div class="mr-asiento"></div>
                            <div class="mr-asiento"><a class="mr-asiento-d" data-toggle="modal" href="#chat_modal" onclick="fn">7</a></div>
                            <div class="mr-asiento"><a class="mr-asiento-d" data-toggle="modal" href="#chat_modal" onclick="fn">8</a></div>
                        </div>
                        <div class="mr-fila">
                            <div class="mr-asiento"><a class="mr-asiento-d" data-toggle="modal" href="#chat_modal" onclick="fn">5</a></div>
                            <div class="mr-asiento"><a class="mr-asiento-r" data-toggle="modal" href="#chat_modal" onclick="fn">6</a></div>
                            <div class="mr-asiento"></div>
                            <div class="mr-asiento"></div>
                            <div class="mr-asiento"></div>
                        </div>                        
                    </div>
                </div>
            </div>
        </div>        
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="javascript" runat="server">
    <script src="assets/js/fnVentaPasaje.js"></script>
</asp:Content>
