<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    String url = (String) request.getContextPath()+ "/";
    double saldo = (double) session.getAttribute("saldo");
    double precioTotal = (double) request.getAttribute("precioTotal");
    boolean deshabilitar = saldo < precioTotal;
%>

<div class="billetera-container">

    <!-- INFO SALDO -->
    <div class="info-container mb-3">
        <p class="m-0">
            <strong>Saldo disponible:</strong>
            <span class="<%= deshabilitar ? "text-danger" : "text-success" %>">
                S/. <%=saldo%>
            </span>
        </p>

        <p class="m-0 mt-1">
            <strong>Total a pagar:</strong> S/. <%=precioTotal%>
        </p>
    </div>

    <!-- MENSAJE ESTADO -->
    <% if (deshabilitar) { %>
        <div class="alert alert-warning mt-3">
            ⚠️ Saldo insuficiente para completar la compra.
        </div>
    <% } else { %>
        <div class="alert alert-success mt-3">
            ✔ Saldo suficiente. Puede continuar con la compra.
        </div>
    <% } %>

    <!-- BOTÓN COMPRAR -->
    <div class="text-end mt-4">
        <a href="<%= deshabilitar ? "#" : url + "PagoController?op=realizarCompraBilletera&metodo=Billetera&totalPago=" + precioTotal %>"
           class="btn btn-pago-billetera <%= deshabilitar ? "disabled" : "" %>"
           style="<%= deshabilitar ? "pointer-events:none;opacity:0.6;" : "" %>">
            💳 Comprar con Billetera
        </a>
    </div>

</div>
