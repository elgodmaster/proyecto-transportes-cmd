$(document).ready(function () {
    spVehiculoListar();
});

function spVehiculoListar() {
    var etiqueta = $("#tbBodyVehiculo");
    $.ajax({
        type: "POST",
        url: "wsVehiculo.asmx/spVehiculoListar",
        data: "{}",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (response) {
            var lstVehiculo = response.d;
            var i = 1;
            $.each(lstVehiculo, function (index, enVehiculo) {
                etiqueta.append('<tr>'
                    + '<td>' + i + '</td>'
                    + '<td>' + enVehiculo.veh_placa + '</td>'
                    + '<td>' + enVehiculo.veh_modelo + '</td>'
                    + '<td>' + enVehiculo.veh_marca + '</td>'
                    + '<td>' + enVehiculo.veh_numAsiPrimer + '</td>'
                    + '<td>' + enVehiculo.veh_numAsiSegundo + '</td>'
                    //+ '<td>' + enVehiculo.veh_estado + '</td>'
                    + '<td>' + enVehiculo.servicioEspecial.serEsp_nombre + '</td>'
                    + '<td> <a class="btn btn-small btn-info" href="frmMantenedorBus.aspx?v=' + enVehiculo.veh_id + '"><i class="btn-icon-only icon-pencil"></i></a>'
                    + '<a class="btn btn-small btn-danger" href="frmMantenedorBus.aspx?e=' + enVehiculo.veh_id + '"><i class="btn-icon-only icon-remove"></i></a></td>'
                    +'</tr>');
                i++;
            });
        },
        failure: function (msg) {
            alert(msg);
        }
    });
}