<%@ page language="java"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page import="org.bson.Document" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
 <%@include file="includes/navBar.jsp" %>
 
 
    
   <br/><br/><br/>


    
   
 <%
List<Document> voituresReservees = (List<Document>) request.getAttribute("reservations");
 
%>

<%-- Vérifiez si la liste des voitures réservées est vide --%>

 <h1>Decouvrez les differentes reservations</h1>
<section class="product-section" class="section-p1">
  <div class="pro-collection">
 
    <%-- Parcourez la liste des réservations de voiture --%>
    <% for (Document reservation : voituresReservees) { %>
    	
      <%-- Récupérer la liste de voitures de la réservation --%>
      <% Document voiture = ((List<Document>) reservation.get("voiture")).get(0); %>


      <%-- Vérifiez si la liste de voitures existe et n'est pas vide --%>
      <% if (voiture != null && !voiture.isEmpty()) { %>
      
        <%-- Parcourez la liste des voitures --%>
        
        
          <% String imageUrl = voiture.getString("Image"); %>

          <div class="product-cart">
            <img src="<%= imageUrl %>" alt="product image" />
             <%-- Afficher les détails de la réservation --%>
            <%
              // Instancier un objet SimpleDateFormat avec le format souhaité
              SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");

              // Récupérer les dates de début et de fin
              Date dateDebut = (Date) reservation.get("DateDebut");
              Date dateFin = (Date) reservation.get("DateFin");

              // Formater les dates en chaînes de caractères
              String dateDebutStr = dateFormat.format(dateDebut);
              String dateFinStr = dateFormat.format(dateFin);
            %>

            <p><strong>De:</strong> <%= dateDebutStr %> &nbsp;&nbsp;&nbsp; <strong>A:</strong> <%= dateFinStr %></p>
            <p><strong>Matricule:</strong> <span> <%= voiture.getString("Matricule") %>&nbsp;&nbsp;</span><strong> Marque:</strong> <span> <%= voiture.getString("Marque") %></span></p>
            
            <p><strong>Klm :</strong><%= voiture.getInteger("Kilométrage") %> Km &nbsp;&nbsp;&nbsp;<strong>Annee : </strong><%= voiture.getInteger("Année") %></p> 
            <p><strong> paiement :</strong><%= reservation.getString("modePaiement") %>&nbsp;&nbsp;&nbsp;<strong>N°Client : </strong><%= reservation.getInteger("ClientId") %></p>
             <p><strong>Total :</strong><span style="color: #ff2000; font-size: 16px; font-weight: bold;"><%= reservation.getInteger("Total") %> DH</span></p>

             <p class="price" style="color: #999; font-size: 16px; font-weight: bold;"><%= reservation.getString("status") %></p>


              <%  String status = reservation.getString("status");
    	    if (status.equals("En attente")) {
    	    	 
    	
    	%>
    	<div class="button-container">
    <form action="ChangerStatutServlet" method="post">
        <input type="hidden" name="reservationId" value="<%= reservation.getObjectId("_id").toString() %>" />
        <button type="submit" class="myButton">Accepter</button>
    </form>
    <form action="DeleteReservationServlet" method="post">
        <input type="hidden" name="reservationId" value="<%= reservation.getObjectId("_id").toString() %>" />
        <button type="submit" class="myButton myButton1">Refuser</button>
    </form>
</div>


    	       <% }%>
                                  
 
               <%
    }
%>                      
          </div>
        <% } %>
     
   
  </div>
</section>
 
 
 <!--footer section-->
<br/><br/><br/><br/><br/><br/>
    <footer style="background-color: black; color: white; padding: 20px;">
    <div id="footer" style="display: flex; align-items: center; justify-content: space-between;">
        <div class="contact" style="margin-right: auto;"> <!-- Déplacement vers la gauche -->
            <a href="indext.html"><img src="/DriveAway/images/logocar.png" alt="" style="width: 120px;" /></a>
        </div>
        <div class="info">
            <h3>Contact</h3>
            <address>
                <p><b>Address:</b> Tetouan/mhanech rue 82</p>
                <p><b>Phone:</b> +212612547836</p>
                <p><b>Hours</b> 10:00 - 18:00. Mon - Sat</p>
            </address>
        </div>
        <div class="socials">
            <h3>Follow Us</h3>
            <div class="icons">
                <a href="#"><i class="fa-brands fa-facebook-square"></i></a>
                <a href="#"><i class="fa-brands fa-youtube"></i></a>
                <a href="#"><i class="fa-brands fa-telegram"></i></a>
                <a href="#"><i class="fa-brands fa-instagram"></i></a>
                <a href="#"><i class="fa-brands fa-twitter"></i></a>
            </div>
        </div>
    </div>
</footer>
       <script
      src="https://kit.fontawesome.com/0e53af926d.js"
      crossorigin="anonymous"
    ></script>
</body>
</html>

<style>
@import url("https://fonts.googleapis.com/css2?family=League+Spartan:wght@100;200;300;400;500;600;700;800;900&display=swap");

