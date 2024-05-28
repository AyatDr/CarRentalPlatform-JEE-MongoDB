<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Client Form</title>
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





		<div class="container " style="margin-top: 90px;">
	      <h3 class="page-title">Ajouter Un Client</h3>
	      <br>
		<div class="card custom-card-width mx-auto" style="background-color: #ccc;">
			<div class="card-body">
<form action="${pageContext.request.contextPath}/Client/insert" method="post" >
    <div class="row">
        
        <div class="col-md-12 mb-3">
            	 <input type="text" class="form-control" name="CIN" placeholder="CIN" required="required">
            
        </div>
    </div>
    
    <div class="row">
        <div class="col-md-6 mb-3">
            	 <input type="text" class="form-control"  name="Nom" placeholder="Nom" required="required">
            
         </div>
        <div class="col-md-6 mb-3">
            
	 <input type="text" class="form-control" name="Prenom" placeholder="Prenom" required="required">
        </div>
    </div>
    
    <div class="row">
        <div class="col-md-6 mb-3">
            
	 <input type="Email" class="form-control" name="Email"  placeholder="Email" required="required">
        </div>
        <div class="col-md-6 mb-3">
            
	 <input type="text" class="form-control" name="Adress"  placeholder="Adresse" required="required">
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