<?php
	
	session_start();

	define("RUTA", "/~dev/"); //en servidor
	define("TIEMPO_SESION",90);  //en minutos
	define("MONTO_MAXIMO_PAGO",167930.00); 

	// error_reporting(E_ALL ^ E_DEPRECATED);
	// error_reporting(E_ERROR | E_WARNING | E_PARSE | E_NOTICE);
	//error_reporting(E_ERROR | E_WARNING | E_PARSE);
	error_reporting(E_ERROR | E_PARSE);

 

	/*
	ini_set('display_errors', 1);
	ini_set('display_startup_errors', 1);
	error_reporting(E_ALL);
	*/

	function conectDB()
	{
		
		$udb="dev_fipago_user";
		$psdb="Eln1n0d3l4s3lv4!";
		$ndb="dev_fipago_db";
		$hdb="localhost";
		
		$link = mysql_connect($hdb, $udb, $psdb);

		if(!$link)
		{
			echo "Revise la conexión con el servidor de base de datos<br>";
			die;
		}

		mysql_select_db($ndb, $link);
		mysql_set_charset("utf8");
	}

	function conectDBReturn()
	{
		$udb="dev_fipago_user";
		$psdb="Eln1n0d3l4s3lv4!";
		$ndb="dev_fipago_db";
		$hdb="localhost";
		
		$link = mysql_connect($hdb, $udb, $psdb);

		mysql_select_db($ndb, $link);
		mysql_set_charset("utf8");

		if(!$link)
		{
			echo "Revise la conexión con el servidor de base de datos<br>";
			die;
		}

		return $link;
	}

	function desconectaDB($linkR)
	{
		mysql_close($linkR);
	}
?>