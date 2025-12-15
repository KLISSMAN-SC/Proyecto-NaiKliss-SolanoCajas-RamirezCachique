const selectorMetodo = document.getElementById("metodoPago");
const contenedor = document.getElementById("contenedor-metodo-pago");

// Función genérica para cargar vistas
function cargarVista(url, callback) {
    fetch(url)
        .then(resp => resp.text())
        .then(html => {
            contenedor.innerHTML = html;
            if (callback) callback();
        })
        .catch(err => console.error("Error al cargar vista:", err));
}

selectorMetodo.addEventListener("change", () => {
    const metodo = selectorMetodo.value;

    if (metodo === "") {
        contenedor.innerHTML = "";
        return;
    }

    console.log("Método seleccionado:", metodo);
    console.log("Precio total enviado:", PRECIO_TOTAL);

    if (metodo === "Billetera") {
        cargarVista(
            `${BASE_URL}PagoController?op=formularioBilletera&precioTotal=${PRECIO_TOTAL}`,
            activarFormBilletera
        );
    }

    if (metodo === "Tarjeta") {
        cargarVista(
            `${BASE_URL}PagoController?op=formularioTarjeta&precioTotal=${PRECIO_TOTAL}`,
            activarFormTarjeta
        );
    }
});

// Funciones de activación
function activarFormBilletera() {
    console.log("Formulario de billetera cargado.");
}

function activarFormTarjeta() {
    console.log("Formulario de tarjeta cargado.");
}