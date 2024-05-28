<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>


<html>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Tableau de bord</title>
    
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="plugins/fontawesome-free/css/all.min.css">
  
    <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
    <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">
    <script src="https://kit.fontawesome.com/ebb1c2c13f.js" crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    
<style>
    /* Ajout d'un trait en dessous */
    .content-header {
        border-bottom: 2px solid #343a40;
    }

    /* Réduction de la taille de la police */
    .content-header h1 {
        font-size: 24px; /* Taille de police réduite */
        vertical-align: middle; /* Alignement vertical avec l'icône */
        display: inline-block; /* Permet l'alignement vertical */
    }

    /* Ajout d'espacement en haut et à gauche */
    .content-header .container-fluid {
        padding-top: 20px; /* Espacement en haut */
        padding-left: 20px; /* Espacement à gauche */
    }

    /* Style pour l'icône */
    .content-header .navbar-brand .icon {
        margin-right: 10px; /* Espacement entre l'icône et le texte */
        vertical-align: middle; /* Alignement vertical avec le texte */
    }
    
    
    
     .cards-row {
        margin-top: 20px;
        margin-left: 15px; /* Marge à gauche */
        margin-right: 15px; /* Marge à droite */
    }

    /* Style pour les petites boîtes */
    .small-box {
        background-color: #dc3545; /* Couleur de fond par défaut */
        color: white; /* Couleur du texte */
        padding: 20px; /* Espacement interne */
        border-radius: 10px; /* Bord arrondi */
        transition: background-color 0.3s ease; /* Animation de transition de couleur */
        overflow: hidden; /* Permet de cacher le débordement pour les icônes */
    }

    /* Style pour le texte à l'intérieur des petites boîtes */
    .small-box .inner h3,
    .small-box .inner p {
        font-size: 24px; /* Taille de la police */
        text-align: center; /* Alignement centré */
    }

    /* Style pour les icônes */
    .small-box .icon {
        font-size: 50px; /* Taille de l'icône */
        text-align: center; /* Alignement centré */
        margin-bottom: 20px; /* Espacement en bas */
        transition: color 0.3s ease; /* Animation de transition de couleur */
    }

    /* Effet d'animation sur le survol */
    .small-box:hover {
        background-color: #c82333; /* Nouvelle couleur de fond au survol */
    }

    /* Effet d'animation sur les icônes au survol */
    .small-box:hover .icon {
        color: rgba(255, 255, 255, 0.5); /* Couleur de l'icône à 50% d'opacité */
    }
    
    
      /* Style pour la carte-header */
    .card-header {
        padding-bottom: 10px; /* Espacement en bas */
    }

    /* Style pour le titre de la carte */
    .card-header .card-title {
        font-size: 18px; /* Taille de police réduite */
        color: #6c757d; /* Couleur de texte grise */
    }

    /* Style pour l'icône */
    .card-header .card-title i {
        margin-right: 10px; /* Espacement entre l'icône et le texte */
        color: #6c757d; /* Couleur de l'icône grise */
    }
    
    
     .card-container {
        margin-top: 20px; /* Marge supérieure */
    }
    
    .active-red {
    color:  #dc3545;
    font-weight: bold !important;
}
    
    .custom-header .card-header {
    background-color: #333; /* Changer la couleur de fond de l'en-tête */
    color: #fff; /* Changer la couleur du texte de l'en-tête */
}
    
    
    
</style>
    


</head>

<body>
<div class="wrapper " style="min-height: 600px ;">

    <nav class="navbar navbar-expand-lg navbar-dark" style="background-color: black;">
 <!-- Modifier la classe bg-primary en bg-dark -->
  <div class="container-fluid">
    <!-- Brand Logo -->
    <a href="#" class="navbar-brand">
     <img src="/DriveAway/images/logocar.png" alt="Logo"  style="width: 100px; height: auto;" >
    </a>

    <!-- Toggle button for mobile -->
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
      aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>

    <!-- Navigation links -->
    <div class="collapse navbar-collapse justify-content-end" id="navbarNav">
      <ul class="navbar-nav">
        <li class="nav-item">
          <a href="${pageContext.request.contextPath}/Dashboard" class="nav-link active-red">
            <i class="fa-solid fa-table-columns"></i>
            <span>Tableau de bord</span>
          </a>
        </li>
        <li class="nav-item">
          <a href="${pageContext.request.contextPath}/Manager2" class="nav-link">
            <i class="fa-solid fa-clipboard-check"></i>
            <span>Espace des Managers</span>
          </a>
        </li>
        <li class="nav-item">
          <a href="${pageContext.request.contextPath}/Admin" class="nav-link">
            <i class="fa-solid fa-user-tie"></i>
            <span>Espace des admins</span>
          </a>
        </li>
        <li class="nav-item">
          <a href="${pageContext.request.contextPath}/ListReservation" class="nav-link">
            <i class="fa-solid fa-car"></i>
            <span>Espace des Réservations</span>
          </a>
        </li>
        <li class="nav-item">
          <a href="LogoutAdmin" class="nav-link">
            <i class="fa-solid fa-arrow-right-from-bracket"></i>
            <span>Déconnexion</span>
          </a>
        </li>
      </ul>
    </div>
  </div>
