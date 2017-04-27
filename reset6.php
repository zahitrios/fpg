<?php

	include_once ("conf/functions.php");
	validarSession();

	
	
	$sql[]="TRUNCATE contenedoresTemporales";
	$sql[]="TRUNCATE reporteFinal";
	$sql[]="TRUNCATE registrosContenadores";
	$sql[]="TRUNCATE erroresContenedoresTemporales";
	
	


	foreach($sql as $k => $v)
	{
		if(mysql_query($v))
			echo "done!<br>";
		else
		{
			echo "error: <br>".$v."<br>".mysql_error()."<br>";
		}
	}


	$files = glob('contFiles/*'); 
	foreach($files as $file)
	{
	  if(is_file($file))
	    unlink($file); 
	}




?>