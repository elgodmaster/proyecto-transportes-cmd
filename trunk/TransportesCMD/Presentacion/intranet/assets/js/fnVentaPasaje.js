$(document).ready(function () {
    limpiarImputText(true,true,true,true,true,true,true,true);
    ocultarComponente(true,true,true);

    spIntinerarioOrigenXNombre();
    spDocumentoIdentidadLista();    
});

function limpiarImputText(numDocIdentidad, nombres, apellidos, fecNacimiento, edad, numAsiento,idPersona, idItinerario) {   
    if (numDocIdentidad) { document.getElementById("numDocIdentidad").value = ""; }
    if (nombres) { document.getElementById("nombres").value = ""; }
    if (apellidos) { document.getElementById("apellidos").value = ""; }
    if (fecNacimiento) { document.getElementById("fecNacimiento").value = ""; }
    if (edad) { document.getElementById("edad").value = ""; }
    if (numAsiento) { document.getElementById("numAsiento").value = ""; }
    if (idPersona) { document.getElementById("idPersona").value = ""; }
    if (idItinerario) { document.getElementById("idItinerario").value = ""; }
}

function ocultarComponente(divNumAsiento, tbItinerario, replicaBus) {
    if (divNumAsiento) {  document.getElementById("divNumAsiento").style.display = "none"; }
    else { document.getElementById("divNumAsiento").style.display = "block"; }

    if (tbItinerario) { document.getElementById("tbItinerario").style.display = "none"; }
    else { document.getElementById("tbItinerario").style.display = "block"; }

    if (replicaBus) { document.getElementById("replicaBus").style.display = "none"; }
    else { document.getElementById("replicaBus").style.display = "block"; }
}

function removerOptions(salidaOrigen, salidaDestino, itinerarioFecha, tipDocIdentidad) {
    if (salidaOrigen) { $("#salidaOrigen").find("option").remove(); }
    if (salidaDestino) { $("#salidaDestino").find("option").remove(); }
    if (itinerarioFecha) { $("#itinerarioFecha").find("option").remove(); }
    if (tipDocIdentidad) { $("#tipDocIdentidad").find("option").remove(); }
}

function removerTr(tbBodyItinerario) {
    if (salidaOrigen) { $("#tbBodyItinerario").find("tr").remove(); }
}

function removerSpan(lblMsjVentaPasaje) {
    if (lblMsjVentaPasaje) { $("#lblMsjVentaPasaje").find("span").remove(); }
}

$("#salidaOrigen").change(function () { 
    spIntinerarioDestinoXIdOrigen($('#salidaOrigen').val());
});

$("#salidaDestino").change(function () { 
    spIntinerarioFechaSalidaXIdOrigenIdDestino($('#salidaOrigen').val(), $('#salidaDestino').val());
});

$("#itinerarioFecha").change(function () {
    spIntinerarioResumenXIdOrigenIdDestinoFecha($('#salidaOrigen').val(), $('#salidaDestino').val(), $('#itinerarioFecha').val());
});

function spIntinerarioOrigenXNombre() {
    limpiarImputText(true, true, true, true, true, true, true,true);
    removerOptions(false, true, true, false);
    ocultarComponente(true, true, true);
    removerTr(true);

    var etiqueta = $("#salidaOrigen");
    $.ajax({
        type: "POST",
        url: "wsVentaPasaje.asmx/spIntinerarioOrigenXNombre",
        data: "{}",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (response) {
            var sucursales = response.d;
            $.each(sucursales, function (index, enSucursal) {
                etiqueta.append('<option value="' + enSucursal.suc_id + '">' + enSucursal.suc_nombre + '</option>');
            });
            spIntinerarioDestinoXIdOrigen($('#salidaOrigen').val());
        },
        failure: function (msg) {
            alert(msg);
        }
    });
}

