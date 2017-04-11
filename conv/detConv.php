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
		<title>FIPAGO - Convenios</title>
		<meta charset="UTF-8">
		<link href="https://fonts.googleapis.com/css?family=Raleway:300,400,700" rel="stylesheet">
		<link rel="stylesheet" type="text/css" href="../styles.css">
		<link rel="stylesheet" type="text/css" href="./styles.css">		

		<script language="javascript" src="../functions.js"></script>
		<script language="javascript" src="./functions.js"></script>
	</head>

	<body onload="marcaRequeridos();">
		
		<div id="menuLateral">
			<img src="/img/logo.jpg" style="width:100%;">
			<div class="itemMenu" onclick="cargaModulo('home');">Inicio</div>
				<?php
					cargaModulos();
				?>
			<div class="itemMenu" onclick="cargaModulo('logout');">Salir</div>
		</div>

		<div id="containerPrincipal">
			<div class='titulos'>Detalle de convenio2</div>
			<div class='usuarioLogueado'><?php echo nombreUsuarioLogeado(); ?></div>
			<div style="clear:both;"></div>	
			<div class="tablaCentrada">
				<?php
					$idconvenio=$_REQUEST["i"];
					$action=$_REQUEST["a"];

					switch($action)
					{
						case "edicionConvenio":
							edicionConvenio();
							formEdit();
						break;

						case "formEdit":
							formEdit();
						break;
					}
				?>
			</div>			
		</div>
	</body>
</html>

<?php

