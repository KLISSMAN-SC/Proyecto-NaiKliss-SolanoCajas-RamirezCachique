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