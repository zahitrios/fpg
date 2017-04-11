<?php

	include_once ("conf/functions.php");
	validarSession();

	$sql[]="TRUNCATE convenio";
	$sql[]="DELETE FROM sociedad WHERE idsociedad>77";
	$sql[]="TRUNCATE convenio_has_sociedad";
	$sql[]="TRUNCATE convenio_has_ahorrador";
	$sql[]="TRUNCATE ahorrador";
	$sql[]="TRUNCATE basesCertificadas";


	$sql[]="TRUNCATE erroresCertificadas";
	$sql[]="TRUNCATE consolidadasCertificadas";
	$sql[]="TRUNCATE analiticasCertificadas";
	$sql[]="TRUNCATE resumenCertificadas";


	$sql[]="TRUNCATE revisionesTemporales";
	$sql[]="TRUNCATE analiticasTemporales";
	$sql[]="TRUNCATE consolidadasTemporales";
	$sql[]="TRUNCATE resumenTemporales";
	$sql[]="TRUNCATE erroresRevisiones";
	$sql[]="TRUNCATE revisionesTemporales_has_documentosValor";
	$sql[]="TRUNCATE revisionesTemporales_has_documentosValor";
	$sql[]="TRUNCATE log";


	$sql[]="TRUNCATE modificacionesConsolidada";
	$sql[]="TRUNCATE modificacionesAnalitica";
	$sql[]="TRUNCATE modificaciones";
	$sql[]="TRUNCATE erroresModificaciones";
	$sql[]="DELETE FROM log WHERE actividades_idactividades=10";


	foreach($sql as $k => $v)
	{
		if(mysql_query($v))
			echo "done!<br>";
		else
		{
			echo "error: <br>".$v."<br>".mysql_error()."<br>";
		}
	}


	$files = glob('tmpFiles/*'); 
	foreach($files as $file)
	{
	  if(is_file($file))
	    unlink($file); 
	}


	$files = glob('modFiles/*'); 
	foreach($files as $file)
	{
	  if(is_file($file))
	    unlink($file); 
	}

	$files = glob('certFiles/*'); 
	foreach($files as $file)
	{
	  if(is_file($file))
	    unlink($file); 
	}


?>