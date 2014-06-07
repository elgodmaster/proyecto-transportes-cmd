<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="Presentacion.index" %>

<!DOCTYPE html>
<html>
<head runat="server" lang="es">
    <title>TCMR - </title>
    <meta charset="utf-8" />
    <meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta name="description" content="" />
    <meta name="author" content="" />

    <link rel="stylesheet" type="text/css" href="assets/lib/bootstrap/css/bootstrap.css" />
    <link rel="stylesheet" type="text/css" href="assets/stylesheets/theme.css" />

    
    <!-- Le fav and touch icons -->
    <link rel="shortcut icon" href="../assets/ico/favicon.ico" />

    
    <!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->

</head>
<body>
    <div class="navbar">
        <div class="navbar-inner">
            <ul class="nav pull-right">
            </ul>
            <a class="brand" href="index.html"><span class="first">Transportes </span><span class="second">CMD</span>
            </a>
        </div>
    </div>

    <div class="row-fluid">
        <div class="dialog">
            <div class="block">
                <p class="block-heading">Ingreso Sistema de Transporte Nacional (SISTRAN)</p>
                <div class="block-body">
                    <div class="container-signin">
                        <form method='POST' id='loginForm' runat="server" class='form-signin' autocomplete='off'>
                           <%-- <label>Sucursal</label>
                            <asp:ListBox ID="lstSucursal" class="span12" runat="server" Rows="1"></asp:ListBox>--%>
                            <label>Usuario</label>
                            <asp:TextBox ID="txtUser" class="span12" runat="server"></asp:TextBox>
                            <label>Contraseña</label>
                            <asp:TextBox ID="txtPass" class="span12" runat="server" type="password"></asp:TextBox>
                           
                            <asp:Label ID="lblMensaje" runat="server" Text="" Font-Bold="True" ForeColor="Red"></asp:Label>
                            <asp:Button ID="Ingresar" class="btn btn-primary pull-right" runat="server" Text="Ingresar" OnClick="Ingresar_Click" />

                            <div class="clearfix"></div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>   
</body>

</html>
