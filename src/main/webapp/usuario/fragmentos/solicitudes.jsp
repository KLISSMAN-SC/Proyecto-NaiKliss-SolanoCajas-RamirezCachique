<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="Beans.Amistad"%>

<style>
    .solicitud-card {
        background-color: #E1E3DB;
        border-radius: 16px;
        padding: 20px;
        box-shadow: 0 12px 25px rgba(0,0,0,0.15);
        transition: transform 0.2s ease, box-shadow 0.2s ease;
    }

    .solicitud-card:hover {
        transform: translateY(-3px);
        box-shadow: 0 18px 35px rgba(0,0,0,0.2);
    }

    .solicitud-avatar {
        width: 64px;
        height: 64px;
        border-radius: 50%;
        border: 3px solid #9E0004;
        background-color: #fff;
    }

    .solicitud-nombre {
        font-weight: 700;
        color: #161917;
        margin-bottom: 2px;
    }

    .solicitud-texto {
        font-size: 0.9rem;
        color: #70160E;
        opacity: 0.85;
        margin-bottom: 0;
    }

    .btn-aceptar {
        background-color: #B9030F;
        border: none;
        color: #E1E3DB;
        font-weight: 600;
    }

    .btn-aceptar:hover {
        background-color: #9E0004;
    }

    .btn-rechazar {
        background-color: #161917;
        border: none;
        color: #E1E3DB;
        font-weight: 600;
    }

    .btn-rechazar:hover {
        background-color: #70160E;
    }
</style>

<h3 class="mb-4">📨 Solicitudes de amistad</h3>

<%
List<Amistad> lista = (List<Amistad>) request.getAttribute("listar");

%>

<% if (lista != null && !lista.isEmpty()) { %>

<div class="row g-4">

    <% for (Amistad a : lista) { %>

    <div class="col-md-6">
        <div class="solicitud-card">

            <div class="d-flex align-items-center mb-3">
                <img
                    src="/POOIIPROYECTO1.2.2/img/<%=a.getAvatar()%>"
                    class="solicitud-avatar me-3"
                    >
					
                <div>
                    <div class="solicitud-nombre">
                        <%=a.getNombreAmigo()%>
                    </div>
                    <p class="solicitud-texto">
                        Te ha enviado una solicitud de amistad
                    </p>
                </div>
            </div>

            <div class="d-flex gap-3">
                <button
                    class="btn btn-aceptar w-50 btn-aceptar"
                    data-id="<%=a.getIdAmistad()%>">
                    Aceptar
                </button>

                <button
                    class="btn btn-rechazar w-50 btn-rechazar"
                    data-id="<%=a.getIdAmistad()%>">
                    Rechazar
                </button>
            </div>

        </div>
    </div>

    <% } %>

</div>

<% } else { %>

<div class="alert alert-info mt-3 rounded-3">
    No tienes solicitudes por el momento.
</div>

<% } %>
