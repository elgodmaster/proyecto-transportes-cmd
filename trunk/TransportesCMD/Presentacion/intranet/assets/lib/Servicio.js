$(document).ready(function () {
    spServicioListar();
});

//Aquí va  el cuerpo de la tabla(Vehiculo).
function spServicioListar() {
    var etiqueta = $("#tbBodyServicio");
    $.ajax({
        type: "POST",
        url: "wsServicio.asmx/spServicioListar",
        data: "{}",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (response) {
            var lstServicio = response.d;
            var i = 1;
            $.each(lstServicio, function (index, enServicioEspecial) {
                etiqueta.append('<tr>'
                    + '<td>' + i + '</td>'
                    + '<td>' + enServicioEspecial.serEsp_nombre + '</td>'
                    + '<td>' + enServicioEspecial.serEsp_caracteristicas + '</td>'
                    //+ '<td>' + enServicioEspecial.serEsp_fecRegistro + '</td>'
                    //+ '<td>' + enServicioEspecial.serEsp_estado + '</td>'
                    + '<td> <a class="btn btn-small btn-info" href="frmMantenedorServicios.aspx?v=' + enServicioEspecial.serEsp_id + '"><i class="btn-icon-only icon-pencil"></i></a>'
                    + '<a class="btn btn-small btn-danger" href="frmMantenedorServicios.aspx?e=' + enServicioEspecial.serEsp_id + '"><i class="btn-icon-only icon-remove"></i></a></td>'
                    + '</tr>');
                i++;
            });
        },
        failure: function (msg) {
            alert(msg);
        }
    });
}