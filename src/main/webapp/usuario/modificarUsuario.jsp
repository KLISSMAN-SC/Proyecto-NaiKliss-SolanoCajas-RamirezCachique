<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="Beans.Usuario"%>

<%
    String url = request.getContextPath() + "/";
    Usuario usuario = (Usuario) request.getAttribute("usuario");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Editar perfil</title>

<!-- Bootstrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- CSS propio -->
<link rel="stylesheet" href="<%= url %>ScriptCss/css/perfil.css">
<link rel="stylesheet" href="<%= url %>ScriptCss/css/avatar.css">
</head>

<body data-avatar-path="<%= request.getContextPath() + "/img/" %>">

<jsp:include page="/componente/Navbar.jsp"/>

<div class="profile-layout">

    <!-- SIDEBAR -->
    <aside class="profile-sidebar">
        <a href="#" class="active" onclick="cargarVista(event, 'general')">General</a>
        <a href="#" onclick="cargarVista(event, 'avatar')">Avatar</a>
    </aside>
	

    <!-- CONTENT -->
    <section class="profile-content" id="contenidoPerfil">
        <jsp:include page="/usuario/fragmentosPerfil/general.jsp" />
    </section>

</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

<!-- JS propio -->
<script src="<%= url %>ScriptCss/js/perfil.js"></script>
<script src="<%= url %>ScriptCss/js/avatar.js"></script>

</body>
</html>

