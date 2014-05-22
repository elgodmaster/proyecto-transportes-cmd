$(document).ready(function () {
    $("#tbSalidas").hide();
    var salOrigen = $("#salidaOrigen");
    
    spIntinerarioOrigenXNombre(salOrigen);
    fnMostrarOcularComponenteByClass(0, 'divControlAsiento');
    fnMostrarOcularComponenteByClass(0, 'replicaBus');
    var selDocIdentidad = $("#selDocIdentidad");
    spDocumentoIdentidadLista(selDocIdentidad);
    
});

function validarTeclaPresionada(e,tecla) {
    var key = e.keyCode || e.which;
    if (key == tecla) { return true; } else { return false; }
}

//function callkeydownhandler(evnt) {
//    var ev = (evnt) ? evnt : event;
//    var code = (ev.which) ? ev.which : event.keyCode;
//    alert("El código de la tecla pulsada es: " + code);
//}
//if (window.document.addEventListener) {
//    window.document.addEventListener("keydown", callkeydownhandler, false);
//} else {
//    window.document.attachEvent("onkeydown", callkeydownhandler);
//}

function fnMostrarOcularComponenteByClass(accion, componente ) {
    var com = document.getElementById(componente);
    if (accion == 0) {
        com.style.display = 'none';
    } else {
        com.style.display = 'block';
    }
}



$("#salidaOrigen").change(function () {
    $("#salidaDestino").find("option").remove();
    $("#itinerarioFecha").find("option").remove();
    $("#itinerarioHora").find("option").remove();
    fnMostrarOcularComponenteByClass(0, 'tbSalidas');
    fnMostrarOcularComponenteByClass(0, 'divControlAsiento');
    fnMostrarOcularComponenteByClass(0, 'replicaBus');

    $("#tbBodyItinerario").find("tr").remove();

    var salDestino = $("#salidaDestino");
    var prmIdOrigen = $('#salidaOrigen').val();
    spIntinerarioDestinoXIdOrigen(salDestino, prmIdOrigen);

});
$("#salidaDestino").change(function () {
    $("#itinerarioFecha").find("option").remove();
    $("#itinerarioHora").find("option").remove();
    $("#tbBodyItinerario").find("tr").remove();
    fnMostrarOcularComponenteByClass(0, 'tbSalidas');
    fnMostrarOcularComponenteByClass(0, 'divControlAsiento');
    fnMostrarOcularComponenteByClass(0, 'replicaBus');

    var salFecha = $("#itinerarioFecha");
    var prmIdOrigen = $('#salidaOrigen').val();
    var prmIdDestino = $('#salidaDestino').val();
    spIntinerarioFechaSalidaXIdOrigenIdDestino(salFecha, prmIdOrigen, prmIdDestino);
});
$("#itinerarioFecha").change(function () {
    $("#itinerarioHora").find("option").remove();
    $("#tbBodyItinerario").find("tr").remove();
    fnMostrarOcularComponenteByClass(1, 'tbSalidas');
    fnMostrarOcularComponenteByClass(0, 'divControlAsiento');
    fnMostrarOcularComponenteByClass(0, 'replicaBus');

    //var salHora = $("#itinerarioHora");
    var etiqueta = $("#tbBodyItinerario");
    var prmIdOrigen = $('#salidaOrigen').val();
    var prmIdDestino = $('#salidaDestino').val();
    var prmFecha = $('#itinerarioFecha').val();
    spIntinerarioResumenXIdOrigenIdDestinoFecha(etiqueta, prmIdOrigen, prmIdDestino, prmFecha);
});

