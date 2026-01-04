<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
String url = request.getContextPath() + "/";
Double saldo = (Double) request.getAttribute("saldo");
if (saldo == null) saldo = 0.0;
%>
<html>
<head>
<meta charset="UTF-8">
<title>Añadir Fondos</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet">

<link rel="stylesheet" href="<%= url %>ScriptCss/css/recargarFondos.css">
</head>

<body>

	<jsp:include page="/componente/Navbar.jsp" />

	<div class="page-wrapper">

		<div class="wallet-container">

			<div class="wallet-header">
				<h2>💳 Añadir fondos a tu cartera</h2>
				<p>Selecciona un monto rápido o ingresa uno personalizado</p>
			</div>
			<div class="saldo-card">
				<div>
					<div class="saldo-badge mb-2">Saldo disponible</div>
					<h3>Tu billetera</h3>
				</div>

				<span>S/. <%=String.format("%.2f", saldo)%></span>
			</div>

			<%
			int[] montos = {15, 30, 75, 150, 300};
			for (int m : montos) {
			%>
			<div class="fondo-item">
				<div>
					<h4>
						Añadir S/.
						<%=m%>.00
					</h4>
					<small>Monto sugerido</small>
				</div>

				<div class="d-flex align-items-center">
					<div class="monto-box">
						S/.
						<%=m%>.00
					</div>
					<a href="<%=url%>RecargaController?op=pagoTarjeta&monto=<%=m%>"
						class="btn-steam"> Añadir fondos </a>
				</div>
			</div>
			<%
			}
			%>

			<div class="divider"></div>

			<!-- Monto personalizado -->
			<div class="custom-amount">
				<div>
					<h4 class="mb-1">Monto personalizado</h4>
					<small>Ingresa el monto que deseas recargar</small>
				</div>

				<div class="d-flex align-items-center">
					<input type="number" min="1" id="montoPersonalizado"
						class="form-control monto-input me-3" placeholder="S/. 0.00">

					<button type="button" class="btn-steam"
						onclick="enviarMontoPersonalizado()">Añadir fondos</button>
				</div>
			</div>

		</div>

	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

	<script>
    const BASE_URL="<%=url%>";
		function enviarMontoPersonalizado() {
			let monto = Number(document.getElementById("montoPersonalizado").value);

			if (isNaN(monto) || monto <= 0) {
				alert("Ingresa un monto válido");
				return;
			}
			window.location.href = BASE_URL
					+ "RecargaController?op=pagoTarjeta&monto=" + monto;
		}
	</script>

</body>
</html>
