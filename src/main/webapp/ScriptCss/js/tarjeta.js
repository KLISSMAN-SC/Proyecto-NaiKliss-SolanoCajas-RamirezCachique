function soloNumerosCVV(e) {
	    const teclasPermitidas = [
	        'Backspace', 'Delete', 'ArrowLeft', 'ArrowRight', 'Tab'
	    ];

	    if (teclasPermitidas.includes(e.key)) return;

	    if (!/^[0-9]$/.test(e.key)) {
	        e.preventDefault();
	    }
	}

	function limpiarCVV(input) {
	    input.value = input.value.replace(/\D/g, '');
	}
 function soloNumeros(e) {
     const teclasPermitidas = [
         'Backspace', 'Delete', 'ArrowLeft', 'ArrowRight', 'Tab'
     ];

     // Permitir teclas de control
     if (teclasPermitidas.includes(e.key)) {
         return;
     }

     // Permitir solo números
     if (!/^[0-9]$/.test(e.key)) {
         e.preventDefault();
     }
 }
function formatearTarjeta(input) {
    // Quitar todo lo que no sea número
    let valor = input.value.replace(/\D/g, '');

    // Limitar a 16 dígitos
    if (valor.length > 16) {
        valor = valor.substring(0, 16);
    }

    // Agregar espacio cada 4 números
    let formateado = valor.replace(/(.{4})/g, '$1 ').trim();

    input.value = formateado;
}