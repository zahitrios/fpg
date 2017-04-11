<?php
	session_start();

	include("../lib/PHPExcel_1.8.0_doc/Classes/PHPExcel.php"); 
	include_once ("../conf/functions.php");

	validarSession();

	set_time_limit (36000); //10 minutos para este script
	ini_set('memory_limit', '512M');

	$_SESSION["language_select"] = "es";
	$link=conectDBReturn();

?>
<html>
	<head>
		<title>FIPAGO - Convenios</title>
		<meta charset="UTF-8">

		<link href="https://fonts.googleapis.com/css?family=Raleway:300,400,700" rel="stylesheet">
		<link rel="stylesheet" type="text/css" href="../styles.css">
		<link rel="stylesheet" type="text/css" href="./styles.css">		

		<script language="javascript" src="../functions.js"></script>
	</head>


	<body>
		
		<div id="menuLateral">
			<img src="/img/logo.jpg" style="width:100%;">
			<div class="itemMenu" onclick="cargaModulo('home');">Inicio</div>
				<?php
					cargaModulos();
				?>
			<div class="itemMenu" onclick="cargaModulo('logout');">Salir</div>
		</div>



		<div id="containerPrincipal">
				
				<div class='titulos'>Convenios</div>
				<div class='usuarioLogueado'><?php echo nombreUsuarioLogeado(); ?></div>
				<div style="clear:both;"></div>	

				<div class="tablaCentrada" >
					<?php
						$action=$_REQUEST["a"];
						switch ($action)
						{
							case "cP": //Comenzar Proceso de convenio
								comenzarProceso();
							break;

							case "altaProyectoConvenio":
								altaProyectoConvenio();
							break;
						}
					?>
				</div>
				
		</div>
	</body>
</html>




