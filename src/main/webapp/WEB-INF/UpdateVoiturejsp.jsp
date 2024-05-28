<%@ page language="java"%>
    <%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
 <%@ page import="org.bson.Document" %>
 <%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Manager Form</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
</head>
<body>
	 <%@include file="includes/navBar.jsp" %>
<br><br><br><br>
		
<center>
    <h3>Modifier Une Voiture</h3>
</center>
<br>
<div class="container ">
    <div class="card" style="background-color: #ccc;">
        <div class="card-body">
          <form action="${pageContext.request.contextPath}/Voiture/Update" method="post" enctype="multipart/form-data">
           <% Document Voiture = (Document)request.getAttribute("Voiture"); %>

    <div class="row">
      
            <input type="hidden"
	          class="form-control"  value="<%= Voiture.get("Matricule") %>"
	           name="Matricule" placeholder="Matricule"required="required">
       
        <div class="col-md-12 text-center">
            <label for="marque">Marque</label>
            <input type="text" class="form-control" value="<%= Voiture.get("Marque") %>" name="Marque" placeholder="Marque" required>
        </div>
    </div>
     <br>
    <div class="row">
        <div class="col-md-6 mb-3">
            <label for="kilometrage">Kilométrage</label>
            <input type="text" class="form-control" value="<%= Voiture.get("Kilométrage") %>" name="Kilometrage" placeholder="Kilométrage" required>
        </div>
        <div class="col-md-6 mb-3">
            <label for="annee">Année</label>
            <input type="text" class="form-control" value="<%= Voiture.get("Année") %>" name="Annee" placeholder="Année" required>
        </div>
    </div>

    <div class="row">
        <div class="col-md-6 mb-3">
            <label for="couleur">Couleur</label>
            <input type="text" class="form-control" value="<%= Voiture.get("Couleur") %>" name="Couleur" placeholder="Couleur" required>
        </div>
        <div class="col-md-6 mb-3">
            <label for="prix">Prix</label>
            <input type="text" class="form-control" value="<%= Voiture.get("Prix") %>" name="prix" placeholder="Prix" required>
        </div>
    </div>

    <div class="row">
        <div class="col-md-12 mb-3">
            
            <input type="file" class="form-control-file" id="photo" name="Photo" accept="image/*" required>
            <small id="photoHelp" class="form-text text-muted">Veuillez sélectionner une photo de la voiture.</small>
        </div>
    </div>

    <div class="row">
        <div class="col-md-3 mx-auto text-center">
            <button type="submit" class="btn btn-primary btn-block" style="background-color: red;">Modifier</button>
        </div>
    </div>
</form>

        </div>
    </div>
</div>

  
</body>
</html>