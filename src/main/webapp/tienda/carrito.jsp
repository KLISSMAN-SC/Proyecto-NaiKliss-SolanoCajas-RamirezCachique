<%@page import="Beans.VideoJuego"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	String url = (String) request.getContextPath()+ "/";
	double saldo = (double) session.getAttribute("saldo");
%>
<html>
<head>
<meta charset="UTF-8">
<title>Carrito</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

<style>
    /* Contenedor centrado como en el dibujo */
    .carrito-container {
        width: 80%;
        margin: 40px auto;
        padding: 25px;
        border: 2px solid #000;
        border-radius: 10px;
        background: #f8f9fa;
    }

    /* Tabla con scroll */
    .tabla-scroll {
        max-height: 250px;
        overflow-y: auto;
    }

    thead th {
        position: sticky;
        top: 0;
        background: #212529;
        color: white;
        z-index: 1;
    }
</style>
</head>

<body>
<jsp:include page="/componente/Navbar.jsp" />

<div class="carrito-container">
    <h2 class="text-center mb-4">Carrito de Compras</h2>

    <!-- BOTÓN Billetera -->
    <div class="mb-3 text-end">
        <a href="<%=url%>TiendaController?op=billetera"
           class="btn btn-warning">
            Saldo : <%=saldo %>
        </a>
    </div>

    <!-- Tabla con scroll -->
    <div class="tabla-scroll">
        <table class="table table-striped table-bordered text-center align-middle">
            <thead class="table-dark">
                <tr>
                    <th>ID</th>
                    <th>Nombre</th>
                    <th>Precio</th>
                    <th>Descripción</th>
                    <th>Desarrollador</th>
                    <th>Categoría</th>
                    <th>Acciones</th>
                </tr>
            </thead>

            <tbody>
                <% 
                List<VideoJuego> lista = (List<VideoJuego>) request.getAttribute("lista");
                int totalJuegos = 0;
                double precioTotal = 0;
                int i=0;
                if (lista != null && !lista.isEmpty()) {
                    for(VideoJuego videojuego : lista) {
                    	i++;
                    	totalJuegos ++;
                    	precioTotal+=videojuego.getPrecio();
                %>

                <tr>
                    <td><%=i%></td>
                    <td><%=videojuego.getNombre()%></td>
                    <td>
                        <% if (videojuego.getPrecio() != 0) { %>
                            S/. <%=videojuego.getPrecio()%>
                        <% } else { %>
                            Gratis
                        <% } %>
                    </td>
                    <td><%=videojuego.getDescripcion()%></td>
                    <td><%=videojuego.getDesarrollador()%></td>
                    <td><%=videojuego.getCategoria()%></td>
                    <td>
                        <a class="btn btn-primary btn-sm"
                        href="<%=url%>TiendaController?op=eliminar&id=<%=videojuego.getIdVideoJuego()%>">
                            eliminar
                        </a>
                    </td>
                </tr>

                <% } } else { %>
                <tr><td colspan="8">Sin resultados</td></tr>
                <% } %>
            </tbody>

        </table>
    </div>

    <!-- Totales -->
    <div class="mt-3">
        <p><strong>Total de juegos:</strong> <%=totalJuegos%></p>
        <p><strong>Precio total:</strong> S/.<%=precioTotal%></p>
    </div>

    <!-- Botones inferiores -->
    <div class="d-flex justify-content-between mt-4">
        <a href="<%=url%>TiendaController?op=listar"
           class="btn btn-secondary">
            Seguir Comprando
        </a>

        <a href="<%=url%>PagoController?op=formularioComprar&precio=<%=precioTotal %>"
           class="btn btn-success">
            CONTINUAR AL PAGO
        </a>
    </div>

</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
