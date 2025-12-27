<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

<%
String url = request.getContextPath();
String usuario = (String) session.getAttribute("nombreUsuario");
String rol = (String) session.getAttribute("rol");
%>

<meta charset="UTF-8">
<title>Navbar</title>

<style>
    .navbar-custom {
        background-color: #161917;
        padding: 0.8rem 1.5rem;
        box-shadow: 0 4px 12px rgba(0, 0, 0, 0.4);
    }

    .navbar-brand {
        color: #9E0004 !important;
        font-weight: 800;
        font-size: 1.4rem;
        letter-spacing: 1px;
    }

    .nav-link {
        color: #E1E3DB !important;
        font-weight: 500;
        margin-right: 10px;
        transition: color 0.3s ease, transform 0.2s ease;
    }

    .nav-link:hover {
        color: #B9030F !important;
        transform: translateY(-2px);
    }

    .nav-link.active {
        color: #9E0004 !important;
        font-weight: 600;
    }

    .dropdown-menu {
        background-color: #E1E3DB;
        border-radius: 12px;
        border: none;
        box-shadow: 0 10px 25px rgba(0, 0, 0, 0.25);
        z-index: 9999;
    }

    .dropdown-item {
        color: #161917;
        font-weight: 500;
        transition: background-color 0.3s ease, padding-left 0.3s ease;
    }

    .dropdown-item:hover {
        background-color: #9E0004;
        color: #E1E3DB;
        padding-left: 20px;
    }

    .dropdown-divider {
        border-color: #70160E;
    }

    .navbar-toggler {
        border: none;
    }

    .navbar-toggler-icon {
        filter: invert(1);
    }
</style>

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
                    <a class="nav-link active" href="<%=url%>/TiendaController?op=asd">
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
                        <%=usuario %>
                    </a>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="<%=url%>/usuario/perfil.jsp">Perfil</a></li>
                        <li><a class="dropdown-item" href="<%=url%>/usuario/amigos.jsp">Amigos</a></li>
                        <li><a class="dropdown-item" href="<%=url%>/usuario/historialCompras.jsp">Historial de compras</a></li>
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
                        <li><a class="dropdown-item">Rol: <%=rol %></a></li>
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
