<%@ Page Title="" Language="C#" MasterPageFile="~/intranet/MDI.Master" AutoEventWireup="true" CodeBehind="frmItinerarios.aspx.cs" Inherits="Presentacion.intranet.frmItinerarios" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cuerpo" runat="server">
    <div class="header">
        <h1 class="page-title">Itinerarios</h1>
    </div>
    <ul class="breadcrumb">
        <li><a href="frmPrincipal.aspx">Inicio</a> <span class="divider">/</span></li>
        <li class="active">Mantenedor de Itinirearios</li>
    </ul>
    <div class="row-fluid">
        <form id="Form1" runat="server">
            <div class="block span6">
        <a href="#widget2container" class="block-heading" data-toggle="collapse">Collapsible </a>
        <div id="widget2container" class="block-body collapse in">
            <div class="box-content">
                <div id="page-stats" class="block-body">
                    <div class="stat-widget-container">
                        <div class="control-group">
                        <span>Origen: </span>
                        <asp:ListBox ID="idOrigen" Rows="1" runat="server"></asp:ListBox>
                            <%-- Aqui Javascript JSON --%> 
                        </div>
                        <div class="control-group">                       
                        <span >Destino: </span>
                        <asp:ListBox ID="idDestino" Rows="1" runat="server"></asp:ListBox>
                            <%-- Aqui Javascript JSON --%>
                        </div>
                        <div class="control-group">
                        <span>Fecha: </span>
                        <select class="span3" id="itinerarioFecha" tabindex="3">
                            <%-- Aqui Javascript JSON --%>
                        </select>
                        </div>
                        <div class="control-group">
                        <span>Hora: </span>
                        <select class="span3" id="itinerarioHora" tabindex="3">
                            <%-- Aqui Javascript JSON --%>
                        </select>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%--<div class="span16">
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
                                <div class="control-group span4">
                                    <label class="control-label"> Origen </label>
                                    <div class="controls">
                                        <asp:ListBox ID="lstSucOrigen" Rows="1" runat="server"></asp:ListBox>
                                    </div>
                                </div>
                                <div class="control-group span4">
                                    <label class="control-label" > Destino </label>
                                    <div class="controls">
                                        <asp:ListBox ID="lstSucDestino" Rows="1" runat="server"></asp:ListBox>
                                    </div>
                                </div>
                                <div class="control-group span3">
                                    <label class="control-label" > Fecha </label>
                                    <div class="controls">
                                        <input class="span2" name="itinerarioFecha" id="itinerarioFecha" onfocus="this.blur()" />
                                    </div>
                                </div>
                                <div class="control-group span2">
                                    <label class="control-label" > Hora </label>
                                    <div class="controls">
                                        <input class="span2" name="itinerarioHora" id="itinerarioHora" />
                                    </div>
                                </div>
                                 <div class="control-group span2">
                                     <label class="control-label" > . </label>
                                    <asp:Button ID="btnBuscar" runat="server" Text="Buscar Buses" />
                                </div>
                            </div> 
                            <div id="tbItinerario" class="span13">                       
                                <div class="box-content box-table">                                    
                                    <div class="span3">
                                        <h4>Lista de Buses</h4>
                                    </div>
                                    <table id="tbSalidasCss" class="table">
                                        <thead>
                                            <tr>
                                                <th>N°</th>
                                                <th>Bus</th>
                                                <th>Origen</th>
                                                <th>Destino</th>
                                                <th>Hora de Llegada</th>
                                                <th>1° Piso</th>
                                                <th>2° Piso</th>
                                            </tr>
                                        </thead>
                                        <tbody id="tbBodyItinerario">
                                            <tr>
                                                <td>1</td>
                                                <td>Mercedes Bens MSG-23</td>
                                                <td>Trujillo</td>
                                                <td>Lima</td>
                                                <td>02/06/2014 23:00</td>
                                                <td>16</td>
                                                <td>52</td>
                                            </tr>
                                            <tr>
                                                <td>2</td>
                                                <td>Mercedes Bens MSG-24</td>
                                                <td>Trujillo</td>
                                                <td>Lima</td>
                                                <td>02/06/2014 3:00</td>
                                                <td>16</td>
                                                <td>52</td>
                                            </tr>
                                            <tr>
                                                <td>3</td>
                                                <td>Mercedes Bens MSG-25</td>
                                                <td>Trujillo</td>
                                                <td>Lima</td>
                                                <td>02/06/2014 5:00</td>
                                                <td>16</td>
                                                <td>52</td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>                         
                        </div>
                    </div>
                    </form>
                </div>
            </div>
        </div>--%>
        </div>
        </form>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="javascript" runat="server">
    <script src="assets/js/gestionItinerario.js"></script>
</asp:Content>