function spIntinerarioOrigenXNombre(salOrigen) {
    
    $.ajax({
        type: "POST",
        url: "wsVentaPasaje.asmx/spIntinerarioOrigenXNombre",
        data: "{}",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (response) {
            var sucursales = response.d;
            salOrigen.append('<option value="0">Seleccione Origen</option>');
            $.each(sucursales, function (index, enSucursal) {
                salOrigen.append('<option value="' + enSucursal.suc_id + '">' + enSucursal.suc_nombre + '</option>');                
            });
        },
        failure: function (msg) {
            alert(msg);
        }
    });
}
function spIntinerarioDestinoXIdOrigen(salDestino, prmIdOrigen) {
    $.ajax({
        type: "POST",
        url: "wsVentaPasaje.asmx/spIntinerarioDestinoXIdOrigen",
        data: "{ 'prmIdOrigen': '" + prmIdOrigen + "' }",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (response) {
            //salDestino.append('<option value="0">Seleccione Destino</option>');
            var sucursales = response.d; 
            $.each(sucursales, function (index, enSucursal) {
                salDestino.append('<option value="' + enSucursal.suc_id + '">' + enSucursal.suc_nombre + '</option>');
            });
            $("#itinerarioFecha").find("option").remove();
            $("#itinerarioHora").find("option").remove();
            $("#tbBodyItinerario").find("tr").remove();
            $("#tbSalidas").hide();

            var salFecha = $("#itinerarioFecha");
            var prmIdOrigen = $('#salidaOrigen').val();
            var prmIdDestino = $('#salidaDestino').val();
            spIntinerarioFechaSalidaXIdOrigenIdDestino(salFecha, prmIdOrigen, prmIdDestino);
        },
        failure: function (msg) {
            alert(msg);
        }

    });
}
function spIntinerarioFechaSalidaXIdOrigenIdDestino(itiFecha, prmIdOrigen, prmIdDestino) {
    $.ajax({
        type: "POST",
        url: "wsVentaPasaje.asmx/spIntinerarioFechaSalidaXIdOrigenIdDestino",
        data: "{ 'prmIdOrigen': '" + prmIdOrigen + "','prmIdDestino': '" + prmIdDestino + "' }",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (response) {
            //itiFecha.append('<option value="0">Seleccione Fecha</option>');
            var itinerarios = response.d;
            $.each(itinerarios, function (index, enItinerario) {
                itiFecha.append('<option value="' + enItinerario.iti_horSalida + '">' + enItinerario.iti_horSalida + '</option>');
            });
            $("#itinerarioHora").find("option").remove();
            $("#tbBodyItinerario").find("tr").remove();
            $("#tbSalidas").show();

            //var salHora = $("#itinerarioHora");
            var etiqueta = $("#tbBodyItinerario");
            var prmIdOrigen = $('#salidaOrigen').val();
            var prmIdDestino = $('#salidaDestino').val();
            var prmFecha = $('#itinerarioFecha').val();
            spIntinerarioResumenXIdOrigenIdDestinoFecha(etiqueta, prmIdOrigen, prmIdDestino, prmFecha);
        },
        failure: function (msg) {
            alert(msg);
        }

    });
}

function spIntinerarioResumenXIdOrigenIdDestinoFecha(etiqueta, prmIdOrigen, prmIdDestino, prmFecha) {
    $.ajax({
        type: "POST",
        url: "wsVentaPasaje.asmx/spIntinerarioResumenXIdOrigenIdDestinoFecha",
        data: "{ 'prmIdOrigen': '" + prmIdOrigen + "','prmIdDestino': '" + prmIdDestino + "' ,'prmFecha':'" + prmFecha + "'}",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (response) {
            var itinerarios = response.d;
            var i = 1;
            $.each(itinerarios, function (index, enItinerario) {                
                etiqueta.append('<tr onkeyup="if(validarTeclaPresionada(event,32) == true) { spControlAsientoXIdItinerario(\''
                    + enItinerario.iti_id + '\'); }" onclick="spControlAsientoXIdItinerario(\'' + enItinerario.iti_id + '\')"  tabindex="' + i + 4 + '"class="collapsed" data-toggle="collapse" data-target=".box-cliente">'
                    //+ '<td>' + enItinerario.sucursalOrigen.ciudad.ciu_nomCiudad + '</td>'
                    //+ '<td>' + enItinerario.sucursalDestino.ciudad.ciu_nomCiudad + '</td>'
                    //+ '<td>' + enItinerario.iti_fecSalida + '</td>'
                    + '<td>' + i + '</td>'
                    + '<td>' + enItinerario.iti_horSalida + '</td>'                    
                    + '<td> S/. ' + enItinerario.iti_precio + '</td>'
                    + '<td>' + enItinerario.vehiculo.veh_totAsientos + ' Asientos</td>'
                    + '<td>' + enItinerario.vehiculo.servicioEspecial.serEsp_nombre + '</td></tr>');
                i++;
            });            
        },
        failure: function (msg) {
            alert(msg);
        }

    });

}

