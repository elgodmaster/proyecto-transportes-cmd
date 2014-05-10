<%@ Page Title="TCMD - Venta de Pasaje" Language="C#" MasterPageFile="~/intranet/MDI.Master" AutoEventWireup="true" CodeBehind="frmVentaPasaje.aspx.cs" Inherits="Presentacion.frmVentaPasaje1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="assets/css/css_roque.css" type="text/css" media="screen, projection" rel="stylesheet" />
    <link rel="stylesheet" href="pruebas/chosen.css" />

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cuerpo" runat="server">
    <div class="row">
        <div class="span8">
            <div class="box pattern pattern-sandstone">                          
                <div class="box-header">
                    <i class="icon-list"></i>
                    <h5>Venta de Pasajes</h5>
                    <button class="btn btn-box-right" data-toggle="collapse" data-target=".box-list">
                        <i class="icon-reorder"></i>
                    </button>
                </div>
                <div class="box-content box-list collapse in">                    
                    <div class="box-content">
                        <div class="row-fluid">
                            <fieldset>
                                <legend></legend>
                                <div class="span8">
                                    <table>
                                        <thead>
                                            <tr>
                                                <td>Origen</td>
                                                <td>Origen</td>
                                            </tr>
                                        </thead>
                                        <tbody id="tbodyOrigenDestino">

                                        </tbody>
                                    </table>
                                </div>
                                <div class="span2">Origen:</div>
                                <div class="control-group">
                                    <select id="salidaOrigen" data-placeholder="Seleccione Origen" class="span5" tabindex="2">
                                        <%-- Aqui Javascript JSON --%>
                                    </select>
                                    
                                </div>
                                <div class="span2">Destino:</div>
                                <div class="control-group">
                                    <select class="span5" id="salidaDestino">
                                        <%-- Aqui Javascript JSON --%>
                                    </select>
                                </div>
                                <div class="span2">Fecha/Hora:</div>
                                <div class="control-group">
                                    <select class="span2" id="itinerarioFecha" multiple="multiple" size="7">
                                        <%-- Aqui Javascript JSON --%>
                                    </select>
                                    <select class="span3" id="itinerarioHora" multiple="multiple" size="7">
                                        <%-- Aqui Javascript JSON --%>
                                    </select>
                                    <textarea id="lista"></textarea>   
                                </div>
                            </fieldset>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="span8">
            <div class="box pattern pattern-sandstone">
                <div class="box-header">
                    <i class="icon-list"></i>
                    <h5>Venta de Pasajes</h5>
                    <button class="btn btn-box-right" data-toggle="collapse" data-target=".box-list">
                        <i class="icon-reorder"></i>
                    </button>
                </div>
                <div class="box-content box-list collapse in">
                    <div class="box-content">

                        <div class="row-fluid">
                            <fieldset>
                                <legend></legend>
                                <div class="span3">Documento de Identidad:</div>
                                <div class="control-group">
                                    <select class="span4" id="Select1">
                                        <option>DNI</option>
                                        <option>PASAPORTE</option>
                                        <option>LIBRETA MILITAR</option>
                                    </select>
                                </div>
                                <div class="span3">Número</div>
                                <div class="control-group">
                                    <input class="span4" name="" value="" />
                                </div>


                                <div class="span3">Nombres:</div>
                                <div class="control-group">
                                    <input class="span4" name="" />
                                </div>
                                <div class="span3">Apellidos:</div>
                                <div class="control-group">
                                    <input class="span4" name="" />
                                </div>
                                <div class="span3">Edad:</div>
                                <div class="control-group">
                                    <input class="span4" name="" />
                                </div>
                            </fieldset>

                        </div>
                    </div>
                    <div class="box-footer ">
                        <button type="submit" class="btn btn-primary">
                            <i class="icon-ok"></i>
                            Aceptar
                        </button>
                        <button type="submit" class="btn" name="action" value="CANCEL">Cancel</button>
                    </div>
                </div>
            </div>
        </div>
        <div class="span8">
            <div class="box">
                <div class="box-header">
                    <i class="icon-book"></i>
                    <h5>Selección de Asientos - Ida</h5>
                </div>
                <div class="box-content">
                    <div id="intinerario-ida">
                        <div class="mr-fila">
                            <div class="mr-asiento"><a class="mr-asiento-d" data-toggle="modal" href="#chat_modal" onclick="fn">1</a></div>
                            <div class="mr-asiento"><a class="mr-asiento-d" data-toggle="modal" href="#chat_modal" onclick="fn">2</a></div>
                            <div class="mr-asiento"></div>
                            <div class="mr-asiento"><a class="mr-asiento-d" data-toggle="modal" href="#chat_modal" onclick="fn">3</a></div>
                            <div class="mr-asiento"><a class="mr-asiento-d" data-toggle="modal" href="#chat_modal" onclick="fn">4</a></div>

                        </div>
                        <div class="mr-fila">
                            <div class="mr-asiento"><a class="mr-asiento-d" data-toggle="modal" href="#chat_modal" onclick="fn">5</a></div>
                            <div class="mr-asiento"><a class="mr-asiento-d" data-toggle="modal" href="#chat_modal" onclick="fn">6</a></div>
                            <div class="mr-asiento"></div>
                            <div class="mr-asiento"><a class="mr-asiento-d" data-toggle="modal" href="#chat_modal" onclick="fn">7</a></div>
                            <div class="mr-asiento"><a class="mr-asiento-d" data-toggle="modal" href="#chat_modal" onclick="fn">8</a></div>
                        </div>
                        <div class="mr-fila">
                            <div class="mr-asiento"><a class="mr-asiento-d" data-toggle="modal" href="#chat_modal" onclick="fn">5</a></div>
                            <div class="mr-asiento"><a class="mr-asiento-r" data-toggle="modal" href="#chat_modal" onclick="fn">6</a></div>
                            <div class="mr-asiento"></div>
                            <div class="mr-asiento"></div>
                            <div class="mr-asiento"></div>
                        </div>
                        <div class="mr-fila">
                            <div class="mr-asiento"><a class="mr-asiento-o" data-toggle="modal" href="#chat_modal" onclick="fn">5</a></div>
                            <div class="mr-asiento"><a class="mr-asiento-o" data-toggle="modal" href="#chat_modal" onclick="fn">6</a></div>
                            <div class="mr-asiento"></div>
                            <div class="mr-asiento"></div>
                            <div class="mr-asiento"></div>
                        </div>
                        <div class="mr-fila">
                            <div class="mr-asiento"><a class="mr-asiento-d" data-toggle="modal" href="#chat_modal" onclick="fn">1</a></div>
                            <div class="mr-asiento"><a class="mr-asiento-d" data-toggle="modal" href="#chat_modal" onclick="fn">2</a></div>
                            <div class="mr-asiento"></div>
                            <div class="mr-asiento"><a class="mr-asiento-d" data-toggle="modal" href="#chat_modal" onclick="fn">3</a></div>
                            <div class="mr-asiento"><a class="mr-asiento-d" data-toggle="modal" href="#chat_modal" onclick="fn">4</a></div>

                        </div>
                        <div class="mr-fila">
                            <div class="mr-asiento"><a class="mr-asiento-d" data-toggle="modal" href="#chat_modal" onclick="fn">1</a></div>
                            <div class="mr-asiento"><a class="mr-asiento-d" data-toggle="modal" href="#chat_modal" onclick="fn">2</a></div>
                            <div class="mr-asiento"></div>
                            <div class="mr-asiento"><a class="mr-asiento-d" data-toggle="modal" href="#chat_modal" onclick="fn">3</a></div>
                            <div class="mr-asiento"><a class="mr-asiento-d" data-toggle="modal" href="#chat_modal" onclick="fn">4</a></div>

                        </div>
                        <div class="mr-fila">
                            <div class="mr-asiento"><a class="mr-asiento-d" data-toggle="modal" href="#chat_modal" onclick="fn">1</a></div>
                            <div class="mr-asiento"><a class="mr-asiento-d" data-toggle="modal" href="#chat_modal" onclick="fn">2</a></div>
                            <div class="mr-asiento"></div>
                            <div class="mr-asiento"><a class="mr-asiento-d" data-toggle="modal" href="#chat_modal" onclick="fn">3</a></div>
                            <div class="mr-asiento"><a class="mr-asiento-d" data-toggle="modal" href="#chat_modal" onclick="fn">4</a></div>

                        </div>
                        <div class="mr-fila">
                            <div class="mr-asiento"><a class="mr-asiento-d" data-toggle="modal" href="#chat_modal" onclick="fn">1</a></div>
                            <div class="mr-asiento"><a class="mr-asiento-d" data-toggle="modal" href="#chat_modal" onclick="fn">2</a></div>
                            <div class="mr-asiento"></div>
                            <div class="mr-asiento"><a class="mr-asiento-d" data-toggle="modal" href="#chat_modal" onclick="fn">3</a></div>
                            <div class="mr-asiento"><a class="mr-asiento-d" data-toggle="modal" href="#chat_modal" onclick="fn">4</a></div>

                        </div>
                        <div class="mr-fila">
                            <div class="mr-asiento"><a class="mr-asiento-d" data-toggle="modal" href="#chat_modal" onclick="fn">1</a></div>
                            <div class="mr-asiento"><a class="mr-asiento-d" data-toggle="modal" href="#chat_modal" onclick="fn">2</a></div>
                            <div class="mr-asiento"></div>
                            <div class="mr-asiento"><a class="mr-asiento-d" data-toggle="modal" href="#chat_modal" onclick="fn">3</a></div>
                            <div class="mr-asiento"><a class="mr-asiento-d" data-toggle="modal" href="#chat_modal" onclick="fn">4</a></div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
       <!-- <div class="span8">
            <div class="box">
                <div class="box-header">
                    <i class="icon-book"></i>
                    <h5>Selección de Asientos - Vuelta</h5>
                </div>
                <div class="box-content">
                    <div id="intinerario-vuelta">
                        <div class="mr-fila">
                            <div class="mr-asiento"><a class="mr-asiento-o" data-toggle="modal" href="#chat_modal" onclick="fn">1</a></div>
                            <div class="mr-asiento"><a class="mr-asiento-o" data-toggle="modal" href="#chat_modal" onclick="fn">2</a></div>
                            <div class="mr-asiento"></div>
                            <div class="mr-asiento"><a class="mr-asiento-o" data-toggle="modal" href="#chat_modal" onclick="fn">3</a></div>
                            <div class="mr-asiento"><a class="mr-asiento-o" data-toggle="modal" href="#chat_modal" onclick="fn">4</a></div>

                        </div>
                        <div class="mr-fila">
                            <div class="mr-asiento"><a class="mr-asiento-o" data-toggle="modal" href="#chat_modal" onclick="fn">5</a></div>
                            <div class="mr-asiento"><a class="mr-asiento-o" data-toggle="modal" href="#chat_modal" onclick="fn">6</a></div>
                            <div class="mr-asiento"></div>
                            <div class="mr-asiento"><a class="mr-asiento-o" data-toggle="modal" href="#chat_modal" onclick="fn">7</a></div>
                            <div class="mr-asiento"><a class="mr-asiento-o" data-toggle="modal" href="#chat_modal" onclick="fn">8</a></div>
                        </div>
                        <div class="mr-fila">
                            <div class="mr-asiento"><a class="mr-asiento-o" data-toggle="modal" href="#chat_modal" onclick="fn">5</a></div>
                            <div class="mr-asiento"><a class="mr-asiento-o" data-toggle="modal" href="#chat_modal" onclick="fn">6</a></div>
                            <div class="mr-asiento"></div>
                            <div class="mr-asiento"></div>
                            <div class="mr-asiento"></div>
                        </div>
                        <div class="mr-fila">
                            <div class="mr-asiento"><a class="mr-asiento-o" data-toggle="modal" href="#chat_modal" onclick="fn">5</a></div>
                            <div class="mr-asiento"><a class="mr-asiento-o" data-toggle="modal" href="#chat_modal" onclick="fn">6</a></div>
                            <div class="mr-asiento"></div>
                            <div class="mr-asiento"></div>
                            <div class="mr-asiento"></div>
                        </div>
                        <div class="mr-fila">
                            <div class="mr-asiento"><a class="mr-asiento-o" data-toggle="modal" href="#chat_modal" onclick="fn">1</a></div>
                            <div class="mr-asiento"><a class="mr-asiento-o" data-toggle="modal" href="#chat_modal" onclick="fn">2</a></div>
                            <div class="mr-asiento"></div>
                            <div class="mr-asiento"><a class="mr-asiento-o" data-toggle="modal" href="#chat_modal" onclick="fn">3</a></div>
                            <div class="mr-asiento"><a class="mr-asiento-o" data-toggle="modal" href="#chat_modal" onclick="fn">4</a></div>

                        </div>
                        <div class="mr-fila">
                            <div class="mr-asiento"><a class="mr-asiento-o" data-toggle="modal" href="#chat_modal" onclick="fn">1</a></div>
                            <div class="mr-asiento"><a class="mr-asiento-o" data-toggle="modal" href="#chat_modal" onclick="fn">2</a></div>
                            <div class="mr-asiento"></div>
                            <div class="mr-asiento"><a class="mr-asiento-o" data-toggle="modal" href="#chat_modal" onclick="fn">3</a></div>
                            <div class="mr-asiento"><a class="mr-asiento-o" data-toggle="modal" href="#chat_modal" onclick="fn">4</a></div>

                        </div>
                        <div class="mr-fila">
                            <div class="mr-asiento"><a class="mr-asiento-o" data-toggle="modal" href="#chat_modal" onclick="fn">1</a></div>
                            <div class="mr-asiento"><a class="mr-asiento-o" data-toggle="modal" href="#chat_modal" onclick="fn">2</a></div>
                            <div class="mr-asiento"></div>
                            <div class="mr-asiento"><a class="mr-asiento-o" data-toggle="modal" href="#chat_modal" onclick="fn">3</a></div>
                            <div class="mr-asiento"><a class="mr-asiento-o" data-toggle="modal" href="#chat_modal" onclick="fn">4</a></div>

                        </div>
                        <div class="mr-fila">
                            <div class="mr-asiento"><a class="mr-asiento-o" data-toggle="modal" href="#chat_modal" onclick="fn">1</a></div>
                            <div class="mr-asiento"><a class="mr-asiento-o" data-toggle="modal" href="#chat_modal" onclick="fn">2</a></div>
                            <div class="mr-asiento"></div>
                            <div class="mr-asiento"><a class="mr-asiento-o" data-toggle="modal" href="#chat_modal" onclick="fn">3</a></div>
                            <div class="mr-asiento"><a class="mr-asiento-o" data-toggle="modal" href="#chat_modal" onclick="fn">4</a></div>

                        </div>
                        <div class="mr-fila">
                            <div class="mr-asiento"><a class="mr-asiento-o" data-toggle="modal" href="#chat_modal" onclick="fn">1</a></div>
                            <div class="mr-asiento"><a class="mr-asiento-o" data-toggle="modal" href="#chat_modal" onclick="fn">2</a></div>
                            <div class="mr-asiento"></div>
                            <div class="mr-asiento"><a class="mr-asiento-d" data-toggle="modal" href="#chat_modal" onclick="fn">3</a></div>
                            <div class="mr-asiento"><a class="mr-asiento-r" data-toggle="modal" href="#chat_modal" onclick="fn">4</a></div>

                        </div>
                    </div>
                </div>
            </div>
        </div>-->
    </div>
    <script src="assets/js/fnVentaPasaje.js"></script>
    <script type="text/javascript">

        $(document).ready(function () {
            var salOrigen = $("#salidaOrigen");
            spIntinerarioOrigenXNombre(salOrigen);
        });

        $("#salidaOrigen").change(function () {
            $("#salidaDestino").find("option").remove();
            $("#itinerarioFecha").find("option").remove();
            $("#itinerarioHora").find("option").remove();
            var salDestino = $("#salidaDestino");
            var prmIdOrigen = $('#salidaOrigen').val();
            spIntinerarioDestinoXIdOrigen(salDestino, prmIdOrigen);

        });

        $("#salidaDestino").change(function () {
            $("#itinerarioFecha").find("option").remove();
            $("#itinerarioHora").find("option").remove();

            var salFecha = $("#itinerarioFecha");
            var prmIdOrigen = $('#salidaOrigen').val();
            var prmIdDestino = $('#salidaDestino').val();
            spIntinerarioFechaSalidaXIdOrigenIdDestino(salFecha, prmIdOrigen, prmIdDestino);
        });

        $("#itinerarioFecha").change(function () {
            $("#itinerarioHora").find("option").remove();

            var salHora = $("#itinerarioHora");
            var prmIdOrigen = $('#salidaOrigen').val();
            var prmIdDestino = $('#salidaDestino').val();
            var prmFecha = $('#itinerarioFecha').val();
            spIntinerarioHoraSalidaXIdOrigenIdDestinoFecha(salHora, prmIdOrigen, prmIdDestino, prmFecha);
        });
        $("#itinerarioHora").change(function () {
            var prmIdOrigen = $('#itinerarioHora').val();
            alert("Ha seleccionado "+prmIdOrigen);
        });

    </script>
    <script src="pruebas/chosen.jquery.js" type="text/javascript"></script>
    <script src="pruebas/prism.js" type="text/javascript" charset="utf-8"></script>
    <script type="text/javascript">
        var config = {
            '.chosen-select': {},
            '.chosen-select-deselect': { allow_single_deselect: true },
            '.chosen-select-no-single': { disable_search_threshold: 10 },
            '.chosen-select-no-results': { no_results_text: 'No existe salida con esa descripción' },
            '.chosen-select-width': { width: "70%" }
        }
        for (var selector in config) {
            $(selector).chosen(config[selector]);
        }

    </script>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="javascript" runat="server">
</asp:Content>
