<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@page import="Beans.*"%>
     <%@page import="Model.*"%>
     <%
     String url = (String) request.getContextPath()+ "/"; 
     double precioTotal = (double) request.getAttribute("precioTotal");
    
   	 Tarjeta tarjeta=(Tarjeta) request.getAttribute("tarjeta");
	   
%>
<form action="PagoController" method="post">

    <input type="hidden" name="op" value="realizarCompraTarjeta">
    <input type="hidden" name="metodo" value="TARJETA">
    <input type="hidden" name="total" value="<%=precioTotal%>">

<%
    if (tarjeta != null) {
%>
    <!-- Tarjeta guardada -->
<div class="row mb-4">
    <div class="col-md-12">

        <div class="card shadow-sm border-0" style="max-width: 420px;">
            <div class="card-body">

                <div class="d-flex justify-content-between align-items-center mb-3">
                    <span class="fw-bold text-success">
                        <i class="bi bi-credit-card"></i> Tarjeta guardada
                    </span>
                    <span class="badge bg-success">Activa</span>
                </div>

                <div class="mb-2 text-muted" style="letter-spacing: 2px; font-size: 1.1rem;">
                    **** **** **** <%= tarjeta.getUltimos4() %>
                </div>

                <div class="row">
                    <div class="col-7">
                        <small class="text-muted">Titular</small>
                        <div class="fw-semibold">
                            <%= tarjeta.getTitular() %>
                        </div>
                    </div>

                    <div class="col-5 text-end">
                        <small class="text-muted">Vence</small>
                        <div class="fw-semibold">
                            <%= tarjeta.getFechaVencimiento() %>
                        </div>
                    </div>
                </div>

                <input type="hidden" name="usarTarjetaGuardada" value="true">

            </div>
        </div>

    </div>
</div>
<%
    } else {
%>
<div class="row mb-4">
    <div class="col-md-6">
        <label class="label-light">Número de tarjeta</label>
        
        <input 
    	id="numeroTarjeta"
    	name="numeroTarjeta"
    	type="text"
    	class="form-control input-light"
    	onkeydown="soloNumeros(event)"
   		placeholder="XXXX XXXX XXXX XXXX"
    	maxlength="19"
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
        <label class="label-light">Código de seguridad</label>
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
<!-- Información de facturación -->
    <h4 class="mt-4 mb-3">INFORMACIÓN DE FACTURACIÓN</h4>

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
            <label class="label-light">Dirección de facturación</label>
            <input type="text" class="form-control input-light">
        </div>

        <div class="col-md-6">
            <label class="label-light">Localidad</label>
            <input type="text" class="form-control input-light">
        </div>
    </div>

    <div class="row mb-3">
        <div class="col-md-6">
            <label class="label-light">Dirección de facturación (segunda línea)</label>
            <input type="text" class="form-control input-light">
        </div>

        <div class="col-md-6">
            <label class="label-light">Código postal o zip</label>
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
     <label>
        <input type="checkbox" name="guardarTarjeta" value="SI">
        Guardar tarjeta para futuros pagos
    </label>
   <%
    }
%>

    <button type="submit" class="btn btn-success">
        COMPRAR
    </button>

   

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
    