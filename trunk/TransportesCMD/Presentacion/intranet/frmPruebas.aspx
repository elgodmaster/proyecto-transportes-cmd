<%@ Page Title="" Language="C#" MasterPageFile="~/intranet/MDI.Master" AutoEventWireup="true" CodeBehind="frmPruebas.aspx.cs" Inherits="Presentacion.intranet.frmPruebas" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="pruebas/style.css" />
    <link rel="stylesheet" href="pruebas/prism.css" />
    <link rel="stylesheet" href="pruebas/chosen.css" />
    <style type="text/css" media="all">
        .chosen-rtl .chosen-drop {
            left: -9000px;
        }
    </style>
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cuerpo" runat="server">
    <div>
        <div class="control-group">
            <select id="salidaOringen" data-placeholder="Seleccione Origen" class="span5  chosen-select" tabindex="2">
            </select>
        </div>

    </div>
    <div id="container">
        <div id="content">
            <div>
                <select data-placeholder="Choose a Country..." class="chosen-select" style="width: 350px;" tabindex="2">
                    <option value=""></option>
                    <option value="United States">United States</option>
                    <option value="United Kingdom">United Kingdom</option>
                    <option value="Western Sahara">Western Sahara</option>
                    <option value="Yemen">Yemen</option>
                    <option value="Zambia">Zambia</option>
                    <option value="Zimbabwe">Zimbabwe</option>
                </select>
            </div>
        </div>
    </div>
     
    <script src="pruebas/chosen.jquery.js" type="text/javascript"></script>
    
    <script src="pruebas/prism.js" type="text/javascript" charset="utf-8"></script>
   
  


    <script type="text/javascript">
        var config = {
            '.chosen-select': {},
            '.chosen-select-deselect': { allow_single_deselect: true },
            '.chosen-select-no-single': { disable_search_threshold: 10 },
            '.chosen-select-no-results': { default_no_result_text: 'no hay!' },
            '.chosen-select-width': { width: "95%" }
        }
        for (var selector in config) {            
            $(selector).chosen(config[selector]);
        }        
    </script>
         
    
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="javascript" runat="server">
</asp:Content>
