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

<style>
body {
	background-color: #161917;
	font-family: Arial, sans-serif;
	color: #161917;
}

.page-wrapper {
	max-width: 1100px;
	margin: 50px auto;
	padding: 0 15px;
}

.wallet-container {
	background-color: #E1E3DB;
	border-radius: 18px;
	padding: 40px;
	box-shadow: 0 25px 50px rgba(0, 0, 0, 0.35);
}

.wallet-header {
	text-align: center;
	margin-bottom: 40px;
}

.wallet-header h2 {
	font-weight: 800;
	color: #161917;
	margin-bottom: 10px;
}

.wallet-header p {
	color: #444;
	font-size: 1rem;
}

/* Tarjetas de monto */
.fondo-item {
	background-color: #ffffff;
	border-radius: 14px;
	padding: 22px;
	margin-bottom: 20px;
	border-left: 6px solid #B9030F;
	display: flex;
	justify-content: space-between;
	align-items: center;
	transition: all 0.2s ease;
}

.fondo-item:hover {
	transform: translateY(-2px);
	box-shadow: 0 10px 25px rgba(0, 0, 0, 0.15);
}

.fondo-item h4 {
	margin-bottom: 4px;
	font-weight: 700;
	color: #161917;
}

.fondo-item small {
	color: #555;
}

.monto-box {
	background-color: #161917;
	color: #E1E3DB;
	padding: 8px 14px;
	border-radius: 8px;
	font-size: 16px;
	font-weight: 700;
	margin-right: 14px;
}

.btn-steam {
	background-color: #B9030F;
	color: #fff;
	font-weight: bold;
	padding: 10px 22px;
	border-radius: 10px;
	border: none;
	transition: background-color 0.2s ease, transform 0.1s ease;
}

.btn-steam:hover {
	background-color: #9E0004;
	transform: translateY(-1px);
}

/* Separador */
.divider {
	margin: 40px 0;
	height: 1px;
	background-color: #ccc;
}

/* Monto personalizado */
.custom-amount {
	background-color: #f7f7f4;
	border-radius: 14px;
	padding: 25px;
	display: flex;
	justify-content: space-between;
	align-items: center;
	border: 1px dashed #9E0004;
}

.monto-input {
	max-width: 180px;
	border-radius: 8px;
	border: 1px solid #aaa;
}

.monto-input:focus {
	border-color: #B9030F;
	box-shadow: 0 0 0 0.15rem rgba(185, 3, 15, 0.25);
}

.saldo-card {
	background: linear-gradient(135deg, #161917, #2a2e2b);
	color: #E1E3DB;
	border-radius: 18px;
	padding: 28px 35px;
	margin-bottom: 35px;
	box-shadow: 0 20px 45px rgba(0, 0, 0, 0.4);
	display: flex;
	justify-content: space-between;
	align-items: center;
}

.saldo-card h3 {
	margin: 0;
	font-weight: 800;
}

.saldo-card span {
	font-size: 2.2rem;
	font-weight: 900;
	color: #4CAF50;
}

.saldo-badge {
	background-color: #B9030F;
	padding: 6px 14px;
	border-radius: 20px;
	font-size: 0.9rem;
	font-weight: bold;
}
</style>
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
