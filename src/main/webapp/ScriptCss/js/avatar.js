function cambiarAvatar(nombreArchivo) {
    const rutaBase = "/POOIIPROYECTO1.2.2/img/";
    const nuevaRuta = rutaBase + nombreArchivo;
	let mensaje = "Hola desde JavaScript";
	console.log(mensaje);
    // 1. Cambiar las imágenes en la vista previa
    document.getElementById('mainPreview').src = nuevaRuta;
    document.getElementById('preview64').src = nuevaRuta;
    document.getElementById('preview32').src = nuevaRuta;
    
    // 2. Actualizar el input oculto para que el Servlet sepa qué archivo elegimos
    document.getElementById('inputAvatar').value = nombreArchivo;
}