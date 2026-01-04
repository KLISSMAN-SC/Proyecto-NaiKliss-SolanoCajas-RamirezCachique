<%@ page language="java" contentType="text/html; charset=UTF-8" 
    pageEncoding="UTF-8"%>
<%
	String url = request.getContextPath() + "/";
    String monto = request.getParameter("monto"); 
    if (monto == null) monto = "0";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Recargar saldo – Información de pago</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

<link rel="stylesheet" href="<%= url %>ScriptCss/css/pagoTarjeta.css">
</head>

<body>

<jsp:include page="/componente/Navbar.jsp" />

<div class="page-wrapper">

    <div class="card-main">

        <!-- RESUMEN -->
        <div class="summary-box">
            <span class="chip">Resumen de la operación</span>
            <p class="mb-1">Monto a recargar:</p>
            <strong>S/. <%= monto %></strong>
        </div>

        <form action="RecargaController?op=recargarSaldo" method="post">

            <input type="hidden" name="monto" value="<%=monto%>">

            <!-- DATOS DE TARJETA -->
            <h4 class="section-title">Datos de la tarjeta</h4>

            <div class="row mb-4">
                <div class="col-md-6">
                    <label class="label-light">Número de tarjeta</label>
                    <input type="text" name="tarjeta" maxlength="19"
                           class="form-control input-light"
                           placeholder="XXXX XXXX XXXX XXXX" required>
                </div>

                <div class="col-md-3">
                    <label class="label-light">Fecha</label>
                    <div class="d-flex gap-2">
                        <select name="mes" class="form-select select-light" required>
                            <option value="">MM</option>
                            <% for(int i=1;i<=12;i++){ %>
                                <option><%=i%></option>
                            <% } %>
                        </select>

                        <select name="anio" class="form-select select-light" required>
                            <option value="">AAAA</option>
                            <% for(int i=2025;i<=2050;i++){ %>
                                <option><%=i%></option>
                            <% } %>
                        </select>
                    </div>
                </div>

                <div class="col-md-3">
                    <label class="label-light">CVV</label>
                    <input type="text" name="cvv" maxlength="3"
                           class="form-control input-light"
                           placeholder="CVV" required>
                </div>
            </div>

            <div class="divider"></div>

            <!-- FACTURACIÓN -->
            <h4 class="section-title">Información de facturación</h4>

            <div class="row mb-3">
                <div class="col-md-6">
                    <label class="label-light">Nombre</label>
                    <input type="text" name="nombre" class="form-control input-light" required>
                </div>
                <div class="col-md-6">
                    <label class="label-light">Apellidos</label>
                    <input type="text" name="apellido" class="form-control input-light" required>
                </div>
            </div>

            <div class="row mb-3">
                <div class="col-md-6">
                    <label class="label-light">Dirección</label>
                    <input type="text" name="direccion" class="form-control input-light" required>
                </div>
                <div class="col-md-6">
                    <label class="label-light">Localidad</label>
                    <input type="text" name="localidad" class="form-control input-light" required>
                </div>
            </div>

            <div class="row mb-3">
                <div class="col-md-6">
                    <label class="label-light">Código postal</label>
                    <input type="text" name="zip" class="form-control input-light" required>
                </div>
                <div class="col-md-6">
                    <label class="label-light">País</label>
                    <select name="pais" class="form-select select-light" required>
                        <option>Perú</option>
                        <option>Argentina</option>
                        <option>Chile</option>
                        <option>México</option>
                    </select>
                </div>
            </div>

            <button type="submit" class="btn-main w-100 mt-4">
                Confirmar recarga
            </button>

        </form>

    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
