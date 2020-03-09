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

    <link href="<?php echo base_url(); ?>/public/css/style.css" rel="stylesheet">
<script src="https://www.chartjs.org/dist/2.9.3/Chart.min.js"></script>
	<script src="https://www.chartjs.org/samples/latest/utils.js"></script>
	<style>
		canvas {
			-moz-user-select: none;
			-webkit-user-select: none;
			-ms-user-select: none;
		}
	</style>
    <style>
        body {
            background: whitesmoke;
            margin: 0;
            padding: 0;
            color: grey;
        }

   

        h4 {
            margin-top: 20px;
            margin-bottom: 20px;
        }



        .mybtn1 {
            border: none;
            border-radius: 50px;
            background-color: #ffffff;
            color: #87C165;
            width: 200px;
            padding: 10px;
            margin-top: 20px;
            font-size: 20px;
            margin-bottom: 10px;
           
        }
        
           #title{
            font-size: 1.7em;
            font-weight: 700 !important;
            opacity: 0.7;
        }

        .zone_text {
            width: 1000px;;
            height: auto;
            text-align: center;
            background-color: white;
            border-radius: 5px;
        }

        .contain {
            background-color: #ffffff;
            width: 200px;
            height: 200px;
            border: 1px solid;
            margin: 10px;
        }
        
        

       
        
       
    </style>

</head>

<body>

     


    <div id="main">
        <div class="container-fluid">
            <h4 id="title" class="text-center">Historiques Tests</h4>
            <h4>Listes recapitulatifs de vos tests :</h4>
            

            <div class="text-center">
                <label class="zone_text">
    
                </label>

            </div>
               
                 <div>
                    
                      <button type="submit" class=" btn btn-block mybtn1 btn-success" onclick="window.print()">Imprimer </button>
                    
                </div>
                
            

        </div>
    </div>



    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</body></html>


