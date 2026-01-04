const selectPais = document.getElementById("selectPais");
    const contenedorEstado = document.getElementById("contenedorEstado");
    const inputEstado = document.getElementById("inputEstado");

    selectPais.addEventListener("change", () => {
        if (selectPais.value !== "") {
            contenedorEstado.style.display = "block";
            inputEstado.disabled = false;
        } else {
            contenedorEstado.style.display = "none";
            inputEstado.disabled = true;
            inputEstado.value = "";
        }
    });