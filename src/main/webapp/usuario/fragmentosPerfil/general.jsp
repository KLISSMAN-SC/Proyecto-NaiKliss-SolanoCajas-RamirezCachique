<%@page import="Beans.Usuario"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String url = request.getContextPath() + "/";
    Usuario usuario = (Usuario) request.getAttribute("usuario");
    
    // Evita errores de NullPointerException en toda la página
    if (usuario == null) {
        usuario = new Usuario(); 
    }
    
    // Helper para facilitar la lectura
    String paisActual = (usuario.getPais() != null) ? usuario.getPais() : "";
    String path = request.getContextPath() + "/img/";
    String avatarActual = usuario.getAvatar();
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Modificar Perfil</title>
</head>
<body>

<form action="<%=url%>UsuarioController" method="GET" >
    <input type="hidden" name="op" value="guardar">

    <div class="profile-header">
        <img src="<%= path + avatarActual %>" class="profile-avatar" ">
        <div>
            <h4 class="mb-1"><%= (usuario.getNombreUsuario() != null) ? usuario.getNombreUsuario() : "Usuario" %></h4>
            <small class="text-muted">Modificar perfil</small>
        </div>
    </div>

    <div class="mb-3">
        <label class="form-label">Nombre de perfil</label> 
        <input type="text" name="nombreUsuario" class="form-control"
            value="<%= (usuario.getNombreUsuario() != null) ? usuario.getNombreUsuario() : "" %>">
    </div>

    <h5 class="section-title">UBICACIÓN</h5>

    <div class="mb-3">
        <label class="form-label">País</label> 
        <select class="form-select" id="selectPais" name="pais">
            <option value="" <%= paisActual.isEmpty() ? "selected" : "" %>>(No mostrar)</option>
            <option value="Perú" <%= "Perú".equals(paisActual) ? "selected" : "" %>>Perú</option>
            <option value="Argentina" <%= "Argentina".equals(paisActual) ? "selected" : "" %>>Argentina</option>
            <option value="México" <%= "México".equals(paisActual) ? "selected" : "" %>>México</option>
        </select>
    </div>

    <div class="mb-3" id="contenedorEstado" style="display: <%= paisActual.isEmpty() ? "none" : "block" %>;">
        <label class="form-label">Estado / Provincia</label> 
        <input type="text" class="form-control" id="inputEstado" name="estado" 
               value="<%= (usuario.getLocalidad() != null) ? usuario.getLocalidad() : "" %>"
               placeholder="Ej. Lima, Buenos Aires, CDMX" 
               <%= paisActual.isEmpty() ? "disabled" : "" %>>
    </div>

    <h5 class="section-title">DESCRIPCIÓN</h5>
    <div class="mb-3">
        <textarea class="form-control" rows="4" name="descripcion" 
            placeholder="Cuéntanos algo sobre ti..."><%= (usuario.getDescripcion() != null) ? usuario.getDescripcion() : "" %></textarea>
    </div>

    <button type="submit" class="btn-save">Guardar cambios</button>
</form>

<script>
    const selectPais = document.getElementById("selectPais");
    const contenedorEstado = document.getElementById("contenedorEstado");
    const inputEstado = document.getElementById("inputEstado");

    selectPais.addEventListener("change", () => {
        if (selectPais.value !== "") {
            contenedorEstado.style.display = "block";
            inputEstado.disabled = false;
        } else {
            contenedorEstado.style.display = "none";
            inputEstado.disabled = true;
            inputEstado.value = "";
        }
    });
</script>
</body>
</html>