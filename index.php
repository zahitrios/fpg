<?php


	include ("conf/functions.php");


	$action=$_REQUEST["a"];

	switch($action)
	{
		case "login":
			$login=intentaLogin();
			if($login===1)
				direccionaHome();			
			else			
				$mensaje=$login;			
		break;


		case "lg":
			logout();
		break;

		default:
			if($_SESSION["i"]!="")
				direccionaHome();
		break;

	}

?>

<html>
	<head>
		<title>FIPAGO - SISTEMA</title>
		<meta charset="UTF-8">

		<link rel="stylesheet" type="text/css" href="styles.css">
		<link rel="stylesheet" type="text/css" href="login.css">
		<link href="https://fonts.googleapis.com/css?family=Raleway:300,400,700" rel="stylesheet">

	</head>



	<body>
		
		<div id="divFormLogin">

	
				<img src="./img/logo.jpg">

				<form method="post" >
					<br>
					<input type="text" required name="user" placeholder="USUARIO">
					<br><br>
					<input type="password" required name="pss" placeholder="PASSWORD">
					<br>
					<br>
					<input type="submit" value="Aceptar" class="botonRojo">
					<input type="hidden" name="a" value="login" >
					<br><br>
					<span class="mensaje"><?php echo $mensaje; ?></span>
				</form>
		</div>
		
	
	</body>

</html>