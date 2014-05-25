function validarTeclaPresionada(e, tecla) {
    var key = e.keyCode || e.which;
    if (key == tecla) { return true; } else { return false; }
}

function validarLongitudInt(etiqueta, max) {
    var cadena = $('#' + etiqueta).val();
    if (isNaN(cadena.substring(cadena.length - 1, cadena.length))) {
        document.getElementById(etiqueta).value = cadena.substring(0, cadena.length - 1);
    } else if (cadena.length > max) {
        document.getElementById(etiqueta).value = cadena.substring(0, max);       
    }
}

