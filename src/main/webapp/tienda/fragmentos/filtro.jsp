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

<form action="<%=url%>TiendaController" method="GET" id="formFiltro" class="filtro-form">
    <input type="hidden" name="op" value="filtro">

    <!-- CATEGORIA -->
    <div class="mb-4">
        <label class="form-label filtro-label">Categoría</label>
        <select class="form-select filtro-select" name="categoria">
            <option value="">Todas</option>
            <%
            if (listarCategoria != null && !listarCategoria.isEmpty()) {
                for (Categoria categoria : listarCategoria) {
            %>
            <option value="<%=categoria.getCategoria()%>">
                <%=categoria.getCategoria()%> (<%=categoria.getAbreviatura()%>)
            </option>
            <%
                }
            } else {
            %>
            <option value="" disabled>No hay categorías disponibles</option>
            <%
            }
            %>
        </select>
    </div>

    <!-- PRECIO -->
    <div class="mb-4">
        <label class="form-label filtro-label">Rango de precio</label>
        <div class="row g-3">
            <div class="col-6">
                <input type="number" name="precioMin" class="form-control filtro-input"
                       min="1" placeholder="Precio mínimo">
            </div>
            <div class="col-6">
                <input type="number" name="precioMax" class="form-control filtro-input"
                       min="1" placeholder="Precio máximo">
            </div>
        </div>
    </div>

    <!-- CREADOR -->
    <div class="mb-4">
        <label class="form-label filtro-label">Creador / Desarrollador</label>
        <select class="form-select filtro-select" name="creador">
            <option value="">Todos</option>
            <%
            if (listarCreador != null && !listarCreador.isEmpty()) {
                for (Creador creador : listarCreador) {
            %>
            <option value="<%=creador.getDesarrollador()%>">
                <%=creador.getDesarrollador()%>
            </option>
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

    <!-- BOTONES -->
    <div class="d-flex justify-content-end gap-3 mt-4">
        <button type="submit" class="btn btn-aplicar">
            Aplicar filtros
        </button>
    </div>

</form>

