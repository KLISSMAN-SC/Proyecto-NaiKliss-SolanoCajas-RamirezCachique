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

        <div class="d-flex justify-content-between mb-3">
        
            <button class="btn btn-outline-secondary" data-bs-toggle="modal" data-bs-target="#modalFiltros" >
			    Filtrar
			</button>
			<input type="text" id="buscar" class="form-control w-50" placeholder="Buscar" >
			<form action="<%=url%>TiendaController" method="POST">
        	<input type="hidden" name="op" value="verCarrito">
	            
	            <button class="btn btn-outline-dark">🛒 CARRITO</button>
	        </form>
        </div>
        
		<div id="tablaResultados" class="table-responsive" style="max-height: 400px; overflow-y: auto;">
        
        </div>

    </div>
    
	<!-- MODAL -->
	<div class="modal fade" id="modalFiltros" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
	  <div class="modal-dialog modal-lg">
	    <div class="modal-content">
	
	      <div class="modal-header">
	        <h5 class="modal-title">Filtros de Búsqueda</h5>
	        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
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
