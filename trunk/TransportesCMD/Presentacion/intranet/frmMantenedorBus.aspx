﻿<%@ Page Title="" Language="C#" MasterPageFile="~/intranet/MDI.Master" AutoEventWireup="true" CodeBehind="frmMantenedorBus.aspx.cs" Inherits="Presentacion.intranet.frmMantenedorBus" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cuerpo" runat="server">
    <div class="span18">
        <div class="box">
            <div class="box-header">
                <i class="icon-list"></i>
                <h5>Listado Vehículo</h5>
                <button class="btn btn-box-right collapsed" data-toggle="collapse" data-target=".box-cliente">
                    <i class="icon-reorder"></i>
                </button>
            </div>
            <div class="box-content box-cliente">
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

    <div class="span18">
        <div class="box">
            <div class="box-header">
                <i class="icon-list"></i>
                <h5>Datos Vehículo</h5>
                <button class="btn btn-box-right collapsed" data-toggle="collapse" data-target=".box-cliente">
                    <i class="icon-reorder"></i>
                </button>
            </div>
            <div class="box-content box-cliente">
                <form runat="server">

                    <div class="control-group">
                        <label class="control-label" for="focusedInput">Modelo</label>
                        <div class="controls">
                            <input class="input-xlarge focused" id="txtmodel" type="text" value="" name="txtmodelo" runat="server" />
                            <br />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Campo necesario" ControlToValidate="txtmodel" Display="Dynamic" ValidationGroup="VALIDACION"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <asp:TextBox ID="txtId" runat="server" Visible="False"></asp:TextBox>
                    <div class="control-group ">
                        <label class="control-label">PLACA</label>
                        <div class="controls">
                            <input id="txtPlac" name="txtPlaca" class="span4" type="text" value="" runat="server" maxlength="7" />
                            <br />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Campo necesario" ControlToValidate="txtPlac" Display="Dynamic" ValidationGroup="VALIDACION"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="control-group ">
                        <label class="control-label">Numero de Asientos 1er piso</label>
                        <div class="controls">

                            <input id="txtprimer" name="txtprimero" class="span4" type="text" value="" runat="server" maxlength="2" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Campo necesario" ControlToValidate="txtprimer" Display="Dynamic" ValidationGroup="VALIDACION"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Ingrese solo números" ControlToValidate="txtprimer" Display="Dynamic" ValidationExpression="^[0-9]*"></asp:RegularExpressionValidator>
                        </div>
                    </div>
                    <div class="control-group ">
                        <label class="control-label">Numero de Asientos 2do piso</label>
                        <div class="controls">
                            <input id="txtsegund" name="txtsegundo" class="span4" type="text" value="" runat="server" maxlength="2" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Campo necesario" ControlToValidate="txtsegund" Display="Dynamic" ValidationGroup="VALIDACION"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="Ingrese solo números" ControlToValidate="txtsegund" Display="Dynamic"></asp:RegularExpressionValidator>
                        </div>
                    </div>
                    <div class="control-group">
                        <label for="challengeQuestion" class="control-label">Marca</label>
                        <div class="controls">
                            <input id="txtmarc" name="txtmarc" class="span4" type="text" value="" runat="server" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Campo necesario" ControlToValidate="txtmarc" Display="Dynamic" ValidationGroup="VALIDACION"></asp:RequiredFieldValidator>
                            <br />
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1"
                                runat="server" ErrorMessage="Solo letras."
                                ControlToValidate="txtmarc" ValidationExpression="^[a-zA-Z ]*$"
                                ValidationGroup="VALIDACION"></asp:RegularExpressionValidator>
                        </div>
                    </div>

                    <div class="control-group">
                        <label for="challengeQuestion" class="control-label">Servicio</label>
                        <div class="controls">
                            <select id="select_servici" name="select_servicio" class="input-large" runat="server">
                                <option value="1">Bus Cama</option>
                                <option value="2">Bus Cama Cold</option>
                                <option value="3">Vip</option>
                            </select>
                        </div>
                    </div>
                    <asp:Button ID="btnRegistrar" runat="server" OnClick="btnRegistrar_Click" Text="Registrar" ValidationGroup="VALIDACION" />
                    <br />
                    <br />
                    <asp:Label ID="lblMensajeGraba" runat="server" Text="Label" Visible="False"></asp:Label>
                </form>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="javascript" runat="server">
    <script src="assets/lib/vehiculo.js"></script>
</asp:Content>
