<?php

	session_start();
	include_once ("conf/functions.php");
	validarSession();

?>

<html>
	<head>
		<title>FIPAGO - Inicio</title>
		<meta charset="UTF-8">

		<link href="https://fonts.googleapis.com/css?family=Raleway:300,400,700" rel="stylesheet">
		<link rel="stylesheet" type="text/css" href="styles.css">		

		<script language="javascript" src="./functions.js"></script>

	</head>


	<body>
		
		<div id="menuLateral">
			<img src="<?php echo RUTA."/img/logo.jpg"; ?>" style="width:100%;">
			<div class="itemMenu" onclick="cargaModulo('home');">Inicio</div>
				<?php
					cargaModulos();
				?>
			<div class="itemMenu" onclick="cargaModulo('logout');">Salir</div>
		</div>



		<div id="containerPrincipal">
		</div>

		<div style="clear:both;"></div>
		
	</body>

</html>