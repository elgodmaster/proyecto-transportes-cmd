<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="Presentacion.index" %>

<!DOCTYPE html>
<html>
<head id="Head1" runat="server">

    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title>Transportes CMD</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">    
    <meta name="layout" content="main"/>
    <script src="assets/js/jquery/jquery-1.8.2.min.js" type="text/javascript" ></script>
    <link href="assets/css/customize-template.css" type="text/css" media="screen, projection" rel="stylesheet" />

</head>
<body>
        <div class="navbar navbar-fixed-top">
            <div class="navbar-inner">
                <div class="container">
                    <button class="btn btn-navbar" data-toggle="collapse" data-target="#app-nav-top-bar">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a href="dashboard.html" class="brand"><i class="icon-leaf">Transportes CMD</i></a>                    
                </div>
            </div>
        </div>
        <div id="body-container">
        <div id="body-content"> 
            <div class='container'>                
                <div class="signin-row row">
                    <div class="span5"></div>
                    <div class="span6">
                        <div class="container-signin">
                            <h4>Autenticación de Usuario</h4>
                            <form method='POST' id='loginForm' runat="server" class='form-signin' autocomplete='off'>
                                <div class="form-inner">
                                    <div class="input-prepend">                                        
                                        <span class="add-on" title="Usuario" ><i class="icon-user"></i></span>
                                        <asp:TextBox ID="txtUser" class="span4" runat="server"></asp:TextBox>                                       
                                    </div>
                                    <div class="input-prepend">                                        
                                        <span class="add-on"><i class="icon-key"></i></span>
                                        <asp:TextBox ID="txtPass" class="span4" runat="server" type="password"></asp:TextBox> 
                                    </div>                                    
                                </div>
                                <footer class="signin-actions">
                                    <div class="span3">
                                        <asp:Label ID="lblMensaje" runat="server" Text=""></asp:Label>
                                    </div>
                                    <asp:Button ID="Ingresar"  class="btn btn-primary" runat="server" Text="Ingresar" OnClick="Ingresar_Click" />                                
                                </footer>
                            </form>
                        </div>
                    </div>
                    <div class="span4"></div>
                </div>            
            </div> 
            </div>
        </div>
        <footer class="application-footer">
            <div class="container">
                <p>Transportes CMD</p>
                <div class="disclaimer">
                    <p>INSTITUTO TECNOLÓGICO DEL NORTE</p>
                    <p>TODOS LOS DERECHOS RESERVADOS</p>
                </div>
            </div>
        </footer>
	</body>

</html>
