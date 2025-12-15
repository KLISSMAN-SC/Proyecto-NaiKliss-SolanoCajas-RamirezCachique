<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    String monto = request.getParameter("monto"); 
    if (monto == null) monto = "0";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Recargar saldo – Información de pago</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

<style>
    body {
        background-color: #1b2838;
        font-family: Arial, sans-serif;
        color: #c7d5e0;
    }

    .card-container {
        background: #2a475e;
        padding: 25px;
        border-radius: 8px;
        width: 80%;
        margin: auto;
        border: 1px solid #00000055;
    }

    .label-light {
        color: #c7d5e0;
        font-weight: bold;
    }

    .input-light, .select-light {
        background-color: #1b2838;
        color: white;
        border: 1px solid #3b4c5c;
    }

    .input-light:focus, .select-light:focus {
        border-color: #66c0f4;
        box-shadow: 0 0 3px #66c0f4;
    }

    .btn-steam {
        background-color: #74b21e;
        color: #000;
        font-weight: bold;
        padding: 10px 25px;
        border-radius: 4px;
        border: none;
        font-size: 18px;
    }

    .btn-steam:hover {
        background-color: #8fd829;
    }

</style>
</head>

<body>

<jsp:include page="/componente/Navbar.jsp" />

<div class="container mt-5 card-container">

    <h2>Confirmar pago</h2>
    <p class="mb-4">Vas a recargar: <strong>S/. <%= monto %></strong></p>

    <form action="RecargaController?op=recargarSaldo" method="post">

        <!-- Monto oculto -->
        <input type="hidden" name="monto" value="<%=monto%>">

        <!-- DATOS DE TARJETA -->
        <div class="row mb-4">
            <div class="col-md-6">
                <label class="label-light">Número de tarjeta</label>
                <input type="text" name="tarjeta" maxlength="19" class="form-control input-light" placeholder="XXXX XXXX XXXX XXXX" required>
            </div>

            <div class="col-md-3">
                <label class="label-light">Fecha de caducidad</label>
                <div class="d-flex gap-2">
                    <select name="mes" class="form-select select-light" required>
                        <option value="">--</option>
                        <% for(int i=1;i<=12;i++){ %>
                            <option><%=i%></option>
                        <% } %>
                    </select>

                    <select name="anio" class="form-select select-light" required>
                        <option value="">----</option>
                        <% for(int i=2025;i<=2050;i++){ %>
                            <option><%=i%></option>
                        <% } %>
                    </select>
                </div>
            </div>

            <div class="col-md-3">
                <label class="label-light">Código de seguridad</label>
                <input type="text" name="cvv" maxlength="3" class="form-control input-light" placeholder="CVV" required>
            </div>
        </div>

        <!-- INFORMACIÓN DE FACTURACIÓN -->
        <h4 class="mt-4 mb-3">Información de facturación</h4>

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
                <label class="label-light">Dirección de facturación</label>
                <input type="text" name="direccion" class="form-control input-light" required>
            </div>

            <div class="col-md-6">
                <label class="label-light">Localidad</label>
                <input type="text" name="localidad" class="form-control input-light" required>
            </div>
        </div>

        <div class="row mb-3">
            <div class="col-md-6">
                <label class="label-light">Dirección de facturación (segunda línea)</label>
                <input type="text" name="direccion2" class="form-control input-light">
            </div>

            <div class="col-md-6">
                <label class="label-light">Código postal o ZIP</label>
                <input type="text" name="zip" class="form-control input-light" required>
            </div>
        </div>

        <div class="row mb-3">
            <div class="col-md-6">
                <label class="label-light">País</label>
                <select name="pais" class="form-select select-light" required>
                    <option>Perú</option>
                    <option>Argentina</option>
                    <option>Chile</option>
                    <option>México</option>
                </select>
            </div>

            <div class="col-md-6">
                <label class="label-light">Teléfono</label>
                <input type="text" name="telefono" maxlength="9" class="form-control input-light" required>
            </div>
        </div>

        <button type="submit" class="btn-steam w-100 mt-4">RECARGAR</button>

    </form>

</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>