<%@ Page Title="" Language="C#" MasterPageFile="~/intranet/MDI.Master" AutoEventWireup="true" CodeBehind="frmMantenedorServicios.aspx.cs" Inherits="Presentacion.intranet.frmMantenedorServicios" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="assets/css/css_roque.css" type="text/css" media="screen, projection" rel="stylesheet" />
   
      <link rel="stylesheet" href="pruebas/chosen.css"/>
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
   <fieldset>
      <div class="control-group">
    <label class="control-label" for="focusedInput">Nombre</label>
    <div class="controls">
    <input class="input-xlarge focused" id="txtnom" type="text" value="" name="txtnombre" runat="server"/>
    </div>
</div>
       <asp:TextBox ID="txtId"  runat="server" Visible="False"></asp:TextBox>
    <div class="control-group ">
        <label class="control-label">Caracterìsticas</label>
        <div class="controls">
            <input id="txtcarac" name="txtcaracteristicas" class="span4" type="text" value="" autocomplete="false" runat="server"/>
        </div>
    </div>
    

    <asp:Button ID="btnRegistrar" runat="server" Text="Registrar" OnClick="btnRegistrar_Click" />
        
        <asp:Label ID="lblMensajeGraba" runat="server" Text="Label" Visible="False"></asp:Label>
    </fieldset>
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
    <script src="assets/js/Servicio.js"></script>
</asp:Content>
