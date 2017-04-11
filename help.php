<?php

	$udb="db217829";
	$psdb="ElM11M3d14T3mpl32016#";
	$ndb="db217829_fipago";
	$hdb="internal-db.s217829.gridserver.com";
	
	$link = mysql_connect($hdb, $udb, $psdb);

	if(!$link)
	{
		echo "Revise la conexión con el servidor de base de datos<br>";
		die;
	}

	mysql_select_db($ndb, $link);
	mysql_set_charset("utf8");



	$folios=Array();
	$nombres=Array();

	$sql="SELECT * FROM analiticasTemporales WHERE revisionesTemporales_idrevisionesTemporales=13 ORDER BY idanaliticasTemporales ASC";
	$res=mysql_query($sql);

	while($fil=mysql_fetch_assoc($res))
	{
		$ecuentraFolio=0;
		foreach($folios as $k => $v)
		{
			if($v==$fil["nuevoFolioIdentificador"])
				$ecuentraFolio=1;
		}

		if($ecuentraFolio==0)
		{
			$folios[]=$fil["nuevoFolioIdentificador"];
			echo $fil["nuevoFolioIdentificador"]."<br>";
		}
		else
			echo "<br>";




		// $ecuentraNombre=0;
		// foreach($nombres as $k => $v)
		// {
		// 	if($v==$fil["nombreAhorrador"])
		// 		$ecuentraNombre=1;
		// }
		// if($ecuentraNombre==0)
		// {
		// 	$nombres[]=$fil["nombreAhorrador"];
		// 	echo $fil["nombreAhorrador"]."<br>";
		// }
		// else
		// 	echo "<br>";




	}


?>