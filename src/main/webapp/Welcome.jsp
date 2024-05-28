<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Location de voitures</title>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

    <style>
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800;900&display=swap');
        *{
            padding: 0;
            margin: 0;
            box-sizing: border-box;
            text-decoration: none;
            font-family: 'Poppins', sans-serif;
        }
        header{
            position: fixed;
            top: 0;
            left: 0;
            right: 0;
        }
        header nav{
            width: 90%;
            margin: auto;
            display: flex;
            justify-content: space-between;
            align-items: center;
            height: 80px;
        }
        header nav .logo{
            width: 150px;
        }
        header nav .menu{
            display: flex;
            align-items: center;
        }
        nav .menu a{
            color: #fff;
            margin-left: 30px;
            position: relative;
        }
        nav .menu a::after{
            content: '';
            position: absolute;
            bottom: -5px;
            left: 0;
            width: 0%;
            height: 2px;
            background-color: #dd0707;
            transition: 0.4s;
        }
        nav .menu a:hover::after{
            width: 100%;
        }
        nav .social a i{
            color: #fff;
            font-size: 22px;
            margin-left: 10px;
            transition: 0.3s;
        }
        nav .social a i:hover{
            transform: scale(1.3);
            color: #dd0707;
        }

        .hero{
            width: 100%;
            height: 100vh;
            background: url(img/bg.jpg);
            background-position: center;
            background-size: cover;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .hero .text{
            width: 90%;
            margin: auto;
        }
        .hero .text h4{
            font-size: 40px;
            color: #fff;
            font-weight: 500;
            margin-bottom: 10px;
        }
        .hero .text h1{
            color: #fff;
            font-size: 65px;
            text-transform: uppercase;
            line-height: 1;
            margin-bottom: 30px;
        }
        .hero .text h1 span{
            color: #dd0707;
            font-size: 80px;
            font-weight: bold;
        }
        .hero .text p{
            color: #fff;
            margin-bottom: 30px;
        }
        .hero .text .btn{
            padding: 10px 20px;
            background-color: #dd0707;
            text-transform: uppercase;
            color: #fff;
            font-weight: bold;
            border-radius: 30px;
            border: 2px solid #dd0707;
            transition: 0.3s;
        }
        .hero .text .btn:hover{
            background-color: transparent;
        }
    </style>
</head>
<body>
    <header>
        <nav>
            <img src="/DriveAway/images/logocar.png" class="logo" alt="">
           

            <div class="social">
                <a href="#"><i class="fa-brands fa-facebook-f"></i></a>
                <a href="#"><i class="fa-brands fa-twitter"></i></a>
                <a href="#"><i class="fa-brands fa-instagram"></i></a>
            </div>
        </nav>
    </header>
    
    <div class="hero">

        <div class="text">
            <h4>Louez votre Voiture personnalisée</h4>
            <h1>DRIVEAWAY Dès <br> <span>Maintenant</span></h1>
            <p>Élégance réelle, Puissance réelle, Performance réelle.</p>
            <a href="LoginAdmin" class="btn">Espace Administrateur</a>  
            <a href="LoginManager" class="btn">Espace Gestionnaire</a>
        </div>
    </div>

    <script>
        let heroBg = document.querySelector('.hero');

        setInterval(() => {
            heroBg.style.backgroundImage = "url(images/cars/bg-light.jpg)"
            
            setTimeout(() => {
                heroBg.style.backgroundImage = "url(images/cars/bg.jpg)"
            }, 1000);
        }, 2200);
    </script>
</body>
</html>