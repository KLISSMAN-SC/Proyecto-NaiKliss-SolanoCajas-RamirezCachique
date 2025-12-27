<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

<title>Inicio</title>

<style>
    body {
        background-color: #E1E3DB;
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    }

    .section-title {
        color: #9E0004;
        font-weight: 700;
        text-align: center;
        margin-bottom: 2rem;
    }

    .card {
        border: none;
        border-radius: 18px;
        overflow: hidden;
        box-shadow: 0 10px 25px rgba(0, 0, 0, 0.12);
        transition: transform 0.3s ease, box-shadow 0.3s ease;
        background-color: #ffffff;
    }

    .card:hover {
        transform: translateY(-8px);
        box-shadow: 0 18px 35px rgba(0, 0, 0, 0.18);
    }

    .card-img-top {
        height: 200px;
        object-fit: cover;
    }

    .card-body {
        background-color: #161917;
        color: #E1E3DB;
        text-align: center;
    }

    .card-text {
        font-size: 1.1rem;
        font-weight: 600;
        margin: 0;
    }

    .container {
        padding-top: 40px;
        padding-bottom: 40px;
    }
</style>

</head>
<body>

    <jsp:include page="/componente/Navbar.jsp" />

    <div class="container">
        <h2 class="section-title">Bienvenido</h2>

        <div class="row justify-content-center">

            <!-- Card 1 -->
            <div class="col-md-4 col-lg-3 mb-4">
                <div class="card">
                    <img src="img/1.jpg" class="card-img-top" alt="Imagen de ejemplo">
                    <div class="card-body">
                        <p class="card-text">Tarjeta 1</p>
                    </div>
                </div>
            </div>

            <!-- Card 2 -->
            <div class="col-md-4 col-lg-3 mb-4">
                <div class="card">
                    <img src="img/1.jpg" class="card-img-top" alt="Imagen de ejemplo">
                    <div class="card-body">
                        <p class="card-text">Tarjeta 2</p>
                    </div>
                </div>
            </div>

            <!-- Card 3 -->
            <div class="col-md-4 col-lg-3 mb-4">
                <div class="card">
                    <img src="img/1.jpg" class="card-img-top" alt="Imagen de ejemplo">
                    <div class="card-body">
                        <p class="card-text">Tarjeta 3</p>
                    </div>
                </div>
            </div>

        </div>
    </div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
