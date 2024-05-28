<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
body {
  background-color: #f2f2f2; /* couleur de fond gris clair pour la page */
}

.card {
   background-color: #000; /* couleur de fond noire */
  border-radius: 15px; /* bordures arrondies */
  padding: 30px; /* espace interne */
  width: 400px; /* largeur de la carte */
  margin: 127px auto; /* centrage horizontal et ajustement vertical */
  box-shadow: 0px 0px 10px 5px rgba(0, 0, 0, 0.1); /* ombre douce */
  transition: transform 0.3s ease; /* transition fluide pour l'effet de survol */
}

.card:hover {
  transform: translateY(-5px); /* translation vers le haut de 5 pixels lors du survol */
}

.card h2 {
  text-align: center; /* centrage du titre */
  margin-bottom: 20px; /* espace sous le titre */
  color:#666; /* couleur du texte blanc */
}

form {
  display: flex;
  flex-direction: column;
}

label {
  margin-bottom: 15px; /* espace entre les étiquettes */
  color: #fff; /* couleur du texte blanc */
}

input[type="date"] {
  padding: 10px;
  border-radius: 5px;
  border: 1px solid #ccc;
  margin-bottom: 20px; /* espace entre les champs de formulaire */
  font-size: 16px; /* taille de police pour les champs de formulaire */
}

input[type="submit"] {
  background-color: #ff0000;
  color: white;
  padding: 12px 20px;
  border: none;
  border-radius: 5px;
  cursor: pointer;
  font-size: 16px; /* taille de police pour le bouton */
}

input[type="submit"]:hover {
  background-color: #333333;
}

</style>
</head>
<body>
 <%@include file="includes/navBar.jsp" %>
 
<div class="card">
  <h2>Ajouter une réservation</h2>
  <form action="AjouterReservation" method="post">
    <label for="date_debut">Date de début :</label>
    <input type="date" id="date_debut" name="date_debut">

    <label for="date_fin">Date de fin :</label>
    <input type="date" id="date_fin" name="date_fin">

    <input type="submit" value="Valider">
  </form>
</div>

</body>
</html>