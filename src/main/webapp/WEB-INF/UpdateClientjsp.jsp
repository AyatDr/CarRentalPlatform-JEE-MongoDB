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
<meta charset="ISO-8859-1">
<title>Client Form</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
</head>
<body>
 <%@include file="includes/navBar.jsp" %>



		<div class="container " style="margin-top: 90px;">
	 <h3 class="page-title text-center">Modifier Un Client</h3>
	 <br>
		<div class="card custom-card-width mx-auto " style="background-color: #ccc;">
			<div class="card-body">
			
			
<form action="${pageContext.request.contextPath}/Client/Update" method="post"  >
    <% Document Client = (Document)request.getAttribute("Client"); %>
    
    
    	 <input type="hidden" class="form-control"  value="<%= Client.get("N_client") %>" name="N_client" placeholder="Numéro Client"required="required">
    
    <div class="row">
        <div class="col-md-6 mb-3">
            <label for="cin">CIN:</label>
            <input type="text" class="form-control" id="cin" value="<%= Client.get("CIN") %>" name="CIN" placeholder="CIN" required="required">
        </div>
        <div class="col-md-6 mb-3">
            <label for="nom">Nom:</label>
            <input type="text" value="<%= Client.get("Nom") %>" class="form-control" id="nom" name="Nom" placeholder="Nom" required="required">
        </div>
    </div>

    <div class="row">
        <div class="col-md-6 mb-3">
            <label for="prenom">Prénom:</label>
            <input type="text" value="<%= Client.get("Prenom") %>" class="form-control" id="prenom" name="Prenom" placeholder="Prénom" required="required">
        </div>
        <div class="col-md-6 mb-3">
            <label for="email">Email:</label>
            <input type="Email" class="form-control" id="email" value="<%= Client.get("Login") %>" name="Email" placeholder="Email" required="required">
        </div>
    </div>

    <div class="row">
        <div class="col-md-12 mb-3">
            <label for="adresse">Adresse:</label>
            <input type="text" class="form-control" id="adresse" value="<%= Client.get("Adress") %>" name="Adress" placeholder="Adresse" required="required">
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
	<br>
	
</body>
</html>