<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="Beans.Amistad"%>

<h3 class="mb-4 fw-bold">👥 Tus amigos</h3>

<%
List<Amistad> lista = (List<Amistad>) request.getAttribute("listar");
String url = request.getContextPath() + "/";
%>
<link rel="stylesheet" href="<%= url %>ScriptCss/css/mostrarAmigos.css">
<%
if (lista != null && !lista.isEmpty()) {
%>

<div class="row row-cols-1 row-cols-md-2 row-cols-lg-3 g-4">

	<%
	for (Amistad a : lista) {
	%>

	<div class="col">

		<a
			href="<%=url%>BibliotecaController?op=listarBibliotecaAmigo&nombre=<%=a.getNombreAmigo()%>&idAmigo=<%=a.getIdAmigo()%>"
			class="text-decoration-none">

			<div class="card friend-card h-100">

				<div class="card-body text-center">

					<!-- Avatar simple -->
					<div class="friend-avatar mb-3">
						<img src="/POOIIPROYECTO1.2.2/img/<%=a.getAvatar()%>"
							
							class="img-fluid rounded-circle">
					</div>

					<h5 class="card-title mb-1">
						<%=a.getNombreAmigo()%>
					</h5>

					<p class="friend-hint">Ver biblioteca</p>

				</div>

			</div>

		</a>

	</div>

	<%
	}
	%>

</div>

<%
} else {
%>

<div class="alert alert-light mt-3">Aún no tienes amigos
	agregados.</div>

<%
}
%>

