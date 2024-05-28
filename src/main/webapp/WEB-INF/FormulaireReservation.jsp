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
    <meta charset="UTF-8">
    <title>Add Reservation</title>
    <link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous"> 
<style>

 /* CSS pour le formulaire dans une carte noire */

.form-card {
    background-color: #000;
    color: #fff;
    border-radius: 10px;
    padding: 20px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    max-width: 600px; /* Largeur de la carte augmentée */
    margin: 0 auto; /* Centrage horizontal */
    margin-top: 20px; /* Espacement par rapport au contenu précédent */
    position: relative; /* Position relative pour le positionnement absolu du bouton */
}

/* Style des étiquettes */
.form-card label {
    font-weight: bold;
}
.form-card:hover {
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.3); /* Ombre au survol */
    transform: translateY(-5px); /* Déplacement vers le haut de 5 pixels */
    transition: transform 0.3s ease; /* Animation fluide */
}

/* Style des champs de formulaire */
.form-card input[type="text"],
.form-card input[type="number"],
.form-card input[type="date"],
.form-card select {
    width: calc(100% - 22px); /* Pour compenser la largeur du border */
    padding: 8px;
    border: 1px solid #ccc;
    border-radius: 5px;
    margin-bottom: 10px;
    box-sizing: border-box;
    background-color: #333; /* Couleur de fond des champs */
    color: #fff; /* Couleur du texte */
    transition: border-color 0.3s ease; /* Transition pour la couleur de la bordure */
}

/* Animation de transition pour les champs de formulaire lors du focus */
.form-card input[type="text"]:focus,
.form-card input[type="number"]:focus,
.form-card input[type="date"]:focus,
.form-card select:focus {
    border-color: #ff0000; /* Couleur de bordure lorsqu'en focus */
}

/* Style du bouton de soumission */
.form-card button[type="submit"] {
    background-color: #ff0000; /* Couleur de fond */
    color: #fff; /* Couleur du texte */
    border: none;
    padding: 10px 20px;
    font-size: 16px;
    border-radius: 5px;
    cursor: pointer;
    position: absolute; /* Position absolue */
    bottom: 20px; /* Espacement depuis le bas */
    left: 50%; /* Position horizontale au milieu */
    transform: translateX(-50%); /* Centrage horizontal */
}

.form-card button[type="submit"]:hover {
    background-color: #c0392b; /* Couleur de fond au survol */
}
/* Style du bouton de soumission */
.container-contact100-form-btn {
    text-align: center; /* Centrage horizontal */
    margin-top: 20px; /* Espacement depuis le contenu précédent */
}

.container-contact100-form-btn input[type="submit"] {
    background-color: #e74c3c; /* Couleur de fond */
    color: #fff; /* Couleur du texte */
    border: none;
    padding: 10px 20px;
    font-size: 16px;
    border-radius: 5px;
    cursor: pointer;
    transition: background-color 0.3s; /* Transition pour l'effet de survol */
}

.container-contact100-form-btn input[type="submit"]:hover {
    background-color: #c0392b; /* Couleur de fond au survol */
}
.form-card label {
    font-weight: bold;
    text-align: center; /* Alignement horizontal au centre */
    display: block; /* Pour que le texte soit sur une ligne */
}
.form-card span {
    text-align: center; /* Alignement horizontal au centre */
    display: block; /* Pour que le texte soit sur une ligne */
}
/* Style du titre du formulaire */
.contact100-form-title {
     font-family: Arial, sans-serif; /* Police de caractères */
        font-size: 28px; /* Taille de la police */
        font-weight: bold; /* Gras */
        color: #333; /* Couleur du texte */
        text-align: center; /* Alignement du texte au centre */
        margin-bottom: 20px; /* Marge en bas pour l'espace supplémentaire */
}


</style>
<!--===============================================================================================-->
    
    
</head>
<body>
 <%@include file="includes/navBar.jsp" %>

    <h1>Ajouter Reservation</h1>
 <%
 Document voitureReservee = (Document) request.getAttribute("reservationVoiture");
 System.out.println("Voiture réservée : " + voitureReservee);

%>

<section class="product-section" class="section-p1">
  
 
            
  </div>
</section> 

<div class="container-contact100">

		<div class="wrap-contact100">
  <% if (voitureReservee != null && !voitureReservee.isEmpty()) { %>
  <div class="pro-collection">
      
      <br><br>
          
          <div class="product-cart mx-auto">
         


            <%-- Afficher les détails de la réservation --%>
           

           

            <% Object prixLocObj = voitureReservee.get("Prix");
               if (prixLocObj != null && prixLocObj instanceof Double) {
                 double prixLoc = (Double) prixLocObj;
            %>
             
               <h4 class="price">$ <%= prixLocObj %></h4>
            <% } %>

           
            
             
    	
  
    	       
                                     
  </div>
               <%
               
    }  
%>   

