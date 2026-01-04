
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="Beans.*"%>
<%@page import="java.util.List"%>
<%
String ulr = request.getContextPath() + "/";
int cantidadVideojuegos = (Integer) request.getAttribute("cantidadJuegos");
int cantidadAmigos = (Integer) request.getAttribute("cantidadAmigos");
List<Biblioteca> b = (List<Biblioteca>) request.getAttribute("lista");
List<Amistad> a = (List<Amistad>) request.getAttribute("lista2");
Biblioteca categoria = (Biblioteca) request.getAttribute("categoriaFav");
double totalAcumulado = (Double) request.getAttribute("totalAcumulado");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="<%= ulr %>ScriptCss/css/reportes.css">
<title>HISTORIAL</title>
</head>
<body>
	<jsp:include page="/componente/Navbar.jsp" />


	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

	<div class="container my-4">

		<div class="row g-4">

			<!-- ================== COLUMNA IZQUIERDA ================== -->
			<!-- CARDS -->
			<div class="col-lg-4 col-md-12">

				<!-- Mis videojuegos -->
				<div class="card card-dashboard text-center shadow-sm mb-4">
					<div class="card-body">
						<h6 class="card-title-dashboard">🎮 Mis Videojuegos</h6>
						<h2 class="card-number-dashboard text-videojuegos">
							<%=cantidadVideojuegos%>
						</h2>
						<small class="card-subtitle-dashboard"> En tu biblioteca </small>
					</div>
				</div>

				<!-- Mis amigos -->
				<div class="card card-dashboard text-center shadow-sm mb-4">
					<div class="card-body">
						<h6 class="card-title-dashboard">👥 Mis Amigos</h6>
						<h2 class="card-number-dashboard text-amigos">
							<%=cantidadAmigos%>
						</h2>
						<small class="card-subtitle-dashboard"> Agregados </small>
					</div>
				</div>

				<!-- Categoría favorita -->
				<div class="card card-dashboard text-center shadow-sm mb-4">
					<div class="card-body">
						<h6 class="card-title-dashboard">⭐ Categoría favorita</h6>
						<h3 class="card-number-dashboard text-videojuegos">
							<%=categoria != null ? categoria.getCategoria() : "—"%>
						</h3>
						<small class="card-subtitle-dashboard"> <%=categoria != null ? categoria.getCantidad() + " juegos" : "Sin datos"%>
						</small>
					</div>
				</div>
				<!-- Saldo Gastado -->
				<div class="card card-dashboard text-center shadow-sm mb-4">
					<div class="card-body">
						<h6 class="card-title-dashboard">💰 Saldo gastado</h6>
						<h2 class="card-number-dashboard text-saldo">
							S/.
							<%=String.format("%.2f", totalAcumulado)%>
						</h2>
						<small class="card-subtitle-dashboard">Total en compras</small>
					</div>
				</div>
			</div>

			<!-- ================== COLUMNA DERECHA ================== -->
			<!-- GRAFICOS -->
			<div class="col-lg-8 col-md-12">

				<!-- Gráfico de barras -->
				<div class="card card-grafico shadow-sm mb-4">
					<div class="card-body">
						<h5 class="text-center mb-4">🎮 Videojuegos por Categoría</h5>
						<canvas id="graficoCategorias" height="100"></canvas>
					</div>
				</div>

				<!-- Gráfico pastel -->
				<div class="card card-grafico shadow-sm">
					<div class="card-body">
						<h5 class="text-center mb-4">👥 Juegos de mis Amigos</h5>
						<canvas id="graficoAmigos" height="10"></canvas>
					</div>
				</div>

			</div>

		</div>

	</div>

	<script>
    const categorias = [
        <%for (Biblioteca item : b) {%>
            "<%=item.getCategoria()%>",
        <%}%>
    ];

    const cantidades = [
        <%for (Biblioteca item : b) {%>
            <%=item.getCantidad()%>,
        <%}%>
    ];

    const amigos = [
        <%for (Amistad item : a) {%>
            "<%=item.getNombreAmigo()%>",
        <%}%>
    ];

    const juegosAmigos = [
        <%for (Amistad item : a) {%>
            <%=item.getCantidad()%>,
        <%}%>
    ];
</script>
	<script src="<%= ulr %>ScriptCss/js/reportes.js"></script>
	
</body>
</html>