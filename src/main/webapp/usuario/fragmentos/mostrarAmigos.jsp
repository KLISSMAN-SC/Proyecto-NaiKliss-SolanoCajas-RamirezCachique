<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="Beans.Amistad" %>

<h3 class="mb-4">Tus amigos</h3>

<%
    List<Amistad> lista = (List<Amistad>) request.getAttribute("listar");
	String url=request.getContextPath() + "/";
%>

<% if (lista != null && !lista.isEmpty()) { %>

<div class="row row-cols-1 row-cols-md-2 row-cols-lg-3 g-4">

    <% for (Amistad a : lista) { %>

    <div class="col">
       
        <a href="<%=url %>BibliotecaController?op=listarBibliotecaAmigo&nombre=<%=a.getNombreAmigo() %>&idAmigo=<%= a.getIdAmigo() %>"
   			class="text-decoration-none text-dark">

    		<div class="card shadow-sm" style="cursor:pointer;">
        <div class="card-body text-center">

            <h5 class="card-title">
                <%= a.getNombreAmigo() %>
            </h5>

            <p class="text-secondary">Tocar para ver biblioteca</p>

        </div>
    </div>

</a>
        
    </div>

    <% } %>

</div>

<% } else { %>
    <p class="mt-3">Aún no tienes amigos agregados.</p>
<% } %>