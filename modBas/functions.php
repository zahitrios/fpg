<?php

	session_start();
	include_once ("../conf/functions.php");
	validarSession();

	set_time_limit (36000); //10 minutos para este script
	ini_set('memory_limit', '512M');

	$_SESSION["language_select"] = "es";
	$mensaje="";

	$idusuarios=dameIdUserMd5($_SESSION["i"]); 		
	if(usuarioTieneModulo($idusuarios,15)===false)//Valido que el usuario tenga el modulo de modificaciones
	{
		echo "SU USUARIO NO PUEDE REALIZAR ESTA ACCION";
		die;
	}

	cargaConstantesDelSistema();


	function validaModificacionAnalitica($folioIdentificador,$idmodificacionesAnalitica)
	{

		$sqlA="SELECT idahorrador,nombre FROM ahorrador WHERE folioIdentificador='".$folioIdentificador."'";
		$resA=mysql_query($sqlA);
		$filA=mysql_fetch_assoc($resA);
		$idahorrador=$filA["idahorrador"];
		$nombre=$filA["nombre"];

		$regresa=Array();

		$camposModificacionesAnalitica[]=Array("folioPS","tipoDocumentoPS","importePS");
		$camposModificacionesAnalitica[]=Array("folioCA","tipoDocumentoCA","importeCA");
		$camposModificacionesAnalitica[]=Array("folioCI","tipoDocumentoCI","importeCI");
		$camposModificacionesAnalitica[]=Array("folioDG","tipoDocumentoDG","importeDG");
		$camposModificacionesAnalitica[]=Array("folioCNC","tipoDocumentoCNC","importeCNC");
		$camposModificacionesAnalitica[]=Array("folioOD","tipoDocumentoOD","importeOD");
		$camposModificacionesAnalitica[]=Array("folioPC","tipoDocumentoPC","importePC");
		
		$tablasAhorrador=Array("ahorradorParteSocial","ahorradorCuentasAhorro","ahorradorCuentasInversion","ahorradorDepositosGarantia","ahorradorChequesNoCobrados","ahorradorOtrosDepositos","ahorradorPrestamosCargo");
		$leyendas=Array("parte social","cuentas de ahorro","cuentas de inversión ","depósitos en garantía","cheques no cobrados","otros depósitos","préstamos a cargo");

		$sqlMod="SELECT * FROM modificacionesAnalitica WHERE idmodificacionesAnalitica='".$idmodificacionesAnalitica."'";
		$resMod=mysql_query($sqlMod);
		$filMod=mysql_fetch_assoc($resMod);
		
		foreach($camposModificacionesAnalitica as $indice => $rubro)
		{			
			if($filMod[$rubro[2]]>0)
			{
				$sqlTabla="SELECT * FROM ".$tablasAhorrador[$indice]." WHERE ahorrador_idahorrador='".$idahorrador."' AND tipoDocumento='".$filMod[$rubro[1]]."' AND folio='".$filMod[$rubro[0]]."' AND importe='".$filMod[$rubro[2]]."'";
				$resTabla=mysql_query($sqlTabla);
				if(mysql_num_rows($resTabla)>0) //Encontrado
				{
					echo "<br><span class='exito'>Para el ahorrador ".$nombre." se econtró el documento <strong>".$filMod[$rubro[1]]."</strong> con folio ".$filMod[$rubro[0]]." con importe $ ".separarMiles($filMod[$rubro[2]])." correspondiente a ".$leyendas[$indice]." </span>";
				}
				else //No encontrado
				{
					echo "<br><span class='error'>Para el ahorrador ".$nombre." no se econtró el documento <strong>".$filMod[$rubro[1]]."</strong> con el folio ".$filMod[$rubro[0]]." con importe $ ".separarMiles($filMod[$rubro[2]])." correspondiente a ".$leyendas[$indice]." </span>";
					$regresa[]="Para el ahorrador ".$nombre." no se econtró el documento ".$filMod[$rubro[0]]." con importe $ ".separarMiles($filMod[$rubro[2]])." correspondiente a ".$leyendas[$indice];
				}
			}
		}
		echo "<br><br>";

		return $regresa;
		
	}

?>