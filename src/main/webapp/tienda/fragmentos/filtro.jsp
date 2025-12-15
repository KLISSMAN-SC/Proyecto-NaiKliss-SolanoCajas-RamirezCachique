<%@page import="Beans.Creador"%>
<%@page import="Beans.Categoria"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String url = request.getContextPath() + "/";
List<Categoria> listarCategoria = (List<Categoria>) request.getAttribute("listarCategoria");
List<Creador> listarCreador = (List<Creador>) request.getAttribute("listarCreador");
%>
	<form action="<%=url%>TiendaController" method="GET" id="formFiltro">
	<input type="hidden" name="op" value="filtro">
	    <div class="mb-3">
            <label class="form-label fw-bold">Por Categoría</label>
            <select class="form-select" name="categoria">
                <option value="">Todas</option>
                <%
                if (listarCategoria != null && !listarCategoria.isEmpty()) {
                    for (Categoria categoria : listarCategoria) {
                %>
                <option value="<%=categoria.getCategoria()%>"><%=categoria.getCategoria()%> (<%=categoria.getAbreviatura()%>)</option>
                <%
                    }
                } else {
                %>
                <option value="" disabled>No hay categorias disponibles</option>
                <%
                }
                %>
            </select>
        </div>

        <!-- FILTRAR POR PRECIO -->
        <div class="row mb-3">
            <label class="form-label fw-bold">Por Precio</label>

            <div class="col-6">
                <input type="number" name="precioMin" class="form-control" min="1"  name="precioMin" placeholder="Mínimo">
            </div>

            <div class="col-6">
                <input type="number" name="precioMax" class="form-control" min="1" name="precioMax" placeholder="Máximo">
            </div>
        </div>

        <!-- FILTRAR POR CREADOR / DESARROLLADOR -->
        <div class="mb-3">
            <label class="form-label fw-bold">Por Creador</label>
            <select class="form-select" name="creador">
                <option value="">Todos</option>
                <%
                if (listarCreador != null && !listarCreador.isEmpty()) {
                    for (Creador creador : listarCreador) {
                %>
                <option value="<%=creador.getDesarrollador()%>"><%=creador.getDesarrollador()%></option>
                <%
                    }
                } else {
                %>
                <option value="" disabled>No hay creadores disponibles</option>
                <%
                }
                %>
            </select>
        </div>

        
		
        <!-- BOTÓN OK -->
        <div class="text-center mt-4">
        	
            <button type="submit" class="btn btn-primary px-4" >
                OK
            </button>
        </div>
	    
	</form>
	
