<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="org.bson.Document" %>


<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Profile</title>
   <link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
      <%@include file="includes/navBar.jsp" %>
      
      <style>
/* Style des champs de formulaire */
.form-control {
    width: 100%;
    padding: 10px;
    margin-bottom: 20px;
    border: 1px solid #ccc;
    border-radius: 4px;
    box-sizing: border-box;
}

/* Style des étiquettes des champs */
.form-group label {
    display: block;
    margin-bottom: 5px;
    font-weight: bold;
}

/* Style des champs textarea */
.form-control textarea {
    resize: none; /* Empêche le redimensionnement */
}

/* Style des champs en lecture seule */
.form-control[readonly] {
    background-color: #f5f5f5; /* Couleur de fond */
    color: #333; /* Couleur du texte */
    
}

/* Style des champs de formulaire au focus */
.form-control:focus {
    border-color: #007bff; /* Couleur de la bordure au focus */
    outline: 0; /* Supprime la bordure de focus */
    box-shadow: 0 0 0 0.2rem rgba(0,123,255,.25); /* Ombre au focus */
}

      
   
      </style>
     
</head>
<br/><br/><br/><br/><br/><br/>
<body>
  
<%

HttpSession session2 = request.getSession();

//Récupérer les informations du manager depuis la session
Document profile = (Document) session2.getAttribute("Profile");
   
    // Récupération des informations du manager
    String nom = profile.getString("Nom");
    String prenom = profile.getString("Prenom");
    String cin = profile.getString("CIN");
    String login = profile.getString("Login");
    String password = profile.getString("Password");
    String adress = profile.getString("adress");
    
    
 

%>


<div class="container">
    <div class="box  ">
        <div class="box-login" id="login">
            <h2 class="top-header">Vos Informations</h2>
            <div class="row">
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="nom">Nom:</label>
                        <input type="text" id="nom" name="nom" class="form-control" value="<%= nom %>" readonly>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="prenom">Prénom:</label>
                        <input type="text" id="prenom" name="prenom" class="form-control" value="<%= prenom %>" readonly>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="cin">CIN:</label>
                        <input type="text" id="cin" name="cin" class="form-control" value="<%= cin %>" readonly>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="login">Email:</label>
                        <input type="text" id="login" name="login" class="form-control" value="<%= login %>" readonly>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="form-group">
                        <label for="adress">Adresse:</label>
                        <textarea id="adress" name="adress" class="form-control" readonly><%= adress %></textarea>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


  
   
   
</body>
</html>



 <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            background: url("images/cars/car_update.jpg");
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            background-attachment: fixed;
        }

        .container {
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 70vh;
        }

        .box {
            display: flex;
            flex-direction: row;
            position: relative;
            padding: 30px 40px 30px 20px; /* Ajustement de la taille de la carte */
            height: 440px;
            width: 700px;
            background-color: rgba(255, 255, 255, 0.1);
            border-radius: 30px;
            -webkit-backdrop-filter: blur(15px);
            backdrop-filter: blur(15px);
            border: 3px solid rgba(255, 255, 255, 0.2);
            overflow: hidden;
        }

        .box-login {
            position: absolute;
            width: 650px;
            left: 20px;
            transition: .5s ease-in-out;
        }

        .top-header {
            text-align: center;
            margin-bottom: 50px; /* Ajustement de l'espace avant le titre */
        }

        .top-header h3 {
            font-size: 22px;
            font-weight: 600;
            margin-bottom: 70px;
        }

        .input-group {
            width: 100%;
        }

        .input-field {
            margin-bottom: 30px; /* Ajout d'espace entre chaque champ */
            position: relative;
        }

        .input-box {
            width: 100%;
            height: 50px;
            font-size: 15px;
            color: #040404;
            border: none;
            border-radius: 10px;
            padding: 7px 45px 0 30px;
            background: rgba(224, 223, 223, 0.6);
            backdrop-filter: blur(2px);
            outline: none;
        }

        .input-field label {
            position: absolute;
            top: -20px; /* Augmentation de l'espace entre le label et le champ */
            left: 20px;
            font-size: 14px; /* Taille du label */
            transition: .3s ease-in-out;
        }

        .input-box:focus ~ label, .input-box:valid ~ label {
            top: 15px;
            font-size: 10px;
            color: #c12828;
            font-weight: 500;
        }

        .eye-area {
            position: absolute;
            top: 30px;
            right: 25px;
        }

        .eye-box {
            display: flex;
            justify-content: center;
            align-items: center;
            position: relative;
        }

        i {
            position: absolute;
            color: #444444;
            cursor: pointer;
        }

        #eye, #eye-2 {
            opacity: 1;
        }

        #eye-slash, #eye-slash-2 {
            opacity: 1;
        }

        .input-submit {
            width: 100%;
            height: 50px;
            font-size: 15px;
            font-weight: 500;
            border: none;
            border-radius: 10px;
            background: #ff0000;
            color: #fff;
            box-shadow: 0px 4px 20px rgba(62, 9, 9, 0.145);
            cursor: pointer;
            transition: .4s;
            
        }

        .input-submit:hover {
            background: #ff2000;
            box-shadow: 0px 4px 20px rgba(62, 9, 9, 0.32);
        }

        .forgot {
            text-align: center;
            font-size: 13px;
            font: 500;
            margin-top: 40px;
        }

        .forgot a {
            text-decoration: none;
            color: #000;
        }

        .switch {
            display: flex;
            position: absolute;
            bottom: 50px;
            left: 25px;
            width: 85%;
            height: 50px;
            background: rgba(255, 255, 255, 0.16);
            backdrop-filter: blur(10px);
            border-radius: 10px;
            box-shadow: 0px 2px 10px rgba(0, 0, 0, 0.1);
            overflow: hidden;
        }

        .switch a {
            display: flex;
            justify-content: center;
            align-items: center;
            font-size: 14px;
            font-weight: 500;
            color: #000;
            text-decoration: none;
            width: 50%;
            border-radius: 10px;
            z-index: 10;
        }

        #btn {
            position: absolute;
            bottom: 0;
            left: 0;
            width: 100%; /* Modification de la largeur du bouton */
            height: 50px;
            background: #cccccd;
            border-radius: 10px;
            box-shadow: 2px 0px 12px rgba(0, 0, 0, 0.1);
            transition: .5s ease-in-out;
        }
        label{
         margin:-5px;
         font-weight:bold;
        }
        h3{
         color:#fff;
         margin-top:4px;
        }
    </style>