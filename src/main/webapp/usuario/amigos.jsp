<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<%
    String url = request.getContextPath() + "/";
%>
<html>
<head>
<meta charset="UTF-8">
<title>Amigos</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

<link rel="stylesheet" href="<%=url%>ScriptCss/css/amigos.css">

</head>
<body>

<jsp:include page="/componente/Navbar.jsp" />

<div class="layout">

    <!-- Sidebar -->
    <ul class="sidebar nav flex-column">
        <li class="nav-item"><a class="nav-link " data-action="cargarAmigos">👥 Tus amigos</a></li>
        <li class="nav-item"><a class="nav-link" data-action="AddAmigos">➕ Añadir amigo</a></li>
        <li class="nav-item"><a class="nav-link" data-action="cargarSolicitudes">📨 Solicitudes</a></li>
    </ul>

    <!-- Contenedor dinámico -->
    <div class="content-box">

        <!-- mensaje bonito -->
        <div id="mensaje-global" class="alert alert-success"></div>

        <div id="contenido">
            <h4>Selecciona una opción del menú</h4>
        </div>
    </div>
</div>

<!-- ========================================= -->
<!--                SCRIPTS SPA                -->
<!-- ========================================= -->
 <script>
    const BASE_URL = "<%=url%>";
   
</script>
<script src="<%=url%>ScriptCss/js/amigos.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>