<%@ Page Title="" Language="C#" MasterPageFile="~/intranet/MDI.Master" AutoEventWireup="true" CodeBehind="frmMantenedorBus.aspx.cs" Inherits="Presentacion.intranet.frmMantenedorBus" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="assets/css/css_roque.css" type="text/css" media="screen, projection" rel="stylesheet" />
   
      <link rel="stylesheet" href="pruebas/chosen.css"/>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cuerpo" runat="server">
    <form runat="server">
   <fieldset>
      <div class="control-group">
    <label class="control-label" for="focusedInput">Modelo</label>
    <div class="controls">
    <input class="input-xlarge focused" id="txtmodel" type="text" value="" name="txtmodelo" runat="server"/>
    </div>
</div>
    <div class="control-group ">
        <label class="control-label">PLACA</label>
        <div class="controls">
            <input id="txtPlac" name="txtPlaca" class="span4" type="text" value="" autocomplete="false" runat="server"/>
        </div>
    </div>
    <div class="control-group ">
        <label class="control-label">Numero de Asientos 1er piso</label>
        <div class="controls">
            <input id="txtprimer" name="txtprimero" class="span4" type="text" value="" autocomplete="false" runat="server"/>

        </div>
    </div>
    <div class="control-group ">
        <label class="control-label">Numero de Asientos 2do piso</label>
        <div class="controls">
            <input id="txtsegund" name="txtsegundo" class="span4" type="text" value="" autocomplete="false" runat="server"/>

        </div>
    </div>
    <div class="control-group">
        <label for="challengeQuestion" class="control-label">Marca</label>
    <div class="controls">                       
    <input id="txtmarc" name="txtmarc" class="span4" type="text" value="" autocomplete="false" runat="server"/>
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
    <asp:Button ID="btnRegistrar" runat="server" OnClick="btnRegistrar_Click" Text="Registrar" />
        <br /><br />
        <asp:Label ID="lblMensajeGraba" runat="server" Text="Label" Visible="False"></asp:Label>
    </fieldset>
    </form>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="javascript" runat="server">
</asp:Content>
