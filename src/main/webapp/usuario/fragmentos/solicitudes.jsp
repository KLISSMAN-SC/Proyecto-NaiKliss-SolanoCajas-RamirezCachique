<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="Beans.Amistad"%>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet">

<h3 class="mb-4">📨 Solicitudes de amistad</h3>

<%
List<Amistad> lista = (List<Amistad>) request.getAttribute("listar");
%>

<%
if (lista != null && !lista.isEmpty()) {
%>

<div class="row g-3">

	<%
	for (Amistad a : lista) {
	%>

	<div class="col-md-6">
		<div class="card shadow-sm p-3">

			<div class="d-flex align-items-center">

				<!-- Foto del usuario (o avatar por defecto) -->
				<img src="https://cdn-icons-png.flaticon.com/512/847/847969.png"
					class="rounded-circle me-3" width="60" height="60">

				<div>
					<h5 class="mb-1">
						<strong><%=a.getNombreAmigo()%></strong>
					</h5>
					<p class="text-muted mb-1">Te ha enviado una solicitud de
						amistad.</p>

				</div>

			</div>

			<div class="mt-3 d-flex gap-2">

				<!-- Botón aceptar -->
				<button  class="btn btn-success btn-sm w-50 btn-aceptar"
					data-id="<%=a.getIdAmistad()%>">Aceptar</button> 

				<button  class="btn btn-danger btn-sm w-50 btn-rechazar"
					data-id="<%=a.getIdAmistad()%>">Rechazar</button>

			</div>

		</div>
	</div>

	<%
	}
	%>
</div>

<%
} else {
%>

<div class="alert alert-info mt-3">No tienes solicitudes por el
	momento.</div>

<%
}
%>
