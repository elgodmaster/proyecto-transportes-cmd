function obtenerListaSalida(salOrigen) {   
    
    $.ajax({
        type: "POST",
        url: "wsVentaPasaje.asmx/sucursalOrigenLista",
        data: "{}",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (response) {
            salOrigen.append('<option value="0">Seleccione Origen</option>');
            var sucursales = response.d;
            $.each(sucursales, function (index, enSucursal) {
                salOrigen.append('<option value="' + enSucursal.suc_id + '">' + enSucursal.suc_nombre + '</option>');                
            });            
        },
        failure: function (msg) {
            alert(msg);
        }
    });
}

function obtenerListaDestinos(salDestino, prmIdOrigen) {
    $.ajax({
        type: "POST",
        url: "wsVentaPasaje.asmx/sucursalDestinoLista",
        data: "{ 'prmIdOrigen': '" + prmIdOrigen + "' }",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (response) {
            salDestino.append('<option value="0">Seleccione Destino</option>');
            var sucursales = response.d; 
            $.each(sucursales, function (index, enSucursal) {
                salDestino.append('<option value="' + enSucursal.suc_id + '">' + enSucursal.suc_nombre + '</option>');
            });          
        },
        failure: function (msg) {
            alert(msg);
        }

    });
}

function itinerarioOrigenDestinoFechaLista(itiFecha, prmIdOrigen, prmIdDestino) {
    $.ajax({
        type: "POST",
        url: "wsVentaPasaje.asmx/itinerarioOrigenDestinoFechaLista",
        data: "{ 'prmIdOrigen': '" + prmIdOrigen + "','prmIdDestino': '" + prmIdDestino + "' }",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (response) {
            var itinerarios = response.d;
            $.each(itinerarios, function (index, enItinerario) {
                itiFecha.append('<option value="' + enItinerario.iti_horSalida + '">' + enItinerario.iti_horSalida + '</option>');
            });
        },
        failure: function (msg) {
            alert(msg);
        }

    });
}

function itinerarioOrigenDestinoFechaHoraLista(itiHora, prmIdOrigen, prmIdDestino, prmFecha) {
    $.ajax({
        type: "POST",
        url: "wsVentaPasaje.asmx/itinerarioOrigenDestinoFechaHoraLista",
        data: "{ 'prmIdOrigen': '" + prmIdOrigen + "','prmIdDestino': '" + prmIdDestino + "' ,'prmFecha':'" + prmFecha + "'}",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (response) {
            var itinerarios = response.d;
            $("#lista").text(JSON.stringify(response));
            $.each(itinerarios, function (index, enItinerario) {
                itiHora.append('<option value="' + enItinerario.iti_id + '">' + enItinerario.iti_horSalida + '</option>');
            });
        },
        failure: function (msg) {
            alert(msg);
        }

    });
}
