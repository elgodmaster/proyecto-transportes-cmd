<%@ Page Title="" Language="C#" MasterPageFile="~/intranet/MDI.Master" AutoEventWireup="true" CodeBehind="frmMantenedorBus.aspx.cs" Inherits="Presentacion.intranet.frmMantenedorBus" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="assets/css/css_roque.css" type="text/css" media="screen, projection" rel="stylesheet" />
   
      <link rel="stylesheet" href="pruebas/chosen.css"/>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cuerpo" runat="server">
    <form runat="server">
    Modelo:<br />
    <asp:TextBox ID="txtmodelo" runat="server"></asp:TextBox>
    <br />
    Placa:<br />
    <asp:TextBox ID="txtplaca" runat="server"></asp:TextBox>
    <br />
    Numeros Asientos 1er Piso:<br />
    <asp:TextBox ID="txt1piso" runat="server"></asp:TextBox>
    <br />
    Numeros Asientos 2do Piso:<br />
    <asp:TextBox ID="txt2piso" runat="server"></asp:TextBox>
<%--    <br />
    Marca:<br />
    <asp:TextBox ID="txtmarca" runat="server"></asp:TextBox>
    <br />
    Servicio especial:<br />
    <asp:TextBox ID="txtservespecial" runat="server"></asp:TextBox>--%>
    <br />
    <br />
    <br />
    <asp:Button ID="btnRegistrar" runat="server" OnClick="btnRegistrar_Click" Text="Registrar" />
        <br /><br />
        <asp:Label ID="lblMensajeGraba" runat="server" Text="Label" Visible="False"></asp:Label>
        </form>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="javascript" runat="server">
</asp:Content>
