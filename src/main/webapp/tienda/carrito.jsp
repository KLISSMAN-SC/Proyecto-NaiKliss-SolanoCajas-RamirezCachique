<%@page import="Beans.VideoJuego"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String url = (String) request.getContextPath()+ "/";
    double saldo = (double) session.getAttribute("saldo");
    boolean deshabilitar =true;
%>
<html>
<head>
<meta charset="UTF-8">
<title>Carrito</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

<style>
    body {
        background-color: #E1E3DB;
    }

    /* CONTENEDOR */
    .carrito-container {
        width: 85%;
        margin: 40px auto;
        padding: 30px;
        border-radius: 18px;
        background: #ffffff;
        box-shadow: 0 15px 30px rgba(0,0,0,0.2);
    }

    /* HEADER */
    .carrito-header {
        display: flex;
        justify-content: space-between;
        align-items: center;
        margin-bottom: 25px;
    }

    .carrito-title {
        color: #9E0004;
        font-weight: 800;
    }

    /* SALDO */
    .saldo-btn {
        background-color: #ffc107;
        font-weight: 700;
        border-radius: 12px;
        padding: 8px 16px;
    }

    /* TABLA */
    .tabla-scroll {
        max-height: 300px;
        overflow-y: auto;
        border-radius: 14px;
        box-shadow: inset 0 0 0 1px #dee2e6;
    }

    thead th {
        position: sticky;
        top: 0;
        background-color: #161917;
        color: #E1E3DB;
        z-index: 5;
        text-align: center;
    }

    tbody tr:hover {
        background-color: rgba(158, 0, 4, 0.08);
    }

    /* PRECIO */
    .precio-gratis {
        color: #9E0004;
        font-weight: 700;
    }

    /* BOTÓN ELIMINAR */
    .btn-eliminar {
        background-color: #9E0004;
        color: #E1E3DB;
        font-weight: 600;
        border-radius: 10px;
        padding: 6px 14px;
    }

    .btn-eliminar:hover {
        background-color: #B9030F;
        color: #fff;
    }

    /* TOTALES */
    .totales {
        background-color: #f8f9fa;
        border-radius: 14px;
        padding: 15px 20px;
        margin-top: 20px;
        font-weight: 600;
    }

    /* BOTONES INFERIORES */
    .btn-seguir {
        background-color: #6c757d;
        color: #fff;
        font-weight: 600;
        border-radius: 12px;
    }

    .btn-pago {
        background-color: #198754;
        color: #fff;
        font-weight: 700;
        border-radius: 12px;
        padding: 10px 22px;
    }

    .btn-pago:hover {
        background-color: #157347;
    }
</style>
</head>

<body>

<jsp:include page="/componente/Navbar.jsp" />

<div class="carrito-container">

    <!-- HEADER -->
    <div class="carrito-header">
        <h2 class="carrito-title">🛒 Carrito de Compras</h2>

        <a href="<%=url%>RecargaController?op=añadirFondos" class="saldo-btn btn">
            Saldo: S/. <%=saldo %>
        </a>
    </div>

    <!-- TABLA -->
    <div class="tabla-scroll">
        <table class="table table-bordered table-hover align-middle text-center mb-0">
            <thead>
                <tr>
                    <th>#</th>
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
                int i = 0;
                
                if (lista != null && !lista.isEmpty()) {
                    for (VideoJuego videojuego : lista) {
                        i++;
                        totalJuegos++;
                        precioTotal += videojuego.getPrecio();
                %>

                <tr>
                    <td><%=i%></td>
                    <td class="fw-bold"><%=videojuego.getNombre()%></td>
                    <td>
                        <% if (videojuego.getPrecio() != 0) { %>
                            S/. <%=videojuego.getPrecio()%>
                        <% } else { %>
                            <span class="precio-gratis">Gratis</span>
                        <% } %>
                    </td>
                    <td><%=videojuego.getDescripcion()%></td>
                    <td><%=videojuego.getDesarrollador()%></td>
                    <td><%=videojuego.getCategoria()%></td>
                    <td>
                        <a class="btn btn-eliminar btn-sm"
                           href="<%=url%>TiendaController?op=eliminar&id=<%=videojuego.getIdVideoJuego()%>">
                            Eliminar
                        </a>
                    </td>
                </tr>

                <% }
                    deshabilitar = totalJuegos < 1;
                    } else { %>
                <tr>
                    <td colspan="7" class="fw-bold">Sin resultados</td>
                </tr>
                <% } %>
            </tbody>
        </table>
    </div>

    <!-- TOTALES -->
    <div class="totales">
        <p>Total de juegos: <strong><%=totalJuegos%></strong></p>
        <p>Precio total: <strong>S/. <%=precioTotal%></strong></p>
    </div>

    <!-- BOTONES -->
    <div class="d-flex justify-content-between mt-4">
        <a href="<%=url%>TiendaController?op=listar" class="btn btn-seguir">
            ← Seguir Comprando
        </a>

       
        <a href="<%= deshabilitar ? "#" : url + "PagoController?op=formularioComprar&precio=" + precioTotal %>"
           class="btn btn-pago <%= deshabilitar ? "disabled" : "" %>"
           style="<%= deshabilitar ? "pointer-events:none;opacity:0.6;" : "" %>">
            Continuar al Pago →
        </a>
    </div>

</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

