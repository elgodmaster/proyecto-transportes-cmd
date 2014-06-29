$(document).ready(function () {

    spRutasListarXIdSucursalOrigen();

    $("#itinerarioFecha").datepicker({
        changeMonth: true,
        changeYear: true,
        defaultDate: "+1w",
        minDate: 0,
        onSelect: function (date) {
            //var fecSeleccionada = new Date(date.substring(6, 10) + '-' + date.substring(3, 5) + '-' + date.substring(0, 2));
            //var fecActual = new Date();
            //var edad = fecActual.getFullYear() - fecSeleccionada.getFullYear();

            //var m = fecActual.getMonth() - fecSeleccionada.getMonth();
            //if (m < 0 || (m == 0 && fecActual.getDate() < fecSeleccionada.getDate())) {
            //    edad--;
            //}
            //document.getElementById("edad").value = edad;
        }

    });

});

$("#cuerpo_idOrigen").change(function () {
    spRutasListarXIdSucursalOrigen();
});

function spRutasListarXIdSucursalOrigen() {
    $.ajax({
        type: "POST",
        url: "wsRuta.asmx/spRutasListarXIdSucursalOrigen",
        data: "{ 'prmIdSucursal': '" + $("#cuerpo_idOrigen").val() + "'}",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (response) {
            var data = $.parseJSON(response.d);
            var oTable = $('#example').dataTable({
                "processing": true,
                "bDestroy": true,
                "aaData": data,
                "aoColumns": [
                    { "mData": "origen.ciudad.ciu_ciudad", },
                    { "mData": "destino.ciudad.ciu_ciudad" },
                    { "mData": "rut_horSalida" },
                    { "mData": "rut_horViaje" },
                    {
                        "mData": null, "mRender": function (aData, type, full) {
                            //var id = full[0]; //row id in the first column   
                            //var rowData = this.cells;
                            //alert(rowData[1].firstChild.value);
                            return '<p><a href="#">Seleccionar</a></p>';
                        }
                    }
                ]
            });

            $('#example tbody').on('click', 'tr', function () {

                if ($(this).hasClass('selected')) {
                    $(this).removeClass('selected');
                } else {
                    $('#example tbody tr').removeClass('selected');
                    $(this).addClass('selected');
                }
            });
        },
        failure: function (msg) {
            alert(msg);
        }
    });
}

