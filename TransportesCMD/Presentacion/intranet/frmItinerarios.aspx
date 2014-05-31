<%@ Page Title="" Language="C#" MasterPageFile="~/intranet/MDI.Master" AutoEventWireup="true" CodeBehind="frmItinerarios.aspx.cs" Inherits="Presentacion.intranet.frmItinerarios" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cuerpo" runat="server">
    <div class="row">
        <div class="span16">
            <div class="box pattern pattern-sandstone">
                <div class="box-header">
                    <i class="icon-list"></i>
                    <h5>Itinerarios(Salidas)</h5>
                    <button class="btn btn-box-right" data-toggle="collapse" data-target=".box-list">
                        <i class="icon-reorder"></i>
                    </button>
                </div>
                <div class="box-content box-list">
                    <form runat="server">
                    <div class="box-content">
                        <div class="row-fluid">
                            <div class="control-group span15">
                                <div class="span2"></div>
                                <span>Origen: </span>
                                <asp:ListBox ID="lstSucOrigen" Rows="1" runat="server"></asp:ListBox>                               
                                <span>Destino: </span>
                               <asp:ListBox ID="lstSucDestino" Rows="1" runat="server"></asp:ListBox>
                                <span>Fecha: </span>
                                <select class="span3" id="itinerarioFecha" tabindex="3">
                                    <%-- Aqui Javascript JSON --%>
                                </select>
                            </div>
                            <div class="span1"></div>
                            <div id="tbItinerario" class="span13">
                                <div class="box">
                                    <div class="box-content box-table">
                                        <div>
                                            <div class="span5"></div>
                                            <div class="span3">
                                                <h4>Lista de Itinerarios</h4>
                                            </div>
                                            <div>
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
                    </form>
                </div>
            </div>
        </div>
        <div class="span8">
            <div class="box pattern pattern-sandstone">
                <div class="box-header">
                    <i class="icon-list"></i>
                    <h5>Datos de Cliente</h5>
                    <button class="btn btn-box-right collapsed" data-toggle="collapse" data-target=".box-cliente">
                        <i class="icon-reorder"></i>
                    </button>
                </div>
                <div class="box-content box-cliente">
                    <div class="box-content">
                        <div class="row-fluid">
                            <form name="frmRegistraVentaPasaje">
                                <div class="hidden">
                                    <input type="text" id="tamNumDocIdentidad" value="" />
                                    <input type="text" id="idItinerario" name="idItinerario" value="" />
                                    <input type="text" id="idPersona" name="idPersona" value="" />
                                    <textarea id="text"></textarea>
                                </div>
                                <div class="span3">Documento de Identidad:</div>
                                <div class="control-group">
                                    <select class="span4" id="tipDocIdentidad" name="tipDocIdentidad">
                                        <%-- Aqui Javascript JSON --%>
                                    </select>
                                </div>
                                <div class="span3">Número de Documento:</div>
                                <div class="control-group">
                                    <input type="text" class="span3" id="numDocIdentidad" name="numDocIdentidad" />
                                    <button type="button" class="btn" onclick="buscarPersonaPorNic()"><i class="icon-search"></i>Buscar</button>
                                </div>
                                <div class="span3">Apellidos:</div>
                                <div class="control-group">
                                    <input class="span4" name="apellidos" id="apellidos" />
                                </div>
                                <div class="span3">Nombres:</div>
                                <div class="control-group">
                                    <input class="span4" name="nombres" id="nombres" />
                                </div>
                                <div class="span3">Sexo:</div>
                                <div class="control-group">
                                    <input type="radio" class="radio" name="sexo" value="m" checked="checked" />
                                    Masculino 
                                    <input type="radio" class="radio" name="sexo" value="f" />
                                    Femenino 
                                </div>
                                <div class="span3">Fecha Nacimiento:</div>
                                <div class="control-group">
                                    <input class="span2" name="fecNacimiento" id="fecNacimiento" onfocus="this.blur()" />
                                    <input class="span1" name="edad" id="edad" /><span> Años</span>
                                </div>
                                <div id="mensaje"></div>
                                <div id="divNumAsiento" class="span8">
                                    <div class="span3">Número de Asiento:</div>
                                    <div class="control-group">
                                        <input type="text" id="numAsiento" class="span2" name="numAsiento" disabled="disabled" />
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                    <div class="box-footer ">
                        <div class="span4">
                            <label class="lblMensaje" id="lblMsjVentaPasaje"></label>
                        </div>
                        <button type="submit" class="btn btn-primary" onclick="spBoletoViajeRegistro()">
                            <i class="icon-ok"></i>
                            Aceptar
                        </button>
                        <button class="btn btn-ser" name="action" value="Cancelar" onclick="cancelarVenta()">Cancel</button>
                    </div>
                </div>
            </div>
        </div>
        <div class="span8">
            <div class="box">
                <div class="box-header">
                    <i class="icon-list"></i>
                    <h5>Réplica de Bus</h5>
                    <button class="btn btn-box-right collapsed" data-toggle="collapse" data-target=".box-cliente">
                        <i class="icon-reorder"></i>
                    </button>
                </div>
                <div class="box-content box-cliente">
                    <div id="replicaBus">
                        <%--Aquí va Javascript y JSON--%>
                    </div>
                </div>
            </div>
        </div>
        <div class="span8">
            <%--<asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
            <rsweb:ReportViewer ID="ReportViewer1" runat="server"></rsweb:ReportViewer>--%>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="javascript" runat="server">
</asp:Content>
