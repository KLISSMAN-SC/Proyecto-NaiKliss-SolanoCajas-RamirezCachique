<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
String url = request.getContextPath() + "/";
double precioTotal = (double) request.getAttribute("precioTotal");
int idUsuario = (int) request.getAttribute("idUsuario");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Confirmación de Compra</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet" href="<%=url%>ScriptCss/css/comprar.css">
<link rel="stylesheet" href="<%=url%>ScriptCss/css/compra.css">


</head>
<body>

	<jsp:include page="/componente/Navbar.jsp" />

	<div class="container mt-4" style="max-width: 900px;">

		<div class="comprar-container">

			<!-- HEADER -->
			<div class="comprar-header">
				<h2 class="comprar-title">✅ Confirmación</h2>
				<span class="badge bg-dark">Usuario ID: <%=idUsuario%></span>
			</div>

			<!-- PASOS -->
			<div class="pasos">
				<div class="paso">Carrito</div>
				<div class="paso">Pago</div>
				<div class="paso activo">Confirmación</div>
			</div>

			<!-- MENSAJE CONFIRMACIÓN -->
			<div class="confirmacion-box text-center my-5">

				<div class="mb-4">
					<span class="confirmacion-icono">🎉</span>
				</div>

				<h3 class="fw-bold text-success mb-3">¡Compra realizada con
					éxito!</h3>

				<p class="text-muted fs-5">Tu compra ha sido procesada
					correctamente.</p>

				<div class="info-container mx-auto mt-4" style="max-width: 320px;">
					Total pagado<br> <span class="text-danger fs-4"> S/. <%=precioTotal%>
					</span>
				</div>

			</div>

			<!-- BOTONES -->
			<div class="d-flex justify-content-center gap-4 mt-5">

				<a href="<%=url%>TiendaController?op=listar"
					class="btn btn-confirmacion-tienda"> ← Volver a la Tienda </a> <a
					href="<%=url%>UsuarioController?op=perfil"
					class="btn btn-confirmacion-compras"> 📦 Ver mis compras </a>

			</div>


		</div>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
