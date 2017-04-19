<?php

	include_once ("conf/functions.php");
	validarSession();

	$sql[]="TRUNCATE ministracionesTemporales";
	$sql[]="TRUNCATE erroresMinistracionesTemporales";
	$sql[]="TRUNCATE registrosMinistraciones";
	$sql[]="TRUNCATE ahorradoresMinistrados";


	foreach($sql as $k => $v)
	{
		if(mysql_query($v))
			echo "done!<br>";
		else
		{
			echo "error: <br>".$v."<br>".mysql_error()."<br>";
		}
	}


	

	$files = glob('minFiles/*'); 
	foreach($files as $file)
	{
	  if(is_file($file))
	    unlink($file); 
	}


?>