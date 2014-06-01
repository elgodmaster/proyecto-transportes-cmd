$(document).ready(function () { 

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

