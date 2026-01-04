<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="Beans.Amistad"%>



<h3 class="mb-4">📨 Solicitudes de amistad</h3>

<%
String url = request.getContextPath() + "/";
List<Amistad> lista = (List<Amistad>) request.getAttribute("listar");

%>
<link rel="stylesheet" href="<%= url %>ScriptCss/css/solicitudes.css">
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
