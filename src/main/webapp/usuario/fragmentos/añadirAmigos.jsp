<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="container">

    <h3 class="mb-4">Añadir amigos</h3>

    <!-- ============================= -->
    <!--       BUSCAR POR ID           -->
    <!-- ============================= -->
    <div class="card p-3 mb-4">
        <h5>Buscar usuario por ID</h5>

        <form id="buscar-id-form" class="mt-2">
            <div class="input-group">
                <input type="number" name="idUsuario" class="form-control" placeholder="ID del usuario" required>
                <button class="btn btn-primary">Buscar</button>
            </div>
        </form>

        <!-- Resultado de búsqueda por ID -->
        <div id="resultado-busqueda-id" class="mt-3"></div>
    </div>

    <!-- ============================= -->
    <!--     BUSCAR POR NOMBRE         -->
    <!-- ============================= -->
    <div class="card p-3 mb-4">
        <h5>Buscar usuario por nombre</h5>

        <form id="buscar-nombre-form" class="mt-2">
            <div class="input-group">
                <input type="text" name="nombre" class="form-control" placeholder="Nombre de usuario" required>
                <button class="btn btn-primary">Buscar</button>
            </div>
        </form>

        <!-- Resultado de búsqueda por nombre -->
        <div id="resultado-busqueda-nombre" class="mt-3"></div>
    </div>

</div>