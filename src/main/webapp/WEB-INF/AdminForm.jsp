<%@ page language="java"%>
    <%@ page contentType="text/html; charset=UTF-8" %>
    <%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
 <%@ page import="org.bson.Document" %>
 <%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <title>Admin</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="plugins/fontawesome-free/css/all.min.css">
    <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
    <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">
    <script src="https://kit.fontawesome.com/ebb1c2c13f.js" crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
   .btn-danger {
            background-color: #dc3545;
            border-color: #dc3545;
        }

        .btn-danger:hover {
            background-color: #c82333;
            border-color: #bd2130;
        }

        .content-header {
            padding-top: 20px;
            padding-bottom: 20px;
        }

        .content-header h1 {
            display: flex;
            align-items: center;
            margin-bottom: 0;
        }

        .content-header h1 i {
            margin-right: 10px;
        }
        
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
                <img src="/DriveAway/images/logocar.png" alt="Logo" style="width: 100px; height: auto;">
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
                    aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse justify-content-end" id="navbarNav">
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a href="${pageContext.request.contextPath}/Dashboard" class="nav-link active">
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
                        <a href="${pageContext.request.contextPath}/Admin" class="nav-link active-red">
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
</header>

<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card">
                <div class="card-body">
                    <div class="text-center mb-4">
                        <h1 class="m-0 text-dark">
                            <i class="fas fa-car mr-2"></i>
                            Ajout d'admin
                        </h1>
                    </div>
                    <form action="${pageContext.request.contextPath}/Admin/insert" method="post">
                        
                        <div class="row mb-3">
                            <label class="col-sm-2 col-form-label">Login</label>
                            <div class="col-sm-10">
                                <input type="Email" class="form-control" name="Login"  placeholder="Email" required="required">
                            </div>
                        </div>
                        <div class="row mb-3">
                            <label class="col-sm-2 col-form-label">Mot de passe</label>
                            <div class="col-sm-10">
                                <input type="Password" class="form-control" name="Password"   placeholder="Mot de passe" required="required">
                            </div>
                        </div>
                        <div class="row mb-3">
                            <div class="col-sm-10 offset-sm-2">
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
