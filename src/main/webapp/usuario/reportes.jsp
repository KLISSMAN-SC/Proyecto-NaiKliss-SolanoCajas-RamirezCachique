
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="Beans.*"%>
<%@page import="java.util.List"%>
<%
String ulr = request.getContextPath() + "/";
int cantidadVideojuegos = (Integer) request.getAttribute("cantidadJuegos");
int cantidadAmigos = (Integer) request.getAttribute("cantidadAmigos");
List<Biblioteca> b = (List<Biblioteca>) request.getAttribute("lista");
List<Amistad> a = (List<Amistad>) request.getAttribute("lista2");
Biblioteca categoria = (Biblioteca) request.getAttribute("categoriaFav");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
:root {
	--rojo-principal: #B9030F;
	--rojo-secundario: #9E0004;
	--rojo-oscuro: #70160E;
	--negro: #161917;
	--blanco-suave: #E1E3DB;
}

/* Cards */
.card-dashboard {
	border-radius: 14px;
	background-color: var(--blanco-suave);
	border: none;
	transition: transform 0.25s ease, box-shadow 0.25s ease;
	animation: fadeUp 0.6s ease forwards;
}

.card-dashboard:hover {
	transform: translateY(-6px);
	box-shadow: 0 10px 25px rgba(22, 25, 23, 0.25);
}

.card-title-dashboard {
	font-size: 18px;
	font-weight: 600;
	color: var(--negro);
}

.card-subtitle-dashboard {
	font-size: 14px;
	color: #444;
}

.card-number-dashboard {
	font-size: 42px;
	font-weight: 700;
	line-height: 1;
}

/* Colores numéricos */
.text-videojuegos {
	color: var(--rojo-principal);
}

.text-amigos {
	color: var(--rojo-secundario);
}

/* Card del gráfico */
.card-grafico {
	background-color: var(--blanco-suave);
	border-radius: 16px;
	height: 280px; 
	
}
.card-grafico .card-body {
    display: flex;
    flex-direction: column;
    justify-content: center;
}

.card-grafico canvas {
    max-height: 200px;
}
@
keyframes fadeUp {from { opacity:0;
	transform: translateY(20px);
}

to {
	opacity: 1;
	transform: translateY(0);
}
}
.
</style>
<title>HISTORIAL</title>
</head>
<body>
	<jsp:include page="/componente/Navbar.jsp" />


	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

	<div class="container my-4">

		<div class="row g-4">

			<!-- ================== COLUMNA IZQUIERDA ================== -->
			<!-- CARDS -->
			<div class="col-lg-4 col-md-12">

				<!-- Mis videojuegos -->
				<div class="card card-dashboard text-center shadow-sm mb-4">
					<div class="card-body">
						<h6 class="card-title-dashboard">🎮 Mis Videojuegos</h6>
						<h2 class="card-number-dashboard text-videojuegos">
							<%=cantidadVideojuegos%>
						</h2>
						<small class="card-subtitle-dashboard"> En tu biblioteca </small>
					</div>
				</div>

				<!-- Mis amigos -->
				<div class="card card-dashboard text-center shadow-sm mb-4">
					<div class="card-body">
						<h6 class="card-title-dashboard">👥 Mis Amigos</h6>
						<h2 class="card-number-dashboard text-amigos">
							<%=cantidadAmigos%>
						</h2>
						<small class="card-subtitle-dashboard"> Agregados </small>
					</div>
				</div>

				<!-- Categoría favorita -->
				<div class="card card-dashboard text-center shadow-sm">
					<div class="card-body">
						<h6 class="card-title-dashboard">⭐ Categoría favorita</h6>
						<h3 class="card-number-dashboard text-videojuegos">
							<%=categoria != null ? categoria.getCategoria() : "—"%>
						</h3>
						<small class="card-subtitle-dashboard"> <%=categoria != null ? categoria.getCantidad() + " juegos" : "Sin datos"%>
						</small>
					</div>
				</div>

			</div>

			<!-- ================== COLUMNA DERECHA ================== -->
			<!-- GRAFICOS -->
			<div class="col-lg-8 col-md-12">

				<!-- Gráfico de barras -->
				<div class="card card-grafico shadow-sm mb-4">
					<div class="card-body">
						<h5 class="text-center mb-4">🎮 Videojuegos por Categoría</h5>
						<canvas id="graficoCategorias" height="100"></canvas>
					</div>
				</div>

				<!-- Gráfico pastel -->
				<div class="card card-grafico shadow-sm">
					<div class="card-body">
						<h5 class="text-center mb-4">👥 Juegos de mis Amigos</h5>
						<canvas id="graficoAmigos" height="10"></canvas>
					</div>
				</div>

			</div>

		</div>

	</div>

	<script>
    const categorias = [
        <%for (Biblioteca item : b) {%>
            "<%=item.getCategoria()%>",
        <%}%>
    ];

    const cantidades = [
        <%for (Biblioteca item : b) {%>
            <%=item.getCantidad()%>,
        <%}%>
    ];
</script>
	<script>
    const amigos = [
        <%for (Amistad item : a) {%>
            "<%=item.getNombreAmigo()%>",
        <%}%>
    ];

    const juegosAmigos = [
        <%for (Amistad item : a) {%>
            <%=item.getCantidad()%>,
        <%}%>
    ];
</script>
	<script>
    const ctx = document.getElementById('graficoCategorias').getContext('2d');

    new Chart(ctx, {
        type: 'bar',
        data: {
            labels: categorias,
            datasets: [{
                label: 'Cantidad de videojuegos',
                data: cantidades,
                backgroundColor: [
                    '#B9030F',
                    '#9E0004',
                    '#70160E',
                    '#B9030F',
                    '#9E0004',
                    '#70160E'
                ],
                borderRadius: 10
            }]
        },
        options: {
            responsive: true,
            maintainAspectRatio: false,
            animation: {
                duration: 1200,
                easing: 'easeOutQuart'
            },
            animations: {
                y: {
                    from: 0
                }
            },
            plugins: {
                legend: {
                    display: false
                }
            },
            scales: {
                x: {
                    ticks: {
                        color: '#161917',
                        font: {
                            size: 14,
                            weight: 'bold'
                        }
                    }
                },
                y: {
                    beginAtZero: true,
                    ticks: {
                        stepSize: 1,
                        color: '#161917',
                        font: {
                            size: 14,
                            weight: 'bold'
                        }
                    }
                }
            }
        }
    });
</script>
	<script>
const ctxAmigos = document.getElementById('graficoAmigos').getContext('2d');

new Chart(ctxAmigos, {
    type: 'pie',
    data: {
        labels: amigos,
        datasets: [{
            data: juegosAmigos,
            backgroundColor: [
                '#B9030F',
                '#9E0004',
                '#70160E',
                '#B9030F99',
                '#9E000499',
                '#70160E99'
            ],
            borderWidth: 2,
            borderColor: '#E1E3DB'
        }]
    },
    options: {
        responsive: true,
        maintainAspectRatio: false,
        animation: {
            animateRotate: true,
            duration: 1200,
            easing: 'easeOutQuart'
        },
        plugins: {
            legend: {
                position: 'bottom',
                labels: {
                    color: '#161917',
                    font: {
                        size: 13,
                        weight: 'bold'
                    }
                }
            }
        }
    }
});
</script>
</body>
</html>