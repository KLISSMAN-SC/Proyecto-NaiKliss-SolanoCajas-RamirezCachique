<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String url = request.getContextPath() + "/";

%>
<link rel="stylesheet" href="<%= url %>ScriptCss/css/añadirAmigos.css">
<div class="container add-friends-container">

    <h3 class="section-title mb-4">➕ Añadir amigos</h3>

    <!-- ============================= -->
    <!--       BUSCAR POR ID           -->
    <!-- ============================= -->
    <div class="search-card mb-4">

        <h5 class="card-title">Buscar usuario por ID</h5>
        <p class="card-subtitle">Encuentra a un usuario usando su identificador</p>

        <form id="buscar-id-form" class="mt-3">
            <div class="input-group">
                <input type="number"
                       name="idUsuario"
                       class="form-control custom-input"
                       placeholder="ID del usuario"
                       required>

                <button class="btn btn-search">
                    Buscar
                </button>
            </div>
        </form>

        <!-- Resultado de búsqueda por ID -->
        <div id="resultado-busqueda-id" class="mt-3"></div>
    </div>

    <!-- ============================= -->
    <!--     BUSCAR POR NOMBRE         -->
    <!-- ============================= -->
    <div class="search-card mb-4">

        <h5 class="card-title">Buscar usuario por nombre</h5>
        <p class="card-subtitle">Busca a tus amigos por su nombre de usuario</p>

        <form id="buscar-nombre-form" class="mt-3">
            <div class="input-group">
                <input type="text"
                       name="nombre"
                       class="form-control custom-input"
                       placeholder="Nombre de usuario"
                       required>

                <button class="btn btn-search">
                    Buscar
                </button>
            </div>
        </form>

        <!-- Resultado de búsqueda por nombre -->
        <div id="resultado-busqueda-nombre" class="mt-3"></div>
    </div>

</div>


