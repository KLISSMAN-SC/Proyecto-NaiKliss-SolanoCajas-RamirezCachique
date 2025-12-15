<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String url = request.getContextPath() + "/";
%>
<html>
<head>
<meta charset="UTF-8">
<title>Añadir Fondos</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

<style>
	body {
		background-color: #1b2838;
		font-family: Arial, sans-serif;
		color: #c7d5e0;
	}

	.fondo-item {
		background: linear-gradient(to right, #2a475e, #1b2838);
		padding: 20px;
		border-radius: 8px;
		margin-bottom: 15px;
		display: flex;
		justify-content: space-between;
		align-items: center;
		border: 1px solid #00000055;
	}

	.fondo-item:hover {
		background: linear-gradient(to right, #3b6b8b, #1b2838);
	}

	.monto-box {
		background: #000;
		color: #fff;
		padding: 8px 12px;
		border-radius: 4px;
		font-size: 16px;
		margin-right: 10px;
	}

	.btn-steam {
		background-color: #74b21e;
		color: #000;
		font-weight: bold;
		padding: 8px 16px;
		border-radius: 4px;
		border: none;
	}

	.btn-steam:hover {
		background-color: #8fd829;
	}
</style>

</head>

<body>
<jsp:include page="/componente/Navbar.jsp" />

<div class="container mt-5">

		<h2 class="mb-4">Añadir fondos a tu cartera</h2>
		<%
			int[] montos = {15, 30, 75, 150, 300};
			for (int m : montos) {
		%>

		<div class="fondo-item">
		<div>
		<h4>Añadir S/.<%=m%>.00</h4>
		<small>Nivel mínimo de fondos</small>
		</div>

		<div class="d-flex align-items-center">
			<div class="monto-box">S/.<%=m%>.00</div>

		<!-- Ahora redirige a pagoTarjeta.jsp -->
		<a href="<%=url %>RecargaController?op=pagoTarjeta&monto=<%=m%>" class="btn-steam">
			Añadir fondos
		</a>
		</div>
	</div>
		<% } %>
		<div class="fondo-item">
	<div>
		<h4>Monto personalizado</h4>
		<small>Ingresa el monto que deseas añadir</small>
	</div>

	<div class="d-flex align-items-center">
		<input type="number" min="1" id="montoPersonalizado" class="form-control me-2" style="max-width: 150px;">

		<button type="button" class="btn-steam" onclick="enviarMontoPersonalizado()">
			Añadir fondos
		</button>
	</div>
</div>



	
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script>
	const BASE_URL="<%=url%>";
	function enviarMontoPersonalizado() {
		let monto = Number(document.getElementById("montoPersonalizado").value);

		if (isNaN(monto) || monto <= 0) {
			alert("Ingresa un monto válido");
			return;
		}
		window.location.href = BASE_URL+"RecargaController?op=pagoTarjeta&monto=" + monto;
	}
</script>
</body>
</html>