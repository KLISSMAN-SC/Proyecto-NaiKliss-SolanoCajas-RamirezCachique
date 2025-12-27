<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

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

<style>
    

    .add-friends-container {
        max-width: 900px;
        margin-top: 40px;
        margin-bottom: 40px;
    }

    .section-title {
        font-weight: 800;
        color: #161917;
        text-align: center;
    }

    /* Card base */
    .search-card {
        background-color: #E1E3DB;
        border-radius: 18px;
        padding: 24px;
        box-shadow: 0 18px 35px rgba(0,0,0,0.35);
        transition: transform 0.2s ease;
    }

    .search-card:hover {
        transform: translateY(-2px);
    }

    .card-title {
        font-weight: 700;
        color: #161917;
        margin-bottom: 4px;
    }

    .card-subtitle {
        font-size: 0.9rem;
        color: #70160E;
        opacity: 0.85;
        margin-bottom: 10px;
    }

    /* Inputs */
    .custom-input {
        border-radius: 10px 0 0 10px;
        border: 1px solid #9E0004;
        background-color: #fff;
    }

    .custom-input:focus {
        border-color: #B9030F;
        box-shadow: 0 0 0 2px rgba(185,3,15,0.15);
    }

    /* Botón */
    .btn-search {
        background-color: #B9030F;
        color: #E1E3DB;
        font-weight: 700;
        padding: 0 22px;
        border-radius: 0 10px 10px 0;
        border: none;
        transition: background-color 0.2s ease;
    }

    .btn-search:hover {
        background-color: #9E0004;
        color: #E1E3DB;
    }
</style>
