<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page import="org.bson.Document" %>
<%@ page import="java.util.List" %>
<%@ page import="org.bson.Document" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body style="min-height: 100vh; margin: 0; display: flex; flex-direction: column;">
<%@include file="includes/navBar.jsp" %>
<section id="hero">
    <h2>Choose Your Car</h2>
</section>

<%
    List<Document> listVoiture = (List<Document>) request.getAttribute("availableCarsList");
%>

<section class="product-section" class="section-p1" style="flex: 1;">
     <h1>Voici tous les Voitures Disponibles </h1>
    <% if (listVoiture != null && !listVoiture.isEmpty()) { %>
    <div class="pro-collection">
        <% for (Document voiture : listVoiture) { %>
        <div class="product-cart">
            <% String imageUrl = voiture.getString("Image"); %>
            <img src="<%= imageUrl %>" alt="product image" style="width: 100%; height: 200px;" /> <!-- Spécification de la taille de l'image -->
            <div class="product-info">
                <p><span><%= voiture.getString("Matricule") %>&nbsp;&nbsp; <%= voiture.getString("Marque") %></span></p>
                <p><strong style="color: #666;"><%= voiture.getInteger("Kilométrage") %> Km</strong></p> <!-- Changement de couleur -->
                <p><strong style="color: #666;"><%= voiture.getInteger("Année") %></strong></p> <!-- Changement de couleur -->
                <p><span style="color: #000; font-size: 16px; font-weight: bold;"><%= voiture.getInteger("Prix") %> DH</span></p>
            </div>
            <form action="Reserver" method="post">
                <input type="hidden" name="dateDebut" value="<%= request.getAttribute("dateDebut") %>" />
                <input type="hidden" name="dateFin" value="<%= request.getAttribute("dateFin")%>" />
                <input type="hidden" name="reservationId" value="<%= voiture.getObjectId("_id").toString() %>" />
                <button type="submit" class="reserve-button">Reserver</button> <!-- Utilisation de classe pour cibler le bouton -->
            </form>
        </div>
        <% } %>
    </div>
    <% } %>
</section>

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

<script src="https://kit.fontawesome.com/0e53af926d.js" crossorigin="anonymous"></script>
<style>

/* hero section styles */
.reserve-button {
    background-color: red; /* Couleur rouge pour le bouton */
    border: none;
    color: white;
    padding: 10px 20px;
    text-align: center;
    text-decoration: none;
    display: block;
    margin: 0 auto; /* Pour centrer le bouton */
    border-radius: 4px;
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
    width: 300px;
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
    width: 100%;
    height: auto; /* Taille automatique */
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

/* footer section styles */
#footer {
    padding: 20px;
    background-color: black;
    color: white;
    text-align: center;
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
</style>
</body>
</html>