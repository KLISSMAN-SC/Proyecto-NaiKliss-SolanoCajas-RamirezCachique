document.addEventListener("DOMContentLoaded", () => {

    const contenido = document.getElementById("contenido");
    const mensajeGlobal = document.getElementById("mensaje-global");
    const navLinks = document.querySelectorAll(".nav-link");

    /* =====================================================
       FUNCIONES GLOBALES
    ===================================================== */

    function activarMenu(link) {
        navLinks.forEach(l => l.classList.remove("active"));
        link.classList.add("active");
    }

    window.mostrarMensaje = function (texto, tipo = "success") {
        mensajeGlobal.className = "alert alert-" + tipo;
        mensajeGlobal.innerText = texto;
        mensajeGlobal.style.display = "block";

        setTimeout(() => {
            mensajeGlobal.style.display = "none";
        }, 2500);
    };

    /* =====================================================
       CARGA DE VISTAS (SPA)
    ===================================================== */

    function cargarVista(url, callback) {
        fetch(url)
            .then(r => r.text())
            .then(html => {
                contenido.innerHTML = html;
                if (callback) callback();
            });
    }

    function cargarAmigos() {
        cargarVista(BASE_URL + "AmistadController?op=listarAmigos");
    }

    function AddAmigos() {
        cargarVista(BASE_URL + "AmistadController?op=añadirAmigos", activarEventosBusqueda);
    }

    function cargarSolicitudes() {
        cargarVista(BASE_URL + "AmistadController?op=listarSolicitudes");
    }

    /* =====================================================
       BÚSQUEDA DE USUARIOS
    ===================================================== */

    function activarEventosBusqueda() {

        const formId = document.getElementById("buscar-id-form");
        const formNombre = document.getElementById("buscar-nombre-form");
        const resultadoID = document.getElementById("resultado-busqueda-id");
        const resultadoNombre = document.getElementById("resultado-busqueda-nombre");

        if (!formId || !formNombre) return;

        function limpiarResultados() {
            resultadoID.innerHTML = "";
            resultadoNombre.innerHTML = "";
        }

        function renderCard(data, destino, tipo) {
            destino.innerHTML = `
                <div class="card p-3 mt-3">
                    <h5>Usuario encontrado (${tipo})</h5>
                    <p><strong>ID:</strong> ${data.idUsuario}</p>
                    <p><strong>Nombre:</strong> ${data.nombre}</p>

					<button type="button"
					        class="btn btn-success btn-solicitud"
					        data-id="${data.idUsuario}">
                        Enviar solicitud
                    </button>
                </div>
            `;
        }

        /* ---------- Buscar por ID ---------- */

        formId.addEventListener("submit", e => {
            e.preventDefault();
            limpiarResultados();

            fetch(BASE_URL + "AmistadController?op=buscarPorId", {
                method: "POST",
                body: new URLSearchParams(new FormData(formId))
            })
            .then(r => r.ok ? r.json() : Promise.reject("Usuario no encontrado"))
            .then(data => renderCard(data, resultadoID, "por ID"))
            .catch(err => {
                resultadoID.innerHTML =
                    `<div class="alert alert-danger">${err}</div>`;
            });
        });

        /* ---------- Buscar por nombre ---------- */

        formNombre.addEventListener("submit", e => {
            e.preventDefault();
            limpiarResultados();

            fetch(BASE_URL + "AmistadController?op=buscarPorNombre", {
                method: "POST",
                body: new URLSearchParams(new FormData(formNombre))
            })
            .then(r => r.ok ? r.json() : Promise.reject("Usuario no encontrado"))
            .then(data => renderCard(data, resultadoNombre, "por nombre"))
            .catch(err => {
                resultadoNombre.innerHTML =
                    `<div class="alert alert-danger">${err}</div>`;
            });
        });
    }

    /* =====================================================
       DELEGACIÓN DE EVENTOS (BOTONES DINÁMICOS)
    ===================================================== */

    contenido.addEventListener("click", e => {
		
		console.log("CLICK:", e.target);

		   if (e.target.classList.contains("btn-solicitud")) {
		       console.log("BOTÓN SOLICITUD DETECTADO");

		       const idAmigo = e.target.dataset.id;
		       console.log("ID:", idAmigo);
		   }
        /* ---------- Enviar solicitud ---------- */
		const btnSolicitud = e.target.closest(".btn-solicitud");
		    if (btnSolicitud) {

		        const idAmigo = btnSolicitud.dataset.id;

		        fetch(BASE_URL + "AmistadController", {
		            method: "POST",
		            headers: { "Content-Type": "application/x-www-form-urlencoded" },
		            body: "op=enviarSolicitud&idAmigo=" + idAmigo
		        })
		        .then(r => r.text())
		        .then(msg => {
		            mostrarMensaje(msg, "success");
		            btnSolicitud.disabled = true;
		            btnSolicitud.innerText = "Solicitud enviada";
		        })
		        .catch(() => mostrarMensaje("Error al enviar solicitud", "danger"));
		    }

        

        /* ---------- Aceptar solicitud ---------- */
        if (e.target.classList.contains("btn-aceptar")) {

            const id = e.target.dataset.id;

            fetch(BASE_URL + "AmistadController", {
                method: "POST",
                body: new URLSearchParams({
                    op: "aceptarSolicitud",
                    idAmistad: id
                })
            })
            .then(r => r.text())
            .then(msg => {
                mostrarMensaje(msg, "success");
                cargarSolicitudes();
            });
        }

        /* ---------- Rechazar solicitud ---------- */
        if (e.target.classList.contains("btn-rechazar")) {

            const id = e.target.dataset.id;

            fetch(BASE_URL + "AmistadController", {
                method: "POST",
                body: new URLSearchParams({
                    op: "rechazarSolicitud",
                    idAmistad: id
                })
            })
            .then(r => r.text())
            .then(msg => {
                mostrarMensaje(msg, "warning");
                cargarSolicitudes();
            });
        }
    });

    /* =====================================================
       MENÚ LATERAL
    ===================================================== */

    navLinks.forEach(link => {
        link.addEventListener("click", () => {
            activarMenu(link);

            const action = link.dataset.action;

            if (action === "cargarAmigos") cargarAmigos();
            else if (action === "AddAmigos") AddAmigos();
            else if (action === "cargarSolicitudes") cargarSolicitudes();
        });
    });

});