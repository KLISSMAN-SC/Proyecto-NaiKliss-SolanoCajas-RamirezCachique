function agregarAlCarrito(event, idVideojuego) {
	    event.preventDefault(); // Evita cualquier acción por defecto

	    // Llamamos al controlador por fetch
	    fetch("TiendaController?op=añadirCarrito&id=" + idVideojuego)
	        .then(response => response.text())
	        .then(html => {
	            // El controlador ahora nos devolverá la tabla actualizada (ver paso 3)
	            document.getElementById("tablaResultados").innerHTML = html;
	            console.log("Juego añadido y tabla refrescada");
	        })
	        .catch(error => console.error('Error:', error));
	}
