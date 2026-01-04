<%@page import="Model.AmistadModel"%>
<%@page import="Beans.Usuario"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

<%
AmistadModel model2=new AmistadModel();
String url = request.getContextPath();
int id = (int) session.getAttribute("idUsuario");
Usuario usuario = model2.obtenerUsuarioporId(id);
String rol = (String) session.getAttribute("rol");
%>

<meta charset="UTF-8">
<title>Navbar</title>

<link rel="stylesheet" href="<%= url %>/ScriptCss/css/navbar.css">

</head>
<body>

<nav class="navbar navbar-expand-lg navbar-custom">
    <div class="container-fluid">

        <a class="navbar-brand" href="<%=url%>/Inicio.jsp">NaiKlis</a>

        <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
            data-bs-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent"
            aria-expanded="false"
            aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">

            <ul class="navbar-nav me-auto mb-2 mb-lg-0">

                <li class="nav-item">
                    <a class="nav-link" href="<%=url%>/TiendaController?op=asd">
                        TIENDA
                    </a>
                </li>

                <li class="nav-item">
                    <a class="nav-link" href="<%=url%>/BibliotecaController?op=listarBibliotecaPersonal">
                        BIBLIOTECA
                    </a>
                </li>

                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" role="button"
                        data-bs-toggle="dropdown" aria-expanded="false">
                        <%=usuario.getNombreUsuario() %>
                    </a>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="<%=url%>/UsuarioController?op=listarPerfil">Perfil</a></li>
                        <li><a class="dropdown-item" href="<%=url%>/usuario/amigos.jsp">Amigos</a></li>
                        <li><a class="dropdown-item" href="<%=url%>/BibliotecaController?op=formularioReportes">Reportes</a></li>
                        <li><a class="dropdown-item" href="<%=url%>/RecargaController?op=añadirFondos">Añadir Fondos</a></li>
                    </ul>
                </li>

            </ul>

            <ul class="navbar-nav ms-auto">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" role="button"
                        data-bs-toggle="dropdown" aria-expanded="false">
                        OPCIONES
                    </a>
                    <ul class="dropdown-menu dropdown-menu-end">
                        <li><a class="dropdown-item">Rol: <%=usuario.getRol() %></a></li>
                        <li><hr class="dropdown-divider"></li>
                        <li>
                            <a class="dropdown-item" href="<%=url%>/LoginController?op=logout">
                                Cerrar sesión
                            </a>
                        </li>
                    </ul>
                </li>
            </ul>

        </div>
    </div>
</nav>

<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>

</body>
</html>
