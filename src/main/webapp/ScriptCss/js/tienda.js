//cargar la tabla al iniciar
window.addEventListener("DOMContentLoaded", function() {
	    fetch("TiendaController?op=tabla")
	        .then(response => response.text())
	        .then(html => {
	            document.getElementById("tablaResultados").innerHTML = html;
	        });
	});

//scrip para busqueda
document.getElementById("buscar").addEventListener("keyup", function() {
	    
	let texto = this.value; // lo que escribe el usuario
		
		 fetch("TiendaController?op=buscar&texto=" + encodeURIComponent(texto))
		    .then(response => response.text())
		    .then(html => {
		         document.getElementById("tablaResultados").innerHTML = html;
		    });
	});	

	// ─────────────────────────────────────────────
	// Script para el Filtrado
	// ─────────────────────────────────────────────

	// Espera a que el modal se muestre para asegurar que el formulario está en el DOM
	document.getElementById('modalFiltros').addEventListener('shown.bs.modal', function () {
	    
	    // ... (Tu código actual de carga de filtros se mantiene) ...
	    fetch('TiendaController?op=mostrarFiltro')
	        .then(response => response.text())
	        .then(html => {
	            document.getElementById('contenidoFiltros').innerHTML = html;
	            
	            // UNA VEZ QUE EL CONTENIDO (EL FORMULARIO) ESTÁ CARGADO,
	            // AÑADIMOS EL LISTENER AL FORMULARIO DE FILTRO
	            const formFiltro = document.getElementById('formFiltro');
	            if (formFiltro) {
	                formFiltro.addEventListener('submit', function(e) {
	                    e.preventDefault(); // Evita el envío tradicional
	                    
	                    // Obtiene los datos del formulario para enviarlos por Fetch
	                    const formData = new FormData(formFiltro);
	                    const urlParams = new URLSearchParams(formData).toString();
	                    
	                    fetch("TiendaController?" + urlParams)
	                        .then(response => response.text())
	                        .then(html => {
	                            // Actualiza el div de la tabla con la respuesta
	                            document.getElementById("tablaResultados").innerHTML = html;
	                            
	                            // Cierra el modal después de cargar la tabla
	                            const modalElement = document.getElementById('modalFiltros');
	                            const modal = bootstrap.Modal.getInstance(modalElement) || new bootstrap.Modal(modalElement);
	                            modal.hide();
	                        })
	                        .catch(error => {
	                            console.error('Error al aplicar filtro:', error);
	                            document.getElementById("tablaResultados").innerHTML = 
	                                "<p class='text-danger'>Error al cargar los resultados del filtro.</p>";
	                        });
	                });
	            }
	        })
	        .catch(error => {
	            document.getElementById('contenidoFiltros').innerHTML = 
	                "<p class='text-danger'>No se pudo cargar el contenido.</p>";
	        });
	});