function spIntinerarioOrigenXNombre(salOrigen) {
    
    $.ajax({
        type: "POST",
        url: "wsVentaPasaje.asmx/spIntinerarioOrigenXNombre",
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

function spIntinerarioDestinoXIdOrigen(salDestino, prmIdOrigen) {
    $.ajax({
        type: "POST",
        url: "wsVentaPasaje.asmx/spIntinerarioDestinoXIdOrigen",
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

function spIntinerarioFechaSalidaXIdOrigenIdDestino(itiFecha, prmIdOrigen, prmIdDestino) {
    $.ajax({
        type: "POST",
        url: "wsVentaPasaje.asmx/spIntinerarioFechaSalidaXIdOrigenIdDestino",
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

function spIntinerarioHoraSalidaXIdOrigenIdDestinoFecha(itiHora, prmIdOrigen, prmIdDestino, prmFecha) {
    $.ajax({
        type: "POST",
        url: "wsVentaPasaje.asmx/spIntinerarioHoraSalidaXIdOrigenIdDestinoFecha",
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