<h2 class="contact100-form-title">Formulaire de reservation</h2>

          <div class="form-card">  
   			 
     <% String imageUrl = voitureReservee.getString("Image"); %>
<center>
    <img src="<%= imageUrl %>" alt="product image" style="border-radius: 10%; width: 550px; height: 250px; object-fit: cover;" />
</center>
    
    <form method="post" action="InsererReservation" class="container">
    
    <br>
    <input type="hidden" name="voitureId" value="<%= voitureReservee.getObjectId("_id").toString() %>" />
    
    <div class="row">
        <div class="col-md-12">
            <label for="mySelect">Client :</label>
            <select id="mySelect" name="client" required class="form-control">
                <option value="">-- Sélectionnez un client --</option>
               <%
			List<Document> listClient = (List<Document>) request.getAttribute("listClient");
		  
			  for (Document client : listClient) { %>
	                <tr>
				
			    <option value="<%= client.get("N_client") %>"><%= client.get("N_client") %></option>
			    
			    <%} %>
            </select>
        </div>
       
    </div>
    
     <div class="row">
        
        <div class="col-md-6">
            <div class="form-group">
                <label>Date debut:</label>
                <input type="date" id="DateDebut" name="DateDebut" required class="form-control" value=<%=request.getAttribute("dateDebut") %>>
            </div>
        </div>
        
         <div class="col-md-6">
            <div class="form-group">
                <label>Date Fin:</label>
                <input type="date" id="DateFin" name="DateFin" required class="form-control" value=<%=request.getAttribute("dateFin") %>>
            </div>
        </div>
        
    </div>
    
    <div class="row">
       
        <div class="col-md-6">
            <div class="form-group">
                <label>Mode Payment :</label>
                <select id="modePaiement" name="modePaiement" required class="form-control">
                    <option value="Cheque">Cheque</option>
                    <option value="Cash">Cash</option>
                    <option value="CreditCard">Credit Card</option>
                </select>
            </div>
        </div>
        
         <div class="col-md-6">
            <div class="form-group">
                <label>Matricule *</label>
                <input type="text" id="Matricule" name="Matricule" value="<%= voitureReservee.getString("Matricule") %>" required class="form-control">
            </div>
        </div>
        
        
    </div>
    
    <div class="row">
        <div class="col-md-6">
            <div class="form-group">
                <label>Prix_loc:</label>
                <input type="number" id="Prix_loc" name="Prix_loc" value="<%= voitureReservee.getInteger("Prix") %>" required class="form-control">
            </div>
        </div>
        <div class="col-md-6">
            <div class="form-group">
                <label>Total</label>
                <input type="number" id="Total" name="Total" required class="form-control">
            </div>
        </div>
    </div>
    <br>
     <br>
    <div class="form-group">
        <button type="submit" class="btn btn-primary">Ajouter Reservation</button>
    </div>
</form>
    
    </div>
    <br>
    
   	</div>
</div>
   
   
   
<!--===============================================================================================-->
	<script src="vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/bootstrap/js/popper.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/select2/select2.min.js"></script>
	<script>
		$(".js-select2").each(function(){
			$(this).select2({
				minimumResultsForSearch: 20,
				dropdownParent: $(this).next('.dropDownSelect2')
			});


			$(".js-select2").each(function(){
				$(this).on('select2:close', function (e){
					$('.js-show-service').slideUp();
					$('.js-show-service').slideDown();
					
				});
			});
		})
	</script>
<!--===============================================================================================-->
<!--Appel du JS-->
	<script src="js/main.js"></script>
<!--===============================================================================================-->
    
    
</body>


<script>
function filterOptions() {
	  var input, select, options, option, i;
	  input = document.getElementById("myInput");
	  select = document.getElementById("mySelect");
	  options = select.getElementsByTagName("option");
	  var filter = parseInt(input.value);

	  for (i = 0; i < options.length; i++) {
	    option = options[i];
	    if (parseInt(option.value) == filter) {
	      option.style.display = "";
	    } else {
	      option.style.display = "none";
	    }
	  }

	  // Show the select element if any options are displayed
	}
</script>










<script>
//Fonction pour calculer le prix total
function calculerPrixTotal() {
    var dateDebut = new Date(document.getElementById("DateDebut").value);
    var dateFin = new Date(document.getElementById("DateFin").value);
    var prixLocParJour = parseFloat(document.getElementById("Prix_loc").value);
    
    // Calculer la différence en jours entre la date de fin et la date de début
    var differenceEnJours = (dateFin - dateDebut) / (1000 * 60 * 60 * 24);
    
    // Calculer le prix total en incluant le jour de début dans la réservation
    var prixTotal = Number((differenceEnJours + 1) * prixLocParJour);
    
    // Mettre à jour le champ de total avec le prix total calculé
    document.getElementById("Total").value = prixTotal;
}

// Appeler la fonction au chargement de la page pour afficher le prix total initial
calculerPrixTotal();

</script>
</html>