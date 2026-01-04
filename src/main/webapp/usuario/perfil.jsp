<%@page import="java.util.Collections"%>
<%@page import="Beans.Biblioteca"%>
<%@page import="java.util.List"%>
<%@page import="Beans.Usuario"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    String url = (String) request.getContextPath()+ "/";
    Usuario usuario = (Usuario) request.getAttribute("usuario");
    String path = request.getContextPath() + "/img/";
    String avatarActual = usuario.getAvatar();
    
    int amigos = (int) request.getAttribute("amigos");
    int juegos = (int) request.getAttribute("juegos");
	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Perfil</title>
<link rel="stylesheet" href="<%= url %>ScriptCss/css/perfil.css">
</head>
<body>
	<jsp:include page="/componente/Navbar.jsp" />
	
	<section class="profile-header">
    <div class="profile-header-inner">

        <div class="profile-avatar">
        	
            <img src="<%= path + avatarActual %>">
        </div>

        <div class="profile-info">
            <h2><%= usuario != null ? usuario.getNombreUsuario() : "Usuario" %></h2>
           	<p><%= usuario.getPais() != null ? usuario.getPais() : "" %><%= usuario.getLocalidad() != null ? ","+usuario.getLocalidad() : "" %></p>
            <p><%= usuario.getDescripcion() != null ? usuario.getDescripcion() : "Perfil personal" %></p>
      		<br>
            
        </div>

        <div class="profile-level">
            Nivel
            <span>6</span>
            
        </div>
		<a href="<%=url%>UsuarioController?op=modificar"
           class="btn-profile">
            Modificar perfil
        </a>
        
    </div>
</section>

<section class="profile-content">
	<div class="card-box">
    <h4>Juegos comprados recientemente</h4>
    <div class="activity-list">
    <% 
    List<Biblioteca> listarBiblioteca = (List<Biblioteca>) request.getAttribute("listarBiblioteca");
    
    if (listarBiblioteca != null && !listarBiblioteca.isEmpty()) {
    	Collections.reverse(listarBiblioteca);
        int totalJuegos = listarBiblioteca.size();
        int limite = Math.min(totalJuegos, 3);
         
        for (int i = 0; i < limite; i++) {
            Biblioteca b = listarBiblioteca.get(i);
    %>
        <div class="activity-item-card">
            
            <div class="game-info">
                <strong><%= b.getNombreVideojuego() %></strong>
                <span>Registrado en biblioteca</span>
            </div>
        </div>
    <% 
        } 
    } else { %>
        <p class="text-muted">No hay juegos en tu biblioteca aún.</p>
    <% } %>
    </div>
</div>

    <div>

        <div class="card-box side-box">
            <h5>Estado</h5>
            <p style="color:#B9030F;font-weight:700;">En línea</p>
        </div>

        

        <div class="card-box side-box">
            <h5>Estadísticas</h5>
            <p>Juegos: <strong><%=juegos %></strong></p>
            <p>Amigos: <strong><%=amigos %></strong></p>
        </div>

    </div>

</section>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>