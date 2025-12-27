<%@page import="Beans.VideoJuego"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String url = request.getContextPath() + "/";
    List<VideoJuego> listarVideojuego = (List<VideoJuego>) request.getAttribute("listarVideojuegos");
%>
<html>
<head>
<meta charset="UTF-8">
<title>Tienda</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="<%=url%>ScriptCss/css/tienda.css">

</head>
<body>

<jsp:include page="/componente/Navbar.jsp" />

<div class="center-container">

    <!-- Barra superior -->
    <div class="tienda-toolbar mb-4">

        <button class="btn btn-filtro" data-bs-toggle="modal" data-bs-target="#modalFiltros">
            🔍 Filtros
        </button>

        <input type="text" id="buscar" class="form-control tienda-buscar" placeholder="Buscar videojuego...">

        <form action="<%=url%>TiendaController" method="POST">
            <input type="hidden" name="op" value="verCarrito">
            <button class="btn btn-carrito">🛒 Carrito</button>
        </form>

    </div>

    <!-- Resultados -->
    <div id="tablaResultados" class="table-responsive tabla-custom">
        <!-- contenido dinámico -->
    </div>

</div>

<!-- MODAL FILTROS -->
<div class="modal fade" id="modalFiltros" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1">
    <div class="modal-dialog modal-lg modal-dialog-centered">
        <div class="modal-content modal-custom">

            <div class="modal-header">
                <h5 class="modal-title">Filtros de búsqueda</h5>
                <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"></button>
            </div>

            <div class="modal-body" id="contenidoFiltros">
                Cargando filtros...
            </div>

        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="<%=url%>ScriptCss/js/tienda.js"></script>

</body>
</html>
