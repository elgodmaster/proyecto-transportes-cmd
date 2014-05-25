
$(document).ready(function () {
    limpiarImputText(true,true,true,true,true,true,true,true);
    ocultarComponente(true,true,true);

    spIntinerarioOrigenXNombre();
    spDocumentoIdentidadLista();

    $("#fecNacimiento").datepicker({
        changeMonth: true,
        changeYear: true,
        maxDate: "+0d",
        onSelect: function (date) {
            var fecSeleccionada = new Date(date.substring(6, 10) + '-' + date.substring(3, 5) + '-' + date.substring(0, 2));
            var fecActual = new Date();
            var edad = fecActual.getFullYear() - fecSeleccionada.getFullYear();

            var m = fecActual.getMonth() - fecSeleccionada.getMonth();
            if (m < 0 || (m == 0 && fecActual.getDate() < fecSeleccionada.getDate())) {
                edad--;
            }
            document.getElementById("edad").value = edad;           
        }

    });
   
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


function mostrarTamanioNumeroDocumentoIdentidad() {
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
}

$("#tipDocIdentidad").change(function () {
    mostrarTamanioNumeroDocumentoIdentidad();
});


function spPersonaXNumeroDocumentoIdentidad(prmNumDocIde) {
    limpiarImputText(false, false, false, false, false, false, true);
    $.ajax({
        type: "POST",
        url: "wsVentaPasaje.asmx/spPersonaXNumeroDocumentoIdentidad",
        data: "{ 'prmNumDocIde': '" + prmNumDocIde + "'}",
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
                    $('#lblMsjVentaPasaje').append("<span>" + enPersona.personaMensaje + ".</span>");
                    $("#tipDocIdentidad option[value=" + enPersona.documentoIdentidad.docIde_id + "]").attr("selected", true);
                    mostrarTamanioNumeroDocumentoIdentidad();
                
            });
        },
        failure: function (msg) {           
            alert(msg);
        }
    });
}

function buscarPersonaPorNic() {
    if (validarLongitudEntre('numDocIdentidad', 8, 15)) {

        spPersonaXNumeroDocumentoIdentidad($('#numDocIdentidad').val());

    } else {
        limpiarImputText(false, true, true, true, true, false, true);
        removerSpan(true);
        $('#lblMsjVentaPasaje').append("<span>Búsqueda: La longitud de \"Número de Documento\" debe ser entre 8 y 15 caracteres.</span>");
    }
    
}

$("#numDocIdentidad").keyup(function () {
    if (validarTeclaPresionada(event, 13) == true) {
        buscarPersonaPorNic();
    }
});

function mostrar() {
    var str = $("form").serialize();
    $("#results").text(str);
}

$("#apellidos").autocomplete({
    source: function (request, response) {
        $.ajax({
            url: "wsVentaPasaje.asmx/spPersonaXApellidos",
            data: "{ 'apellidos': '" + request.term + "' }",
            dataType: "json",
            type: "POST",
            contentType: "application/json; charset=utf-8",
            success: function (data) {
                var lstPersona = data.d;
                response($.map(lstPersona, function (enPersona) {
                    return {
                        value: enPersona.per_apellidos,
                        label: (enPersona.per_apellidos).concat(' ' + enPersona.per_nombres),
                        docIde_id: enPersona.documentoIdentidad.docIde_id,
                        per_nombres: enPersona.per_nombres,
                        per_fecNacimiento: enPersona.per_fecNacimiento,
                        edad: enPersona.edad,
                        per_sexo: enPersona.per_sexo,
                        per_numDocIdentidad: enPersona.per_numDocIdentidad,
                        per_id: enPersona.per_id
                    }
                }))
            },
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                alert(textStatus);
            }
        });
    },
    select: function (e, i) {
        document.getElementById("nombres").value = i.item.per_nombres;
        document.getElementById("apellidos").value = i.item.per_apellidos;
        document.getElementById("fecNacimiento").value = i.item.per_fecNacimiento;
        document.getElementById("edad").value = i.item.edad;
        document.getElementById("idPersona").value = i.item.per_id;
        document.getElementById("numDocIdentidad").value = i.item.per_numDocIdentidad;
        $("#tipDocIdentidad option[value=" + i.item.docIde_id + "]").attr("selected", true);
        mostrarTamanioNumeroDocumentoIdentidad();
        if (i.item.per_sexo == 'm') {
            document.frmRegistraVentaPasaje.sexo[0].checked = true;
        } else if (enPersona.per_sexo == 'f') {
            document.frmRegistraVentaPasaje.sexo[1].checked = true;
        }
        removerSpan(true);
        $('#lblMsjVentaPasaje').append("<span>¡Cliente Nuestro!</span>");
    },
    minLength: 2
});
