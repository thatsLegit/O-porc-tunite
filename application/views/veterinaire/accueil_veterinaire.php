<!DOCTYPE html>
<html lang="fr">

<head>
    <meta charset="utf-8">
    <title>O'porctunité Web</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Font Awesome CSS -->
    <link rel="stylesheet" href="font-awesome-4.7.0/css/font-awesome.min.css">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<link href="css/style.css" rel="stylesheet">
    <style>
        body {
            background: whitesmoke;
            margin: 0;
            padding: 0;
            color: grey
        }

        .header {
            background-color: #87C165;
            width: auto;
            height: auto;
        }

        #logo {
            font-family: Apple Chancery, cursive;
            color: white;
            font-weight: bold;
            text-align: center;
            padding: 10px;

        }

        li {
            font-family: cursive;
            background-color: white;
            margin: 5px;
            width: 200px;
            padding: 5px;
            text-align: center;
            border-radius: 5px;
        }

        #main {
            padding: 10px;
            display: flex;
            justify-content: center;
            align-content: center;
           
        }
           .title{
            font-size: 1.7em;
            font-weight: 700 !important;
            opacity: 0.7;
        }
        
        .text{
             font-size: 1em;
            font-weight: 700 !important;
            opacity: 0.7;
        }

        h2{
            padding: 25px;
            margin-top: 20px;
            margin-bottom: 20px;
        }
        
        .zone_text{
            color: #87C165;
            padding: 13px;
            width: 200px;
            background-color: white;
            border-radius: 5px;
            font-size: 1em;
            font-weight: 700 !important;
           
        }
          .mybtn {
            border: none;
            border-radius: 50px;
            background-color: #87C165;
            width: 300px;
            padding: 10px;
            margin-top: 10px;
            margin-left: 20px;
            font-size: 20px;
            font-weight: bold;
            margin-bottom: 10px;
        }
        
        .infosVeto{
            margin-top: 20px;
            margin-bottom: 20px;
        }
        .container{
            border: 1px solid;
            height: 150px;
            width: 150px;
            background: #fff;
        }
       
    </style>

</head>

<body>

    <div id="main">
        <div class="menu">
            <p class="text-center">Connecté</p>
            <h2 class="title" >Bienvenue Dr 
                <?php 
                    foreach($user as $u){
                        echo ($u['nomCabinet']);
                    }
                ?>
                !
            </h2>
            <div class="container">
                <h5 class="text-center">recup $nomPhoto</h5>
            </div>
            <div class="infosVeto">
            <div >
           <label class="text">Dr
               <?php 
                    foreach($user as $u){
                        echo ($u['nomCabinet']);
                    }
                ?>
                :
            </label><br>
            </div>
            <div>
           <label class="text">
                <?php 
                    foreach($user as $u){
                        echo ($u['adresseCabinet']);
                        echo "<br>";
                        echo ($u['codePostal']);
                    }
                ?>
           </label><br>
            </div>
             <div>
           <label class="text">
                <?php 
                    foreach($user as $u){
                        echo ($u['email']);
                    }
                ?>
           </label><br>
            </div>
            <div>
           <label class="text">
                <?php 
                    foreach($user as $u){
                        echo ($u['telephone']);
                    }
                ?>
           </label><br>
            </div>
            </div>
            <div class="text-center">
             <h6 class="text-center">Nombre d'elevage gérés :</h6>
            <label class="zone_text">$var_elevage</label>
            </div>
            <form action="" method="POST">
            <div class="col-md-12 text-center ">
                <button type="submit" class=" btn btn-block mybtn btn-success">Consulter elevages</button>
            </div>
            </form>
        </div>

    </div>





    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</body></html>