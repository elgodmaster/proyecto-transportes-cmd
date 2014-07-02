<%@ Page Title="" Language="C#" MasterPageFile="~/intranet/MDI.Master" AutoEventWireup="true" CodeBehind="frmRuta.aspx.cs" Inherits="Presentacion.intranet.frmRuta" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="assets/lib/jquery/jquery.validate.min.js"></script>
    <link href="assets/css/screen.css" rel="stylesheet" />
    <script src="assets/lib/jquery.maskedinput.min.js"></script>
    <%--<script src="assets/lib/jquery/jquery-1.9.1.js"></script>--%>
    <script>
        $(document).ready(function () {
            $.mask.definitions['h'] = "[0-1]";
            $.mask.definitions['n'] = "[0-5]";
            $.mask.definitions['a'] = "[AaPp]";
            $("#cuerpo_" + "txtHorSalida").mask("h9:n9 a.m.");

            // validate signup form on keyup and submit
            $("#Form1").validate({
                rules: {
                    ctl00$cuerpo$txtHorasViaje: "required"
                },
                messages: {
                    ctl00$cuerpo$txtHorasViaje: "Please enter your firstname"
                }
            });

        });


    </script>
    <style type="text/css">

</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cuerpo" runat="server">
    <div class="header">
        <h1 class="page-title">Rutas</h1>
    </div>
   
    <ul class="breadcrumb">
        <li><a href="#">Administración</a> <span class="divider">/</span></li>
        <li class="active">Rutas</li>
    </ul>
    <div class="container-fluid">
        <div class="row-fluid">
            <div class="block span4">
                <a href="#widget2container" class="block-heading" data-toggle="collapse">Ruta </a>
                <div id="widget2container" class="block-body collapse in">
                    <form id="Form1" runat="server">
                        <div class="control-group">
                            <label class="control-label" for="focusedInput">Origen</label>                           
                            <asp:DropDownList ID="lstOrigen" runat="server"></asp:DropDownList>
                        </div>
                        <div class="control-group">
                            <label class="control-label" for="focusedInput">Origen</label>
                            <asp:DropDownList ID="lstDestino" runat="server"></asp:DropDownList>                            
                        </div>
                        <div class="control-group">
                            <label class="control-label" for="focusedInput">Hora Salida</label>
                            <div class="controls">
                                <input class="focused" id="txtHorSalida" type="text" value="" name="txtHorSalida" runat="server" />
                                <br />

                            </div>
                        </div>
                        <div class="control-group ">
                            <label class="control-label">Horas de viaje</label>
                            <div class="controls">
                                <input id="txtHorasViaje" name="txtHorasViaje" type="text" value="" runat="server" maxlength="3" />
                                <br />

                            </div>
                        </div>
                        <asp:Button ID="btnRegistrar" class="btn btn-primary" runat="server" Text="Registrar" OnClick="btnRegistrar_Click" />
                        <br />
                        <br />
                        <asp:Label ID="lblMensajeGraba" runat="server" Text="Label" Visible="False"></asp:Label>
                    </form>
                </div>
            </div>
        </div>
        <div class="block span8">
            <a href="#widget1container" class="block-heading" data-toggle="collapse">Listado Vehículo </a>
            <div id="widget1container" class="block-body collapse in">
                <div class="box-content">
                    <table id="tbSalidasCss" class="table">
                        <thead>
                            <tr>
                                <th>N°</th>
                                <th>Placa</th>
                                <th>Modelo</th>
                                <th>Marca</th>
                                <th>1er piso</th>
                                <th>2do piso</th>
                                <%--<th>Estado</th>--%>
                                <th>Servicio Especial</th>
                                <th>Acción</th>
                            </tr>
                        </thead>

                        <tbody id="tbBodyVehiculo">
                            <%-- Aqui Javascript JSON --%>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

    </div>    
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="javascript" runat="server">
    <div id="divScript" runat="server"></div>
</asp:Content>
