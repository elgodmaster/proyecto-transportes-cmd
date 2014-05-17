$(document).ready(function () {
    $("#tbSalidas").hide();
    var salOrigen = $("#salidaOrigen");
    
    spIntinerarioOrigenXNombre(salOrigen);   
       
});

$("#salidaOrigen").change(function () {
    $("#salidaDestino").find("option").remove();
    $("#itinerarioFecha").find("option").remove();
    $("#itinerarioHora").find("option").remove();
    $("#tbSalidas").hide();    

    $("#tbBodyItinerario").find("tr").remove();

    var salDestino = $("#salidaDestino");
    var prmIdOrigen = $('#salidaOrigen').val();
    spIntinerarioDestinoXIdOrigen(salDestino, prmIdOrigen);

});
$("#salidaDestino").change(function () {
    $("#itinerarioFecha").find("option").remove();
    $("#itinerarioHora").find("option").remove();
    $("#tbBodyItinerario").find("tr").remove();
    $("#tbSalidas").hide();

    var salFecha = $("#itinerarioFecha");
    var prmIdOrigen = $('#salidaOrigen').val();
    var prmIdDestino = $('#salidaDestino').val();
    spIntinerarioFechaSalidaXIdOrigenIdDestino(salFecha, prmIdOrigen, prmIdDestino);
});
$("#itinerarioFecha").change(function () {
    $("#itinerarioHora").find("option").remove();
    $("#tbBodyItinerario").find("tr").remove();
    $("#tbSalidas").show();

    //var salHora = $("#itinerarioHora");
    var etiqueta = $("#tbBodyItinerario");
    var prmIdOrigen = $('#salidaOrigen').val();
    var prmIdDestino = $('#salidaDestino').val();
    var prmFecha = $('#itinerarioFecha').val();
    spIntinerarioResumenXIdOrigenIdDestinoFecha(etiqueta, prmIdOrigen, prmIdDestino, prmFecha);
});
//$("#itinerarioHora").change(function () {
//    var prmIdOrigen = $('#itinerarioHora').val();
//    ////alert("Ha seleccionado " + prmIdOrigen);
//});

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
            //$("#salidaDestino").find("option").remove();
            //$("#itinerarioFecha").find("option").remove();
            //$("#itinerarioHora").find("option").remove();
            //$("#tbSalidas").hide();

            //$("#tbBodyItinerario").find("tr").remove();

            //var salDestino = $("#salidaDestino");
            //var prmIdOrigen = $('#salidaOrigen').val();
            //spIntinerarioDestinoXIdOrigen(salDestino, prmIdOrigen);

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
//function spIntinerarioHoraSalidaXIdOrigenIdDestinoFecha(itiHora, prmIdOrigen, prmIdDestino, prmFecha) {
//    $.ajax({
//        type: "POST",
//        url: "wsVentaPasaje.asmx/spIntinerarioHoraSalidaXIdOrigenIdDestinoFecha",
//        data: "{ 'prmIdOrigen': '" + prmIdOrigen + "','prmIdDestino': '" + prmIdDestino + "' ,'prmFecha':'" + prmFecha + "'}",
//        contentType: "application/json; charset=utf-8",
//        dataType: "json",
//        success: function (response) {
//            var itinerarios = response.d;
//            $("#lista").text(JSON.stringify(response));
//            $.each(itinerarios, function (index, enItinerario) {
//                itiHora.append('<option value="' + enItinerario.iti_id + '">' + enItinerario.iti_horSalida + '</option>');
//            });
//        },
//        failure: function (msg) {
//            alert(msg);
//        }

//    });
    
//}

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
                etiqueta.append('<tr onclick="mostrar(\'' + enItinerario.iti_id + '\')"  tabindex="' + i+4 + '">'
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
function mostrar(msg) {
    alert(msg);
}