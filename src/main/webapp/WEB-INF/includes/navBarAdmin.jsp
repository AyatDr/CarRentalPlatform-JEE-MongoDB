

    <header>
      <div id="header">
        <div class="header-logo">
          <a href="indext.html"><img src="images/logo.png" alt="" /></a>
        </div>
        <div class="header-list">
          <nav class="header-list-nav">
            <ul>
              <li><a href="#">Reservation</a></li>
              <li><a href="#">Voiture</a></li>
              <li><a href="#">Client</a></li>
              <li><a href="Update">Managers</a></li>
              <li><a href="LogoutAdmin">Logout</a></li>
            </ul>
          </nav>
          <div class="header-list-icon">
            <a href=""><i class="fa fa-bag-shopping"></i></a>
          </div>
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
  background-color: #87CEFA;
  padding: 20px 80px;
  box-shadow: 0 5px 15px rgba(0, 0, 0, 0.06);
  z-index: 999;
  position:fixed;
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
  color: #1a1a1a;
  transition: 0.3s ease;
}
.header-list-nav ul a:hover,
.header-list-nav ul a.active {
  color: #088178;
  content: "";
}
.header-list-icon a {
  color: #1a1a1a;
  padding-left: 20px;
  transition: 0.3s ease;
}
.header-list-icon a:hover,
.header-list-nav ul a.active {
  color: #088178;
}
.header-list-nav ul li a:hover::after,
.header-list-nav ul li a.active::after {
  content: "";
  width: 30%;
  height: 2px;
  background: #088178;
  position: absolute;
  bottom: -4px;
  left: 20px;
}


</style>