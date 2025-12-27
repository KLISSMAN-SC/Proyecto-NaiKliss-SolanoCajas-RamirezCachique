<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="Beans.Amistad" %>

<h3 class="mb-4 fw-bold">👥 Tus amigos</h3>

<%
    List<Amistad> lista = (List<Amistad>) request.getAttribute("listar");
    String url = request.getContextPath() + "/";
%>

<% if (lista != null && !lista.isEmpty()) { %>

<div class="row row-cols-1 row-cols-md-2 row-cols-lg-3 g-4">

    <% for (Amistad a : lista) { %>

    <div class="col">

        <a href="<%=url %>BibliotecaController?op=listarBibliotecaAmigo&nombre=<%=a.getNombreAmigo() %>&idAmigo=<%= a.getIdAmigo() %>"
           class="text-decoration-none">

            <div class="card friend-card h-100">

                <div class="card-body text-center">

                    <!-- Avatar simple -->
                    <div class="friend-avatar mb-3">
                        <span><%= a.getNombreAmigo().substring(0,1).toUpperCase() %></span>
                    </div>

                    <h5 class="card-title mb-1">
                        <%= a.getNombreAmigo() %>
                    </h5>

                    <p class="friend-hint">
                        Ver biblioteca
                    </p>

                </div>

            </div>

        </a>

    </div>

    <% } %>

</div>

<% } else { %>

<div class="alert alert-light mt-3">
    Aún no tienes amigos agregados.
</div>

<% } %>

<style>
    /* Cards de amigos */
    .friend-card {
        background-color: #E1E3DB;
        border-radius: 16px;
        border: none;
        box-shadow: 0 15px 30px rgba(0,0,0,0.25);
        transition: all 0.2s ease;
        cursor: pointer;
    }

    .friend-card:hover {
        transform: translateY(-4px);
        box-shadow: 0 20px 40px rgba(0,0,0,0.35);
    }

    /* Avatar */
    .friend-avatar {
        width: 70px;
        height: 70px;
        margin: 0 auto;
        border-radius: 50%;
        background-color: #161917;
        display: flex;
        align-items: center;
        justify-content: center;
    }

    .friend-avatar span {
        color: #E1E3DB;
        font-size: 28px;
        font-weight: 700;
    }

    .friend-card h5 {
        font-weight: 700;
        color: #161917;
    }

    .friend-hint {
        color: #9E0004;
        font-size: 0.9rem;
        font-weight: 600;
    }
</style>
