<%@ Page Title="" Language="C#" MasterPageFile="~/intranet/MDI.Master" AutoEventWireup="true" CodeBehind="frmItinerarios.aspx.cs" Inherits="Presentacion.intranet.frmItinerarios" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="assets/datatable/css/jquery.dataTables.min.css" rel="stylesheet" />
    <script src="assets/datatable/js/jquery.dataTables.min.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cuerpo" runat="server">
    <div class="header">
        <h1 class="page-title">Gestión de Itinirearios</h1>
    </div>
    <ul class="breadcrumb">
        <li><a href="#">Administración</a> <span class="divider">/</span></li>
        <li class="active">Gestión de Itinirearios</li>
    </ul>
    <div class="row-fluid">
        <form id="Form1" runat="server">
            <div class="block">
                <a href="#widget2container" class="block-heading" data-toggle="collapse">Collapsible </a>
                <div id="widget2container" class="block-body collapse in">
                    <div class="box-content">
                        <div id="page-stats" class="block-body">
                            <div class="stat-widget-container">
                                <div class="control-group">
                                    <span>Origen: </span>
                                    <asp:ListBox ID="idOrigen" Rows="1" runat="server"></asp:ListBox>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="box-content">
                        <table id="example" class="table">
                            <thead>
                                <tr>
                                    <th>Origen</th>
                                    <th>Destino</th>
                                    <th>H Salida</th>
                                    <th>Horas</th>
                                    <th></th>
                                </tr>
                            </thead>
                        </table>
                    </div>
                </div>
            </div>
        </form>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="javascript" runat="server">
    <script src="assets/lib/gestionItinerario.js"></script>
</asp:Content>
