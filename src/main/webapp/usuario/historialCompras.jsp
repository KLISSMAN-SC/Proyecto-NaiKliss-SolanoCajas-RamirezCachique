<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    String ulr=request.getContextPath() + "/";
   int cantidadVideojuegos= (Integer) request.getAttribute("cantidadJuegos");
   int cantidadAmigos=(Integer) request.getAttribute("cantidadAmigos");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HISTORIAL</title>
</head>
<body>
<jsp:include page="/componente/Navbar.jsp" />
	HISTORIAL
	
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
	
	<div class="container mt-4">
    <div class="row justify-content-center g-3">

        <div class="col-md-3 col-sm-6">
            <div class="card text-center shadow-sm p-2">
                <div class="card-body">
                    <h6 class="card-title mb-1">🎮 Mis Videojuegos</h6>
                    <h3 class="fw-bold text-primary mb-0">
                        <%=cantidadVideojuegos %>
                    </h3>
                    <small class="text-muted">En tu biblioteca</small>
                </div>
            </div>
        </div>

        <div class="col-md-3 col-sm-6">
            <div class="card text-center shadow-sm p-2">
                <div class="card-body">
                    <h6 class="card-title mb-1">👥 Mis Amigos</h6>
                    <h3 class="fw-bold text-success mb-0">
                        <%=cantidadAmigos %>
                    </h3>
                    <small class="text-muted">Agregados</small>
                </div>
            </div>
        </div>

    </div>
</div>
	
</body>
</html>