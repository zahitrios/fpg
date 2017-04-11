<?php

	session_start();
	include_once ("../conf/functions.php");
	validarSession();

	set_time_limit (36000); //10 minutos para este script
	ini_set('memory_limit', '512M');

	$_SESSION["language_select"] = "es";
	$link=conectDBReturn();

?>

<html>
	<head>
		
		<meta charset="UTF-8">

		<link href="https://fonts.googleapis.com/css?family=Raleway:300,400,700" rel="stylesheet">
		<link rel="stylesheet" type="text/css" href="../styles.css">
		<link rel="stylesheet" type="text/css" href="../bdinicial/styles.css">		

		<script language="javascript" src="../functions.js"></script>
		<script language="javascript" src="./bdinicial/functions.js"></script>

	</head>


	<body>
		<?php
			$idconvenio=$_REQUEST["i"];
			$file=$_REQUEST["f"];


			$action=$_REQUEST["a"];

			switch($action)
			{
				case "checkGeneralFile":
					checkGeneralFile($file);
				break;

				case "checkDetalleFileConsolidada":
					checkDetalleFileConsolidada();
				break;
			}
		?>
	</body>

</html>


<?php

	function checkGeneralFile($file)
	{
		include("../lib/PHPExcel_1.8.0_doc/Classes/PHPExcel.php"); 


		$Reader = PHPExcel_IOFactory::createReaderForFile($file);
		$Reader->setReadDataOnly(true); // set this, to not read all excel properties, just data
		$worksheetData = $Reader->listWorksheetInfo($file);
		$sheetCount=count($worksheetData);

		$filaMasGrande=100;
		foreach($worksheetData as $hojas => $hoja)
		{
			if($hoja["totalRows"]>$filaMasGrande)
				$filaMasGrande=$hoja["totalRows"];
		}

		/** $worksheetData as $hoja **/
		// worksheetName 
		// lastColumnLetter
		// lastColumnIndex
		// totalRows
		// totalColumns
		
		echo "Hojas en el documento: <strong>".$sheetCount."</strong> (incluyendo hojas ocultas)<br><br>";
		
		$opcionesHojas="";
		foreach($worksheetData as $hojas => $hoja)
		{
			$opcionesHojas.="<option value='".$hoja["worksheetName"]."'>".$hoja["worksheetName"]."</option>";
		}
		for($i=1;$i<50;$i++)
		{
			$opcionesFilas.="<option value='".$i."'>".$i."</option>";
		}

		?>
		<form name="opcionesArchivo" method="post">		
			<fieldset name="fieldSetHojas" class="fieldsetZht">
				<legend>Selecciona las hojas del documento que serán analizadas</legend>
				<br>
				Consolidada: <select name="hojaConsolidada"><?php echo $opcionesHojas; ?></select><br><br>
				Analítica: <select name="hojaAnalitica"><?php echo $opcionesHojas; ?></select><br><br>
				Resumen: <select name="hojaResumen"><?php echo $opcionesHojas; ?></select>
				<br><br>
			</fieldset>

			<br><br>

			<fieldset name="fieldSetfilas" class="fieldsetZht">
				<legend>Selecciona las <strong>filas</strong> desde donde <strong>comienza</strong> la revisión de cada hoja</legend>
				<br>
				Consolidada: <select name="filaConsolidada"><?php echo $opcionesFilas; ?></select><br><br>
				Analítica: <select name="filaAnalitica"><?php echo $opcionesFilas; ?></select><br><br>
				Resumen: <select name="filaResumen"><?php echo $opcionesFilas; ?></select>
				<br><br>
			</fieldset>

			<br><br>

			<fieldset name="fieldSetfilasFinal" class="fieldsetZht">
				<legend>Selecciona las <strong>filas</strong>  donde <strong>finaliza</strong> la revisión de cada hoja</legend>
				<br>
				Consolidada: <input required type="number" name="filaConsolidada2" value="<?php echo $filaMasGrande; ?>" ><br><br>
				Analítica: <input required type="number" name="filaAnalitica2" value="<?php echo $filaMasGrande; ?>"><br><br>
				Resumen: <input required type="number" name="filaResumen2" value="<?php echo $filaMasGrande; ?>" />
				<br><br>				
			</fieldset>
			
			<br><br>
			<input type="hidden" name="a" value="checkDetalleFileConsolidada" />
			<input type="hidden" name="f" value="<?php echo $file; ?>" />
			<input type="hidden" name="i" value="<?php echo $idconvenio; ?>" />

			<input type="submit" value="Analizar archivo" class="botonRojo">
		</form>

		<?php
	}


	function checkDetalleFileConsolidada()
	{
		global $_REQUEST,$mensaje;

		require("./classes.php"); 

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

		//Inserto la revision temporal
		$sql="INSERT INTO revisionesTemporales (usuarios_idusuarios) VALUES ('".dameIdUserMd5($_SESSION["i"])."')";
		$res=mysql_query($sql);
		$idrevisionesTemporales=mysql_insert_id();
		guardaLog(dameIdUserMd5($_SESSION["i"]),2,"revisionesTemporales",$idrevisionesTemporales);

		

		echo "Leyendo la base consolidada, hoja <strong>".$hojaConsolidada."</strong> <br>";

		$registros=insertRegistros($file,$hojaConsolidada,$filaConsolidada,$filaConsolidada2);

		foreach($registros as $indice => $registro)
		{			
		    $sqlInsert="INSERT INTO consolidadasTemporales 
		    			(		    			
							revisionesTemporales_idrevisionesTemporales, nuevoFolioIdentificador, folioIdentificadorAnterior, nombreAhorrador, parteSocial, cuentasAhorro, cuentasInversion, depositosGarantia, chequesNoCobrados, otrosDepositos, prestamosACargo, saldoNeto100, saldoNeto70, montoMaximoPago, calleYNumero, colonia, delegacionMunicipio, telefono, filaDocumentoOriginal,hojaDocumentoOriginal
		    			) 
		    			VALUES 
		    			( 
		    				'".$idrevisionesTemporales."', '".$registro[0]."', '".$registro[1]."', '".$registro[2]."', '".$registro[3]."', '".$registro[4]."', '".$registro[5]."', '".$registro[6]."', '".$registro[7]."', '".$registro[8]."', '".$registro[9]."', '".$registro[10]."', '".$registro[11]."', '".$registro[12]."', '".$registro[13]."', '".$registro[14]."', '".$registro[15]."', '".$registro[16]."', '".$registro[count($registro)-1]."','".$hojaConsolidada."'
		    			)";

		    $resInsert=mysql_query($sqlInsert);
		    if(!$resInsert)
		    {
		    	echo "error: <br>".mysql_error()."<br>".$sqlInsert;
		    	die;
		    }
		}

		?>
		<br>
		<form method="post">

			<input type="hidden" name="a" value="checkDetalleFileAnalitica" />

			<input type="hidden" name="fileD" value="<?php echo $_REQUEST['fileD']; ?>" />
			<input type="hidden" name="hojaConsolidada" value="<?php echo $_REQUEST['hojaConsolidada']; ?>" />
			<input type="hidden" name="hojaAnalitica" value="<?php echo $_REQUEST['hojaAnalitica']; ?>" />
			<input type="hidden" name="hojaResumen" value="<?php echo $_REQUEST['hojaResumen']; ?>" />

			<input type="hidden" name="filaConsolidada" value="<?php echo $_REQUEST['filaConsolidada']; ?>" />
			<input type="hidden" name="filaAnalitica" value="<?php echo $_REQUEST['filaAnalitica']; ?>" />
			<input type="hidden" name="filaResumen" value="<?php echo $_REQUEST['filaResumen']; ?>" />

			<input type="hidden" name="filaConsolidada2" value="<?php echo $_REQUEST['filaConsolidada2']; ?>" />
			<input type="hidden" name="filaAnalitica2" value="<?php echo $_REQUEST['filaAnalitica2']; ?>" />
			<input type="hidden" name="filaResumen2" value="<?php echo $_REQUEST['filaResumen2']; ?>" />

			<input type="hidden" name="idrevisionesTemporales" value="<?php echo $idrevisionesTemporales; ?>" />

			<input type="submit" value="Continuar con la base analítica" class="botonRojo">
		
		</form>
		<?php

	}





	function checkDetalleFileAnalitica()
	{
		global $_REQUEST,$mensaje;

		require("./classes.php"); 

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

		$idrevisionesTemporales=$_REQUEST["idrevisionesTemporales"];

		echo "Leyendo la base analítica, hoja <strong>".$hojaAnalitica."</strong> <br>";
		
		$registros=insertRegistros($file,$hojaAnalitica,$filaAnalitica,$filaAnalitica2);

		foreach($registros as $indice => $registro)
		{
			$sqlInsert="INSERT INTO analiticasTemporales 
	 	    			(		    			
	 						revisionesTemporales_idrevisionesTemporales, nuevoFolioIdentificador, folioIdentificadorAnterior, nombreAhorrador, tipoDocumentoPS, folioPS, importePS, tipoDocumentoCA, folioCA, importeCA, tipoDocumentoCI, folioCI, importeCI, tipoDocumentoDG, folioDG, importeDG, tipoDocumentoCNC, folioCNC, importeCNC, tipoDocumentoOtros, folioOtros, importeOtros, tipoDocumentoPrestamos, folioPrestamos, importePrestamos, saldoNeto100, saldoNeto70, montoMaximoPago, calleYNumero, delegacionMunicipio, telefono, filaDocumentoOriginal,hojaDocumentoOriginal
	 	    			) 
	 	    			VALUES 
	 	    			(
	 	    				'".$idrevisionesTemporales."', '".$registro[0]."', '".$registro[1]."', '".$registro[2]."', '".$registro[3]."', '".$registro[4]."', '".$registro[5]."', '".$registro[6]."', '".$registro[7]."', '".$registro[8]."', '".$registro[9]."', '".$registro[10]."', '".$registro[11]."', '".$registro[12]."', '".$registro[13]."', '".$registro[14]."', '".$registro[15]."', '".$registro[16]."', '".$registro[17]."', '".$registro[18]."', '".$registro[19]."', '".$registro[20]."', '".$registro[21]."', '".$registro[22]."', '".$registro[23]."', '".$registro[24]."', '".$registro[25]."', '".$registro[26]."', '".$registro[27]."', '".$registro[28]."', '".$registro[29]."', '".$registro[count($registro)-1]."','".$hojaAnalitica."'
	 	    			)";

		    $resInsert=mysql_query($sqlInsert);
		    if(!$resInsert)
		    {
		    	echo "error: <br>".mysql_error()."<br>".$sqlInsert;
		    	die;
		    }
		}

		?>
		<br>
		<form method="post">

			<input type="hidden" name="a" value="checkDetalleFileResumen" />

			<input type="hidden" name="fileD" value="<?php echo $_REQUEST['fileD']; ?>" />
			<input type="hidden" name="hojaConsolidada" value="<?php echo $_REQUEST['hojaConsolidada']; ?>" />
			<input type="hidden" name="hojaAnalitica" value="<?php echo $_REQUEST['hojaAnalitica']; ?>" />
			<input type="hidden" name="hojaResumen" value="<?php echo $_REQUEST['hojaResumen']; ?>" />

			<input type="hidden" name="filaConsolidada" value="<?php echo $_REQUEST['filaConsolidada']; ?>" />
			<input type="hidden" name="filaAnalitica" value="<?php echo $_REQUEST['filaAnalitica']; ?>" />
			<input type="hidden" name="filaResumen" value="<?php echo $_REQUEST['filaResumen']; ?>" />

			<input type="hidden" name="filaConsolidada2" value="<?php echo $_REQUEST['filaConsolidada2']; ?>" />
			<input type="hidden" name="filaAnalitica2" value="<?php echo $_REQUEST['filaAnalitica2']; ?>" />
			<input type="hidden" name="filaResumen2" value="<?php echo $_REQUEST['filaResumen2']; ?>" />

			<input type="hidden" name="idrevisionesTemporales" value="<?php echo $idrevisionesTemporales; ?>" />

			<input type="submit" value="Continuar con la base de resumen" class="botonRojo">
		
		</form>
		<?php
	}


	function checkDetalleFileResumen()
	{
		global $_REQUEST,$mensaje;

		require("./classes.php"); 

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

		$idrevisionesTemporales=$_REQUEST["idrevisionesTemporales"];

		echo "Leyendo la base de resumen, hoja <strong>".$hojaResumen."</strong> <br>";
		
		$registros=insertRegistros($file,$hojaResumen,$filaResumen,$filaResumen2);

		foreach($registros as $indice => $registro)
		{
			$sqlInsert="INSERT INTO resumenTemporales 
	 	    			(		    			
							revisionesTemporales_idrevisionesTemporales, descripcion, noAhorradores, parteSocial, cuentaAhorro, cuentaInversion, depositosGarantia, chequesNoCobrados, otrosDepositos, prestamosCargo, saldoNetoAhorro100, saldoNetoAhorro70, montoMaximoPago, filaDocumentoOriginal,hojaDocumentoOriginal
	 	    			) 
	 	    			VALUES 
	 	    			(
	 	    				'".$idrevisionesTemporales."','".$registro[0]."','". $registro[1]."','". $registro[2]."','". $registro[3]."','". $registro[4]."','". $registro[5]."','". $registro[6]."','". $registro[7]."','". $registro[8]."','". $registro[9]."','". $registro[10]."','". $registro[11]."','". $registro[count($registro)-1]."','".$hojaResumen."'
	 	    			)";

		    $resInsert=mysql_query($sqlInsert);
		    if(!$resInsert)
		    {
		    	echo "error: <br>".mysql_error()."<br>".$sqlInsert;
		    	die;
		    }
		}

		?>
		<br>
		<form method="post">

			<input type="hidden" name="a" value="comenzarReporte" />

			<!-- 
			<input type="hidden" name="fileD" value="<?php echo $_REQUEST['fileD']; ?>" />
			<input type="hidden" name="hojaConsolidada" value="<?php echo $_REQUEST['hojaConsolidada']; ?>" />
			<input type="hidden" name="hojaAnalitica" value="<?php echo $_REQUEST['hojaAnalitica']; ?>" />
			<input type="hidden" name="hojaResumen" value="<?php echo $_REQUEST['hojaResumen']; ?>" />

			<input type="hidden" name="filaConsolidada" value="<?php echo $_REQUEST['filaConsolidada']; ?>" />
			<input type="hidden" name="filaAnalitica" value="<?php echo $_REQUEST['filaAnalitica']; ?>" />
			<input type="hidden" name="filaResumen" value="<?php echo $_REQUEST['filaResumen']; ?>" />

			<input type="hidden" name="filaConsolidada2" value="<?php echo $_REQUEST['filaConsolidada2']; ?>" />
			<input type="hidden" name="filaAnalitica2" value="<?php echo $_REQUEST['filaAnalitica2']; ?>" />
			<input type="hidden" name="filaResumen2" value="<?php echo $_REQUEST['filaResumen2']; ?>" />
 			-->
			<input type="hidden" name="idrevisionesTemporales" value="<?php echo $idrevisionesTemporales; ?>" />

			<input type="submit" value="Emitir reporte" class="botonRojo">
		
		</form>
		<?php
	}



	function comenzarReporte($getErrores=0)
	{
		global $_REQUEST,$mensaje;

		$erroresTotalesReporte=0;

		$idrevisionesTemporales=$_REQUEST["idrevisionesTemporales"];
		
		$sql="SELECT hojaDocumentoOriginal FROM consolidadasTemporales WHERE revisionesTemporales_idrevisionesTemporales='".$idrevisionesTemporales."'";
		$res=mysql_query($sql);
		$fil=mysql_fetch_assoc($res);
		$hojaConsolidada=$fil["hojaDocumentoOriginal"];

		$sql="SELECT hojaDocumentoOriginal FROM analiticasTemporales WHERE revisionesTemporales_idrevisionesTemporales='".$idrevisionesTemporales."'";
		$res=mysql_query($sql);
		$fil=mysql_fetch_assoc($res);
		$hojaAnalitica=$fil["hojaDocumentoOriginal"];

		$sql="SELECT hojaDocumentoOriginal FROM resumenTemporales WHERE revisionesTemporales_idrevisionesTemporales='".$idrevisionesTemporales."'";
		$res=mysql_query($sql);
		$fil=mysql_fetch_assoc($res);
		$hojaResumen=$fil["hojaDocumentoOriginal"];

		?>
		<fieldset class="fieldsetZht fieldSetReporte">
			<legend><strong>Reporte sobre la base de datos consolidada</strong></legend>
			<br>
			<?php
				//Numero total de ahorradores base consolidada 
				$sql="SELECT COUNT(*) AS total FROM consolidadasTemporales WHERE revisionesTemporales_idrevisionesTemporales='".$idrevisionesTemporales."' AND UPPER(nombreAhorrador)<>'TOTAL' AND nombreAhorrador<>'' ";
				$res=mysql_query($sql);
				$fil=mysql_fetch_assoc($res);
				$totalAhorradoresBaseConsolidada=$fil["total"];
				echo "Total de ahorradores de la base consolidada: <strong>".$totalAhorradoresBaseConsolidada."</strong><br><br>";



				//Reviso folios repetidos
				$sql="SELECT nuevoFolioIdentificador,COUNT(*) AS total FROM consolidadasTemporales WHERE revisionesTemporales_idrevisionesTemporales='".$idrevisionesTemporales."' GROUP BY nuevoFolioIdentificador HAVING total>1";
				$res=mysql_query($sql);		
				$foliosRepetidosBaseConsolidad=mysql_num_rows($res);
				echo "Nuevos folios repetidos de la base consolidada: <strong>".$foliosRepetidosBaseConsolidad."</strong>";

				if($foliosRepetidosBaseConsolidad>0)
				{
					$erroresTotalesReporte++;

					echo "<span class='botonMostrar' onclick='muestraOculta(\"divFoliosRepetidosConsolidada\");' >Mostrar/Ocultar</span>";
					echo "<div class='oculta' id='divFoliosRepetidosConsolidada'>";
						
						while($fil=mysql_fetch_assoc($res))		
							$foliosRepetidos[]=$fil["nuevoFolioIdentificador"];			

						echo "<ul>";
							foreach($foliosRepetidos as $indice => $folio)
							{
								$sqlFoliosRepetidos="SELECT filaDocumentoOriginal FROM consolidadasTemporales WHERE nuevoFolioIdentificador='".$folio."' AND revisionesTemporales_idrevisionesTemporales='".$idrevisionesTemporales."'";					
								$resFoliosRepetidos=mysql_query($sqlFoliosRepetidos);
								$filas="";
								while($filFoliosRepetidos=mysql_fetch_assoc($resFoliosRepetidos))					
									$filas[]=$filFoliosRepetidos["filaDocumentoOriginal"];
								
								$filas=implode(", ",$filas);					
								echo "<li>El folio <strong>".$folio."</strong> aparece en las filas <strong>".$filas."</strong> de la hoja <strong>".$hojaConsolidada."</strong></li>";
							}	
						echo "</ul>";

					echo "</div>";
				}
				echo "<br><br>";


				//Reviso nombres repetidos
				$sql="SELECT nombreAhorrador,COUNT(*) AS total FROM consolidadasTemporales WHERE revisionesTemporales_idrevisionesTemporales='".$idrevisionesTemporales."' GROUP BY nombreAhorrador HAVING total>1";
				$res=mysql_query($sql);		
				$nombresRepetidosBaseConsolidada=mysql_num_rows($res);
				echo "Nombres repetidos de la base consolidada: <strong>".$nombresRepetidosBaseConsolidada."</strong>";
				if($nombresRepetidosBaseConsolidada>0)
				{
					$erroresTotalesReporte++;
					echo "<span class='botonMostrar' onclick='muestraOculta(\"divNombresRepetidosConsolidada\");'>Mostrar/Ocultar</span>";
					echo "<div class='oculta' id='divNombresRepetidosConsolidada'>";
						
						while($fil=mysql_fetch_assoc($res))		
							$nombresRepetidos[]=$fil["nombreAhorrador"];		

						echo "<ul>";
							foreach($nombresRepetidos as $indice => $nombre)
							{							
								$sqlNombresRepetidos="SELECT filaDocumentoOriginal FROM consolidadasTemporales WHERE nombreAhorrador='".$nombre."' AND revisionesTemporales_idrevisionesTemporales='".$idrevisionesTemporales."'";					
								$resNombresRepetidos=mysql_query($sqlNombresRepetidos);
								$filas="";
								while($filNombresRepetidos=mysql_fetch_assoc($resNombresRepetidos))					
									$filas[]=$filNombresRepetidos["filaDocumentoOriginal"];
								
								$filas=implode(", ",$filas);					
								echo "<li>El nombre <strong>".$nombre."</strong> aparece en las filas <strong>".$filas."</strong> de la hoja <strong>".$hojaConsolidada."</strong></li>";					
							}	
						echo "</ul>";

					echo "</div>";		
				}
				echo "<br><br>";




			
				//Reviso todos los importes

				$leyendas="";
				$campos="";

				$leyendas[]="parte social";
				$campos[]="parteSocial";

				$leyendas[]="cuentas de ahorro";
				$campos[]="cuentasAhorro";

				$leyendas[]="cuentas de inversión";
				$campos[]="cuentasInversion";

				$leyendas[]="depositos en garantía";
				$campos[]="depositosGarantia";

				$leyendas[]="cheques no cobrados";
				$campos[]="chequesNoCobrados";

				$leyendas[]="otros depósitos";
				$campos[]="otrosDepositos";

				$leyendas[]="préstamos a cargo";
				$campos[]="prestamosACargo";

				$leyendas[]="saldo neto de ahorro al 100%";
				$campos[]="saldoNeto100";

				$leyendas[]="saldo neto de ahorro al 70%";
				$campos[]="saldoNeto70";

				$leyendas[]="monto máximo de pago";
				$campos[]="montoMaximoPago";


				foreach($campos as $k => $campo)
				{
					$leyenda=$leyendas[$k];

					$sql="SELECT SUM(".$campo.") AS total FROM consolidadasTemporales WHERE UPPER(nombreAhorrador)<>'TOTAL' AND revisionesTemporales_idrevisionesTemporales='".$idrevisionesTemporales."' ";
					$res=mysql_query($sql);
					$fil=mysql_fetch_assoc($res);
					$totalCalculado=$fil["total"];
					$totalCalculado=round($totalCalculado,2);
					echo "Saldo total calculado de ".$leyenda.": <strong>".$totalCalculado."</strong><br>";

					//indicado
					$sql="SELECT ".$campo." FROM consolidadasTemporales WHERE UPPER(nombreAhorrador)='TOTAL' AND revisionesTemporales_idrevisionesTemporales='".$idrevisionesTemporales."' ";
					$res=mysql_query($sql);
					$fil=mysql_fetch_assoc($res);
					$totalIndicado=$fil[$campo];
					echo "Saldo total indicado &nbsp;&nbsp;de ".$leyenda.": <strong>".$totalIndicado."</strong><br>";

					if($totalCalculado==$totalIndicado)
						echo "<span class='exito'>Los montos calculados de ".$leyenda." coinciden con el monto indicado en el documento</span>";
					else
					{
						$erroresTotalesReporte++;
						echo "<span class='error'>Los montos calculados de ".$leyenda." NO coinciden con el monto indicado en el documento</span>";
					}
					echo "<br><br>";
				}



				//Busco direcciones incompletas
				$sql="SELECT filaDocumentoOriginal FROM consolidadasTemporales WHERE (calleYNumero='' OR colonia='' OR delegacionMunicipio='') AND (UPPER(nombreAhorrador)<>'TOTAL' AND nuevoFolioIdentificador<>'' AND revisionesTemporales_idrevisionesTemporales='".$idrevisionesTemporales."')";
				$res=mysql_query($sql);		
				$direccionesIncompletas=mysql_num_rows($res);
				echo "Direcciones incompletas de la base consolidada: <strong>".$direccionesIncompletas."</strong>";

				if($direccionesIncompletas>0)
				{
					$erroresTotalesReporte++;
					$filas="";
					echo "<span class='botonMostrar' onclick='muestraOculta(\"divDireccionesIncompletasConsolidada\");' >Mostrar/Ocultar</span>";
					echo "<div class='oculta' id='divDireccionesIncompletasConsolidada'>";
						while($fil=mysql_fetch_assoc($res))		
							$filas[]=$fil["filaDocumentoOriginal"];			
						
					
						$filas=implode(", ",$filas);					
						echo "<br>La dirección esta incompleta en las filas <strong>".$filas."</strong> de la hoja <strong>".$hojaConsolidada."</strong>";					
							
					echo "</div>";
				}
				echo "<br><br><br>";
				

				
				//Montos mal calculados por ahorrador
				$sql="SELECT * FROM consolidadasTemporales WHERE UPPER(nombreAhorrador)<>'TOTAL' AND nuevoFolioIdentificador<>'' AND revisionesTemporales_idrevisionesTemporales='".$idrevisionesTemporales."'";
				$res=mysql_query($sql);
				$error=0;
				$mensaje="";
				$mensaje.="<ul>";
				while($ahorrador=mysql_fetch_assoc($res))
				{

						//Reviso saldo neto al 100%
						$saldoCalculado100=$ahorrador["parteSocial"]+$ahorrador["cuentasAhorro"]+$ahorrador["cuentasInversion"]+$ahorrador["depositosGarantia"]+$ahorrador["chequesNoCobrados"]+$ahorrador["otrosDepositos"]-$ahorrador["prestamosACargo"];
						$saldoCalculado100=round($saldoCalculado100,2);
						$saldoIndicado100=$ahorrador["saldoNeto100"];
						if(round($saldoCalculado100,2)!=round($saldoIndicado100,2))
						{
							$error++;
							$erroresTotalesReporte++;
							$mensaje.= "<li> El saldo neto de ahorro al 100% del ahorrador <strong>".$ahorrador["nombreAhorrador"]."</strong> indicado en la fila <strong>".$ahorrador["filaDocumentoOriginal"]."</strong> de la hoja ".$hojaConsolidada." debe ser <strong>".$saldoCalculado100."</strong> y en el documento se idica que es de <strong>".$saldoIndicado100."</strong></li>";
						}

						//Reviso saldo neto al 70%
						$saldoCalculado70=$saldoCalculado100*0.70;
						$saldoCalculado70=round($saldoCalculado70,2);
						$saldoIndicado70=$ahorrador["saldoNeto70"];					
						if(round($saldoCalculado70,2)!=round($saldoIndicado70,2))
						{
							$error++;
							$erroresTotalesReporte++;
							$mensaje.= "<li> El saldo neto de ahorro al 70% del ahorrador <strong>".$ahorrador["nombreAhorrador"]."</strong> indicado en la fila <strong>".$ahorrador["filaDocumentoOriginal"]."</strong> de la hoja ".$hojaConsolidada." debe ser <strong>".$saldoCalculado70."</strong> y en el documento se idica que es de <strong>".$saldoIndicado70."</strong></li>";
						}

						//Reviso el monto máximo de pago
						$montoMaximoCalculado=$saldoCalculado70;
						if($montoMaximoCalculado>MONTO_MAXIMO_PAGO)
							$montoMaximoCalculado=MONTO_MAXIMO_PAGO;
						$montoMaximoIndicado=$ahorrador["montoMaximoPago"];					
						if($montoMaximoCalculado!=$montoMaximoIndicado)
						{
							$error++;
							$erroresTotalesReporte++;
							$mensaje.= "<li> El monto máximo de pago del ahorrador <strong>".$ahorrador["nombreAhorrador"]."</strong> indicado en la fila <strong>".$ahorrador["filaDocumentoOriginal"]."</strong> de la hoja ".$hojaConsolidada." debe ser <strong>".$montoMaximoCalculado."</strong> y en el documento se idica que es de <strong>".$montoMaximoIndicado."</strong></li>";
						}					
				}
				$mensaje.="</ul>";

				if($error==0)
					echo "Saldos mal indicados por ahorrador: <strong>0</strong>";
				else
				{
					echo "Saldos mal indicados por ahorrador: <strong>".$error."</strong>";
					echo "<span class='botonMostrar' onclick='muestraOculta(\"divSaldosMalCalculadosPorAhorrador\");'>Mostrar/Ocultar</span>";
					echo "<br><br>";
					echo "<div class='oculta' id='divSaldosMalCalculadosPorAhorrador'>";
						echo $mensaje;
					echo "</div>";
				}
				
			?>
			<br>
		</fieldset>






		<br><br>
		<fieldset class="fieldsetZht fieldSetReporte">
			<legend><strong>Reporte sobre la base de datos analítica</strong></legend>
			<br>
				<?php

					//Reviso folios repetidos					
					$sql="SELECT nuevoFolioIdentificador,COUNT(*) AS total FROM analiticasTemporales WHERE (nuevoFolioIdentificador<>0 OR nuevoFolioIdentificador<>'') AND revisionesTemporales_idrevisionesTemporales='".$idrevisionesTemporales."' GROUP BY nuevoFolioIdentificador HAVING total>1";
					$res=mysql_query($sql);		
					$foliosRepetidosBaseAnalitica=mysql_num_rows($res);
					echo "Nuevos folios repetidos de la base analítica: <strong>".$foliosRepetidosBaseAnalitica."</strong>";

					if($foliosRepetidosBaseAnalitica>0)
					{
						$erroresTotalesReporte++;
						echo "<span class='botonMostrar' onclick='muestraOculta(\"divFoliosRepetidosAnalitica\");' >Mostrar/Ocultar</span>";
						echo "<div class='oculta' id='divFoliosRepetidosAnalitica'>";
							
							while($fil=mysql_fetch_assoc($res))		
								$foliosRepetidos[]=$fil["nuevoFolioIdentificador"];			

							echo "<ul>";
								foreach($foliosRepetidos as $indice => $folio)
								{
									$sqlFoliosRepetidos="SELECT filaDocumentoOriginal FROM analiticasTemporales WHERE nuevoFolioIdentificador='".$folio."' AND revisionesTemporales_idrevisionesTemporales='".$idrevisionesTemporales."'";					
									$resFoliosRepetidos=mysql_query($sqlFoliosRepetidos);
									$filas="";
									while($filFoliosRepetidos=mysql_fetch_assoc($resFoliosRepetidos))					
										$filas[]=$filFoliosRepetidos["filaDocumentoOriginal"];
									
									$filas=implode(", ",$filas);					
									echo "<li>El folio <strong>".$folio."</strong> aparece en las filas <strong>".$filas."</strong> de la hoja <strong>".$hojaAnalitica."</strong></li>";
								}	
							echo "</ul>";

						echo "</div>";
					}
					echo "<br><br>";




					//Reviso folios que no esten en la consolidada
					$sql="SELECT nuevoFolioIdentificador,filaDocumentoOriginal FROM analiticasTemporales WHERE nuevoFolioIdentificador NOT IN(SELECT nuevoFolioIdentificador FROM consolidadasTemporales) AND revisionesTemporales_idrevisionesTemporales='".$idrevisionesTemporales."'";
					$res=mysql_query($sql);
					$numeroFoliosNoEncontrados=mysql_num_rows($res);
					echo "Nuevos folios que NO se encontraron en la base consolidada: <strong>".$numeroFoliosNoEncontrados."</strong>";
					if($numeroFoliosNoEncontrados>0)
					{
						$erroresTotalesReporte++;
						echo "<span class='botonMostrar' onclick='muestraOculta(\"divFoliosNoEncontrados\");'>Mostrar/Ocultar</span>";
						echo "<div class='oculta' id='divFoliosNoEncontrados'>";								
							echo "<ul>";
								while ($fil=mysql_fetch_assoc($res))
									echo "<li>El folio <strong>".$fil["nuevoFolioIdentificador"]."</strong> especificado en la fila <strong>".$fil["filaDocumentoOriginal"]."</strong> de la hoja <strong>".$hojaAnalitica."</strong> no aparece en la base consolidada de la hoja <strong>".$hojaConsolidada."</strong></li>";
								
							echo "</ul>";
						echo "</div>";
					}
					echo "<br><br>";



					//Reviso nombres repetidos
					$sql="SELECT nombreAhorrador,COUNT(*) AS total FROM analiticasTemporales WHERE nombreAhorrador<>'' AND revisionesTemporales_idrevisionesTemporales='".$idrevisionesTemporales."' GROUP BY nombreAhorrador HAVING total>1";
					$res=mysql_query($sql);		
					$nombresRepetidosBaseAnalitica=mysql_num_rows($res);
					echo "Nombres repetidos de la base analítica: <strong>".$nombresRepetidosBaseAnalitica."</strong>";
					if($nombresRepetidosBaseAnalitica>0)
					{
						$erroresTotalesReporte++;
						echo "<span class='botonMostrar' onclick='muestraOculta(\"divNombresRepetidosAnalitica\");'>Mostrar/Ocultar</span>";
						echo "<div class='oculta' id='divNombresRepetidosAnalitica'>";
							
							while($fil=mysql_fetch_assoc($res))		
								$nombresRepetidos[]=$fil["nombreAhorrador"];		

							echo "<ul>";
								foreach($nombresRepetidos as $indice => $nombre)
								{							
									$sqlNombresRepetidos="SELECT filaDocumentoOriginal FROM analiticasTemporales WHERE nombreAhorrador='".$nombre."' AND revisionesTemporales_idrevisionesTemporales='".$idrevisionesTemporales."'";					
									$resNombresRepetidos=mysql_query($sqlNombresRepetidos);
									$filas="";
									while($filNombresRepetidos=mysql_fetch_assoc($resNombresRepetidos))					
										$filas[]=$filNombresRepetidos["filaDocumentoOriginal"];
									
									$filas=implode(", ",$filas);					
									echo "<li>El nombre <strong>".$nombre."</strong> aparece en las filas <strong>".$filas."</strong> de la hoja <strong>".$hojaAnalitica."</strong></li>";					
								}	
							echo "</ul>";

						echo "</div>";		
					}
					echo "<br><br>";




					//Reviso todos los importes
					$leyendas="";
					$campos="";

					$leyendas[]="importes de parte social";
					$campos[]="importePS";

					$leyendas[]="importes de cuentas de ahorro";
					$campos[]="importeCA";

					$leyendas[]="importes de cuentas de inversión";
					$campos[]="importeCI";

					$leyendas[]="importes de depositos en garantía";
					$campos[]="importeDG";

					$leyendas[]="importes de cheques no cobrados";
					$campos[]="importeCNC";

					$leyendas[]="importes de otros depósitos";
					$campos[]="importeOtros";

					$leyendas[]="prestamos a cargo";
					$campos[]="importePrestamos";

					$leyendas[]="saldos netos de ahorro al 100%";
					$campos[]="saldoNeto100";

					$leyendas[]="saldos netos de ahorro al 70%";
					$campos[]="saldoNeto70";

					$leyendas[]="montos máximo de pago";
					$campos[]="montoMaximoPago";

					foreach($campos as $k => $campo)
					{
						$leyenda=$leyendas[$k];

						$sql="SELECT SUM(".$campo.") AS total FROM analiticasTemporales WHERE UPPER(nombreAhorrador)<>'TOTAL' AND revisionesTemporales_idrevisionesTemporales='".$idrevisionesTemporales."' ";
						$res=mysql_query($sql);
						$fil=mysql_fetch_assoc($res);
						$totalCalculado=$fil["total"];
						$totalCalculado=round($totalCalculado,2);
						echo "Saldo total calculado de ".$leyenda.": <strong>".$totalCalculado."</strong><br>";

						//indicado
						$sql="SELECT ".$campo." FROM analiticasTemporales WHERE UPPER(nombreAhorrador)='TOTAL' AND revisionesTemporales_idrevisionesTemporales='".$idrevisionesTemporales."' ";
						$res=mysql_query($sql);
						$fil=mysql_fetch_assoc($res);
						$totalIndicado=$fil[$campo];
						echo "Saldo total indicado &nbsp;&nbsp;de ".$leyenda.": <strong>".$totalIndicado."</strong><br>";

						if($totalCalculado==$totalIndicado)
							echo "<span class='exito'>Los montos calculados de ".$leyenda." coinciden con el monto indicado en el documento</span>";
						else
						{
							$erroresTotalesReporte++;
							echo "<span class='error'>Los montos calculados de ".$leyenda." NO coinciden con el monto indicado en el documento</span>";
						}
						echo "<br><br>";
					}
					echo "<br><br>";




					//Montos mal calculados por ahorrador
					$sql="SELECT * FROM analiticasTemporales WHERE UPPER(nombreAhorrador)<>'TOTAL' AND revisionesTemporales_idrevisionesTemporales='".$idrevisionesTemporales."' LIMIT 50";
					$res=mysql_query($sql);
					$error=0;
					$mensaje="";

					$importePS=0;
					$importeCA=0;
					$importeCI=0;
					$importeDG=0;
					$importeCNC=0;
					$importeOtros=0;
					$importePrestamos=0;
					$saldoNeto100=0;
					$saldoNeto70=0;
					$montoMaximoPago=0;
					$nombreAhorradorAnterior="";
					$nombreRealAhorrador="";
					$filaRealAhorrador="";

					$mensaje.="<ul>";
					$contador=0;
					while($ahorrador=mysql_fetch_assoc($res))
					{
						$nombreAhorradorActual=$ahorrador["nombreAhorrador"];

						if($nombreAhorradorAnterior!=$nombreAhorradorActual && $contador!=0 && $nombreAhorradorActual!="")
						{
							//calculo el 100
							$montoCalculadoAl100=$importePS+$importeCA+$importeCI+$importeDG+$importeCNC+$importeOtros-$importePrestamos;
							$montoCalculadoAl100=round($montoCalculadoAl100,2);							
							if(round($montoCalculadoAl100,2)!=round($saldoNeto100,2))
							{
								$error++;
								$erroresTotalesReporte++;
								$mensaje.= "<li> El saldo neto de ahorro al 100% del ahorrador <strong>".$nombreRealAhorrador."</strong> indicado en la fila <strong>".$filaRealAhorrador."</strong> de la hoja ".$hojaAnalitica." debe ser <strong>".$montoCalculadoAl100."</strong> y en el documento se idica que es de <strong>".$saldoNeto100."</strong></li>";
							}


							//calculo el 70
							$montoCalculadoAl70=$montoCalculadoAl100*0.70;
							$montoCalculadoAl70=round($montoCalculadoAl70,2);							
							if(round($montoCalculadoAl70,2)!=round($saldoNeto70,2))
							{
								$error++;
								$erroresTotalesReporte++;
								$mensaje.= "<li> El saldo neto de ahorro al 70% del ahorrador <strong>".$nombreRealAhorrador."</strong> indicado en la fila <strong>".$filaRealAhorrador."</strong> de la hoja ".$hojaAnalitica." debe ser <strong>".$montoCalculadoAl70."</strong> y en el documento se idica que es de <strong>".$saldoNeto70."</strong></li>";
							}

							//Reviso el monto máximo de pago
							$montoMaximoCalculado=$montoCalculadoAl70;
							if($montoMaximoCalculado>MONTO_MAXIMO_PAGO)
								$montoMaximoCalculado=MONTO_MAXIMO_PAGO;


							if($montoMaximoCalculado!=$montoMaximoPago)
							{
								$error++;
								$erroresTotalesReporte++;
								$mensaje.= "<li> El monto máximo de pago del ahorrador <strong>".$nombreRealAhorrador."</strong> indicado en la fila <strong>".$filaRealAhorrador."</strong> de la hoja ".$hojaAnalitica." debe ser <strong>".$montoMaximoCalculado."</strong> y en el documento se idica que es de <strong>".$montoMaximoPago."</strong></li>";
							}		



							//limpieza datos					
							$importePS=0;
							$importeCA=0;
							$importeCI=0;
							$importeDG=0;
							$importeCNC=0;
							$importeOtros=0;
							$importePrestamos=0;
							$saldoNeto100=0;
							$saldoNeto70=0;
							$montoMaximoPago=0;														
						}
						


						$importePS+=$ahorrador["importePS"];
						$importeCA+=$ahorrador["importeCA"];
						$importeCI+=$ahorrador["importeCI"];
						$importeDG+=$ahorrador["importeDG"];
						$importeCNC+=$ahorrador["importeCNC"];
						$importeOtros+=$ahorrador["importeOtros"];
						$importePrestamos+=$ahorrador["importePrestamos"];
						$saldoNeto100+=$ahorrador["saldoNeto100"];
						$saldoNeto70+=$ahorrador["saldoNeto70"];
						$montoMaximoPago+=$ahorrador["montoMaximoPago"];


						$nombreAhorradorAnterior=$nombreAhorradorActual;

						if($nombreAhorradorAnterior!="")
						{
							$nombreRealAhorrador=$nombreAhorradorAnterior;
							$filaRealAhorrador=$ahorrador["filaDocumentoOriginal"];
						}

						$contador++;
					}

					$mensaje.="</ul>";

					if($error==0)
						echo "Saldos mal indicados por ahorrador: <strong>0</strong>";
					else
					{
						echo "Saldos mal indicados por ahorrador: <strong>".$error."</strong>";
						echo "<span class='botonMostrar' onclick='muestraOculta(\"divSaldosMalCalculadosPorAhorradorAnalitica\");'>Mostrar/Ocultar</span>";
						echo "<br><br>";
						echo "<div class='oculta' id='divSaldosMalCalculadosPorAhorradorAnalitica'>";
							echo $mensaje;
						echo "</div>";
					}

				?>
			<br>
		</fieldset>
		<br><br>




			
			<fieldset class="fieldsetZht fieldSetReporte">
				<legend><strong>Reporte sobre la base de datos de resumen</strong></legend>
				<br>
				<?php
					
					//Nombro todas las sociedades
					$sql="SELECT DISTINCT(descripcion) FROM resumenTemporales WHERE revisionesTemporales_idrevisionesTemporales='".$idrevisionesTemporales."' AND UPPER(descripcion)<>'TOTAL' AND descripcion<>'' ORDER BY idresumenTemporales ASC";
					$res=mysql_query($sql);					
					echo 'Listado de sociedades <span class="botonMostrar" onclick="muestraOculta(\'divNombreSociedades\');">Mostrar/Ocultar</span>';
					echo "<div class='oculta' id='divNombreSociedades'>";						
						echo "<ol>";
							while($fil=mysql_fetch_assoc($res))		
								echo "<li><strong>".$fil["descripcion"]."</strong></li>";
							
						echo "</ol>";
					echo "</div>";
					echo "<br><br>";

					
					$sumasMenores = array("noAhorradores"=>0,"parteSocial"=>0,"cuentaAhorro"=>0,"cuentaInversion"=>0,"depositosGarantia"=>0,"chequesNoCobrados"=>0,"otrosDepositos"=>0,"prestamosCargo"=>0,"saldoNetoAhorro100"=>0,"saldoNetoAhorro70"=>0,"montoMaximoPago"=>0);
					$sumasMayores = array("noAhorradores"=>0,"parteSocial"=>0,"cuentaAhorro"=>0,"cuentaInversion"=>0,"depositosGarantia"=>0,"chequesNoCobrados"=>0,"otrosDepositos"=>0,"prestamosCargo"=>0,"saldoNetoAhorro100"=>0,"saldoNetoAhorro70"=>0,"montoMaximoPago"=>0);
					$camposResumen = array("noAhorradores","parteSocial","cuentaAhorro","cuentaInversion","depositosGarantia","chequesNoCobrados","otrosDepositos","prestamosCargo","saldoNetoAhorro100","saldoNetoAhorro70","montoMaximoPago");
					$leyendas = array("No. total de ahorradores","Total de parte social ($)","Total en cuentas de ahorro ($)","Total en cuentas de inversión ($)","Total en depósitos en garantía ($)","Total en cheques no cobrados ($)","Total en otros depósitos ($)","Total en préstamos a cargo ($)","Total en saldos netos al 100% ($)","Total en saldos netos al 70% ($)","Total en montos máximo de pagos ($)");
					
					$sqlFolioPrimero="SELECT nuevoFolioIdentificador FROM consolidadasTemporales WHERE revisionesTemporales_idrevisionesTemporales='".$idrevisionesTemporales."' ORDER BY idconsolidadasTemporales ASC LIMIT 1";
					$resFolioPrimero=mysql_query($sqlFolioPrimero);
					$filFolioPrimero=mysql_fetch_assoc($resFolioPrimero);
					$filFolioPrimero=$filFolioPrimero["nuevoFolioIdentificador"];

					$folioCaja=$filFolioPrimero[0];
					$longitudFolio=strlen($filFolioPrimero);

					//INICIO Reviso sociedad por sociedad //
					$sql="SELECT DISTINCT(descripcion) FROM resumenTemporales WHERE revisionesTemporales_idrevisionesTemporales='".$idrevisionesTemporales."' AND UPPER(descripcion)<>'TOTAL' AND descripcion<>'' ORDER BY idresumenTemporales ASC";
					$res=mysql_query($sql);
					while($fil=mysql_fetch_assoc($res))		
					{
						if($folioCaja%10==0)
							$longitudFolio++;
						
						echo '<strong>'.$fil["descripcion"].'</strong> folio ('.$folioCaja.')';
						echo "<br>";

						echo "<div class='sangria'>";

							echo "<span class='subTitulos'>Menores o iguales a 239,900.00</span><br>";//Menores o Iguales a 239,900.00
							echo "<div class='sangria'>";								
								$sqlD="SELECT * FROM resumenTemporales WHERE descripcion='".$fil["descripcion"]."' AND  revisionesTemporales_idrevisionesTemporales='".$idrevisionesTemporales."' ORDER BY idresumenTemporales ASC LIMIT 1";
								$resD=mysql_query($sqlD);
								$filD=mysql_fetch_assoc($resD);
								foreach($camposResumen as $indice => $campo)
								{
									$sumasMenores[$campo]+=$filD[$campo];
									echo $leyendas[$indice]." indicados:&nbsp;&nbsp; <strong>".$filD[$campo]."</strong><br>";

									if($campo=="noAhorradores") //Busco solo el total									
										$sqlC="SELECT COUNT(*) AS total ";

									else if($campo=="cuentaAhorro")
										$sqlC="SELECT SUM(cuentasAhorro) AS total ";

									else if($campo=="cuentaInversion")
										$sqlC="SELECT SUM(cuentasInversion) AS total ";

									else if($campo=="prestamosCargo")
										$sqlC="SELECT SUM(prestamosACargo) AS total ";

									else if($campo=="saldoNetoAhorro100")
										$sqlC="SELECT SUM(saldoNeto100) AS total ";

									else if($campo=="saldoNetoAhorro70")
										$sqlC="SELECT SUM(saldoNeto70) AS total ";

									else
										$sqlC="SELECT SUM(".$campo.") AS total ";
																		
									$sqlC.=" FROM consolidadasTemporales WHERE nuevoFolioIdentificador LIKE '".$folioCaja."%' ";
									$sqlC.=" AND LENGTH(nuevoFolioIdentificador)='".$longitudFolio."' ";
									$sqlC.=" AND revisionesTemporales_idrevisionesTemporales='".$idrevisionesTemporales."'";
									$sqlC.=" AND saldoNeto100<=239900";

									$resC=mysql_query($sqlC);
									$filC=mysql_fetch_assoc($resC);

									echo $leyendas[$indice]." calculados: <strong>".round($filC["total"],2)."</strong><br>";									

									if(round($filC["total"],2)==round($filD[$campo],2))									
										echo "<span class='exito'>LOS TOTALES COINCIDEN</span>";									
									else
									{
										$erroresTotalesReporte++;																			
										echo "<span class='error'>LOS TOTALES CALCULADOS EN LA BASE DE DATOS DE RESUMEN NO COINCIDEN CON LOS INDICADOS EN LA BASE CONSOLIDADA</span>";
									}
									echo "<br><br>";


								}
							echo "</div>";
							



							echo "<br>";
							echo "<span class='subTitulos'>Mayores a 239,900.00</span><br>"; //Mayores a 239,900.00
							echo "<div class='sangria'>";								
								$sqlD="SELECT * FROM resumenTemporales WHERE descripcion='".$fil["descripcion"]."' AND  revisionesTemporales_idrevisionesTemporales='".$idrevisionesTemporales."' ORDER BY idresumenTemporales DESC LIMIT 1";
								$resD=mysql_query($sqlD);
								$filD=mysql_fetch_assoc($resD);	
								foreach($camposResumen as $indice => $campo)
								{
									$sumasMayores[$campo]+=$filD[$campo];
									echo $leyendas[$indice]." indicados: <strong>".$filD[$campo]."</strong><br>";

									if($campo=="noAhorradores") //Busco solo el total									
										$sqlC="SELECT COUNT(*) AS total ";

									else if($campo=="cuentaAhorro")
										$sqlC="SELECT SUM(cuentasAhorro) AS total ";

									else if($campo=="cuentaInversion")
										$sqlC="SELECT SUM(cuentasInversion) AS total ";

									else if($campo=="prestamosCargo")
										$sqlC="SELECT SUM(prestamosACargo) AS total ";

									else if($campo=="saldoNetoAhorro100")
										$sqlC="SELECT SUM(saldoNeto100) AS total ";

									else if($campo=="saldoNetoAhorro70")
										$sqlC="SELECT SUM(saldoNeto70) AS total ";

									else
										$sqlC="SELECT SUM(".$campo.") AS total ";
																		
									$sqlC.=" FROM consolidadasTemporales WHERE nuevoFolioIdentificador LIKE '".$folioCaja."%' ";
									$sqlC.=" AND LENGTH(nuevoFolioIdentificador)='".$longitudFolio."' ";
									$sqlC.=" AND revisionesTemporales_idrevisionesTemporales='".$idrevisionesTemporales."'";
									$sqlC.=" AND saldoNeto100>239900";									
									$resC=mysql_query($sqlC);
									$filC=mysql_fetch_assoc($resC);

									echo $leyendas[$indice]." calculados: <strong>".round($filC["total"],2)."</strong><br>";									

									if(round($filC["total"],2)==round($filD[$campo],2))									
										echo "<span class='exito'>LOS TOTALES COINCIDEN</span>";									
									else			
									{
										$erroresTotalesReporte++;						
										echo "<span class='error'>LOS TOTALES CALCULADOS EN LA BASE DE DATOS DE RESUMEN NO COINCIDEN CON LOS INDICADOS EN LA BASE CONSOLIDADA</span>";
									}
									echo "<br><br>";


								}
							echo "</div>";

						echo "</div>";
						
						$folioCaja++;

						echo "<br><br><br>";
					}
					//FIN Reviso sociedad por sociedad //





					/*** TOTALES INDICADOS VS CALCULADOS***/

					//Menores o Iguales a 239,900.00
					echo "<br><strong>TOTALES INDICADOS VS TOTALES CALCULADOS MENORES O IGUALES A 239,900.00 DE LA BASE DE RESUMEN</strong><br><br>";
					echo "<div class='sangria'>";
						$sqlD="SELECT * FROM resumenTemporales WHERE UPPER(descripcion)='TOTAL' AND revisionesTemporales_idrevisionesTemporales='".$idrevisionesTemporales."' ORDER BY idresumenTemporales ASC LIMIT 1";
						$resD=mysql_query($sqlD);
						$filD=mysql_fetch_assoc($resD);	
						foreach($camposResumen as $indiceCamposResumen => $campoResumen)
						{
							echo $leyendas[$indiceCamposResumen]." <strong>indicados</strong>:&nbsp;&nbsp; <strong>".$sumasMenores[$campoResumen]."</strong><br>";
							echo $leyendas[$indiceCamposResumen]." <strong>sumados</strong>: <strong>".$filD[$campoResumen]."</strong><br>";
							
							if(round($sumasMenores[$campoResumen],2)==round($filD[$campoResumen],2))
							{
								echo "<span class='exito'>";
									echo "LOS TOTALES COINCIDEN";
								echo "</span>";
							}
							else
							{
								$erroresTotalesReporte++;
								echo "<span class='error'>";
									echo "LOS TOTALES SUMADOS NO COINCIDEN CON LOS INDICADOS";
								echo "</span>";
							}
							echo "<br><br>";
						}
					echo "</div>";


					//Mayores a 239,900.00
					echo "<br><strong>TOTALES INDICADOS VS TOTALES CALCULADOS MAYORES A 239,900.00 DE LA BASE DE RESUMEN</strong><br><br>";
					echo "<div class='sangria'>";
						$sqlD="SELECT * FROM resumenTemporales WHERE UPPER(descripcion)='TOTAL' AND revisionesTemporales_idrevisionesTemporales='".$idrevisionesTemporales."' ORDER BY idresumenTemporales ASC LIMIT 2";
						$resD=mysql_query($sqlD);
						$filD=mysql_fetch_assoc($resD);
						$filD=mysql_fetch_assoc($resD);

						foreach($camposResumen as $indiceCamposResumen => $campoResumen)
						{
							echo $leyendas[$indiceCamposResumen]." <strong>indicados</strong>:&nbsp;&nbsp; <strong>".$sumasMayores[$campoResumen]."</strong><br>";
							echo $leyendas[$indiceCamposResumen]." <strong>sumados</strong>: <strong>".$filD[$campoResumen]."</strong><br>";
							
							if(round($sumasMayores[$campoResumen],2)==round($filD[$campoResumen],2))
							{
								echo "<span class='exito'>";
									echo "LOS TOTALES COINCIDEN";
								echo "</span>";
							}
							else
							{
								$erroresTotalesReporte++;
								echo "<span class='error'>";
									echo "LOS TOTALES SUMADOS NO COINCIDEN CON LOS INDICADOS";
								echo "</span>";
							}
							echo "<br><br>";
						}
					echo "</div>";

				?>
			</fieldset>

		<?php

		//ACTUALIZO LOS ERRORES
		$sqlUpdate="UPDATE revisionesTemporales SET totalErrores='".$erroresTotalesReporte."' WHERE  idrevisionesTemporales='".$idrevisionesTemporales."'";
		$resUpdate=mysql_query($sqlUpdate);

		if($getErrores==1)
			return $erroresTotalesReporte;

	}
?>