function spControlAsientoXIdItinerario(prmIdItinerario) {
    var etiqueta = $("#replicaBus");
    $.ajax({
        type: "POST",
        url: "wsVentaPasaje.asmx/spControlAsientoXIdItinerario",
        data: "{ 'prmIdItinerario': '" + prmIdItinerario + "'}",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (response) {
            etiqueta.find("div").remove();
            fnMostrarOcularComponenteByClass(1, 'replicaBus');
            fnMostrarOcularComponenteByClass(0, 'divControlAsiento');
            var controlAsiento = response.d;
            etiqueta.append('<div><h4>Primer Piso</h4></div>');
            var contSeg = 1;
            var contPri = 1;
            for (var i = 0; i < controlAsiento.length; ++i) {                 
                if (controlAsiento[i + 3].conAsi_piso == 1) {                   
                    if (controlAsiento.length > 60) {
                        etiqueta.append('<div class="fila">'
                       + '<div class="asiento"><a class="asiento-' + controlAsiento[i].conAsi_estAsiento + '"   onclick="fnMostrarAsiento(' + controlAsiento[i].conAsi_numAsiento + ')">' + controlAsiento[i].conAsi_numAsiento + '</a></div>'
                       + '<div class="asiento"><a class="asiento-' + controlAsiento[i + 1].conAsi_estAsiento + '" onclick="fnMostrarAsiento(' + controlAsiento[i+1].conAsi_numAsiento + ')">' + controlAsiento[i + 1].conAsi_numAsiento + '</a></div>'
                       + '<div class="asiento">' + controlAsiento.length + '</div>'
                       + '<div class="asiento"><a class="asiento-' + controlAsiento[i + 2].conAsi_estAsiento + '" onclick="fnMostrarAsiento(' + controlAsiento[i+2].conAsi_numAsiento + ')">' + controlAsiento[i + 2].conAsi_numAsiento + '</a></div>'
                       + '<div class="asiento"><a class="asiento-' + controlAsiento[i + 3].conAsi_estAsiento + '" onclick="fnMostrarAsiento(' + controlAsiento[i+3].conAsi_numAsiento + ')">' + controlAsiento[i + 3].conAsi_numAsiento + '</a></div>'
                       + '</div>');
                        i += 3;
                        
                    } else {
                        if (contPri == 3 || contPri == 4) {
                            etiqueta.append('<div class="fila">'
                                + '<div class="asiento"><a class="asiento-' + controlAsiento[i].conAsi_estAsiento + '"   onclick="fnMostrarAsiento(' + controlAsiento[i+1].conAsi_numAsiento + ')">' + controlAsiento[i].conAsi_numAsiento + '</a></div>'
                                + '<div class="asiento"><a class="asiento-' + controlAsiento[i + 1].conAsi_estAsiento + '"   onclick="fnMostrarAsiento(' + controlAsiento[i+2].conAsi_numAsiento + ')">' + controlAsiento[i + 1].conAsi_numAsiento + '</a></div>'
                                + '<div class="asiento">' + controlAsiento.length + '</div>'
                                + '<div class="asiento"></div>'
                                + '<div class="asiento"></div>'
                                + '</div>');
                            i += 1;
                        } else {
                            etiqueta.append('<div class="fila">'
                      + '<div class="asiento"><a class="asiento-' + controlAsiento[i].conAsi_estAsiento + '"  onclick="fnMostrarAsiento(' + controlAsiento[i].conAsi_numAsiento + ')">' + controlAsiento[i].conAsi_numAsiento + '</a></div>'
                      + '<div class="asiento"><a class="asiento-' + controlAsiento[i + 1].conAsi_estAsiento + '"  onclick="fnMostrarAsiento(' + controlAsiento[i+1].conAsi_numAsiento + ')">' + controlAsiento[i + 1].conAsi_numAsiento + '</a></div>'
                      + '<div class="asiento">' + controlAsiento.length + '</div>'
                      + '<div class="asiento"><a class="asiento-' + controlAsiento[i + 2].conAsi_estAsiento + '"  onclick="fnMostrarAsiento(' + controlAsiento[i+2].conAsi_numAsiento + ')">' + controlAsiento[i + 2].conAsi_numAsiento + '</a></div>'
                      + '<div class="asiento"><a class="asiento-' + controlAsiento[i + 3].conAsi_estAsiento + '"   onclick="fnMostrarAsiento(' + controlAsiento[i+3].conAsi_numAsiento + ')">' + controlAsiento[i + 3].conAsi_numAsiento + '</a></div>'
                      + '</div>');
                            i += 3;
                        }
                    }
                    contPri++;
                } else if (controlAsiento[i + 3].conAsi_piso == 2) {
                    if (contSeg == 1) {
                        etiqueta.append('<div><h4>Segundo Piso</h4></div>');
                    }                   
                    if (contSeg == 3 || contSeg == 4) {
                        etiqueta.append('<div class="fila">'
                            + '<div class="asiento"><a class="asiento-' + controlAsiento[i].conAsi_estAsiento + '" onclick="fnMostrarAsiento(' + controlAsiento[i+1].conAsi_numAsiento + ')">' + controlAsiento[i].conAsi_numAsiento + '</a></div>'
                            + '<div class="asiento"><a class="asiento-' + controlAsiento[i + 1].conAsi_estAsiento + '"   onclick="fnMostrarAsiento(' + controlAsiento[i+2].conAsi_numAsiento + ')">' + controlAsiento[i + 1].conAsi_numAsiento + '</a></div>'
                            + '<div class="asiento">' + controlAsiento[i + 3].conAsi_piso + '</div>'
                            + '<div class="asiento"></div>'
                            + '<div class="asiento"></div>'
                            + '</div>');
                        i += 1;
                    } else {
                        etiqueta.append('<div class="fila">'
                        + '<div class="asiento"><a class="asiento-' + controlAsiento[i].conAsi_estAsiento + '"  onclick="fnMostrarAsiento(' + controlAsiento[i].conAsi_numAsiento + ')">' + controlAsiento[i].conAsi_numAsiento + '</a></div>'
                        + '<div class="asiento"><a class="asiento-' + controlAsiento[i + 1].conAsi_estAsiento + '"  onclick="fnMostrarAsiento(' + controlAsiento[i+1].conAsi_numAsiento + ')">' + controlAsiento[i + 1].conAsi_numAsiento + '</a></div>'
                        + '<div class="asiento">' + controlAsiento[i + 3].conAsi_piso + '</div>'
                        + '<div class="asiento"><a class="asiento-' + controlAsiento[i + 2].conAsi_estAsiento + '" onclick="fnMostrarAsiento(' + controlAsiento[i+2].conAsi_numAsiento + ')">' + controlAsiento[i + 2].conAsi_numAsiento + '</a></div>'
                        + '<div class="asiento"><a class="asiento-' + controlAsiento[i + 3].conAsi_estAsiento + '"   onclick="fnMostrarAsiento(' + controlAsiento[i+3].conAsi_numAsiento + ')">' + controlAsiento[i + 3].conAsi_numAsiento + '</a></div>'
                        + '</div>');
                        i += 3;
                    }
                    contSeg++;
                }
            }
        },
        failure: function (msg) {
            alert(msg);
        }

    });

}

