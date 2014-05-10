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
                    <div class="span4"></div>
                    <div class="span8">
                        <div class="container-signin">
                            <legend>Autenticación de Usuario</legend>
                            <form action='frmPrincipal.aspx' method='POST' id='loginForm' class='form-signin' autocomplete='off'>
                                <div class="form-inner">
                                    <div class="input-prepend">
                                        
                                        <span class="add-on" rel="tooltip" title="Username or E-Mail Address" data-placement="top"><i class="icon-envelope"></i></span>
                                        <input type='text' class='span4' id='username'/>
                                    </div>

                                    <div class="input-prepend">
                                        
                                        <span class="add-on"><i class="icon-key"></i></span>
                                        <input type='password' class='span4' id='password'/>
                                    </div>
                                    <label class="checkbox" for='remember_me'>Recordar
                                        <input type='checkbox' id='remember_me'
                                               />
                                    </label>
                                </div>
                                <footer class="signin-actions">
                                    <input class="btn btn-primary" type='submit' id="submit" value='Ingreso'/>
                                </footer>
                            </form>
                        </div>
                    </div>
                    <div class="span3"></div>
                </div>

                <div class="signin-row row">                    
                </div>
            
            </div>
    

            </div>
        </div>

        <div id="spinner" class="spinner" style="display:none;">
            Loading&hellip;
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
        <script type="text/javascript">
            $(function () {
                document.forms['loginForm'].elements['j_username'].focus();
                $('body').addClass('pattern pattern-sandstone');
                $("[rel=tooltip]").tooltip();
            });
        </script>
        <script src="assets/js/bootstrap/bootstrap-transition.js" type="text/javascript" ></script>
        <script src="assets/js/bootstrap/bootstrap-alert.js" type="text/javascript" ></script>
        <script src="assets/js/bootstrap/bootstrap-modal.js" type="text/javascript" ></script>
        <script src="assets/js/bootstrap/bootstrap-dropdown.js" type="text/javascript" ></script>
        <script src="assets/js/bootstrap/bootstrap-scrollspy.js" type="text/javascript" ></script>
        <script src="assets/js/bootstrap/bootstrap-tab.js" type="text/javascript" ></script>
        <script src="assets/js/bootstrap/bootstrap-tooltip.js" type="text/javascript" ></script>
        <script src="assets/js/bootstrap/bootstrap-popover.js" type="text/javascript" ></script>
        <script src="assets/js/bootstrap/bootstrap-button.js" type="text/javascript" ></script>
        <script src="assets/js/bootstrap/bootstrap-collapse.js" type="text/javascript" ></script>
        <script src="assets/js/bootstrap/bootstrap-carousel.js" type="text/javascript" ></script>
        <script src="assets/js/bootstrap/bootstrap-typeahead.js" type="text/javascript" ></script>
        <script src="assets/js/bootstrap/bootstrap-affix.js" type="text/javascript" ></script>
        <script src="assets/js/bootstrap/bootstrap-datepicker.js" type="text/javascript" ></script>
        <script src="assets/js/jquery/jquery-tablesorter.js" type="text/javascript" ></script>
        <script src="assets/js/jquery/jquery-chosen.js" type="text/javascript" ></script>
        <script src="assets/js/jquery/virtual-tour.js" type="text/javascript" ></script>
        

	</body>

</html>
