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
    <title>Réservations</title>
    
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
    <style >
    
        .active-red {
    color:  #dc3545;
    font-weight: bold !important;
}
    </style>


</head>
<body style="background-color: #f8f9fa; color: #343a40;">
<header>
  <div class="wrapper" style="min-height: 600px;">

    <nav class="navbar navbar-expand-lg navbar-dark mb-4" style="background-color: black;"> <!-- Modifier la classe bg-primary en bg-dark -->
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
          <a href="${pageContext.request.contextPath}/Manager2" class="nav-link">
            <i class="fa-solid fa-clipboard-check"></i>
            <span>Espaces des Managers</span>
          </a>
        </li>
        <li class="nav-item">
          <a href="${pageContext.request.contextPath}/Admin" class="nav-link">
            <i class="fa-solid fa-user-tie"></i>
            <span>Espaces des admins</span>
          </a>
        </li>
        <li class="nav-item">
          <a href="${pageContext.request.contextPath}/ListReservation" class="nav-link active-red">
            <i class="fa-solid fa-car"></i>
            <span>Espaces des Réservations</span>
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

<div class="content-wrapper mt-4">
    <!-- Content Header (Page header) -->
    <div class="content-header">
        <div class="container">
            <div class="row">
                <div class="col-sm-12">
                    <h1 class="m-0 text-dark fs-4" style="text-align: center;"><i class="fas fa-car"></i> Liste des réservations</h1>
                    <hr style="border-top: 1px solid #6c757d;">
                    <% List<Document> listReservation = (List<Document>) request.getAttribute("listReservation"); %>
                    <div class="table-responsive"> <!-- Ajout de la classe pour une table responsive -->
                        <table class="table table-bordered table-hover"> <!-- Ajout des classes table-hover et table-bordered -->
                            <thead>
                                <tr>
                                    <th style="background-color: #343a40; color: #ffffff;">Matricule</th>
                                    <th style="background-color: #343a40; color: #ffffff;">Date debut</th>
                                    <th style="background-color: #343a40; color: #ffffff;">Date fin</th>
                                    <th style="background-color: #343a40; color: #ffffff;">mode de paiement</th>
                                    <th style="background-color: #343a40; color: #ffffff;">Total (DH)</th>
                                    <th style="background-color: #343a40; color: #ffffff;">Statut</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%-- Loop through the listVoiture and display each document --%>
                                <% for (Document reservation : listReservation) { %>
                                  <% Document voiture = ((List<Document>) reservation.get("voiture")).get(0); %>
                                
                                    <tr>
                                        <% 
                                        // Récupérer la valeur du statut de la réservation
                                        String status = reservation.getString("status");
                                        
                                        // Déterminer la classe CSS à appliquer en fonction de la valeur du statut
                                        String badgeClass = "";
                                        if (status.equals("Accepté")) {
                                            badgeClass = "badge bg-success"; // Vert pour Accepté
                                        } else if (status.equals("Refusé")) {
                                            badgeClass = "badge bg-danger"; // Rouge pour Refusé
                                        } else if (status.equals("En attente")) {
                                            badgeClass = "badge bg-warning text-dark"; // Jaune pour En attente
                                        }
                                        %>
                                        <td><%= voiture.get("Matricule") %></td>
                                        <td><%= reservation.get("DateDebut") %></td>
                                        <td><%= reservation.get("DateFin") %></td>
                                        <td><%= reservation.get("modePaiement") %></td>
                                        <td><%= reservation.get("Total") %></td>
                                        <td><span class="<%= badgeClass %>"><%= status %></span></td>
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

</header>





</body>
</html>