function fnMostrarAsiento(numAsiento) {
    fnMostrarOcularComponenteByClass(1, 'divControlAsiento');
    document.getElementById("numAsiento").value = numAsiento;
}

function spDocumentoIdentidadLista(etiqueta){
    $.ajax({
        type: "POST",
        url: "wsVentaPasaje.asmx/spDocumentoIdentidadLista",
        data: "{}",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (response) {
            var docIdentidad = response.d;
            $.each(docIdentidad, function (index, enDocumentoIdentidad) {
                etiqueta.append('<option value="' + enDocumentoIdentidad.docIde_id + '">' + enDocumentoIdentidad.docIde_descripcion + '</option>');
            });
        },
        failure: function (msg) {
            alert(msg);
        }
    });
}

function spPersonaXNumeroTipoDocumentoIdentidad(prmNumDocIde, idTipDoc) {
    $.ajax({
        type: "POST",
        url: "wsVentaPasaje.asmx/spPersonaXNumeroTipoDocumentoIdentidad",
        data: "{ 'prmNumDocIde': '" + prmNumDocIde + "','idTipDoc': '" + idTipDoc + "'}",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (response) {
            var persona = response.d;
            $.each(persona, function (index, enPersona) {
                document.getElementById("impNombres").value = enPersona.per_nombres;
                document.getElementById("impApellidos").value = enPersona.per_apellidos;
                document.getElementById("impEdad").value = enPersona.per_fecNacimiento;                
                if (enPersona.per_sexo == 'm') {
                    document.frmRegistraVentaPasaje.sexo[0].checked = true;
                } else if (enPersona.per_sexo == 'f') {
                    document.frmRegistraVentaPasaje.sexo[1].checked = true;
                } lblMsjVentaPasaje
                $('#lblMsjVentaPasaje').find("span").remove();
                $('#lblMsjVentaPasaje').append("<span>" + enPersona.personaMensaje + "</span>");
            });
        },
        failure: function (msg) {           
            alert(msg);
        }
    });
}

$("#impDocIdentidad").keyup(function () {  

    if ($('#impDocIdentidad').val().length >= 8) {
        if (validarTeclaPresionada(event, 13) == true) {
            fnEnviarDatosPersonBusqueda()
        }
    } else {
        fnLimpiarCampos();       
    }

});
function fnEnviarDatosPersonBusqueda() {
    var prmNumDocIde = $('#impDocIdentidad').val();
    var idTipDoc = $('#selDocIdentidad').val();
    spPersonaXNumeroTipoDocumentoIdentidad(prmNumDocIde, idTipDoc)
}

function fnLimpiarCampos() {
    document.getElementById("impNombres").value ="";
    document.getElementById("impApellidos").value = "";
    document.getElementById("impEdad").value = "";
    //document.getElementById("impNumAsiento").value = "";
}