/* hero section styles */

.button-container {
  display: flex;
  justify-content: center;
  align-items: center;
  margin-top: 10px;
}

#myButton {
  background-color: #4CAF50; /* Set background color */
  border: none; /* Remove default button border */
  color: white; /* Set text color */
  padding: 10px 20px; /* Add padding to the button */
  text-align: center; /* Center text horizontally */
  text-decoration: none; /* Remove default text decoration */
  display: inline-block; /* Make the button a block element */
  font-size: 16px; /* Set font size */
  cursor: pointer; /* Add a cursor effect on hover */
  border-radius: 4px; /* Add rounded corners */
}
#myButton1 {
  background-color: red; /* Set background color */
  border: none; /* Remove default button border */
  color: white; /* Set text color */
  padding: 10px 20px; /* Add padding to the button */
  text-align: center; /* Center text horizontally */
  text-decoration: none; /* Remove default text decoration */
  display: inline-block; /* Make the button a block element */
  font-size: 16px; /* Set font size */
  cursor: pointer; /* Add a cursor effect on hover */
  border-radius: 4px; /* Add rounded corners */
}
#myButton:hover {
  background-color: #45a049; /* Change background color on hover */
}
.interval {
  background-color: #f2f2f2;
  padding: 10px;
  border: 1px solid #ccc;
  border-radius: 5px;
}

.date {
  display: block;
  margin-bottom: 5px;
}
form {
  display: flex;
  flex-direction: column;
  max-width: 300px;
  margin: 0 auto;
}

label {
  margin-bottom: 5px;
}

input[type="date"] {
  padding: 5px;
  border-radius: 3px;
  border: 1px solid #ccc;
}

input[type="submit"] {
  background-color: #4CAF50;
  color: white;
  padding: 10px 15px;
  border: none;
  border-radius: 3px;
  cursor: pointer;
}

input[type="submit"]:hover {
  background-color: #45a049;
}

/* feature section styles */

.product-section .pro-collection {
    display: flex;
    flex-wrap: wrap;
    justify-content: space-around;
    margin: 50px 60px 0;
}
.product-section h1,
.product-section p {
    text-align: center;
}
.product-section .product-cart {
    width: calc(33.33% - 20px); /* Calcule 33.33% moins les marges */
    background-color: #ccc; /* Couleur grise */
    border-radius: 10px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    margin-bottom: 30px;
    overflow: hidden;
    transition: transform 0.3s ease, box-shadow 0.3s ease; /* Transition pour le mouvement et l'ombre */
}
.product-section .product-cart:hover {
    transform: translate(0,-5px); /* Déplacement vers l'avant au survol */
    box-shadow: 0 10px 20px rgba(0, 0, 0, 0.2); /* Ombre plus prononcée au survol */
}
.product-section .product-cart img {
    width: 100%; /* Pour s'assurer que l'image occupe toute la largeur de son conteneur */
    height: 200px; /* Hauteur fixe pour toutes les images */
    object-fit: cover; /* Pour que l'image remplisse la zone tout en conservant ses proportions */
    border-top-left-radius: 10px;
    border-top-right-radius: 10px;
}
.product-section .product-info {
    padding: 20px;
}
.product-section .product-info span {
    display: block;
    font-weight: bold;
    color: #333;
    margin-bottom: 10px;
}
.product-section .product-info p {
    color: #666;
    margin-bottom: 10px;
}
.product-section .product-info p:last-child {
    margin-bottom: 0;
}

#footer {
    padding: 20px;
    background-color: black;
    color: white;
    text-align: center;
    width: 100%; /* Couvrir toute la largeur de son conteneur */
    max-width: 1200px; /* Largeur maximale du footer */
    margin: 0 auto; /* Centrer horizontalement */
}


#footer .contact,
#footer .info,
#footer .socials {
    flex: 1;
}

#footer a {
    color: white;
    text-decoration: none;
}

#footer a:hover {
    color: #088178;
}

#footer .icons {
    display: flex;
    justify-content: center;
}

#footer .icons a {
    margin: 0 5px;
}
body {
  background-color: #f2f2f2; /* couleur de fond gris clair pour la page */
}
b {
    color: #777; /* Couleur grise */
}
h3{
 color: #ff0000;
}

/* Ajoutez ces styles pour aligner le footer en bas de la page */
html, body {
  height: 100%;
}

body {
  display: flex;
  flex-direction: column;
}

.product-section {
  flex: 1;
}
.myButton {
    margin-bottom: 10px;
     background-color: #4CAF50; /* Couleur verte */
    color: white;
    padding: 10px 20px;
    border: none;
    border-radius: 4px;
    cursor: pointer;
}

.myButton1{
 margin-bottom: 10px;
  background-color: red; /* Couleur rouge */
    color: white;
    padding: 10px 20px;
    border: none;
    border-radius: 4px;
    cursor: pointer;
}
h1{
 text-align:center;
}

/* Ajoutez ces styles CSS à votre feuille de style existante */







</style>