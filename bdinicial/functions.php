<?php

	session_start();
	include_once ("../conf/functions.php");
	validarSession();

	set_time_limit (36000); //10 minutos para este script
	ini_set('memory_limit', '512M');

	$_SESSION["language_select"] = "es";
	$mensaje="";

	$idusuarios=dameIdUserMd5($_SESSION["i"]); 		
	if(usuarioTieneModulo($idusuarios,2)===false)//Valido que el usuario tenga el modulo de convenios
	{
		echo "SU USUARIO NO PUEDE REALIZAR ESTA ACCION";
		die;
	}


	$action=$_REQUEST["a"];

	
	switch($action)
	{

		case "cuentaRegistros":
			cuentaRegistros();
		break;

		case "checkFilasTodas":
			checkFilasTodas();
		break;

		case "checkFilasTodasAnalitica":
			checkFilasTodasAnalitica();
		break;

		case "checkFilasTodasResumen":
			checkFilasTodasResumen();
		break;

		case "guardaNuevoDocumento":
			guardaNuevoDocumento();
		break;


	}




	function guardaNuevoDocumento()
	{
		global $_REQUEST;

		$sql="INSERT INTO documentosValor (nombre) VALUES ('".$_REQUEST["n"]."')";
		$res=mysql_query($sql);
		if(!$res)
			echo "0";
		else
		{
			$idNuevoDocumentosValor=mysql_insert_id();
			echo $idNuevoDocumentosValor.",".$_REQUEST["n"];
		}
	}




	function checkFilasTodas()
	{
		global $_REQUEST,$mensaje;

		require("./classes.php"); 

		$file=$_REQUEST["fileD"];
		$estado=$_REQUEST["estado"];

		$documentosValor=$_REQUEST["documentosValor"];
	
		$hojaConsolidada=$_REQUEST["hojaConsolidada"];
		$hojaAnalitica=$_REQUEST["hojaAnalitica"];
		$hojaResumen=$_REQUEST["hojaResumen"];

		$filaConsolidada=$_REQUEST["filaConsolidada"];
		$filaAnalitica=$_REQUEST["filaAnalitica"];
		$filaResumen=$_REQUEST["filaResumen"];

		$filaConsolidada2=$_REQUEST["filaConsolidada2"];
		$filaAnalitica2=$_REQUEST["filaAnalitica2"];
		$filaResumen2=$_REQUEST["filaResumen2"];

		//Inserto la revision temporal
		$sql="INSERT INTO revisionesTemporales (archivo,estado_idestado) VALUES ('".$file."','".$estado."')";
		$res=mysql_query($sql);
		$idrevisionesTemporales=mysql_insert_id();
		guardaLog(dameIdUserMd5($_SESSION["i"]),2,"revisionesTemporales",$idrevisionesTemporales);


		$documentosValor=explode(",", $documentosValor);
		foreach($documentosValor as $k => $documentoValor)
		{
			if($documentoValor!="")
			{
				$sql="INSERT INTO revisionesTemporales_has_documentosValor (revisionesTemporales_idrevisionesTemporales,documentosValor_iddocumentosValor) VALUES ('".$idrevisionesTemporales."','".$documentoValor."')";
				$res=mysql_query($sql);
			}
		}
		


		echo $idrevisionesTemporales;

		//// LA CONSOLIDADA ////
		insertRegistros("consolidadasTemporales",$idrevisionesTemporales,$file,$hojaConsolidada,$filaConsolidada,$filaConsolidada2);
		limpiaUltimosRegistros($idrevisionesTemporales,"consolidada");
	
	}



	function checkFilasTodasAnalitica()
	{
		global $_REQUEST,$mensaje;

		include_once("./classes.php"); 

		$file=$_REQUEST["fileD"];

		$hojaConsolidada=$_REQUEST["hojaConsolidada"];
		$hojaAnalitica=$_REQUEST["hojaAnalitica"];
		$hojaResumen=$_REQUEST["hojaResumen"];

		$filaConsolidada=$_REQUEST["filaConsolidada"];
		$filaAnalitica=$_REQUEST["filaAnalitica"];
		$filaResumen=$_REQUEST["filaResumen"];

		$filaConsolidada2=$_REQUEST["filaConsolidada2"];
		$filaAnalitica2=$_REQUEST["filaAnalitica2"];
		$filaResumen2=$_REQUEST["filaResumen2"];

		// OBTENGO EL ID DE LA REVISION TEMPORAL
		$sql="SELECT idrevisionesTemporales FROM revisionesTemporales WHERE archivo='".$file."' ORDER BY idrevisionesTemporales ASC ";
		$res=mysql_query($sql);
		$fil=mysql_fetch_assoc($res);
		$idrevisionesTemporales=$fil["idrevisionesTemporales"];

		//// LA ANALITICA ////		
		insertRegistros("analiticasTemporales",$idrevisionesTemporales,$file,$hojaAnalitica,$filaAnalitica,$filaAnalitica2);
		limpiaUltimosRegistros($idrevisionesTemporales,"analitica");
	}




	function checkFilasTodasResumen()
	{
		global $_REQUEST,$mensaje;

		include_once("./classes.php"); 

		$file=$_REQUEST["fileD"];
		
		$hojaConsolidada=$_REQUEST["hojaConsolidada"];
		$hojaAnalitica=$_REQUEST["hojaAnalitica"];
		$hojaResumen=$_REQUEST["hojaResumen"];

		$filaConsolidada=$_REQUEST["filaConsolidada"];
		$filaAnalitica=$_REQUEST["filaAnalitica"];
		$filaResumen=$_REQUEST["filaResumen"];

		$filaConsolidada2=$_REQUEST["filaConsolidada2"];
		$filaAnalitica2=$_REQUEST["filaAnalitica2"];
		$filaResumen2=$_REQUEST["filaResumen2"];

		// OBTENGO EL ID DE LA REVISION TEMPORAL
		$sql="SELECT idrevisionesTemporales FROM revisionesTemporales WHERE archivo='".$file."' ORDER BY idrevisionesTemporales ASC ";
		$res=mysql_query($sql);
		$fil=mysql_fetch_assoc($res);
		$idrevisionesTemporales=$fil["idrevisionesTemporales"];

		insertRegistros("resumenTemporales",$idrevisionesTemporales,$file,$hojaResumen,$filaResumen,$filaResumen2);
		limpiaUltimosRegistros($idrevisionesTemporales,"resumen");


		//INSERTO TODAS LAS SOCIEDADES EN sociedadesTemporales
		$foliosCajas=array("001","002","003","004","005","006","007","008","009","010","011","012","013","014","015","016","017","018","019","020","021","022","023","024","025","026","027","028","029","030","031","032","033","034","035","036","037","038","039","040","041","042","043","044","045","046","047","048","049","050","051","052","053","054","055","056","057","058","059","060","061","062","063","064","065","066","067","068","069","070","071","072","073","074","075","076","077","078","079","080");
		
		$sql="SELECT DISTINCT(descripcion) FROM resumenTemporales WHERE descripcion<>'' AND UPPER(descripcion)<>'TOTAL' AND revisionesTemporales_idrevisionesTemporales='".$revisionesTemporales_idrevisionesTemporales."' ORDER BY idresumenTemporales ASC";
		$res=mysql_query($sql);
		$contadorFoliosCajas=0;
		while($fil=mysql_fetch_assoc($res))
		{
			$folioCaja=$foliosCajas[$contadorFoliosCajas];
			$nombreCaja=$fil["descripcion"];

			$sqlIn="INSERT INTO sociedadesTemporales (folio,nombre,revisionesTemporales_idrevisionesTemporales) VALUES ('".$folioCaja."','".$nombreCaja."','".$revisionesTemporales_idrevisionesTemporales."')";
			$resIn=mysql_query($sqlIn);

			$contadorFoliosCajas++;
		}
		//INSERTO TODAS LAS SOCIEDADES EN sociedadesTemporales 

	}




	function cuentaRegistros()
	{
		global $_REQUEST;
		$fileD=$_REQUEST["fileD"];

		// OBTENGO EL ID DE LA REVISION TEMPORAL
		$sql="SELECT idrevisionesTemporales FROM revisionesTemporales WHERE archivo='".$fileD."' ORDER BY idrevisionesTemporales ASC ";
		$res=mysql_query($sql);
		$fil=mysql_fetch_assoc($res);
		$idrevisionesTemporales=$fil["idrevisionesTemporales"];

		//PRIMERO DE LA CONSOLIDADA
		$sql="SELECT COUNT(*) AS TOTAL FROM consolidadasTemporales WHERE revisionesTemporales_idrevisionesTemporales='".$idrevisionesTemporales."'";
		$res=mysql_query($sql);
		$fil=mysql_fetch_assoc($res);
		$totalConsolidada=$fil["TOTAL"];

		//LA ANALITICA
		$sql="SELECT COUNT(*) AS TOTAL FROM analiticasTemporales WHERE revisionesTemporales_idrevisionesTemporales='".$idrevisionesTemporales."'";
		$res=mysql_query($sql);
		$fil=mysql_fetch_assoc($res);
		$totalAnalitica=$fil["TOTAL"];

		//LA DE RESUMEN
		$sql="SELECT COUNT(*) AS TOTAL FROM resumenTemporales WHERE revisionesTemporales_idrevisionesTemporales='".$idrevisionesTemporales."'";
		$res=mysql_query($sql);
		$fil=mysql_fetch_assoc($res);
		$totalResumen=$fil["TOTAL"];


		// VERIFICO SI YA SE TERMINO //
		$sql="SELECT COUNT(*) AS TOTAL FROM consolidadasTemporales WHERE UPPER(nombreAhorrador)='TOTAL' AND revisionesTemporales_idrevisionesTemporales='".$idrevisionesTemporales."'";
		$res=mysql_query($sql);
		$fil=mysql_fetch_assoc($res);
		$totalFinalConsolidada=$fil["TOTAL"];

		$sql="SELECT COUNT(*) AS TOTAL FROM analiticasTemporales WHERE UPPER(nombreAhorrador)='TOTAL' AND revisionesTemporales_idrevisionesTemporales='".$idrevisionesTemporales."'";
		$res=mysql_query($sql);
		$fil=mysql_fetch_assoc($res);
		$totalFinalAnalitica=$fil["TOTAL"];


		$sql="SELECT COUNT(*) AS TOTAL FROM resumenTemporales WHERE UPPER(descripcion)='TOTAL' AND revisionesTemporales_idrevisionesTemporales='".$idrevisionesTemporales."'";
		$res=mysql_query($sql);
		$fil=mysql_fetch_assoc($res);
		$totalFinalResumen=$fil["TOTAL"];


		if($totalFinalResumen>2 && $totalFinalConsolidada>0 && $totalFinalAnalitica>0)
			$terminado=1;
		else
			$terminado=0;
		// VERIFICO SI YA SE TERMINO //

		echo $totalConsolidada."-".$totalAnalitica."-".$totalResumen."-".$idrevisionesTemporales."-".$terminado;
	}


	function limpiaUltimosRegistros($idrevisionesTemporales,$tipo)
	{
		if($tipo=="consolidada")
		{
			$sql="SELECT idconsolidadasTemporales FROM consolidadasTemporales WHERE revisionesTemporales_idrevisionesTemporales='".$idrevisionesTemporales."' AND UPPER(nombreAhorrador)='TOTAL'";
			$res=mysql_query($sql);
			$fil=mysql_fetch_assoc($res);
			$idFinal=$fil["idconsolidadasTemporales"];

			$sql="DELETE FROM consolidadasTemporales WHERE revisionesTemporales_idrevisionesTemporales='$idrevisionesTemporales' AND idconsolidadasTemporales>'".$idFinal."'";
			$res=mysql_query($sql);
		}

		else if($tipo=="analitica")
		{
			$sql="SELECT idanaliticasTemporales FROM analiticasTemporales WHERE revisionesTemporales_idrevisionesTemporales='".$idrevisionesTemporales."' AND UPPER(nombreAhorrador)='TOTAL'";
			$res=mysql_query($sql);
			$fil=mysql_fetch_assoc($res);
			$idFinal=$fil["idanaliticasTemporales"];

			$sql="DELETE FROM analiticasTemporales WHERE revisionesTemporales_idrevisionesTemporales='$idrevisionesTemporales' AND idanaliticasTemporales>'".$idFinal."'";
			$res=mysql_query($sql);
		}

		else if($tipo=="resumen")
		{
			$sql="SELECT idresumenTemporales FROM  resumenTemporales WHERE revisionesTemporales_idrevisionesTemporales='".$idrevisionesTemporales."' AND UPPER(descripcion)='TOTAL' ORDER BY idresumenTemporales DESC LIMIT 1";
			$res=mysql_query($sql);
			$fil=mysql_fetch_assoc($res);
			$idFinal=$fil["idresumenTemporales"];

			$sql="DELETE FROM resumenTemporales WHERE revisionesTemporales_idrevisionesTemporales='$idrevisionesTemporales' AND idresumenTemporales>'".$idFinal."'";
			$res=mysql_query($sql);
		}
	}









?>