<?php

	function comenzarProceso()
	{
		global $_REQUEST;
		validarSession();
		$link=conectDBReturn();

		$idusuarios=dameIdUserMd5($_SESSION["i"]); 	
		$idconvenio=$_REQUEST["i"];
		$convenio=dameDetalleConvenio($idconvenio);

		if(usuarioTieneModulo($idusuarios,5)===false)//Valido que el usuario tenga el modulo de convenios
		{
			echo "SU USUARIO NO PUEDE REALIZAR ESTA ACCION";
			die;
		}

		if($convenio["statusConvenio_idstatusConvenio"]!=1) //Solo los convenios que estan en borrador pueden comenzar el proceso
		{
			echo "EL CONVENIO QUE SELECCIONÓ YA NO PUEDE COMENZAR EL PROCESO, DEBE ELEGIR UN PROYECTO DE CONVENIO ";
			die;
		}

		//Cambio el status del convenio
		$sqlUp="UPDATE convenio SET statusConvenio_idstatusConvenio=2 WHERE idconvenio='".$idconvenio."'";
		$resUp=mysql_query($sqlUp);
		if($resUp)		
			guardaLog(dameIdUserMd5($_SESSION["i"]),9,"convenio",$idconvenio); //Guardo en el log el cambio del status del convenio


		//Comienzo a dar de alta ahorrador por ahorrador		
		$ahorradores=dameDatosTodosAhorradoresConsolidada($convenio["revisionesTemporales_idrevisionesTemporales"]);


		$contadorAhorradores=0;

		foreach($ahorradores as $k => $ahorrador)
		{

			// idconsolidadasTemporales -> 4942
			// revisionesTemporales_idrevisionesTemporales -> 2
			// nuevoFolioIdentificador -> 200001
			// folioIdentificadorAnterior -> 0
			// nombreAhorrador -> ALDERETE RIOS PLACIDA
			// parteSocial -> 500
			// cuentasAhorro -> 12500
			// cuentasInversion -> 0
			// depositosGarantia -> 0
			// chequesNoCobrados -> 0
			// otrosDepositos -> 0
			// prestamosACargo -> 0
			// saldoNeto100 -> 13000
			// saldoNeto70 -> 9100
			// montoMaximoPago -> 9100
			// calleYNumero -> NIÑOS HEROES SN
			// colonia -> LOC SANTIAGO CUIXTLA
			// delegacionMunicipio -> SANTOS REYES NOPALA 
			// telefono -> 
			// filaDocumentoOriginal -> 14
			// hojaDocumentoOriginal -> CONSOL 1

			mysql_query("START TRANSACTION");
			$errores=0;

			$sqlA="INSERT INTO ahorrador (nombre,direccion,montoAl100,montoAl70,montoMaximo) VALUES ('".$ahorrador["nombreAhorrador"]."','".$ahorrador["calleYNumero"]." ".$ahorrador["colonia"]." ".$$ahorrador["delegacionMunicipio"]."','".$ahorrador["saldoNeto100"]."','".$ahorrador["saldoNeto70"]."','".$ahorrador["montoMaximoPago"]."')";	
			$resA=mysql_query($sqlA);
			if(!$resA)
				$errores++;
			$idNuevoAhorrador=mysql_insert_id();

			$sqlCn="INSERT INTO convenio_has_ahorrador (convenio_idconvenio,ahorrador_idahorrador) VALUES ('".$idconvenio."','".$idNuevoAhorrador."')";	
			$resCn=mysql_query($sqlCn);
			if(!$resCn)
				$errores++;

			$sqlCA="INSERT INTO sca (monto,ahorrador_idahorrador) VALUES ('".$ahorrador["cuentasAhorro"]."','".$idNuevoAhorrador."')";
			$resCA=mysql_query($sqlCA);
			if(!$resCA)
				$errores++;

			$sqlCI="INSERT INTO sci (monto,ahorrador_idahorrador) VALUES ('".$ahorrador["cuentasInversion"]."','".$idNuevoAhorrador."')";
			$resCI=mysql_query($sqlCI);
			if(!$resCI)
				$errores++;

			$sqlPS="INSERT INTO sps (monto,ahorrador_idahorrador) VALUES ('".$ahorrador["parteSocial"]."','".$idNuevoAhorrador."')";
			$sqlPS=mysql_query($sqlPS);
			if(!$sqlPS)
				$errores++;

			$sqlSDG="INSERT INTO sdg (monto,ahorrador_idahorrador) VALUES ('".$ahorrador["depositosGarantia"]."','".$idNuevoAhorrador."')";
			$sqlSDG=mysql_query($sqlSDG);
			if(!$sqlSDG)
				$errores++;

			$sqlSPC="INSERT INTO spc (monto,ahorrador_idahorrador) VALUES ('".$ahorrador["prestamosACargo"]."','".$idNuevoAhorrador."')";
			$sqlSPC=mysql_query($sqlSPC);
			if(!$sqlSPC)
				$errores++;

			$sqlSOD="INSERT INTO sod (monto,ahorrador_idahorrador) VALUES ('".$ahorrador["otrosDepositos"]."','".$idNuevoAhorrador."')";
			$sqlSOD=mysql_query($sqlSOD);
			if(!$sqlSOD)
				$errores++;

			if ($errores==0)
			{
			    mysql_query("COMMIT");
			    $contadorAhorradores++;
			}
			else
			{
			    mysql_query("ROLLBACK");
			}			
		}
		echo "EL PROCESO DEL CONVENIO FUE INICIADO CORRECTAMENTE<br><br>";
		echo "SE DIERON DE ALTA <strong>".$contadorAhorradores."</strong> AHORRADORES<br><br>";

		echo "<input type='button' onclick='cargaModulo(\"ahrs/index.php?a=shwCdr&ic=".$idconvenio."\");' value='MOSTRAR CUADRO DE AHORRADORES' class='botonRojo' />";
	}




	function altaProyectoConvenio()
	{
		global $_REQUEST;
		validarSession();
		$link=conectDBReturn();

		$idusuarios=dameIdUserMd5($_SESSION["i"]); 		
		if(usuarioTieneModulo($idusuarios,5)===false)//Valido que el usuario tenga el modulo de convenios
		{
			echo "SU USUARIO NO PUEDE REALIZAR ESTA ACCION";
			die;
		}

		$revisionTemporal=$_REQUEST["revisionesTemporales_idrevisionesTemporales"];
		$fechaFirma=$_REQUEST["dateFirmaP"];
		$fechaDOF=$_REQUEST["dateDOFP"];
		$cuentaBancaria=$_REQUEST["cuentaBancaria"];
		$CLABE=$_REQUEST["clabe"];
		$banco=$_REQUEST["banco"];		
		$estado=$_REQUEST["estado"];
		$porcentajeContingencia=$_REQUEST["porcentajeContingencia"];
		$fechaFinRegistro="";
		$fechaFinPago="";

		if($fechaFirma!="")
		{
			$fechaFirma= date('Y-m-d', strtotime($fechaFirma));		
		}
		if($fechaDOF!="")
		{
			$fechaDOF= date('Y-m-d', strtotime($fechaDOF));
			//Calculo la fecha de fin de registro (60 días naturales más)		
			$fechaFinRegistro=$fechaDOF;
			$fechaFinRegistro= date('Y-m-d', strtotime($fechaFinRegistro. ' + 60 days'));
			//Calculo la fecha de fin de pago (180 días naturales más)		
			$fechaFinPago=$fechaDOF;
			$fechaFinPago= date('Y-m-d', strtotime($fechaFinPago. ' + 180 days'));
		}
			
		$erroresRevision=dameErroresRevision($revisionTemporal);
		if($erroresRevision>0)
		{
			echo "LA REVISIÓN QUE SELECCIONO CUENTA CON ERRORES, DEBE GENERAR UNA REVISIÓN DE BASE DE DATOS SIN ERRORES";
			die;
		}
		?>
		<strong>CUADRO DE APORTACIONES</strong>
		<br><br>		
		<?php		

		$sql="INSERT INTO convenio 
			(
				statusConvenio_idstatusConvenio,
				usuarios_idusuarios,
				revisionesTemporales_idrevisionesTemporales,
				estado_idestado,
				fechaFirma,
				fechaDOF,
				bancos_idbancos,
				cuentaBancaria, 
				clabe,
				porcentajeContingencia, 				
				fechaFinRegistro,
				fechaFinPago,
				montoMaximoPagoTotal,
				montoMaximoPagoEstado,
				montoMaximoPagoFipago,
				montoContingenciaTotal,
				montoContingenciaEstado,
				montoContingenciaFipago,
				montoTotalConvenio,
				montoTotalEstado,
				montoTotalFipago
			) 
			VALUES 
			(
				'1',
				'".dameIdUserMd5($_SESSION["i"])."',
				'".$revisionTemporal."',
				'".$estado."',
				'".$fechaFirma."',
				'".$fechaDOF."',
				'".$banco."',
				'".$cuentaBancaria."', 
				'".$CLABE."', 
				'".$porcentajeContingencia."', 			
				'".$fechaFinRegistro."',
				'".$fechaFinPago."',
				'".$montoMaximoDePago."',
				'".$montoMaximoDePagoEstado."',
				'".$montoMaximoDePagoFipago."',
				'".($contingenciaFipago + $contingenciaEstado)."',
				'".$contingenciaEstado."',
				'".$contingenciaFipago."',
				'".($totalFipago + $totalEstado)."',
				'".$totalEstado."',
				'".$totalFipago ."'
			)";
		$res=mysql_query($sql);
		if(!$res)
		{
			echo "<br><br>".$sql."<br>OCURRIO UN ERROR AL SUBIR EL CONVERNIO<br>".mysql_error();
			die;
		}
		$idconvenio=mysql_insert_id();
		imprimeCuadroAportaciones($revisionTemporal);
		guardaLog(dameIdUserMd5($_SESSION["i"]),7,"convenio",$idconvenio);

		/***  GUARDO LOS DOCUMENTOS ***/
		foreach($_REQUEST as $k => $v)
		{
			$pos = strrpos($k, "documentos_");
			if ($pos === false) 
			{ }
			else
			{				
				$documentos[]=$v;
			}			
		} 
		foreach($documentos as $indice => $documento)
		{
			$sqlDocs="INSERT INTO convenio_has_documentos (convenio_idconvenio,documentos_iddocumentos) VALUES ('".$idconvenio."','".$documento."')";
			$resDocs=mysql_query($sqlDocs);
		}
		/***  FIN DE GUARDO LOS DOCUMENTOS ***/

		echo "<br><br>EL PROYECTO DE CONVENIO FUE GUARDADO EXITOSAMENTE<br><br>";

		//Reviso las sociedades
		$sociedades=dameTodasSociedadesRevision($revisionTemporal);
		echo "<ol style='text-align:left;'>";
			foreach($sociedades as $indice => $sociedad)
			{
				echo "<li>";
				//Busco si esa sociedad ya esta en el sistema
				$sqlSoc="SELECT * FROM sociedad WHERE UPPER(nombre)='".strtoupper($sociedad)."'";
				$resSoc=mysql_query($sqlSoc);
				if(mysql_num_rows($resSoc)==0) //Doy de alta la sociedad 
				{
					$sqlUp="INSERT INTO sociedad (nombre) VALUES ('".$sociedad."')";
					$resUp=mysql_query($sqlUp);
					$idNuevaSociedad=mysql_insert_id();

					$sqlConSoc="INSERT INTO convenio_has_sociedad (convenio_idconvenio,sociedad_idsociedad) VALUES ('".$idconvenio."','".$idNuevaSociedad."')";
					$resConSoc=mysql_query($sqlConSoc);
					echo "La sociedad <strong>".$sociedad."</strong> fue registrada en el catálogo de sociedades";
					
				}
				else
				{
					$filSoc=mysql_fetch_assoc($resSoc);
					$idNuevaSociedad=$filSoc["idsociedad"];
					$sqlConSoc="INSERT INTO convenio_has_sociedad (convenio_idconvenio,sociedad_idsociedad) VALUES ('".$idconvenio."','".$idNuevaSociedad."')";
					$resConSoc=mysql_query($sqlConSoc);
				}
				echo "</li>";
			}
		echo "</ol>";

		echo '<input type="button" onclick="cargaModulo(\'conv\');" value="Siguiente" class="botonRojo">';

	}

?>
