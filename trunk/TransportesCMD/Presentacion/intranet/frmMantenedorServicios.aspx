<%@ Page Title="" Language="C#" MasterPageFile="~/intranet/MDI.Master" AutoEventWireup="true" CodeBehind="frmMantenedorServicios.aspx.cs" Inherits="Presentacion.intranet.frmMantenedorServicios" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cuerpo" runat="server">


    <div class="span8">
        <div class="box">
            <div class="box-header">
                <i class="icon-list"></i>
                <h5>Servicios Especiales</h5>
                <button class="btn btn-box-right collapsed" data-toggle="collapse" data-target=".box-cliente">
                    <i class="icon-reorder"></i>
                </button>
            </div>
            <div class="box-content box-cliente">
                <div id="Div1">
                    <br />
                    <form id="Form1" runat="server">
                            <div class="control-group">
                                <label class="control-label" for="focusedInput">Nombre</label>
                                <div class="controls">
                                    <asp:TextBox ID="txtnombre" CssClass="input-xlarge focused" runat="server"></asp:TextBox>
                                    <br /><asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Solo letras" ControlToValidate="txtnombre" Display="Dynamic" ValidationExpression="^[a-zA-Z ]*$" ValidationGroup="VALIDACION"></asp:RegularExpressionValidator>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Campo necesario" ControlToValidate="txtnombre" Display="Dynamic" ValidationGroup="VALIDACION"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <asp:TextBox ID="txtId" runat="server" Visible="False"></asp:TextBox>
                            <div class="control-group ">
                                <label class="control-label">Caracterìsticas</label>
                                <div class="controls">
                                    <asp:TextBox ID="txtcaracteristicas" CssClass="input-xlarge focused" runat="server"></asp:TextBox>
                                    <br /><asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Campo necesario" ControlToValidate="txtcaracteristicas" Display="Dynamic" ValidationGroup="VALIDACION"></asp:RequiredFieldValidator>
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
        </div>
    </div>

    <div class="span8">
        <div class="box">
            <div class="box-header">
                <i class="icon-list"></i>
                <h5>Servicios Especiales</h5>
                <button class="btn btn-box-right collapsed" data-toggle="collapse" data-target=".box-cliente">
                    <i class="icon-reorder"></i>
                </button>
            </div>
            <div class="box-content box-cliente">
            </div>
        </div>
    </div>


    <div class="span18">
        <div class="span18">
            <h4>Listado General</h4>
        </div>
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


</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="javascript" runat="server">
    <script src="assets/lib/Servicio.js"></script>
</asp:Content>