function formEdit()
{
	global $_REQUEST,$idconvenio;

	$KoolControlsFolder="../lib/KoolPHPSuite/KoolControls";

	require $KoolControlsFolder."/KoolAjax/koolajax.php";
	require $KoolControlsFolder."/KoolGrid/koolgrid.php";
	require $KoolControlsFolder."/KoolCalendar/koolcalendar.php";
	require $KoolControlsFolder."/KoolListBox/koollistbox.php";
	require $KoolControlsFolder."/KoolTabs/kooltabs.php";

	$koolajax->scriptFolder = "../lib/KoolPHPSuite/KoolControls/KoolAjax"; 

	$sql="SELECT convenio.*,  
		  estado.nombre AS nombreEstado,
		  statusConvenio.descripcion AS status  
		  FROM convenio 
		  INNER JOIN estado ON idestado=estado_idestado 
		  INNER JOIN statusConvenio ON idstatusConvenio=statusConvenio_idstatusConvenio  
		  WHERE idconvenio='".$idconvenio."'";
	$res=mysql_query($sql);
	$convenio=mysql_fetch_assoc($res);

	?>			
	<form action="./detConv.php" enctype="multipart/form-data" id="formAltaConvenios" name="formAltaConvenios" method="post" class="formularioUpload">						
		<br><br>
		<?php																			
			$dateFirma = new KoolDatePicker("dateFirmaP"); //Create calendar object
			$dateFirma->scriptFolder = $KoolControlsFolder."/KoolCalendar";//Set scriptFolder
			$dateFirma->styleFolder="default";
			if($convenio["fechaFirma"]!="0000-00-00")
				$dateFirma->Value = $convenio["fechaFirma"];
			$dateFirma->Init();


			$dateDOF = new KoolDatePicker("dateDOFP"); //Create calendar object
			$dateDOF->scriptFolder = $KoolControlsFolder."/KoolCalendar";//Set scriptFolder
			$dateDOF->styleFolder="default";	
			if($convenio["fechaDOF"]!="0000-00-00")
				$dateDOF->Value = $convenio["fechaDOF"];					 
			$dateDOF->Init();

			$todosDocumentosIdentidad=dameGridTable("documentos WHERE catalogoTipoDocumentos_idcatalogoTipoDocumentos=1","nombre");
			$todosDocumentosValor=dameGridTable("documentos WHERE catalogoTipoDocumentos_idcatalogoTipoDocumentos=2","nombre");

			$todosEstados=dameGridTable("estado","nombre");
			$todosBancos=dameGridTable("bancos","nombre");
		?>
		<div class="mitadIzquierda">
			Status del convenio: <strong><?php echo $convenio["status"]; ?></strong>
			<br><br>
			Entidad federativa: <?php echo $convenio["nombreEstado"]; ?>					
			<br><br>					
			Monto máximo de pago: $<?php echo separarMiles($convenio["montoMaximoPagoTotal"]); ?>
			<br><br>
			Fondo de contingencia (<?php echo $convenio["porcentajeContingencia"]; ?>%): $<?php echo separarMiles($convenio["montoContingenciaTotal"]); ?>
			<br><br>	
			Monto total del convenio: <strong>$<?php echo separarMiles($convenio["montoTotalConvenio"]); ?></strong>
			<br><br>

			Banco:
			<select name="banco" id="banco">						
				<?php
					foreach($todosBancos as $indice => $banco)
					{
						if($convenio["bancos_idbancos"]==$banco["idbancos"])									
							echo "<option selected value='".$banco["idbancos"]."'>".$banco["nombreCorto"]."</option>";
						else
							echo "<option value='".$banco["idbancos"]."'>".$banco["nombreCorto"]."</option>";
					}
				?>
			</select>
			<br><br>

			Cuenta bancaria: <input type="text" name="cuentaBancaria" id="cuentaBancaria" value="<?php echo $convenio['cuentaBancaria']; ?>"/>
			<br><br>

			CLABE: <input type="text" name="clabe" id="clabe" value="<?php echo $convenio['clabe']; ?>"/>
			<br><br>	

			Fecha de la firma del convenio: <?php echo $dateFirma->Render();?>
			<br><br>
			Fecha de la publicación en el DOF: <?php echo $dateDOF->Render();?>
			<br><br>					
			<?php
				if($convenio["fechaDOF"]!="0000-00-00")
				{
					?>
					Fecha final para el registro a ahorradores: <?php echo convierteTimeStampCorto($convenio["fechaFinRegistro"]);?>
					<br><br>
					Fecha final para el pago a ahorradores: <?php echo convierteTimeStampCorto($convenio["fechaFinPago"]);?>
					<br><br>
					<?php
				}
			?>							
		</div>


		<div class="mitadDerecha">

			<strong>Sociedades del convenio:</strong>
			<br>
			<div class="sangria">						
				<?php
					$sqlSocs="SELECT * FROM sociedad INNER JOIN convenio_has_sociedad ON sociedad_idsociedad=idsociedad WHERE convenio_idconvenio='".$idconvenio."'";
					$resSocs=mysql_query($sqlSocs);
					while($filSocs=mysql_fetch_assoc($resSocs))
					{
						echo "- ".$filSocs["nombre"]."<br>";
					}
				?>
			</div>
			<br><br>

			<strong>Documentos de identidad aprobados en el convenio:</strong>
			<br>
			<div class="sangria">						
				<?php
					foreach($todosDocumentosIdentidad as $indiceDocumentos => $documento)
					{
						$sqlDocs="SELECT COUNT(*) AS total FROM convenio_has_documentos WHERE documentos_iddocumentos=".$documento["iddocumentos"]." AND convenio_idconvenio='".$idconvenio."'";
						$resDocs=mysql_query($sqlDocs);
						$filDocs=mysql_fetch_assoc($resDocs);
						if($filDocs["total"]>0)
							echo '<input type="checkbox" checked name="documentos_'.$documento["iddocumentos"].'" value="'.$documento["iddocumentos"].'">'.$documento["nombre"].'<br>';
						else
							echo '<input type="checkbox" name="documentos_'.$documento["iddocumentos"].'" value="'.$documento["iddocumentos"].'">'.$documento["nombre"].'<br>';								
					}
				?>
			</div>
			<br><br>

			<strong>Documentos de valor aprobados en el convenio:</strong>
			<br>	
			<div class="sangria">													
				<?php
					foreach($todosDocumentosValor as $indiceDocumentos => $documento)
					{
						$sqlDocs="SELECT COUNT(*) AS total FROM convenio_has_documentos WHERE documentos_iddocumentos=".$documento["iddocumentos"]." AND convenio_idconvenio='".$idconvenio."'";
						$resDocs=mysql_query($sqlDocs);
						$filDocs=mysql_fetch_assoc($resDocs);
						if($filDocs["total"]>0)
							echo '<input checked type="checkbox" name="documentos_'.$documento["iddocumentos"].'" value="'.$documento["iddocumentos"].'">'.$documento["nombre"].'<br>';								
						else
							echo '<input type="checkbox" name="documentos_'.$documento["iddocumentos"].'" value="'.$documento["iddocumentos"].'">'.$documento["nombre"].'<br>';								
					}
				?>
			</div>							
		</div>						


		<div style="clear:both;"></div>
		<br><br>						
		<input type="hidden" name="a" value="edicionConvenio" />
		<input type="hidden" name="i" value="<?php echo $idconvenio; ?>" />
		<input type="hidden" name="statusConvenio_idstatusConvenio" value="1" /> <!-- convenio en proyecto -->
		<?php					
			echo '<input type="submit" value="Guardar cambios" class="botonRojo">';
		?>						
	</form>
	<?php						
		$revisionTemporal=$convenio["revisionesTemporales_idrevisionesTemporales"];
	?>
	<br>
	<strong>CUADRO DE APORTACIONES</strong>
	<br><br>
	<?php
		imprimeCuadroAportaciones($revisionTemporal);
	?>
	<br><br>
	<?php					
		echo '<input type="button" onclick="cargaModulo(\'conv\');" value="Volver a la lista de convenios" class="botonRojo">';
	?>
	<br><br>
	<?php
}

function edicionConvenio()
{
	global $_REQUEST,$idconvenio;

	$banco=$_REQUEST["banco"];		
	$cuentaBancaria=$_REQUEST["cuentaBancaria"];
	$CLABE=$_REQUEST["clabe"];
	$fechaFirma=$_REQUEST["dateFirmaP"];
	$fechaDOF=$_REQUEST["dateDOFP"];
	
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


	$sqlUpd="UPDATE convenio SET 
             bancos_idbancos='".$banco."', 
             cuentaBancaria='".$cuentaBancaria."',
             clabe='".$CLABE."',
             fechaFirma='".$fechaFirma."',
             fechaDOF='".$fechaDOF."',
             fechaFinRegistro='".$fechaFinRegistro."',
             fechaFinPago='".$fechaFinPago."' 
             WHERE idconvenio='".$idconvenio."'";
    $resUpd=mysql_query($sqlUpd);

    //primero elimino los documentos del convenio
    $sqlArc="DELETE FROM convenio_has_documentos WHERE convenio_idconvenio='".$idconvenio."'";
    $resArc=mysql_query($sqlArc);

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


}


?>