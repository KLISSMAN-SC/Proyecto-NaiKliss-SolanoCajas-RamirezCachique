<%@page import="Beans.Usuario"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<%
String url = request.getContextPath();

%>
<style>
body {
	background-color: #161917;
	font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
	color: #E1E3DB;
}

/* HERO */
.hero {
	background: linear-gradient(135deg, #161917, #70160E);
	padding: 80px 20px;
	text-align: center;
	margin-bottom: 50px;
}

.hero h1 {
	font-size: 3rem;
	font-weight: 800;
	color: #B9030F;
	letter-spacing: 1px;
}

.hero p {
	color: #E1E3DB;
	font-size: 1.15rem;
	margin-top: 10px;
	margin-bottom: 30px;
	opacity: 0.9;
}

.hero .btn {
	padding: 12px 28px;
	border-radius: 30px;
	font-weight: 600;
	margin: 0 8px;
}

/* TITULOS */
.section-title {
	color: #9E0004;
	font-weight: 700;
	text-align: center;
	margin-bottom: 10px;
}

.section-subtitle {
	text-align: center;
	color: #b5b5b5;
	margin-bottom: 40px;
	font-size: 0.95rem;
}

/* CARDS CON ICONOS */
.card {
	border: none;
	border-radius: 20px;
	background-color: #161917;
	box-shadow: 0 12px 30px rgba(0, 0, 0, 0.45);
	transition: transform 0.3s ease, box-shadow 0.3s ease;
	text-align: center;
	padding: 35px 20px;
	cursor: pointer;
}

.card:hover {
	transform: translateY(-10px);
	box-shadow: 0 20px 45px rgba(0, 0, 0, 0.7);
}

.card-icon {
	font-size: 3.5rem;
	color: #B9030F;
	margin-bottom: 15px;
	transition: transform 0.3s ease;
}

.card:hover .card-icon {
	transform: scale(1.15);
}

.card-title {
	font-size: 1.2rem;
	font-weight: 700;
	margin-bottom: 6px;
	color: #E1E3DB;
}

.card-subtitle {
	font-size: 0.9rem;
	color: #b5b5b5;
}

.card-link {
	text-decoration: none;
	color: inherit;
	display: block;
}

.container {
	padding-bottom: 60px;
}
</style>

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
