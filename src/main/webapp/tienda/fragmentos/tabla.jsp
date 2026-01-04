<%@page import="Beans.VideoJuego"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<table
	class="table table-hover table-bordered align-middle text-center tabla-tienda">

	<thead>
		<tr>
			<th>ID</th>
			<th>Nombre</th>
			<th>Precio</th>
			<th>Descripción</th>
			<th>Desarrollador</th>
			<th>Categoría</th>
			<th>Estado</th>
			<th>Acciones</th>
		</tr>
	</thead>

	<tbody>
		<%
		List<VideoJuego> lista = (List<VideoJuego>) request.getAttribute("lista");
		if (lista != null && !lista.isEmpty()) {
			for (VideoJuego videojuego : lista) {
		%>

		<tr>
			<td><%=videojuego.getIdVideoJuego()%></td>

			<td class="fw-bold"><%=videojuego.getNombre()%></td>

			<td>
				<%
				if (videojuego.getPrecio() != 0) {
				%> <span class="precio">S/. <%=videojuego.getPrecio()%></span> <%
 } else {
 %> <span class="precio-gratis">Gratis</span> <%
 }
 %>
			</td>

			<td class="descripcion"><%=videojuego.getDescripcion()%></td>

			<td><%=videojuego.getDesarrollador()%></td>
			<td><%=videojuego.getCategoria()%></td>

			<td>
				<%
				String estado = videojuego.getEstado();
				String estadoClass = "";

				if (estado.equals("Disponible")) {
					estadoClass = "estado-disponible";
				} else if (estado.equals("Carrito")) {
					estadoClass = "estado-carrito";
				} else if (estado.equals("Biblioteca")) {
					estadoClass = "estado-biblioteca";
				}
				%> <span class="estado <%=estadoClass%>"> <%=estado%>
			</span>
			</td>

			<td>
				<%
				boolean desactivar = videojuego.getEstado().equals("Carrito") || videojuego.getEstado().equals("Biblioteca");
				%>

				<button class="btn btn-anadir <%= desactivar ? "disabled" : "" %>"
        onclick="agregarAlCarrito(event, <%= videojuego.getIdVideoJuego() %>)"
        <%= desactivar ? "disabled" : "" %>>
    Añadir
</button>
			</td>
		</tr>

		<%
		}
		} else {
		%>
		<tr>
			<td colspan="8" class="text-center fw-bold">Sin resultados</td>
		</tr>
		<%
		}
		%>
	</tbody>
	
</table>


