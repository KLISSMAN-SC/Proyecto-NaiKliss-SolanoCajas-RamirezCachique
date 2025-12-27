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
    <aside class="sidebar">
        <h5 class="sidebar-title">Social</h5>

        <ul class="nav flex-column mt-4">
            <li class="nav-item">
                <a href="#" class="nav-link" data-action="cargarAmigos">👥 Tus amigos</a>
            </li>
            <li class="nav-item">
                <a href="#" class="nav-link" data-action="AddAmigos">➕ Añadir amigo</a>
            </li>
            <li class="nav-item">
                <a href="#" class="nav-link" data-action="cargarSolicitudes">📨 Solicitudes</a>
            </li>
        </ul>
    </aside>

    <!-- Contenido -->
    <main class="content-box">

        <div id="mensaje-global" class="alert alert-success"></div>

        <div class="content-card">
            <div id="contenido" class="content-placeholder">
                <h4>👋 Bienvenido a tu área social</h4>
                <p class="text-muted mt-2">
                    Desde aquí puedes gestionar tus amigos, enviar solicitudes
                    y revisar invitaciones pendientes.
                </p>
            </div>
        </div>

    </main>
</div>

<script>
    const BASE_URL = "<%=url%>";
</script>

<script src="<%=url%>ScriptCss/js/amigos.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>

