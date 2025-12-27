<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="Beans.*"%>
<%@page import="Model.*"%>

<%
    String url = (String) request.getContextPath()+ "/"; 
    double precioTotal = (double) request.getAttribute("precioTotal");
    Tarjeta tarjeta = (Tarjeta) request.getAttribute("tarjeta");
%>

<form action="PagoController" method="post" class="tarjeta-form">

    <input type="hidden" name="op" value="realizarCompraTarjeta">
    <input type="hidden" name="metodo" value="TARJETA">
    <input type="hidden" name="total" value="<%=precioTotal%>">

<% if (tarjeta != null) { %>

    <!-- TARJETA GUARDADA -->
    <div class="tarjeta-guardada mb-4">

        <div class="tarjeta-visual">
            <div class="tarjeta-header">
                <span>Tarjeta guardada</span>
                <span class="estado-ok">ACTIVA</span>
            </div>

            <div class="tarjeta-numero">
                **** **** **** <%= tarjeta.getUltimos4() %>
            </div>

            <div class="tarjeta-footer">
                <div>
                    <small>Titular</small>
                    <div><%= tarjeta.getTitular() %></div>
                </div>
                <div>
                    <small>Vence</small>
                    <div><%= tarjeta.getFechaVencimiento() %></div>
                </div>
            </div>
        </div>

        <input type="hidden" name="usarTarjetaGuardada" value="true">

    </div>

<% } else { %>

    <!-- DATOS DE TARJETA -->
    <div class="bloque-form mb-4">
        <h5 class="bloque-title">💳 Datos de la tarjeta</h5>

        <div class="row mb-3">
            <div class="col-md-6">
                <label class="label-light">Número de tarjeta</label>
                <input
                    id="numeroTarjeta"
                    name="numeroTarjeta"
                    type="text"
                    class="form-control input-light"
                    placeholder="XXXX XXXX XXXX XXXX"
                    maxlength="19"
                    onkeydown="soloNumeros(event)"
                    oninput="formatearTarjeta(this)">
            </div>

            <div class="col-md-3">
                <label class="label-light">Fecha de caducidad</label>
                <div class="d-flex gap-2">
                    <select name="mes" class="form-select select-light">
                        <option>--</option>
                        <% for(int i=1;i<=12;i++){ %>
                            <option><%=i%></option>
                        <% } %>
                    </select>

                    <select name="anio" class="form-select select-light">
                        <option>----</option>
                        <% for(int i=2025;i<=2050;i++){ %>
                            <option><%=i%></option>
                        <% } %>
                    </select>
                </div>
            </div>

            <div class="col-md-3">
                <label class="label-light">CVV</label>
                <input
                    type="text"
                    id="cvv"
                    name="cvv"
                    class="form-control input-light"
                    placeholder="CVV"
                    maxlength="4"
                    onkeydown="soloNumerosCVV(event)"
                    oninput="limpiarCVV(this)">
            </div>
        </div>
    </div>

    <!-- FACTURACIÓN -->
    <div class="bloque-form mb-4">
        <h5 class="bloque-title">🧾 Información de facturación</h5>

        <div class="row mb-3">
            <div class="col-md-6">
                <label class="label-light">Nombre</label>
                <input type="text" name="nombre" class="form-control input-light">
            </div>

            <div class="col-md-6">
                <label class="label-light">Apellidos</label>
                <input type="text" name="apellido" class="form-control input-light">
            </div>
        </div>

        <div class="row mb-3">
            <div class="col-md-6">
                <label class="label-light">Dirección</label>
                <input type="text" class="form-control input-light">
            </div>

            <div class="col-md-6">
                <label class="label-light">Localidad</label>
                <input type="text" class="form-control input-light">
            </div>
        </div>

        <div class="row mb-3">
            <div class="col-md-6">
                <label class="label-light">Dirección (línea 2)</label>
                <input type="text" class="form-control input-light">
            </div>

            <div class="col-md-6">
                <label class="label-light">Código postal</label>
                <input type="text" class="form-control input-light">
            </div>
        </div>

        <div class="row mb-3">
            <div class="col-md-6">
                <label class="label-light">País</label>
                <select class="form-select select-light">
                    <option>Perú</option>
                    <option>Argentina</option>
                    <option>Chile</option>
                    <option>México</option>
                </select>
            </div>

            <div class="col-md-6">
                <label class="label-light">Teléfono</label>
                <input type="text" class="form-control input-light" maxlength="9">
            </div>
        </div>

        <label class="mt-2">
            <input type="checkbox" name="guardarTarjeta" value="SI">
            Guardar tarjeta para futuros pagos
        </label>
    </div>

<% } %>

    <!-- BOTÓN COMPRAR -->
    <div class="text-end mt-4">
        <button type="submit" class="btn btn-pago-tarjeta">
            💰 Confirmar pago
        </button>
    </div>

</form>

<script>
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
</script>
    