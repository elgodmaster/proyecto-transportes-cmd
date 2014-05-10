<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="Presentacion.index" %>

<!DOCTYPE html>

<html>
<head runat="server">
<title></title>
<meta charset="utf-8">
<link rel="stylesheet" href="assets/css/reset.css" type="text/css" media="all">
<link rel="stylesheet" href="assets/css/layout.css" type="text/css" media="all">
<link rel="stylesheet" href="assets/css/style.css" type="text/css" media="all">
<script type="text/javascript" src="assets/js/jquery-1.4.2.js" ></script>
<script type="text/javascript" src="assets/js/cufon-yui.js"></script>
<script type="text/javascript" src="assets/js/cufon-replace.js"></script> 
<script type="text/javascript" src="assets/js/Myriad_Pro_italic_600.font.js"></script>
<script type="text/javascript" src="assets/js/Myriad_Pro_italic_400.font.js"></script>
<script type="text/javascript" src="assets/js/Myriad_Pro_400.font.js"></script>
</head>
<body>
    <div class="body1">
	<div class="main">
<!-- header -->
		<header>
			<div class="wrapper">
				<h1>
					<a href="index.aspx" id="logo">lANDlINES</a><span id="slogan">Transportes CMD</span>
				</h1>
				<div class="right">
					<nav>
						<ul id="top_nav">
							<li><a href="index.aspx"><img src="assets/images/img1.gif" alt=""></a></li>
							
							<li class="bg_none"><a href="intranet/index.aspx"><img src="assets/images/img3.gif" alt=""></a></li>
						</ul>
					</nav>
					<nav>
						<ul id="menu">
							<li id="menu_active"><a href="index.aspx">Inicio</a></li>
							<li><a href="intranet/index.aspx">Intranet</a></li>							
							<li><a href="index-4.html">Contactanos</a></li>
						</ul>
					</nav>
				</div>
			</div>
		</header>
	</div>
</div><div class="ic"></div>
<div class="main">
	<div id="banner">
		<div class="text1">
			COMFORT<span>Garantizado</span><p>Por el mes de Mama le ofrecemos la mejor Promocion y esta al alcanse del bolsillo revise nuestras promociones con solo un click!</p>
		</div>
		<a href="#" class="button_top">Ir a la Promocion</a>
	</div>
</div>
<div class="main">
	<section id="content">
		<article class="col1">
			<div class="pad_1">
				<h2>Hacer una Reserva</h2>
				<form id="form_1" action="" method="post">
					<div class="wrapper pad_bot1">
						<div class="radio marg_right1">
							<input type="radio" name="name1"><asp:Label ID="Label1" runat="server" Text="Ida y Retorno"></asp:Label>						
						</div>
						<div class="radio">
							<input type="radio" name="name1">Solo Ida							
						</div>
					</div>
					<div class="wrapper">
						Origen:
						<div class="bg"><input type="text" class="input input1" value="Agregar Ciudad de Origen" onblur="if(this.value=='') this.value='Enter City or Airport Code'" onFocus="if(this.value =='Enter City or Airport Code' ) this.value=''"></div>
					</div>
					<div class="wrapper">
						Destino:
						<div class="bg"><input type="text" class="input input1" value="Agregar Ciudad de Destino" onblur="if(this.value=='') this.value='Enter City or Airport Code'" onFocus="if(this.value =='Enter City or Airport Code' ) this.value=''"></div>
					</div>
					<div class="wrapper">
						Fecha y Hora de Salida:
						<div class="wrapper">
							<div class="bg left"><input type="text" class="input input2" value="mm/dd/aaaa " onblur="if(this.value=='') this.value='mm/dd/yyyy '" onFocus="if(this.value =='mm/dd/yyyy ' ) this.value=''"></div>
							<div class="bg right"><input type="text" class="input input2" value="12:00am" onblur="if(this.value=='') this.value='12:00am'" onFocus="if(this.value =='12:00am' ) this.value=''"></div>
						</div>
					</div>
					<div class="wrapper">
						Fecha y Hora de Retorno:
						<div class="wrapper">
							<div class="bg left"><input type="text" class="input input2" value="mm/dd/aaaa " onblur="if(this.value=='') this.value='mm/dd/yyyy '" onFocus="if(this.value =='mm/dd/yyyy ' ) this.value=''"></div>
							<div class="bg right"><input type="text" class="input input2" value="12:00am" onblur="if(this.value=='') this.value='12:00am'" onFocus="if(this.value =='12:00am' ) this.value=''"></div>
						</div>
					</div>
					<div class="wrapper">
						
						<a href="#" class="button2" onClick="document.getElementById('form_1').submit()">Buscar!</a>
					</div>
				</form>
				
			</div>
		</article>		
	</section>
</div>
<div class="body2">
	<div class="main">
		<footer>
			<a rel="nofollow" href="http://www.templatemonster.com/" target="_blank"></a> Transporte CMD    -   CEI VI Ciclo - 201401<br>
			<a href="http://www.templates.com/product/3d-models/" target="_blank"></a> Intituto Teconológico del Norte
		</footer>
	</div>
</div>
<script type="text/javascript"> Cufon.now(); </script>
</body>
</html>