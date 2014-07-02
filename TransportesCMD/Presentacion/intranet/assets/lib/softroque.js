function validarTeclaPresionada(e, tecla) {
    var key = e.keyCode || e.which;
    if (key == tecla) { return true; } else { return false; }
}

function validarLongitudMaxima(etiqueta, max) {
    var cadena = $('#' + etiqueta).val();
    if (cadena.length > max) {
        document.getElementById(etiqueta).value = cadena.substring(0, max);
    }  
}

function validarLongitudEntre(etiqueta, min,max) {
    var cadena = $('#' + etiqueta).val();
    if (cadena.length > max) {
        document.getElementById(etiqueta).value = cadena.substring(0, max);
        return false;
    } else if (cadena.length < min) {
        return false;
    } else {
        return true;
    }
}

function validarLongitudInt(etiqueta, max) {
    var cadena = $('#' + etiqueta).val();
    if (isNaN(cadena.substring(cadena.length - 1, cadena.length))) {
        document.getElementById(etiqueta).value = cadena.substring(0, cadena.length - 1);
    } else if (cadena.length > max) {
        document.getElementById(etiqueta).value = cadena.substring(0, max);       
    }
}

function validarLongitudIntEntre(etiqueta,min, max) {
    var cadena = $('#' + etiqueta).val();
    if (isNaN(cadena.substring(cadena.length - 1, cadena.length))) {
        document.getElementById(etiqueta).value = cadena.substring(0, cadena.length - 1);
        return false;
    } else if (cadena.length < min) {
        return false
    } else if (cadena.length > max) {
        document.getElementById(etiqueta).value = cadena.substring(0, max);
        return false;
    } else {
        return true;
    }
}

function validarInt(etiqueta) {
    var cadena = $('#' + etiqueta).val();
    if (isNaN(cadena.substring(cadena.length - 1, cadena.length))) {
        document.getElementById(etiqueta).value = cadena.substring(0, cadena.length - 1);
        return false;
    } else {
        return true;
    }
}

function validarTexto(etiqueta) {
    var cadena = $('#' + etiqueta).val();
    if (!isNaN(cadena.substring(cadena.length - 1, cadena.length))) {
        document.getElementById(etiqueta).value = cadena.substring(0, cadena.length - 1);
        return false;
    } else {
        return true;
    }
}

//############################## ---------------Nuevos---------------- ##############
function fnMostrarAlertMessage(modalTitulo, modalIcon, modalMensaje) {

    $(document).ready(function () {

    $('#modalMensaje').modal('show');
    $('#modalMensajeTitulo').html(modalTitulo);
    $('#modalMensajeIcon').addClass("modal-icon " + modalIcon);
    $('#modalMensajeDescripcion').html(modalMensaje);
    });
}
