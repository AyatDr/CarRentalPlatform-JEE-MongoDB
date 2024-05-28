<!DOCTYPE html>
<html>
<head>
    <title>Voiture</title>
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
        .active-red {
    color:  #dc3545;
    font-weight: bold !important;
}
    </style>
</head>
<body>

<header>
<nav class="navbar navbar-expand-lg navbar-dark mb-4" style="background-color: black;">
  <div class="container-fluid">
    <a href="#" class="navbar-brand">
     <img src="/DriveAway/images/logocar.png" alt="Logo"  style="width: 100px; height: auto;" >
    </a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
      aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>

    <!-- Navigation links -->
    <div class="collapse navbar-collapse justify-content-end" id="navbarNav">
      <ul class="navbar-nav">
        <li class="nav-item">
          <a href="${pageContext.request.contextPath}/Dashboard" class="nav-link ">
            <i class="fa-solid fa-table-columns"></i>
            <span>Tableau de bord</span>
          </a>
        </li>
        <li class="nav-item">
          <a href="${pageContext.request.contextPath}/Manager2" class="nav-link active-red">
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
            <span>Espace des R�servations</span>
          </a>
        </li>
        <li class="nav-item">
          <a href="LogoutAdmin" class="nav-link">
            <i class="fa-solid fa-arrow-right-from-bracket"></i>
            <span>D�connexion</span>
          </a>
        </li>
      </ul>
    </div>
  </div>
</nav>
</header>
 

<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card">
                <div class="card-body">
                    <div class="text-center mb-4">
                        <h1 class="m-0 text-dark">
                            <i class="fas fa-user-tie mr-2"></i>
                            Ajouter un Manager
                        </h1>
                    </div>
                    <form action="${pageContext.request.contextPath}/Manager2/insert" method="post">
                        
                        <div class="row mb-3">
                            <label class="col-sm-2 col-form-label">CIN</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" name="CIN" placeholder="CIN" required="required">
                            </div>
                        </div>
                        <div class="row mb-3">
                            <label class="col-sm-2 col-form-label">Nom</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" name="Nom" placeholder="Nom" required="required">
                            </div>
                        </div>
                        <div class="row mb-3">
                            <label class="col-sm-2 col-form-label">Prenom</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" name="Prenom" placeholder="Prenom" required="required">
                            </div>
                        </div>
                        <div class="row mb-3">
                            <label class="col-sm-2 col-form-label">Email</label>
                            <div class="col-sm-10">
                                <input type="Email" class="form-control" name="Login" placeholder="Email" required="required">
                            </div>
                        </div>
                        <div class="row mb-3">
                            <label class="col-sm-2 col-form-label">Mot de passe</label>
                            <div class="col-sm-10">
                                <input type="Password" class="form-control" name="Password" placeholder="Mot de passe" required="required">
                            </div>
                        </div>
                        <div class="row mb-3">
                            <label class="col-sm-2 col-form-label">Adresse</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" name="adress" placeholder="Adresse" required="required">
                            </div>
                        </div>
                        <div class="row mb-3">
                            <div class="col-sm-10 offset-sm-2 text-end">
                                <button type="submit" class="btn btn-danger float-end">Ajouter</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>


</body>
</html>