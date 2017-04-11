<?php

	include_once ("conf/functions.php");
	validarSession();

	$sql[]="TRUNCATE modificacionesConsolidada;";
	$sql[]="TRUNCATE modificacionesAnalitica;";
	$sql[]="TRUNCATE modificaciones;";
	$sql[]="TRUNCATE erroresModificaciones;";
	$sql[]="DELETE FROM log WHERE tabla='modificaciones';";


	foreach($sql as $k => $v)
	{
		if(mysql_query($v))
			echo "done!<br>";
		else
		{
			echo "error: <br>".$v."<br>".mysql_error()."<br>";
		}
	}



	$files = glob('modFiles/*'); 
	foreach($files as $file)
	{
	  if(is_file($file))
	    unlink($file); 
	}


?>