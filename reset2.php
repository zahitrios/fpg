<?php

	include_once ("conf/functions.php");
	validarSession();


	$sql[]="TRUNCATE basesCertificadas";
	$sql[]="TRUNCATE consolidadasCertificadas";
	$sql[]="TRUNCATE analiticasCertificadas";
	$sql[]="TRUNCATE resumenCertificadas";
	$sql[]="TRUNCATE erroresCertificadas";
	$sql[]="TRUNCATE convenio";



	foreach($sql as $k => $v)
	{
		if(mysql_query($v))
			echo "done!<br>";
		else
		{
			echo "error: <br>".$v."<br>".mysql_error()."<br>";
		}
	}



	$files = glob('certFiles/*'); 
	foreach($files as $file)
	{
	  if(is_file($file))
	    unlink($file); 
	}


?>