</nav>


        <div class="content-wrapper">
       	  <div class="container-fluid">
<div class="content-header">
    <div class="container-fluid">
        <div class="row mb-2">
            <div class="col-sm-6">
                <a href="#" class="navbar-brand">
                    <i class="fa-solid fa-table-columns icon"></i> 
                    <h1 class="m-0 text-dark">Tableau de bord</h1>
                </a>
            </div>
        </div>
    </div>
</div>

	<div class="row cards-row">
    <div class="col-lg-3 col-6">
        <a href="${pageContext.request.contextPath}/Client" class="text-dark text-decoration-none">
            <div class="small-box">
                <div class="inner">
                    <h3><%=request.getAttribute("nbrReservation")%></h3>
                    <p>Nombre de réservations</p>
                </div>
                <div class="icon">
                    <i class="fas fa-car-crash"></i>
                </div>
            </div>
        </a>
    </div>
    <div class="col-lg-3 col-6">
        <a href="${pageContext.request.contextPath}/Client" class="text-dark text-decoration-none">
            <div class="small-box">
                <div class="inner">
                    <h3><%=request.getAttribute("nbrClient")%></h3>
                    <p>Nombre de clients</p>
                </div>
                <div class="icon">
                    <i class="fas fa-user"></i>
                </div>
            </div>
        </a>
    </div>
    <div class="col-lg-3 col-6">
        <a href="${pageContext.request.contextPath}/Manager" class="text-dark text-decoration-none">
            <div class="small-box">
                <div class="inner">
                    <h3><%=request.getAttribute("nbrManager")%></h3>
                    <p>Nombre de Managers</p>
                </div>
                <div class="icon">
                    <i class="fas fa-user-check"></i>
                </div>
            </div>
        </a>
    </div>
    <div class="col-lg-3 col-6">
        <a href="${pageContext.request.contextPath}/Voiture" class="text-dark text-decoration-none">
            <div class="small-box">
                <div class="inner">
                    <h3><%=request.getAttribute("nbrVoiture")%></h3>
                    <p>Nombre de voitures</p>
                </div>
                <div class="icon">
                    <i class="fas fa-car"></i>
                </div>
            </div>
        </a>
    </div>
</div>
<!-- Le graphique -->

<div class="row m-4">
    <section class="col connectedSortable chart-container">
        <div class="card card-container custom-header">
            <div class="card-header">
                <h3 class="card-title">
                    <i class="fa-solid fa-chart-simple"></i> Graphique des Réservations par mois
                </h3>
            </div>
            <div class="card-body">
                <div class="tab-content p-0">
                    <div class="chart tab-pane active" id="revenue-chart" style="position: relative;">
                        <canvas id="chart"></canvas>
                    </div>
                </div>
            </div>
        </div>
    </section>
</div>


<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script>
    var months = ${months};
    var counts = ${counts};

    var ctx = document.getElementById('chart').getContext('2d');
    var chart = new Chart(ctx, {
        type: 'line',
        data: {
            labels: months,
            datasets: [{
                label: 'Nombre de réservations confirmées',
                data: counts,
                backgroundColor: 'rgba(255, 99, 132, 0.2)',
                borderColor: 'rgba(255, 99, 132, 1)',
                borderWidth: 1,
                fill: {
                    target: 'origin',
                    above: 'rgba(255, 99, 132, 0.2)'
                }
            }]
        },
        options: {
            scales: {
                y: {
                    beginAtZero: true,
                    ticks: {
                        fontSize: 10 
                    }
                },
                x: {
                    ticks: {
                        fontSize: 10 
                    }
                }
            },
            plugins: {
                legend: {
                    display: false 
                }
            },
            elements: {
                point: {
                    backgroundColor: 'rgba(255, 99, 132, 1)'
                }
            },
            responsive: true,
            maintainAspectRatio: false 
        }
    });

</script>