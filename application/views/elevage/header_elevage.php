<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Navbar responsive pour opporctunité</title>
    <link href="https://fonts.googleapis.com/css?family=Montserrat:300,400,500,600,700&display=swap" rel="stylesheet">

    <link rel = "stylesheet" type = "text/css" href = "<?php echo base_url(); ?>public/css/elevage/style2.css">
    <link rel = "stylesheet" media="screen and (max-width: 1200px)" type = "text/css" href = "<?php echo base_url(); ?>public/css/elevage/middle-size.css">
    <link rel = "stylesheet" media="screen and (max-width: 600px)" type = "text/css" href = "<?php echo base_url(); ?>public/css/elevage/mobile.css">

</head>
<body>
    <nav>
        <div class="nav-container">
            <div class="burger-container">
                <div class="line1 line"></div>
                <div class="line2 line"></div>
                <div class="line3 line"></div>
            </div>
            <h1 id="titre_header">O'Porctunité</h1>
        </div>
        <div class="menu" id="menunav">
            <ul>
                <li class="menutitre titre1"><a href="">Accueil</a></li>
                <li class="menutitre titre2"><a href="">Bien-être évaluation</a></li>
                <li class="menutitre titre3"><a href="http://localhost/codeigniter/index.php/fiches/afficher_pagefiche.html">Fiches conseils</a></li>
                <li class="menutitre titre4"><a href="">Fiches favoris </a></li>
                <li class="menutitre titre5"><a href="">Suivi de mon élevage</a></li>
                <li class="menutitre titre6"><a href="">Contacts</a></li>    
            </ul>
        </div>
    </nav>

    <script src="<?php echo base_url(); ?>public/js/elevage/script.js"></script>

</body>
</html>