function spIntinerarioDestinoXIdOrigen(prmIdOrigen) {
    limpiarImputText(true, true, true, true, true, true, true, true);
    removerOptions(false, true, true, false);
    ocultarComponente(true, true, true);
    removerTr(true);
    var etiqueta = $("#salidaDestino");
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
                etiqueta.append('<option value="' + enSucursal.suc_id + '">' + enSucursal.suc_nombre + '</option>');
            });
            spIntinerarioFechaSalidaXIdOrigenIdDestino($('#salidaOrigen').val(), $('#salidaDestino').val());
        },
        failure: function (msg) {
            alert(msg);
        }

    });
}

function spIntinerarioFechaSalidaXIdOrigenIdDestino(prmIdOrigen, prmIdDestino) {
    limpiarImputText(true, true, true, true, true, true, true, true);
    removerOptions(false, false, true, false);
    ocultarComponente(true, true, true);
    removerTr(true);
    var etiqueta = $("#itinerarioFecha");
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
                etiqueta.append('<option value="' + enItinerario.iti_horSalida + '">' + enItinerario.iti_horSalida + '</option>');
            });
            spIntinerarioResumenXIdOrigenIdDestinoFecha($('#salidaOrigen').val(), $('#salidaDestino').val(), $('#itinerarioFecha').val());
        },
        failure: function (msg) {
            alert(msg);
        }

    });
}

