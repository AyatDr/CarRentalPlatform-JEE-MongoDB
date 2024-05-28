
    <header>
      <div id="header">
       <div class="header-logo">
         <a href="index.html">
         <img src="/DriveAway/images/logocar.png" alt="" style="width: 100px; height: auto;" />

         </a>
        </div>
        <div class="header-list">
          <nav class="header-list-nav">
            <ul>
            <li><a href="${pageContext.request.contextPath}/Profile">Profil</a></li>
             <li><a href="${pageContext.request.contextPath}/Reservations">Reservation</a></li>
              <li><a href="${pageContext.request.contextPath}/VoitureServ">Voiture</a></li>
              <li><a href="${pageContext.request.contextPath}/Client">Client</a></li>
              <li><a href="${pageContext.request.contextPath}/Filtrer">Ajouter</a></li>
              <li><a href="${pageContext.request.contextPath}/Logout">Logout</a></li>
            </ul>
          </nav>
         
        </div>
      </div>
    </header>
    
    
    
  <style>
/* header styles */
@import url('https://fonts.googleapis.com/css2?family=Poppins:wght@400;500&display=swap');
*{
    font-family: 'Poppins',sans-serif;
}
#header {
  display: flex;
  align-items: center;
  justify-content: space-between;
  background-color: #000; /* changer la couleur de fond en noir */
  padding: 10px 50px;
  box-shadow: 0 5px 15px rgba(0, 0, 0, 0.06);
  z-index: 999;
  position: fixed;
  top: 0;
  left: 0;
  right: 0;
}

.header-list {
  display: flex;
  align-items: center;
  justify-content: center;
}
.header-list-nav ul {
  display: flex;
}
.header-list-nav ul li {
  list-style-type: none;
  padding: 0 20px;
  position: relative;
}
.header-list-nav ul a {
  text-decoration: none;
  font-size: 16px;
  font-weight: 600;
  color: #ff0000; /* changer la couleur du texte en rouge */
  transition: 0.3s ease;
}



.header-list-nav ul a:hover,
.header-list-nav ul a.active {
  color: #fff; /* changer la couleur du texte en survol en blanc */
}

.header-list-icon a:hover,
.header-list-nav ul a.active {
  color: #fff; /* changer la couleur de l'icône en survol en blanc */
}


</style>