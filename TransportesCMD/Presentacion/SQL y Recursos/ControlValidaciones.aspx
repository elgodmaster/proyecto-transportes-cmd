<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ControlValidaciones.aspx.cs" Inherits="Presentacion.SQL_y_Recursos.ControlValidaciones" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <%--VALIDACION BASICA--%>
    <table>
        <tr>
            <%--RECONOCE EL TIPO DE CARACTERES QUE DESEES USAR 
            ESTE EJEMPLO ES PARA FORMATOS nombre@dominio.xyz.--%>
            <%--TAMBIEN SE PUEDE USAR PARA LETRAS Y NUMEROS PERO TIENEN
            QUE PERSONALIZARLO--%>
            <th><asp:TextBox ID="textEmail" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="textEmail" Display="Dynamic" ErrorMessage="Se requiere la dirección de correo electrónico." ValidationGroup="AllValidators">*</asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="textEmail" Display="Dynamic" ErrorMessage="Las direcciones de correo electrónico deben estar en el formato nombre@dominio.xyz." ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="AllValidators">Formato no válido.</asp:RegularExpressionValidator>
            </th>
        </tr>
        <tr>
            <th><asp:TextBox ID="textNumberInParty" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="textNumberInParty" Display="Dynamic" ErrorMessage="Indique cuántas personas hay en la fiesta."></asp:RequiredFieldValidator>
                <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="textNumberInParty" Display="Dynamic" ErrorMessage="Escriba un número entre 1 y 20 para indicar el número de las personas en la fiesta." MaximumValue="20" MinimumValue="1" Type="Integer" ValidationGroup="AllValidators">Escriba un número entre 1 y 20.</asp:RangeValidator>
            </th>
        </tr>
        <tr>
            <th><asp:TextBox ID="textPreferredDate" runat="server"></asp:TextBox></th>
        </tr>
        <tr>
            <th><asp:Button ID="buttonSubmit" runat="server" OnClick="buttonSubmit_Click" Text="Enviar solicitud" ValidationGroup="AllValidators" /></th>
        </tr>
        <tr>
            <th><asp:Label ID="labelMessage" runat="server"></asp:Label></th>
        </tr>
    </table>

        <%--!!!!!!!!!!!!!!!!!ADVERTENCIAAA!!!!!!!!!!!!!!!!!!--%>

        <%--BUENO SOLO PARA AVISARLES QUE ESTOS EJEMPLOS LOS SAQUE DE ESTA RUTA:
        http://msdn.microsoft.com/es-es/library/a0z2h4sw(v=vs.100).aspx
        Y TAMBIEN PARA ADVERTIRLES QUE ME SUCEDIO UN ERROR Y CREO QUE ES UN ERROR 
        DE VISUAL 2012 O NO SABRIA DECIRLES PERO BUSCANDO EN INTERNET ENCONTRE 
        COMO SOLUCIONAR EL ERROR AQUI TAMBIEN LES DEJO LA RUTA SOLO TRADUSCAN
        A SPANISH PLEASE AQUI ESPLICAN EL ERROR QUE ME SALIA:
        http://howtodomssqlcsharpexcelaccess.blogspot.ca/2012/11/aspnet-how-to-fix-error-webforms.html--%>
    </div>
    </form>
</body>
</html>