function spIntinerarioResumenXIdOrigenIdDestinoFecha(prmIdOrigen, prmIdDestino, prmFecha) {
    limpiarImputText(true, true, true, true, true, true, true);
    removerOptions(false, false, false, false);
    ocultarComponente(true, false, true);
    removerTr(true);
    var etiqueta = $("#tbBodyItinerario");
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
                etiqueta.append('<tr onclick="spControlAsientoXIdItinerario(\'' + enItinerario.iti_id + '\')"  tabindex="' + i + 4 + '"class="collapsed" data-toggle="collapse" >'
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
    document.getElementById("idItinerario").value = prmIdItinerario;
    var etiqueta = $("#replicaBus");
    $.ajax({
        type: "POST",
        url: "wsVentaPasaje.asmx/spControlAsientoXIdItinerario",
        data: "{ 'prmIdItinerario': '" + prmIdItinerario + "'}",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (response) {
            etiqueta.find("div").remove();
            ocultarComponente(true, false, false);

            var controlAsiento = response.d;
            etiqueta.append('<div><h4>Primer Piso</h4></div>');
            var contSeg = 1;
            var contPri = 1;
            for (var i = 0; i < controlAsiento.length; ++i) {                 
                if (controlAsiento[i + 3].conAsi_piso == 1) {                   
                    if (controlAsiento.length > 60) {
                        etiqueta.append('<div class="fila">'
                       + '<div class="asiento"><a class="asiento-' + controlAsiento[i].conAsi_estAsiento + '"   onclick="asignarAsiento(' + controlAsiento[i].conAsi_numAsiento + ')">' + controlAsiento[i].conAsi_numAsiento + '</a></div>'
                       + '<div class="asiento"><a class="asiento-' + controlAsiento[i + 1].conAsi_estAsiento + '" onclick="asignarAsiento(' + controlAsiento[i+1].conAsi_numAsiento + ')">' + controlAsiento[i + 1].conAsi_numAsiento + '</a></div>'
                       + '<div class="asiento">' + controlAsiento.length + '</div>'
                       + '<div class="asiento"><a class="asiento-' + controlAsiento[i + 2].conAsi_estAsiento + '" onclick="asignarAsiento(' + controlAsiento[i+2].conAsi_numAsiento + ')">' + controlAsiento[i + 2].conAsi_numAsiento + '</a></div>'
                       + '<div class="asiento"><a class="asiento-' + controlAsiento[i + 3].conAsi_estAsiento + '" onclick="asignarAsiento(' + controlAsiento[i+3].conAsi_numAsiento + ')">' + controlAsiento[i + 3].conAsi_numAsiento + '</a></div>'
                       + '</div>');
                        i += 3;
                        
                    } else {
                        if (contPri == 3 || contPri == 4) {
                            etiqueta.append('<div class="fila">'
                                + '<div class="asiento"><a class="asiento-' + controlAsiento[i].conAsi_estAsiento + '"   onclick="asignarAsiento(' + controlAsiento[i+1].conAsi_numAsiento + ')">' + controlAsiento[i].conAsi_numAsiento + '</a></div>'
                                + '<div class="asiento"><a class="asiento-' + controlAsiento[i + 1].conAsi_estAsiento + '"   onclick="asignarAsiento(' + controlAsiento[i+2].conAsi_numAsiento + ')">' + controlAsiento[i + 1].conAsi_numAsiento + '</a></div>'
                                + '<div class="asiento">' + controlAsiento.length + '</div>'
                                + '<div class="asiento"></div>'
                                + '<div class="asiento"></div>'
                                + '</div>');
                            i += 1;
                        } else {
                            etiqueta.append('<div class="fila">'
                      + '<div class="asiento"><a class="asiento-' + controlAsiento[i].conAsi_estAsiento + '"  onclick="asignarAsiento(' + controlAsiento[i].conAsi_numAsiento + ')">' + controlAsiento[i].conAsi_numAsiento + '</a></div>'
                      + '<div class="asiento"><a class="asiento-' + controlAsiento[i + 1].conAsi_estAsiento + '"  onclick="asignarAsiento(' + controlAsiento[i+1].conAsi_numAsiento + ')">' + controlAsiento[i + 1].conAsi_numAsiento + '</a></div>'
                      + '<div class="asiento">' + controlAsiento.length + '</div>'
                      + '<div class="asiento"><a class="asiento-' + controlAsiento[i + 2].conAsi_estAsiento + '"  onclick="asignarAsiento(' + controlAsiento[i+2].conAsi_numAsiento + ')">' + controlAsiento[i + 2].conAsi_numAsiento + '</a></div>'
                      + '<div class="asiento"><a class="asiento-' + controlAsiento[i + 3].conAsi_estAsiento + '"   onclick="asignarAsiento(' + controlAsiento[i+3].conAsi_numAsiento + ')">' + controlAsiento[i + 3].conAsi_numAsiento + '</a></div>'
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
                            + '<div class="asiento"><a class="asiento-' + controlAsiento[i].conAsi_estAsiento + '" onclick="asignarAsiento(' + controlAsiento[i+1].conAsi_numAsiento + ')">' + controlAsiento[i].conAsi_numAsiento + '</a></div>'
                            + '<div class="asiento"><a class="asiento-' + controlAsiento[i + 1].conAsi_estAsiento + '"   onclick="asignarAsiento(' + controlAsiento[i+2].conAsi_numAsiento + ')">' + controlAsiento[i + 1].conAsi_numAsiento + '</a></div>'
                            + '<div class="asiento">' + controlAsiento[i + 3].conAsi_piso + '</div>'
                            + '<div class="asiento"></div>'
                            + '<div class="asiento"></div>'
                            + '</div>');
                        i += 1;
                    } else {
                        etiqueta.append('<div class="fila">'
                        + '<div class="asiento"><a class="asiento-' + controlAsiento[i].conAsi_estAsiento + '"  onclick="asignarAsiento(' + controlAsiento[i].conAsi_numAsiento + ')">' + controlAsiento[i].conAsi_numAsiento + '</a></div>'
                        + '<div class="asiento"><a class="asiento-' + controlAsiento[i + 1].conAsi_estAsiento + '"  onclick="asignarAsiento(' + controlAsiento[i+1].conAsi_numAsiento + ')">' + controlAsiento[i + 1].conAsi_numAsiento + '</a></div>'
                        + '<div class="asiento">' + controlAsiento[i + 3].conAsi_piso + '</div>'
                        + '<div class="asiento"><a class="asiento-' + controlAsiento[i + 2].conAsi_estAsiento + '" onclick="asignarAsiento(' + controlAsiento[i+2].conAsi_numAsiento + ')">' + controlAsiento[i + 2].conAsi_numAsiento + '</a></div>'
                        + '<div class="asiento"><a class="asiento-' + controlAsiento[i + 3].conAsi_estAsiento + '"   onclick="asignarAsiento(' + controlAsiento[i+3].conAsi_numAsiento + ')">' + controlAsiento[i + 3].conAsi_numAsiento + '</a></div>'
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

function asignarAsiento(numAsiento) {
    ocultarComponente(false, false, false);
    document.getElementById("numAsiento").value = numAsiento;
}

function spDocumentoIdentidadLista() {
    var etiqueta = $("#tipDocIdentidad");
    $.ajax({
        type: "POST",
        url: "wsVentaPasaje.asmx/spDocumentoIdentidadLista",
        data: "{}",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (response) {
            var numDocIdentidad = response.d;
            document.getElementById("tamNumDocIdentidad").value=numDocIdentidad[0].docIde_longitud;
            $.each(numDocIdentidad, function (index, enDocumentoIdentidad) {
                etiqueta.append('<option value="' + enDocumentoIdentidad.docIde_id + '">' + enDocumentoIdentidad.docIde_descripcion + '</option>');
            });
        },
        failure: function (msg) {
            alert(msg);
        }
    });
}

$("#tipDocIdentidad").change(function () {
    limpiarImputText(false, true, true, true, true, false,true);
    removerSpan(true);
    $.ajax({
        type: "POST",
        url: "wsVentaPasaje.asmx/longitudNumeroDocumentoIdentidad",
        data: "{ 'prmIdDocIdentidad': '" + $("#tipDocIdentidad").val() + "'}",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (response) {
            $.each(response.d, function (index, enDocumentoIdentidad) {
                document.getElementById("tamNumDocIdentidad").value = enDocumentoIdentidad.docIde_longitud;
            });
        },
        failure: function (msg) {
            alert(msg);
        }
    });
});


$("#numDocIdentidad").keyup(function () {
    //validarLongitudInt(inputText, tamaño máximo);
    validarLongitudInt('numDocIdentidad', $('#tamNumDocIdentidad').val());
    if ($('#numDocIdentidad').val().length >= 8 && $('#numDocIdentidad').val().length <=15) {
        //if (validarTeclaPresionada(event, 13) == true) {
        var prmNumDocIde = $('#numDocIdentidad').val();
        var idTipDoc = $('#tipDocIdentidad').val();
        spPersonaXNumeroTipoDocumentoIdentidad(prmNumDocIde, idTipDoc);
        //}
    } else {
        limpiarImputText(false, true, true, true, true, false,true);
        removerSpan(true);
    }
});

function spPersonaXNumeroTipoDocumentoIdentidad(prmNumDocIde, idTipDoc) {
    limpiarImputText(false, false, false, false, false, false, true);
    $.ajax({
        type: "POST",
        url: "wsVentaPasaje.asmx/spPersonaXNumeroTipoDocumentoIdentidad",
        data: "{ 'prmNumDocIde': '" + prmNumDocIde + "','idTipDoc': '" + idTipDoc + "'}",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (response) {
            var persona = response.d;
            $.each(persona, function (index, enPersona) {
                document.getElementById("nombres").value = enPersona.per_nombres;
                document.getElementById("apellidos").value = enPersona.per_apellidos;
                document.getElementById("fecNacimiento").value = enPersona.per_fecNacimiento;
                document.getElementById("edad").value = enPersona.edad;
                document.getElementById("idPersona").value = enPersona.per_id;
                if (enPersona.per_sexo == 'm') {
                    document.frmRegistraVentaPasaje.sexo[0].checked = true;
                } else if (enPersona.per_sexo == 'f') {
                    document.frmRegistraVentaPasaje.sexo[1].checked = true;
                }
                removerSpan(true);
                $('#lblMsjVentaPasaje').append("<span>" + enPersona.personaMensaje + "</span>");               
            });
        },
        failure: function (msg) {           
            alert(msg);
        }
    });
}

function mostrar() {
    var str = $("form").serialize();
    $("#results").text(str);
}

