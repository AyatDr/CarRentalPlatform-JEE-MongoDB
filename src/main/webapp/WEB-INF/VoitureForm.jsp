 <%@ page language="java"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
 <%@ page import="org.bson.Document" %>
 <%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Voiture Form</title>
</head>
<body>
<title></title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
	
<style>
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
	
	<div class="container " style="margin-top: 70px;">
	<h3 class="page-title">Ajouter Une Voiture</h3>
	<br>
		<div class="card " style="background-color: #ccc;">
			<div class="card-body">
<form action="${pageContext.request.contextPath}/Voiture/insert" method="post"  enctype="multipart/form-data">
    <div class="row">
        <div class="col-md-6 mb-3">
           
            <input type="text" class="form-control" id="matricule" name="Matricule" placeholder="Matricule" required="required">
        </div>
        <div class="col-md-6 mb-3">
            
            <input type="text" class="form-control" id="marque" name="Marque" placeholder="Marque" required="required">
        </div>
    </div>
    
    <div class="row">
        <div class="col-md-6 mb-3">
            
            <input type="text" class="form-control" id="kilometrage" name="Kilométrage" placeholder="Kilométrage" required="required">
        </div>
        <div class="col-md-6 mb-3">
            
            <input type="text" class="form-control" id="annee" name="Annee" placeholder="Année" required="required">
        </div>
    </div>
    
    <div class="row">
        <div class="col-md-6 mb-3">
            
            <input type="text" class="form-control" id="couleur" name="Couleur" placeholder="Couleur" required="required">
        </div>
        <div class="col-md-6 mb-3">
            
            <input type="text" class="form-control" id="prix" name="Prix" placeholder="Prix" required="required">
        </div>
    </div>
    
   
    
     <div class="row">
        <div class="col-md-12 mb-3">
            
            <input type="file" class="form-control-file" id="photo" name="Photo" accept="image/*" required="required">
            <small id="photoHelp" class="form-text text-muted">Veuillez sélectionner une photo de la voiture.</small>
        </div>
    </div>
    
     <div class="row">
       <div class="col-md-3 mx-auto text-center">
        <button type="submit" class="btn btn-primary btn-block" style="background-color: red;">Ajouter</button>
       </div>

    </div>
</form>

			</div>
		</div>
	</div>
	<br>
</body>
</html>