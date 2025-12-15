<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String url = (String) request.getContextPath()+ "/";
	double saldo = (double) session.getAttribute("saldo");
	double precioTotal = (double) request.getAttribute("precioTotal");
	boolean deshabilitar = saldo < precioTotal;
%>
	<div class="col-md-6">
        <div class="info-container">
            <p class="m-0"><strong>Saldo de la billetera:</strong> S/.<%=saldo%></p>
        </div>
    </div>
    <br>
    
    <a href="<%= deshabilitar ? "#" : url + "PagoController?op=realizarCompraBilletera&metodo=Billetera&totalPago=" + precioTotal %>"
	   class="btn btn-success <%= deshabilitar ? "disabled" : "" %>"
	   style="<%= deshabilitar ? "pointer-events:none;opacity:0.6;" : "" %>">
	    COMPRAR
	</a>