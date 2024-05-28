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
    <title>Manager 2</title>
    
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
    .custom-table-bg {
        background-color: #f8f9fa; /* Remplacez cette couleur par celle de votre choix */
    }
     .table-header {
        background-color: #343a40; /* Couleur de fond des titres */
        color: #ffffff; /* Couleur du texte des titres */
    }
    .table-row:hover {
        background-color: #f2f2f2; /* Couleur de fond au survol */
    }
    .dashboard-body {
        background-color: #ffffff; /* Couleur de fond du corps du tableau de bord */
        /* Autres styles pour le corps du tableau de bord */
    }
    
        .active-red {
    color:  #dc3545;
    font-weight: bold !important;
}
</style>

</head>
<body>

<header>


<nav class="navbar navbar-expand-lg navbar-dark mb-4" style="background-color: black;"><!-- Modifier la classe bg-primary en bg-dark -->
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
          <a href="${pageContext.request.contextPath}/Admin" class="nav-link ">
            <i class="fa-solid fa-user-tie"></i>
            <span>Espace des admins</span>
          </a>
        </li>
        <li class="nav-item">
          <a href="${pageContext.request.contextPath}/ListReservation" class="nav-link ">
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
 
<div class="content-wrapper dashboard-body">
            <!-- Content Header (Page header) -->
            <div class="content-header">
                <div class="container-fluid">
                    <div class="row mb-2">
                        <div class="col-sm-12">
                           <h1 class="m-0 text-dark fs-4" style="text-align: center;"><i class="fas fa-car"></i> Liste des manager</h1>

          

        <hr>
        <div class="container text-right text-end">
        
            <a href="${pageContext.request.contextPath}/Manager2/Form" class="btn btn-success">Ajouter un manager</a>

        </div>
        <div class="container col-10 mx-auto">
        <br>
                <%
List<Document> listManager = (List<Document>) request.getAttribute("listManager");
%>
        
            
       <table class="table table-bordered custom-table-bg">
    <thead class="table-header">
        <tr>
            <th>Num Manager</th>
            <th>Nom</th>
            <th>Prenom</th>
            <th>CIN</th>
            <th>Email</th>
            <th>Adresse</th>
            <th>Action</th>
        </tr>
    </thead>
    <tbody>
        <%-- Loop through the listManager and display each document --%>
        <% for (Document manager : listManager) { %>
            <tr class="table-row">
                <td><%= manager.get("N_manager") %></td>
                <td><%= manager.get("Nom") %></td>
                <td><%= manager.get("Prenom") %></td>
                <td><%= manager.get("CIN") %></td>
                <td><%= manager.get("Login") %></td>
                <td><%= manager.get("adress") %></td>
                <td>
                    <a href="${pageContext.request.contextPath}/Manager2/UpdateManager?id=<%= manager.get("N_manager") %>" class="btn btn-primary">Modifier</a>
                    <a href="${pageContext.request.contextPath}/Manager2/delete?id=<%= manager.get("N_manager") %>" class="btn btn-danger">Supprimer</a>
                </td>
            </tr>
        <% } %>
    </tbody>
</table>
 </div>
                  </div>
                    </div>
                </div>
            </div>
    </div>
</div>
</body>
</html>
