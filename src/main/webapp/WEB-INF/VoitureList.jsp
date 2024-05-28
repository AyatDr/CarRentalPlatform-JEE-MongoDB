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
    <title>Voiture Management Application</title>
    <link rel="stylesheet"
          href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
          crossorigin="anonymous">
          
     <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
     
     
          
          <style>
          
          .body{
          overflow-x: hidden;
          }
          
        
    .row {
        margin-top: 70px; /* Ajoutez la marge supérieure souhaitée en pixels ou toute autre unité de mesure */
    }
    
          .table-custom {
        background-color: #ccc; /* Gris */
    }

    /* Couleur de fond noir pour l'en-tête */
    .table-custom thead th {
        background-color: #000; /* Noir */
        color: #fff;
    }
    
     .table-custom td,
    .table-custom th {
        text-align: center;
    }
    
     .round-image {
        width: 80px;
        height: 60px;
        border-radius: 50%; /* Rend les coins de l'image circulaires */
        transition: transform 0.3s ease; /* Ajoute une transition fluide lorsqu'il y a un changement de transform */
    }

    /* Styles pour l'effet de zoom au survol */
    .round-image:hover {
        transform: scale(1.1); /* Applique un zoom de 110% lorsque vous survolez l'image */
    }
    
      .table-custom {
        box-shadow: 0 4px 8px rgba(0, 0, 0, 1); /* Ajoute une ombre portée */
    }
    
     /* Style pour le survol des lignes */
    .table-custom tbody tr:hover {
        background-color: #f5f5f5; /* Couleur de fond au survol */
    }
    
    .edit-icon {
        color: green;
    }

    /* Style pour l'icône de suppression (rouge) */
    .delete-icon {
        color: red;
    }
    
      .custom-container {
        background-color: green; /* Couleur de fond rouge */
        padding: 10px; /* Ajoutez un padding pour un meilleur espacement */
        text-align: right; /* Alignement du texte à droite */
    }

    .custom-container  {
        color: white; /* Couleur du texte blanc */
    }
    
    .page-title {
        font-family: Arial, sans-serif; /* Police de caractères */
        font-size: 28px; /* Taille de la police */
        font-weight: bold; /* Gras */
        color: #333; /* Couleur du texte */
        text-align: center; /* Alignement du texte au centre */
        margin-bottom: 20px; /* Marge en bas pour l'espace supplémentaire */
        
    }
    
   
    
    
</style>
</head>
<body>


   
    <%@include file="includes/navBar.jsp" %>
   

<br>

<div class="row ">
    <div class="container ">
        <h3 class="page-title">Liste Des Voitures</h3>
        <br>
      
        <div class="container text-right">
        
            <a  href="${pageContext.request.contextPath}/Voiture/Form" class="btn  custom-container">Ajouter Nouvelle Voiture</a>

        </div>
        <br>
                <%
                 List<Document> listVoiture = (List<Document>) request.getAttribute("listVoiture");
                %>
        
            
        <table class="table table-bordered table-custom">
            <thead>
            <tr>
            <th>Voiture</th>
            <th>Matricule</th>
            <th>Marque</th>
           
            <th>Kilometrage</th>
            <th>Annee</th>
           
            <th>Couleur</th>
            <th>Prix</th>
             <th colspan="2">Action</th>
            </tr>
            </thead>
           
            <tbody>
           <%-- Loop through the listVoiture and display each document --%>
            <% for (Document voiture : listVoiture) { %>
                <tr>
                <% String imageUrl = voiture.getString("Image"); %>
                <tr>
                <td><img class="round-image" width="80px" height="60px"  src="<%= imageUrl %>" alt="product image" /></td>
                  <td><%= voiture.get("Matricule") %></td>
                  <td><%= voiture.get("Marque") %></td>
                 
                  <td><%= voiture.get("Kilométrage") %></td>
                  <td><%= voiture.get("Année") %></td>
                
                  <td><%= voiture.get("Couleur") %></td>
                   <td><%= voiture.get("Prix") %></td>
                  <%String action = request.getServletPath(); %>
                  
                 <td>
    <a href="${pageContext.request.contextPath}/Voiture/UpdateVoiture?id=<%= voiture.get("Matricule") %>">
        <i class="fas fa-edit edit-icon"></i> <!-- Icône d'édition -->
    </a>
</td>
<td>
    <a href="${pageContext.request.contextPath}/Voiture/delete?id=<%= voiture.get("Matricule") %>">
        <i class="fas fa-trash-alt delete-icon"></i> <!-- Icône de suppression -->
    </a>
</td>


                    <!-- Access other properties of the voiture document -->
                </tr>
            <% } %>
        </tbody>
    </table>
    </div>
</div>
</body>
</html>

