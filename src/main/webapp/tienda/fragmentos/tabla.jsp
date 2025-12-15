<%@page import="Beans.VideoJuego"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<table class="table table-striped table-bordered text-center align-middle">
    <thead class="table-dark">
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
            for(VideoJuego videojuego : lista) {
        %>

        <tr>
            <td><%=videojuego.getIdVideoJuego()%></td>
            <td><%=videojuego.getNombre()%></td>
            <td>
                <% if (videojuego.getPrecio() != 0) { %>
                    S/.<%=videojuego.getPrecio()%>
                <% } else { %>
                    Gratis
                <% } %>
            </td>
            <td><%=videojuego.getDescripcion()%></td>
            <td><%=videojuego.getDesarrollador()%></td>
            <td><%=videojuego.getCategoria()%></td>
            <td>
			    <% 
			        String estado = videojuego.getEstado();
			        String colorClass = "";
			
			        if(estado.equals("Disponible")){
			            colorClass = "p-3 mb-2 bg-success text-white";     // Verde
			        } else if(estado.equals("Carrito")){
			            colorClass = "p-3 mb-2 bg-warning text-dark";     // Amarillo
			        } else if(estado.equals("Biblioteca")){
			            colorClass = "p-3 mb-2 bg-primary text-white";        // Celeste
			        }
			    %>
			
			    <span class="badge <%= colorClass %> text-dark px-3 py-2">
			        <%= estado %>
			    </span>
			</td>
            <td>
            	
                <%
				    boolean desactivar = videojuego.getEstado().equals("Carrito")|| videojuego.getEstado().equals("Biblioteca");
				%>
				
				<a class="btn btn-primary btn-sm <%= desactivar ? "disabled" : "" %>"
				   href="<%= request.getContextPath() %>/TiendaController?op=añadirCarrito&id=<%= videojuego.getIdVideoJuego() %>"
				   <%= desactivar ? "tabindex='-1' aria-disabled='true'" : "" %>>
				    Añadir
				</a>
            </td>
        </tr>

        <% } } else { %>
            <tr><td colspan="8">Sin resultados</td></tr>
        <% } %>
    </tbody>
</table>