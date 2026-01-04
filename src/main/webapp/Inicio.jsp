<%@page import="Beans.Usuario"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%
String url = request.getContextPath();
	

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
	<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css"
	rel="stylesheet">

<title>Inicio</title>

<link rel="stylesheet" href="<%= url %>/ScriptCss/css/inicio.css">

</head>
<body>
	<%

Usuario usuario = (Usuario) request.getAttribute("usuarios");
	request.setAttribute("usuarios", usuario);
%>
	<!-- NAVBAR (NO TOCADO) -->
	<jsp:include page="/componente/Navbar.jsp" />

	<!-- HERO -->
	<section class="hero">
		<h1>NaiKlis</h1>
		<p>Gestiona tu biblioteca, descubre nuevos juegos y conéctate con
			tus amigos</p>
		<a href="<%=url%>/TiendaController?op=asd" class="btn btn-danger">Explorar
			tienda</a> <a
			href="<%=url%>/BibliotecaController?op=listarBibliotecaPersonal"
			class="btn btn-outline-light">Mi biblioteca</a>
	</section>

	<!-- CONTENIDO -->
	<div class="container">

		<h2 class="section-title">Accesos rápidos</h2>
		<p class="section-subtitle">Continúa donde lo dejaste</p>

		<div class="row justify-content-center">

			<div class="col-md-4 col-lg-3 mb-4">
				<a href="<%=url%>/BibliotecaController?op=listarBibliotecaPersonal"
					class="card-link">
					<div class="card">
						<i class="bi bi-collection-fill card-icon"></i>
						<div class="card-title">Mi biblioteca</div>
						<div class="card-subtitle">Todos tus juegos</div>
					</div>
				</a>
			</div>
			<!-- Card Tienda -->
			<div class="col-md-4 col-lg-3 mb-4">
				<a href="<%=url%>/TiendaController?op=asd"
					class="card-link">
					<div class="card">
						<i class="bi bi-cart-fill card-icon"></i>
						<div class="card-title">Tienda</div>
						<div class="card-subtitle">Comprar nuevos títulos</div>
					</div>
				</a>
			</div>

			<!-- Card Amigos -->
			<div class="col-md-4 col-lg-3 mb-4">
				<a href="<%=url%>/usuario/amigos.jsp"
					class="card-link">
					<div class="card">
						<i class="bi bi-people-fill card-icon"></i>
						<div class="card-title">Amigos</div>
						<div class="card-subtitle">Ver bibliotecas</div>
					</div>
				</a>
			</div>
		</div>
	</div>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
