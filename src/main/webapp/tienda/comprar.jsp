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

<style>
    body {
        background-color: #E1E3DB;
    }

    /* CONTENEDOR PRINCIPAL */
    .comprar-container {
        background-color: #ffffff;
        border-radius: 20px;
        padding: 30px;
        box-shadow: 0 15px 30px rgba(0,0,0,0.2);
    }

    /* HEADER */
    .comprar-header {
        display: flex;
        justify-content: space-between;
        align-items: center;
        margin-bottom: 25px;
    }

    .comprar-title {
        font-weight: 800;
        color: #9E0004;
    }

    /* PASOS (VISUAL) */
    .pasos {
        display: flex;
        justify-content: space-between;
        margin-bottom: 30px;
    }

    .paso {
        flex: 1;
        text-align: center;
        padding: 12px;
        border-radius: 14px;
        font-weight: 600;
        background-color: #f8f9fa;
        margin: 0 5px;
        color: #6c757d;
    }

    .paso.activo {
        background-color: #161917;
        color: #E1E3DB;
    }

    /* LABELS */
    .label-light {
        font-weight: 700;
        margin-bottom: 6px;
        color: #161917;
    }

    /* SELECT */
    .select-light {
        border-radius: 12px;
        border: 2px solid #161917;
        padding: 10px 14px;
    }

    .select-light:focus {
        border-color: #9E0004;
        box-shadow: 0 0 0 0.15rem rgba(158,0,4,0.25);
    }

    /* INFO */
    .info-container {
        background-color: #f8f9fa;
        border-radius: 14px;
        padding: 18px;
        font-weight: 700;
        font-size: 1.1rem;
        text-align: center;
    }

    /* FORM DINÁMICO */
    #contenedor-metodo-pago {
        margin-top: 30px;
        padding: 25px;
        border-radius: 18px;
        background-color: #ffffff;
        border: 2px dashed #dee2e6;
        min-height: 120px;
    }

    /* TEXTO AYUDA */
    .texto-ayuda {
        text-align: center;
        color: #6c757d;
        font-style: italic;
    }
</style>

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
