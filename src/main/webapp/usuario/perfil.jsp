<%@page import="Beans.Usuario"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Perfil</title>
<style>
/* ====== BASE ====== */
body {
    margin: 0;
    background-color: #161917;
    font-family: Arial, sans-serif;
    color: #E1E3DB;
}

/* ====== PERFIL HEADER ====== */
.profile-header {
    background: linear-gradient(135deg, #70160E, #161917);
    padding: 40px;
}

.profile-header-inner {
    max-width: 1200px;
    margin: auto;
    display: flex;
    align-items: center;
    gap: 30px;
}

/* AVATAR */
.profile-avatar {
    width: 140px;
    height: 140px;
    border-radius: 12px;
    background-color: #E1E3DB;
    padding: 5px;
}

.profile-avatar img {
    width: 100%;
    height: 100%;
    border-radius: 8px;
}

/* INFO */
.profile-info h2 {
    margin: 0;
    font-weight: 800;
}

.profile-info p {
    margin: 6px 0;
    color: #d6d8d0;
    font-size: 0.95rem;
}

/* NIVEL */
.profile-level {
    margin-left: auto;
    background-color: #9E0004;
    padding: 18px 26px;
    border-radius: 14px;
    font-weight: 800;
    text-align: center;
}

.profile-level span {
    display: block;
    font-size: 0.85rem;
    opacity: 0.9;
}

/* ====== CONTENIDO ====== */
.profile-content {
    max-width: 1200px;
    margin: 40px auto;
    display: grid;
    grid-template-columns: 2.3fr 1fr;
    gap: 30px;
}

/* ====== CARD ====== */
.card-box {
    background-color: #E1E3DB;
    color: #161917;
    border-radius: 18px;
    padding: 25px;
    box-shadow: 0 20px 40px rgba(0,0,0,0.4);
}

/* ACTIVIDAD */
.activity-item {
    display: flex;
    gap: 15px;
    padding: 15px 0;
    border-bottom: 1px solid rgba(0,0,0,0.1);
}

.activity-item:last-child {
    border-bottom: none;
}

.activity-item img {
    width: 120px;
    border-radius: 8px;
}

/* PANEL DERECHO */
.side-box {
    margin-bottom: 25px;
}

.badges {
    display: flex;
    gap: 10px;
    margin-top: 10px;
}

.badge-item {
    width: 50px;
    height: 50px;
    background-color: #161917;
    border-radius: 10px;
}

/* BOTÓN */
.btn-profile {
    background-color: #B9030F;
    color: #E1E3DB;
    border: none;
    padding: 10px 18px;
    border-radius: 10px;
    font-weight: 700;
    text-decoration: none;   /* 🔴 CLAVE PARA <a> */
    
    cursor: pointer;
}

.btn-profile:hover {
    background-color: #9E0004;
}

/* RESPONSIVE */
@media (max-width: 900px) {
    .profile-content {
        grid-template-columns: 1fr;
    }

    .profile-header-inner {
        flex-direction: column;
        text-align: center;
    }

    .profile-level {
        margin-left: 0;
    }
}
</style>
</head>
<body>
	<jsp:include page="/componente/Navbar.jsp" />
	<%
    String url = (String) request.getContextPath()+ "/";
    Usuario usuario = (Usuario) request.getAttribute("usuario");
    String path = request.getContextPath() + "/img/";
    String avatarActual = usuario.getAvatar();
	%>
	<!-- ===== HEADER PERFIL ===== -->
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

<!-- ===== CONTENIDO ===== -->
<section class="profile-content">

    <!-- ACTIVIDAD -->
    <div class="card-box">
        <h4>Actividad reciente</h4>

        <div class="activity-item">
            <img src="https://upload.wikimedia.org/wikipedia/en/2/25/Half-Life_2_cover.jpg">
            <div>
                <strong>Half-Life 2</strong>
                <p>Última sesión: 25 Dic 2025</p>
            </div>
        </div>

        <div class="activity-item">
            <img src="https://upload.wikimedia.org/wikipedia/en/thumb/b/ba/Left4Dead2.jpg/250px-Left4Dead2.jpg">
            <div>
                <strong>Left 4 Dead 2</strong>
                <p>Última sesión: 23 Dic 2025</p>
            </div>
        </div>
    </div>

    <!-- PANEL DERECHO -->
    <div>

        <div class="card-box side-box">
            <h5>Estado</h5>
            <p style="color:#B9030F;font-weight:700;">En línea</p>
        </div>

        <div class="card-box side-box">
            <h5>Insignias</h5>
            <div class="badges">
                <div class="badge-item"></div>
                <div class="badge-item"></div>
                <div class="badge-item"></div>
            </div>
        </div>

        <div class="card-box side-box">
            <h5>Estadísticas</h5>
            <p>Juegos: <strong>76</strong></p>
            <p>Amigos: <strong>12</strong></p>
        </div>

    </div>

</section>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>