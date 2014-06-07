<%@ Page Title="" Language="C#" MasterPageFile="~/intranet/MDI.Master" AutoEventWireup="true" CodeBehind="frmMantenedorServicios.aspx.cs" Inherits="Presentacion.intranet.frmMantenedorServicios" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cuerpo" runat="server">
    <div class="header">
        <h1 class="page-title">SERVICIOS ESPECIALES</h1>
    </div>
    <ul class="breadcrumb">
        <li><a href="frmPrincipal.aspx">Pasajes</a> <span class="divider">/</span></li>
        <li class="active">Servicios Especiales</li>
    </ul>
    <div class="container-fluid">
    <div class="row-fluid">
        <div class="block span4">
            <a href="#widget2container" class="block-heading" data-toggle="collapse">Datos Servicio </a>
            <div id="widget2container" class="block-body collapse in">
                    <form id="Form1" runat="server">
                            <div class="control-group">
                                <label class="control-label" for="focusedInput">Nombre</label>
                                <div class="controls">
                                    <asp:TextBox ID="txtnombre" CssClass="input-xlarge focused" runat="server"></asp:TextBox>
                                    <br /><asp:RegularExpressionValidator CssClass="validaciones" ID="RegularExpressionValidator1" runat="server" ErrorMessage="Solo letras" ControlToValidate="txtnombre" Display="Dynamic" ValidationExpression="^[a-zA-Z ]*$" ValidationGroup="VALIDACION"></asp:RegularExpressionValidator>
                                    <asp:RequiredFieldValidator CssClass="validaciones" ID="RequiredFieldValidator1" runat="server" ErrorMessage="Campo necesario" ControlToValidate="txtnombre" Display="Dynamic" ValidationGroup="VALIDACION"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <asp:TextBox ID="txtId" runat="server" Visible="False"></asp:TextBox>
                            <div class="control-group ">
                                <label class="control-label">Caracterìsticas</label>
                                <div class="controls">
                                    <asp:TextBox ID="txtcaracteristicas" CssClass="input-xlarge focused" runat="server"></asp:TextBox>
                                    <br /><asp:RequiredFieldValidator ID="RequiredFieldValidator2" CssClass="validaciones" runat="server" ErrorMessage="Campo necesario" ControlToValidate="txtcaracteristicas" Display="Dynamic" ValidationGroup="VALIDACION"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                         <div class="control-group ">
                                <label class="control-label">Estado</label>
                                <div class="controls">
                                    <asp:RadioButtonList ID="RadioButtonList1" runat="server"></asp:RadioButtonList>
                                </div>
                            </div>
                            <asp:Button ID="btnRegistrar" runat="server" Text="Registrar" OnClick="btnRegistrar_Click" ValidationGroup="VALIDACION" />                 
                    </form>
                </div>
            </div>
                <div class="block span8">
                    <a href="#widget1container" class="block-heading" data-toggle="collapse">Listado Servicio </a>
                    <div id="widget1container" class="block-body collapse in">
                    <div class="box-content">
                        <table id="tbSalidasCss" class="table">
                            <thead>
                                <tr>
                                    <th>N°</th>
                                    <th>Nombre</th>
                                    <th>Caracteristicas</th>

                                    <th>Acción</th>
                                </tr>
                            </thead>
                            <tbody id="tbBodyServicio">
                                <%-- Aqui Javascript JSON --%>
                            </tbody>
                        </table>
                    </div>
                    </div>
                </div>
        </div>
    </div>

        


</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="javascript" runat="server">
    <script src="assets/lib/Servicio.js"></script>
</asp:Content>
