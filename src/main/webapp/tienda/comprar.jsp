<%@ page language="java" contentType="text/html; charset=UTF-8" 
    pageEncoding="UTF-8"%>

<%
    String url = request.getContextPath()+"/";
    double precioTotal = (double) request.getAttribute("precioTotal");
    int idUsuario = (int) request.getAttribute("idUsuario");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Comprar</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="<%=url%>ScriptCss/css/comprar.css">
<link rel="stylesheet" href="<%=url%>ScriptCss/css/compra.css">



</head>
<body>

<jsp:include page="/componente/Navbar.jsp" />

<div class="container mt-4" style="max-width: 900px;">

    <div class="comprar-container">

        <!-- HEADER -->
        <div class="comprar-header">
            <h2 class="comprar-title">💳 Finalizar Compra</h2>
            <span class="badge bg-dark">Usuario ID: <%=idUsuario%></span>
        </div>

        <!-- PASOS (SOLO VISUAL) -->
        <div class="pasos">
            <div class="paso">Carrito</div>
            <div class="paso activo">Pago</div>
            <div class="paso">Confirmación</div>
        </div>

        <!-- MÉTODO DE PAGO -->
        <div class="row mb-4 align-items-end">

            <div class="col-md-6">
                <label class="label-light">Método de pago</label>
                <select id="metodoPago" class="form-select select-light">
                    <option value="">Seleccione un método</option>
                    <option value="Billetera">Billetera</option>
                    <option value="Tarjeta">Tarjeta</option>
                </select>
            </div>

            <div class="col-md-6">
                <div class="info-container">
                    Precio total<br>
                    <span class="text-danger fs-4">
                        S/. <%=precioTotal%>
                    </span>
                </div>
            </div>

        </div>

        <!-- CONTENEDOR DINÁMICO -->
        <div id="contenedor-metodo-pago">
            <p class="texto-ayuda">
                Seleccione un método de pago para continuar
            </p>
        </div>
		<!-- BOTONES INFERIORES -->
<div class="d-flex justify-content-between mt-4">

    <a href="<%=url%>TiendaController?op=listar"
       class="btn btn-seguir">
        ← Volver a la Tienda
    </a>

    <a href="<%=url%>TiendaController?op=verCarrito"
       class="btn btn-pago">
        🛒 Volver al Carrito
    </a>

</div>
		
    </div>
</div>

<script>
    const BASE_URL = "<%=url%>";
    const PRECIO_TOTAL = <%=precioTotal%>;
</script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="<%=url%>ScriptCss/js/comprar.js"></script>

</body>
</html>
