<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="Beans.*"%>
<%@page import="java.util.List"%>

<!DOCTYPE html>
<html>
<head>
<%
    String url = request.getContextPath() + "/";
    List<Biblioteca> listarBiblioteca = (List<Biblioteca>) request.getAttribute("listarBiblioteca");
    String nombre = (String) request.getAttribute("nombre");
%>
<meta charset="UTF-8">

<title>Biblioteca</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

<link rel="stylesheet" href="<%= url %>ScriptCss/css/biblioteca.css">
</head>

<body>

    <jsp:include page="/componente/Navbar.jsp" />

    <div class="biblioteca-container">

        <h2 class="biblioteca-title">
             Biblioteca de <span class="text-primary"><%=nombre%></span>
        </h2>

        <div class="tabla-scroll">
            <table class="table table-striped table-bordered text-center align-middle mb-0">
                <thead>
                    <tr>
                        <th>#</th>
                        <th>Nombre</th>
                        <th>Descripción</th>
                        <th>Desarrollador</th>
                        <th>Categoría</th>
                    </tr>
                </thead>

                <tbody>
                <%
                    if (listarBiblioteca != null && !listarBiblioteca.isEmpty()) {
                        int i = 0;
                        for (Biblioteca b : listarBiblioteca) {
                            i++;
                %>
                    <tr>
                        <td><%=i%></td>
                        <td class="fw-semibold"><%=b.getNombreVideojuego()%></td>
                        <td><%=b.getDescripcion()%></td>
                        <td><%=b.getDesarrollador()%></td>
                        <td>
                            <span class="badge bg-secondary">
                                <%=b.getCategoria()%>
                            </span>
                        </td>
                    </tr>
                <%
                        }
                    } else {
                %>
                    <tr>
                        <td colspan="5" class="empty-row">
                            🚫 No hay videojuegos en tu biblioteca
                        </td>
                    </tr>
                <%
                    }
                %>
                </tbody>
            </table>
        </div>

        <!-- Footer visual -->
        <div class="mt-4 text-end text-muted">
            Total de juegos:
            <strong>
                <%= listarBiblioteca != null ? listarBiblioteca.size() : 0 %>
            </strong>
        </div>

    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
