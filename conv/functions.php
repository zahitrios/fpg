<?php

	session_start();
	include_once ("../conf/functions.php");
	validarSession();
	ob_start();
	$_SESSION["language_select"] = "es";
	$action=$_REQUEST["a"];


	$idusuarios=dameIdUserMd5($_SESSION["i"]); 		
	if(usuarioTieneModulo($idusuarios,5)===false)//Valido que el usuario tenga el modulo de convenios
	{
		echo "SU USUARIO NO PUEDE REALIZAR ESTA ACCION";
		die;
	}

	if($action=="cargaCuadroAportaciones")
	{
		global $_REQUEST;

		$porcentajeContingencia=$_REQUEST["pC"];
		$idbasesCertificadas=$_REQUEST["i"];
		imprimeCuadroAportaciones($idbasesCertificadas,$porcentajeContingencia);
		die;
	}

	else if($action=="cuentaRegistros")
	{
		global $_REQUEST;
		cuentaRegistros();
		die;
	}

	else if($action=="checkFilasTodas")
	{
		global $_REQUEST;
		checkFilasTodas();
		die;
	}

	else if($action=="checkFilasTodasAnalitica")
	{
		global $_REQUEST;
		checkFilasTodasAnalitica();
		die;
	}

	else if($action=="checkFilasTodasResumen")
	{
		global $_REQUEST;
		checkFilasTodasResumen();
		die;
	}
	


	?>


	<html>
			<head>
				<title>FIPAGO - Convenios</title>
				<meta charset="UTF-8">

				<link href="https://fonts.googleapis.com/css?family=Raleway:300,400,700" rel="stylesheet">
				<link rel="stylesheet" type="text/css" href="../styles.css">
				<link rel="stylesheet" type="text/css" href="./styles.css">		

				<script text="javascript" src="//code.jquery.com/jquery-1.10.2.js"></script>
				<script text="javascript" src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>				

				<script language="javascript" src="../functions.js"></script>
				<script language="javascript" src="./functions.js"></script>
			</head>

			<body>
				<div id="cargando">
					<img id="imagenCargando" src="<?php echo RUTA; ?>img/cargando.gif" />
					<br>
					<span id="progreso"></span>
				</div>

		
				<div id="menuLateral">
					<img src="<?php echo RUTA; ?>/img/logo.jpg" style="width:100%;">
					<div class="itemMenu" onclick="cargaModulo('home');">Inicio</div>
						<?php
							cargaModulos();
							cargaConstantesDelSistema();
						?>
					<div class="itemMenu" onclick="cargaModulo('logout');">Salir</div>
				</div>



				<div id="containerPrincipal">
				
						<div class='titulos'>Convenios</div>
						<div class='usuarioLogueado'><?php echo nombreUsuarioLogeado(); ?></div>
						<div style="clear:both;"></div>	

						<div class="tablaCentrada">
							<?php
								switch($action)
								{
									case "altaConvenio":
										altaConvenio();
									break;

									case "formEdit":
										formEdit();
									break;

									case "edicionConvenio":
										edicionConvenio();
									break;

									case "revisaCabecerasYGeneralidades":
										revisaCabecerasYGeneralidades();
									break;

									case "comenzarReporte":
										comenzarReporte();
									break;

									case "generaConvenio":
										generaConvenio();										
									break;
								}
							?>
						</div>
				</div>
			</body>
		</html>





<?php

function edicionConvenio()
{
	global $_REQUEST;

	$idconvenio=$_REQUEST["i"];
	$banco=$_REQUEST["banco"];		
	$cuentaBancaria=$_REQUEST["cuentaBancaria"];
	$CLABE=$_REQUEST["clabe"];
	$fechaFirma=$_REQUEST["dateFirmaP"];
	$fechaDOF=$_REQUEST["dateDOFP"];

	if($fechaFirma!="") //Va cambiar a firmado
	{
		$fechaFirma= date('Y-m-d', strtotime($fechaFirma));		
		$nuevoStatusConvenio=2;

		$sqlUpd="UPDATE convenio SET 
             fechaFirma='".$fechaFirma."',   
             bancos_idbancos='".$banco."',
             cuentaBancaria='".$cuentaBancaria."',
             clabe='".$CLABE."',  
             statusConvenio_idstatusConvenio='".$nuevoStatusConvenio."' 
             WHERE idconvenio='".$idconvenio."'";
    	$resUpd=mysql_query($sqlUpd);

    	if(!$resUpd)
    	{
    		echo "error<br>".$sqlUpd."<br>".mysql_error();
    	}

    	//primero elimino los documentos del convenio
	    $sqlArc="DELETE FROM documentosValor WHERE convenio_idconvenio='".$idconvenio."'";
	    $resArc=mysql_query($sqlArc);


	    /***  GUARDO LOS DOCUMENTOS ***/
	    $idbasesCertificadas=dameIdRevisionConvenio($idconvenio);
	    $documentosConvenio=dameDocumentos($idbasesCertificadas);
	    foreach($documentosConvenio as $k => $v)
	    {
	    	//echo $k." -> ".$v."<br>";
	    	$sqlDocVal="INSERT INTO documentosValor (nombre,convenio_idconvenio) VALUES ('".$v."','".$idconvenio."')";
	    	$resDocVal=mysql_query($sqlDocVal);
	    }	
		/***  FIN DE GUARDO LOS DOCUMENTOS ***/






		/**** COMIENZO A PONER TODOS LOS AHORRADORES EN EL PADRÓN DE AHORRADORES ******/
		$totalAhorradoresDadosDeAlta=0;
		$claveEstado=dameClaveEstadoConvenio($idconvenio);

		$idbasesCertificadas=dameIdRevisionConvenio($idconvenio);
		$consecutivo=1;
		
		$sqlC="SELECT * FROM consolidadasTemporales WHERE revisionesTemporales_idrevisionesTemporales='".$idbasesCertificadas."' AND UPPER(nombreAhorrador)<>'TOTAL' AND nombreAhorrador<>'' ";
		$resC=mysql_query($sqlC);		
		while($ahorrador=mysql_fetch_assoc($resC))		
		{
			$sociedadAhorrador=dameSociedadDelAhorradorRevision($ahorrador["idconsolidadasTemporales"]);
			// $sociedadAhorrador["nombre"]
			// $sociedadAhorrador["clave"]

			$etapaConvenio=dameNumeroConveniosPorEstado($claveEstado,$idconvenio);
			$etapaConvenio+=1;

			if($etapaConvenio<=9)
				$etapaConvenio=$etapaConvenio*1000;
			else if($etapaConvenio<=99)
				$etapaConvenio=$etapaConvenio*100;
			else if($etapaConvenio<=999)
				$etapaConvenio=$etapaConvenio*10;

			if($consecutivo<=9)
				$consecutivoTexto="0000".$consecutivo;
			else if($consecutivo<=99)
				$consecutivoTexto="000".$consecutivo;
			else if($consecutivo<=999)
				$consecutivoTexto="00".$consecutivo;
			else if($consecutivo<=9999)
				$consecutivoTexto="0".$consecutivo;

			if($sociedadAhorrador["clave"]<=9)
				$claveSociedadFinal="00".$sociedadAhorrador["clave"];
			else if($sociedadAhorrador["clave"]<=99)
				$claveSociedadFinal="0".$sociedadAhorrador["clave"];

			$folioIdentificador=$claveEstado.$claveSociedadFinal.$etapaConvenio.$consecutivoTexto;
			
			$sql="INSERT INTO ahorrador 
	    			(
	    				folioIdentificador,
	    				nombre,
	    				direccion,
	    				montoAl100,
	    				montoAl70,
	    				montoMaximo,
	    				sca,
	    				sci,
	    				sps,
	    				sdg,
	    				scnc,
	    				spc,
	    				sod
	    				
	    			)
					VALUES 
					(
						'".$folioIdentificador."',
	    				'".$ahorrador["nombreAhorrador"]."',
	    				'".$ahorrador["calleYNumero"]."-".$ahorrador["colonia"]."-".$ahorrador["delegacionMunicipio"]."',
	    				'".$ahorrador["saldoNeto100"]."',
	    				'".$ahorrador["saldoNeto70"]."',
	    				'".$ahorrador["montoMaximoPago"]."',
	    				'".$ahorrador["cuentasAhorro"]."',
	    				'".$ahorrador["cuentasInversion"]."',
	    				'".$ahorrador["parteSocial"]."',
	    				'".$ahorrador["depositosGarantia"]."',
	    				'".$ahorrador["chequesNoCobrados"]."',
	    				'".$ahorrador["prestamosACargo"]."',
	    				'".$ahorrador["otrosDepositos"]."'		    				
					)

	    			";

	    	if(!$res=mysql_query($sql))
	    	{
	    		echo "OCURRIO UN ERROR AL REGISTAR EL AHORRADOR ".$ahorrador["nombreAhorrador"]." EN EL PADRÓN NACIONAL DE AHORRADORES <br>";
	    		die;
	    	}
	    	else
	    	{
	    		$totalAhorradoresDadosDeAlta++;
	    		$idNuevoAhorrador=mysql_insert_id();

	    		$sqlJoin="INSERT INTO convenio_has_ahorrador (convenio_idconvenio,ahorrador_idahorrador) VALUES ('".$idconvenio."','".$idNuevoAhorrador."')";
	    		$resJoin=mysql_query($sqlJoin);
	    		$idNuevoConvenio=mysql_insert_id();

	    		
	    		// INSERTO LA ANALÍTICA //
	    		$vuetaAnalitica=0;
	    		$sqlA="SELECT * FROM analiticasTemporales WHERE nuevoFolioIdentificador='".$ahorrador["nuevoFolioIdentificador"]."' AND revisionesTemporales_idrevisionesTemporales='".$idbasesCertificadas."' ORDER BY idanaliticasTemporales ASC";
	    		$resA=mysql_query($sqlA);
	    		$filA=mysql_fetch_assoc($resA);

	    		$tablasInsert=Array('ahorradorParteSocial','ahorradorCuentasAhorro','ahorradorCuentasInversion','ahorradorOtrosDepositos','ahorradorDepositosGarantia','ahorradorChequesNoCobrados','ahorradorPrestamosCargo');
	    		
	    		$camposLectura[]=Array('tipoDocumentoPS','folioPS','importePS');
	    		$camposLectura[]=Array('tipoDocumentoCA','folioCA','importeCA');
	    		$camposLectura[]=Array('tipoDocumentoCI','folioCI','importeCI');
	    		$camposLectura[]=Array('tipoDocumentoOtros','folioOtros','importeOtros');
	    		$camposLectura[]=Array('tipoDocumentoDG','folioDG','importeDG');
	    		$camposLectura[]=Array('tipoDocumentoCNC','folioCNC','importeCNC');	    		
	    		$camposLectura[]=Array('tipoDocumentoPrestamos','folioPrestamos','importePrestamos');
	    	
	    		foreach($tablasInsert as $indice => $tablaInsert)
	    		{
	    			if($filA[$camposLectura[$indice][2]]!=0)
	    			{
	    				$sqlIA="INSERT INTO ".$tablaInsert." (tipoDocumento,folio,importe,ahorrador_idahorrador) VALUES ('".$filA[$camposLectura[$indice][0]]."','".$filA[$camposLectura[$indice][1]]."','".$filA[$camposLectura[$indice][2]]."','".$idNuevoAhorrador."')";
	    				$resIA=mysql_query($sqlIA);
	    			}
	    		}

	    		$filaDocumentoOriginalInicial=$filA["filaDocumentoOriginal"];
	    		$sqlA="SELECT filaDocumentoOriginal FROM analiticasTemporales WHERE nombreAhorrador<>'' AND filaDocumentoOriginal>'".$filaDocumentoOriginalInicial."' AND revisionesTemporales_idrevisionesTemporales='".$idbasesCertificadas."' ORDER BY filaDocumentoOriginal ASC LIMIT 1";
	    		$resA=mysql_query($sqlA);
	    		$filA=mysql_fetch_assoc($resA);
	    		$filaDocumentoOriginalFinal=$filA["filaDocumentoOriginal"];
	    		

	    		$sqlA="SELECT * FROM analiticasTemporales WHERE nombreAhorrador='' AND filaDocumentoOriginal>'".$filaDocumentoOriginalInicial."' AND filaDocumentoOriginal<'".$filaDocumentoOriginalFinal."' AND revisionesTemporales_idrevisionesTemporales='".$idbasesCertificadas."' ORDER BY filaDocumentoOriginal";
	    		$resA=mysql_query($sqlA);
	    		while($filA=mysql_fetch_assoc($resA))
	    		{
	    			foreach($tablasInsert as $indice => $tablaInsert)
		    		{
		    			if($filA[$camposLectura[$indice][2]]!=0)
		    			{
		    				$sqlIA="INSERT INTO ".$tablaInsert." (tipoDocumento,folio,importe,ahorrador_idahorrador) VALUES ('".$filA[$camposLectura[$indice][0]]."','".$filA[$camposLectura[$indice][1]]."','".$filA[$camposLectura[$indice][2]]."','".$idNuevoAhorrador."')";
		    				$resIA=mysql_query($sqlIA);
		    			}
		    		}
	    		}

	    	}

			$consecutivo++;
    	}
		echo "SE DIERON DE ALTA ".$totalAhorradoresDadosDeAlta." EN EL PADRÓN NACIONAL DE AHORRADORES<br><br>";    		
		echo '<input type="button" onclick="cargaModulo(\'conv\');" value="Volver a la lista de convenios" class="botonRojo">';
		echo "<br><br>";
		die;

    	/**** FIN DE COMIENZO A PONER TODOS LOS AHORRADORES EN EL PADRÓN DE AHORRADORES ******/
	}







	else if($fechaDOF!="") //Va cambiar a publicado
	{
		$nuevoStatusConvenio=3;
		$fechaFinRegistro="";
		$fechaFinPago="";

		$fechaDOF= date('Y-m-d', strtotime($fechaDOF));
		//Calculo la fecha de fin de registro (60 días naturales más)		
		$fechaFinRegistro=$fechaDOF;
		$fechaFinRegistro= date('Y-m-d', strtotime($fechaFinRegistro. ' + 60 days'));
		//Calculo la fecha de fin de pago (180 días naturales más)		
		$fechaFinPago=$fechaDOF;
		$fechaFinPago= date('Y-m-d', strtotime($fechaFinPago. ' + 180 days'));


		$sqlUpd="UPDATE convenio SET  
             fechaDOF='".$fechaDOF."',
             fechaFinRegistro='".$fechaFinRegistro."',
             fechaFinPago='".$fechaFinPago."', 
             statusConvenio_idstatusConvenio='".$nuevoStatusConvenio."' 
             WHERE idconvenio='".$idconvenio."'";
    	$resUpd=mysql_query($sqlUpd);

	}

	    

	?>
	<script languaje="javascript">
		alert ("El convenio fue actualizado correctamente");
		cargaModulo('conv');
	</script>
	<?php
}






function formEdit()
{
	global $_REQUEST;

	$idconvenio=$_REQUEST["i"];

	$KoolControlsFolder="../lib/KoolPHPSuite/KoolControls";

	require $KoolControlsFolder."/KoolAjax/koolajax.php";
	require $KoolControlsFolder."/KoolGrid/koolgrid.php";
	require $KoolControlsFolder."/KoolCalendar/koolcalendar.php";
	require $KoolControlsFolder."/KoolListBox/koollistbox.php";
	require $KoolControlsFolder."/KoolTabs/kooltabs.php";
	

	$koolajax->scriptFolder = "../lib/KoolPHPSuite/KoolControls/KoolAjax"; 

	$sql="SELECT convenio.*,  
		  estado.nombre AS nombreEstado,
		  statusConvenio.descripcion AS status, 
		  statusConvenio.idstatusConvenio AS idstatusConvenio 
		  FROM convenio 
		  INNER JOIN estado ON idestado=estado_idestado 
		  INNER JOIN statusConvenio ON idstatusConvenio=statusConvenio_idstatusConvenio  
		  WHERE idconvenio='".$idconvenio."'";
	
	$res=mysql_query($sql);
	$convenio=mysql_fetch_assoc($res);

	$idrevisionesTemporales=$convenio["revisionesTemporales_idrevisionesTemporales"];

	?>			
	<form action="./functions.php" enctype="multipart/form-data" id="formAltaConvenios" name="formAltaConvenios" method="post" class="formularioUpload">						
		<br><br>
		<?php																			
			$dateFirma = new KoolDatePicker("dateFirmaP"); //Create calendar object
			$dateFirma->scriptFolder = $KoolControlsFolder."/KoolCalendar";//Set scriptFolder
			$dateFirma->styleFolder="default";
			$dateFirma->CalendarSettings->RangeMinDate=strtotime($convenio["fechaSesion"]);
			if($convenio["fechaFirma"]!="0000-00-00")
				$dateFirma->Value = $convenio["fechaFirma"];
			$dateFirma->Init();


			$dateDOF = new KoolDatePicker("dateDOFP"); //Create calendar object
			$dateDOF->scriptFolder = $KoolControlsFolder."/KoolCalendar";//Set scriptFolder
			$dateDOF->styleFolder="default";	
			$dateDOF->CalendarSettings->RangeMinDate=strtotime($convenio["fechaFirma"]);
			if($convenio["fechaDOF"]!="0000-00-00")
				$dateDOF->Value = $convenio["fechaDOF"];					 
			$dateDOF->Init();


			$todosEstados=dameGridTable("estado","nombre");
			$todosBancos=dameGridTable("bancos","nombre");
		?>
		<div class="mitadIzquierda">
			Estado del convenio: <strong><?php echo $convenio["status"]; ?></strong>
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
			<?php 
				if($convenio['idstatusConvenio']>1) //Autorizado no firmado
					echo getNombreBanco($convenio["bancos_idbancos"]); 
				else
				{
					$todosBancos=dameGridTable("bancos","nombre");
					echo '<select name="banco" id="banco" required>';
						echo '<option value="">Elija un banco</option>';
							foreach($todosBancos as $indice => $banco)
								echo "<option value='".$banco["idbancos"]."'>".$banco["nombreCorto"]."</option>";
						echo '</option>';
					echo '</select>';

				}
			?>
			<br><br>


			Cuenta bancaria: 
			<?php 
				if($convenio['idstatusConvenio']>1) //Autorizado no firmado
					echo $convenio['cuentaBancaria']; 
				else
				{
					echo '<input required type="text" name="cuentaBancaria" id="cuentaBancaria"  minlength="4" title="Debe introducir al menos 4 dígitos"/>';
				}
			?>
			<br><br>


			CLABE: 
			<?php 
				if($convenio['idstatusConvenio']>1) //Autorizado no firmado
					echo $convenio['clabe']; 
				else
				{
					echo '<input required type="text" name="clabe" id="clabe" minlength="18" title="Debe introducir al menos 18 dígitos">';
				}
			?>
			<br><br>	


			Sesión: <?php echo $convenio['sesion']; ?>
			<br><br>


			Fecha de sesión: <?php echo convierteTimeStampCorto($convenio['fechaSesion']); ?>
			<br><br>


			Fecha de la firma del convenio: 
			<?php
				if($convenio['idstatusConvenio']==1) //Autorizado no firmado
					echo $dateFirma->Render();				
				else
					echo convierteTimeStampCorto($convenio["fechaFirma"]);
			?>
			<br><br>

			
			<?php

				if($convenio['idstatusConvenio']==2) //Firmado
				{
					echo "Fecha de la publicación en el DOF: ";

					//Verifico si el convenio ya tiene capacitación
					$sqlConvCap="SELECT COUNT(*) AS total FROM capacitacion WHERE convenio_idconvenio='".$idconvenio."'";
					$resConvCap=mysql_query($sqlConvCap);
					$filConvCap=mysql_fetch_assoc($resConvCap);

					if($filConvCap["total"]>0)
						echo $dateDOF->Render();
					else
						echo "<strong class='error'>DEBE AGREGAR UNA CAPACITACIÓN AL CONVENIO</strong>";

					echo "<br><br>";
				}

				else if($convenio['idstatusConvenio']>=3) //Ya cuenta con fecha de publicacion
				{
					echo "Fecha de la publicación en el DOF: ";
					echo convierteTimeStampCorto($convenio["fechaDOF"]);
					echo "<br><br>";
				}
			


				if($convenio['idstatusConvenio']>=3) //Ya cuenta con fecha de publicacion
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


			
			<strong>Documentos aceptados:</strong>
			<ul>
				<?php $options = dameIdDocumentosSinAgregar($idrevisionesTemporales);
				foreach($options as $key => $opt): ?>
					<li><?= $opt[1]; ?></li>
				<?php endforeach; ?>
			</ul>
			<br><br>

			<!-- Drag & drop module -->
			<strong>Agregar documentos permitidos:</strong>
			
				<div class="dd-lists">
					<!-- De este input se envían los ids de documentos permitidos separados por comas -->
					<input id="selected-input" type="hidden" name="documentosValor">

					<div class="dd-list-container">
						<input id="dd-list-search" type="text" class="dd-list-search" placeholder="Buscar...">
						<button type="button" id="dd-add-all" class="dd-button">>> Todos</button>
						<ul id="src-list" class="dd-source dd-list">
							<?php $options = dameIdDocumentos($idrevisionesTemporales);
							foreach($options as $key => $opt): ?>
								<li class="dd-list-item" data-value="<?= $opt[0]?>"><?= $opt[1] ?></li>
							<?php endforeach; ?>
						</ul>
					</div>
					<div class="dd-list-container">
						<button type="button" id="dd-delete-all" class="dd-button">X Borrar todos</button>
						<ul id="dest-list" class="dd-dest dd-list clean">
						</ul>
					</div>
				</div>
				<input type="button" class="botonRojo" value="Guardar documentos" />

			

			<script>
				// Search, drag & drop list
				(function () {

					var search = document.getElementById("dd-list-search");
					var selected_input = document.getElementById("selected-input");
					var src_list = document.getElementById("src-list");
					var dest_list = document.getElementById("dest-list");
					var add_all_btn = document.getElementById("dd-add-all");
					var delete_all_btn = document.getElementById("dd-delete-all");

					change();

					function change () {
				    var dest_list_items = dest_list.querySelectorAll(".dd-list-item");
				    dest_list.classList.toggle("clean", (dest_list_items.length <= 0));
						var selected = [];
						for (var i = 0; i < dest_list_items.length; i++) {
							var item = dest_list_items[i];
							selected.push(item.dataset.value);
						}
						selected_input.value = selected.join(",");
					}

					add_all_btn.addEventListener("click", function () {
						var src_list_items = src_list.querySelectorAll(".dd-list-item");
						for (var i = 0; i < src_list_items.length; i++)
							dest_list.appendChild(src_list_items[i]);
						change();
					});

					delete_all_btn.addEventListener("click", function () {
						var dest_list_items = dest_list.querySelectorAll(".dd-list-item");
						for (var i = 0; i < dest_list_items.length; i++)
							src_list.appendChild(dest_list_items[i]);
						change();
					});

					dragula([src_list, document.getElementById("dest-list")], {
						revertOnSpill: true
					}).on('drop', function (el) {
				    change();
				  });

					search.addEventListener("keyup", function (event) {
						var input = search.value;
						var src_list_items = src_list.querySelectorAll(".dd-list-item");
						for (var i = 0; i < src_list_items.length; i++) {
							var item = src_list_items[i];
							var option = item.textContent;
							item.classList.toggle("hide", input && !(option.toLowerCase().indexOf(input.toLowerCase()) >= 0));
							console.log(option, input && (option.indexOf(input) >= 0));
						}
					});

				})();					
			</script>
			<!-- /Drag & drop module -->					
		</div>

		

		<div style="clear:both;"></div>
		<br><br>						
		<input type="hidden" name="a" value="edicionConvenio" />
		<input type="hidden" name="i" value="<?php echo $idconvenio; ?>" />
		<input type="hidden" name="statusConvenio_idstatusConvenio" value="1" /> <!-- convenio en proyecto -->
		<?php	
			if($convenio['idstatusConvenio']!=3) //Si ya se publico no hay cambios
				echo '<input type="submit" value="Guardar cambios" class="botonRojo">';

			echo "<br><br>";
			if($convenio['idstatusConvenio']>=2) //Si ya se firmo ya hay ahorradores en el padrón
				echo '<input type="button" class="botonRojo" value="Generar base con folios finales" onclick="generaBaseCertificada(\''.md5($idconvenio).'\');" >';
		?>						
	</form>


	
	<div class="tablaCentrada">
	
			<br>
			<strong>CUADRO DE APORTACIONES</strong>
			<br><br>
			<?php
				imprimeCuadroAportaciones($idrevisionesTemporales);
			?>
			<br><br>
			<?php					
				echo '<input type="button" onclick="cargaModulo(\'conv\');" value="Volver a la lista de convenios" class="botonRojo">';
			?>
			<br><br>
	</div>
	<?php
}



	function altaConvenio()
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
		
		$revisionTemporal=$_REQUEST["basesCertificadas_idbasesCertificadas"];
		$fechaSesion=$_REQUEST["dateSesion"];		
		// $cuentaBancaria=$_REQUEST["cuentaBancaria"];
		// $CLABE=$_REQUEST["clabe"];
		// $banco=$_REQUEST["banco"];		
		$estado=$_REQUEST["estado"];
		$sesion=$_REQUEST["sesion"];
		$porcentajeContingencia=$_REQUEST["porcentajeContingencia"];
		$idStatusConvenio=$_REQUEST["statusConvenio_idstatusConvenio"];


		$target_dir = "../certFiles/";
		$target_file = $target_dir . basename($_FILES["fileToUpload"]["name"]);
		$uploadOk = 1;

		$imageFileType = pathinfo($target_file,PATHINFO_EXTENSION);
		if ($_FILES["fileToUpload"]["size"] > 50000000) 
		{
		    $mensaje= "El archivo es demasiado grande, intente con uno menor a 50 megas";
		    $uploadOk = 0;
		}		
		if($imageFileType != "xls" && $imageFileType != "xlsx" ) 
		{
		    $mensaje= "Solo se admiten archivos xls o xlsx";
		    $uploadOk = 0;
		}		
		if(file_exists($target_file))
		{
			$mensaje= "Ya existe un archivo con ese nombre en el servidor";
		    $uploadOk = 0;
		}	
		if ($uploadOk == 0) 
		{
			//No se pudo subir el archivo
			$urlRedirect=RUTA."/conv/index.php?kts_selected=altaProyecto&mensaje=".$mensaje;
			header("LOCATION: ".$urlRedirect);
		}
		else //todo bien
		{
		    if (!move_uploaded_file($_FILES["fileToUpload"]["tmp_name"], $target_file)) 
		    {
		       //No se pudo subir el archivo
		       $mensaje="Ocurrio un eror al subir el archivo";
		       $urlRedirect=RUTA."/conv/index.php?kts_selected=altaProyecto&mensaje=".$mensaje;
			   header("LOCATION: ".$urlRedirect);
		    }
		    
		}	
		


		//Comienza la revisión de la base certificada
		include("../lib/PHPExcel_1.8.0_doc/Classes/PHPExcel.php"); 

		$Reader = PHPExcel_IOFactory::createReaderForFile($target_file);
		$Reader->setReadDataOnly(true); // set this, to not read all excel properties, just data
		$worksheetData = $Reader->listWorksheetInfo($target_file);
		$sheetCount=count($worksheetData);
		
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
		<form id="formulario" action="./functions.php" name="opcionesArchivo" method="post">		
			<fieldset name="fieldSetHojas" class="fieldsetZht">
				<legend>Selecciona las hojas del documento que serán analizadas</legend>
				<br>
				Consolidada: <select name="hojaConsolidada"><?php echo $opcionesHojas; ?></select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				Analítica: <select name="hojaAnalitica"><?php echo $opcionesHojas; ?></select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				Resumen: <select name="hojaResumen"><?php echo $opcionesHojas; ?></select>
				<br><br>
			</fieldset>
			<br><br>
			<input type="hidden" name="a" value="revisaCabecerasYGeneralidades" />
			<input type="hidden" name="fileD" value="<?php echo $target_file; ?>" />
			<input type="submit" value="Continuar" class="botonRojo">
			<?php
				foreach($_REQUEST as $k => $v)
				{
					if($k!="PHPSESSID" && $k!="a")
						echo '<input type="hidden" name="'.$k.'" value="'.$v.'" />';						
				}
			?>
		</form>
		<?php
		

	}




	
	function revisaCabecerasYGeneralidades()
	{
		global $_REQUEST,$mensaje;		
		
		include("../bdinicial/classes.php"); 
		include("../lib/PHPExcel_1.8.0_doc/Classes/PHPExcel.php"); 

		$file=$_REQUEST["fileD"];
		$hojaConsolidada=$_REQUEST["hojaConsolidada"];
		$hojaAnalitica=$_REQUEST["hojaAnalitica"];
		$hojaResumen=$_REQUEST["hojaResumen"];	
		$erroresCabeceras=0;


		$objReader = PHPExcel_IOFactory::createReader("Excel2007"); 
		$objReader->setReadDataOnly(true);
		$worksheetData=$objReader->listWorksheetInfo($file);
		$totalRows= $worksheetData[0]['totalRows'];

		foreach($worksheetData as $k => $hoja)
		{
			if($hoja["worksheetName"]==$hojaConsolidada)			
				$filaConsolidada2=$hoja["totalRows"];
			
			else if($hoja["worksheetName"]==$hojaAnalitica)
				$filaAnalitica2=$hoja["totalRows"];
			
			else if($hoja["worksheetName"]==$hojaResumen)
				$filaResumen2=$hoja["totalRows"];
		}

		
		$registrosConsolidada=getAllRegistros($file,$hojaConsolidada,50);
		$registrosAnalitica=getAllRegistros($file,$hojaAnalitica,50);
		$registrosResumen=getAllRegistros($file,$hojaResumen,100);


		$cabecera=0;
		//Valido la cabecera de la base consolidada
		foreach($registrosConsolidada as $fila => $celdas)
		{			
			foreach($celdas as $celda => $valor)
			{
				if(strtoupper($valor)==="NUEVO FOLIO IDENTIFICADOR")
				{
					$cabecera=$fila;
					break;
				}
				if($cabecera!=0)
					break;
			}
			if($cabecera!=0)
					break;
		}
		if($cabecera==0)
		{
			$erroresCabeceras++;
			echo "<br>";
			echo "<span class='error'>NO SE ENCONTRO EN LA COLUMNA <strong>A</strong> 'NUEVO FOLIO IDENTIFICADOR' PARA INICIAR CON LA REVISIÓN DE LA BASE CONSOLIDADA</span>";
			echo "<br>";
			echo "<strong>FORMATO PARA LA CABECERA DE LA BASE CONSOLIDADA</strong>";
			echo "<br>";
			imprimerCabeceraConsolidada();
			echo "<br><br>";	
		}
		else if(!validaCabeceraConsolidada($registrosConsolidada,$cabecera))
		{
			$erroresCabeceras++;
			echo "<br>";
			echo "<strong>FORMATO PARA LA CABECERA DE LA BASE CONSOLIDADA</strong>";
			echo "<br>";
			imprimerCabeceraConsolidada();
			echo "<br><br>";			
		}




		$cabecera=0;
		//Valido la cabecera de la base analitica
		foreach($registrosAnalitica as $fila => $celdas)
		{		
			
			foreach($celdas as $celda => $valor)
			{	
				if(strtoupper($valor)==="NUEVO FOLIO IDENTIFICADOR")
				{
					$cabecera=$fila;
					break;
				}
				if($cabecera!=0)
					break;
			}
			if($cabecera!=0)
					break;
		}
		if($cabecera==0)
		{
			$erroresCabeceras++;
			echo "<br>";
			echo "<span class='error'>NO SE ENCONTRO EN LA COLUMNA <strong>A</strong> 'NUEVO FOLIO IDENTIFICADOR' PARA INICIAR CON LA REVISIÓN DE LA BASE DE ANALÍTICA</span>";
			echo "<br>";
			echo "<strong>FORMATO PARA LA CABECERA DE LA BASE ANALÍTICA</strong>";
			echo "<br>";
			imprimeCabeceraAnalitica();
			echo "<br><br>";	
		}
		else if(!validaCabeceraAnalitica($registrosAnalitica,$cabecera))
		{
			$erroresCabeceras++;
			echo "<br>";
			echo "<strong>FORMATO PARA LA CABECERA DE LA BASE ANALÍTICA</strong>";
			echo "<br>";
			imprimeCabeceraAnalitica();
			echo "<br><br>";			
		}







		$cabecera=0;
		//Valido la cabecera de la base DE RESUMEN
		foreach($registrosResumen as $fila => $celdas)
		{	
			foreach($celdas as $celda => $valor)
			{	
				if(strtoupper($valor)==="DESCRIPCION" || strtoupper($valor)==="DESCRIPCIÓN")
				{					
					$cabecera=$fila;
					break;
				}
				if($cabecera!=0)
					break;
			}
			if($cabecera!=0)
					break;
		}
		if($cabecera==0)
		{
			$erroresCabeceras++;
			echo "<br>";
			echo "<span class='error'>NO SE ENCONTRO EN LA COLUMNA <strong>A</strong> 'DESCRIPCIÓN' PARA INICIAR CON LA REVISIÓN DE LA BASE DE RESUMEN</span>";
			echo "<br>";
			echo "<strong>FORMATO PARA LA CABECERA DE LA BASE DE RESUMEN</strong>";
			echo "<br>";
			imprimeCabeceraResumen();
			echo "<br><br>";	
		}
		else if(!validaCabeceraResumen($registrosResumen,$cabecera))
		{
			$erroresCabeceras++;
			echo "<br>";
			echo "<strong>FORMATO PARA LA CABECERA DE LA BASE DE RESUMEN</strong>";
			echo "<br>";
			imprimeCabeceraResumen();
			echo "<br><br>";			
		}


		if($erroresCabeceras>0)
		{
			unlink($file); //Borro el archivo
			?>
			<input type="button" value="Regresar" class="botonRojoChico" onclick="cargaModulo('bdinicial')">
			<br><br>
			<?php
			die;
		}








		// //Reviso que la consolidada cuente con nuevo folio identificador
		// $erroresFoliosCosolidada=0;
		// $erroresFoliosAnalitica=0;
		// $mensajeErroresGenerales="";
		// $totalRegistrosConsolidada=count($registrosConsolidada);
		// $totalRegistrosAnalitica=count($registrosAnalitica);

		// foreach($registrosConsolidada as $indiceRegistros => $registro)			
		// {			
		// 	if(strlen($registro[0])!=8 && trim($registro[0])!="" && strtoupper($registro[0])!="NUEVO FOLIO IDENTIFICADOR" &&  !esUltimaFilaConsolidada($registro))
		// 		$foliosIncorrectosConsolidada[]= $registro[0];
			
		// }
		// if(count($foliosIncorrectosConsolidada)>0 )
		// {
		// 	echo "LOS SIGUIENTES FOLIOS DE LA BASE CONSOLIDA NO CUENTAN CON EL FORMATO CORRECTO (SSSAAAAA) ";
		// 	echo "<ul>";
		// 		foreach($foliosIncorrectosConsolidada as $k => $v)
		// 			echo "<li>".$v."</li>";
		// 	echo "</ul>";			
		// }
			




		// //Reviso que la analitica cuente con nuevo folio identificador
		// foreach($registrosAnalitica as $indiceRegistros => $registro)
		// {			
		// 	if(strlen($registro[0])!=8 && trim($registro[0])!="" && strtoupper($registro[0]!="NUEVO FOLIO IDENTIFICADOR") && !esUltimaFilaAnalitica($registro))
		// 		$foliosIncorrectosAnalitica[]= $registro[0];				
		// }
		// if(count($foliosIncorrectosAnalitica)>0)
		// {
		// 	echo "LOS SIGUIENTES FOLIOS DE LA BASE ANALÍTICA NO CUENTAN CON EL FORMATO CORRECTO (SSSAAAAA) ";
		// 	echo "<ul>";
		// 		foreach($foliosIncorrectosAnalitica as $k => $v)
		// 			echo "<li>".$v."</li>";
		// 	echo "</ul>";	
		// }
		







		// if(count($foliosIncorrectosAnalitica)>0 || count($foliosIncorrectosConsolidada)>0)
		// {			
		// 	unlink($file); //Borro el archivo
		 	?>
		 	<!--<input type="button" value="Regresar" class="botonRojoChico" onclick="cargaModulo('bdinicial')">
		 	<br><br>-->
			<?php
		// 	die;
		// }





		$banderaConsolidada=0;
		$banderaAnalitica=0;
		$banderaResumen=0;
		$filaConsolidada=0;
		$filaAnalitica=0;
		$filaResumen=0;
		// $filaConsolidada2=0;
		// $filaAnalitica2=0;
		$filaResumen2=0;
		$filaResumenIntermedia=0;

		
		foreach($registrosConsolidada as $indiceRegistros => $registro)
		{
			if(strtoupper($registro[0])=="NUEVO FOLIO IDENTIFICADOR")			
				$banderaConsolidada=1;
				
			if($registro[0]!="" && $banderaConsolidada==1 && strtoupper($registro[0])!="NUEVO FOLIO IDENTIFICADOR" && $filaConsolidada==0)			
				$filaConsolidada=$registro[count($registro)-1];

			if(strtoupper($registro[2])=="TOTAL")			
				$filaConsolidada2=$registro[count($registro)-1];	
		}

		
		foreach($registrosAnalitica as $indiceRegistros => $registro)
		{
			if(strtoupper($registro[0])=="NUEVO FOLIO IDENTIFICADOR")			
				$banderaAnalitica=1;
				
			if($registro[0]!="" && $banderaAnalitica==1 && strtoupper($registro[0])!="NUEVO FOLIO IDENTIFICADOR" && $filaAnalitica==0)			
				$filaAnalitica=$registro[count($registro)-1];

			if(strtoupper($registro[2])=="TOTAL")			
				$filaAnalitica2=$registro[count($registro)-1];	
		}

		
		foreach($registrosResumen as $indiceRegistros => $registro)
		{			
			
			if(trim(strtoupper($registro[1]))=="MENORES A 239,900.00" || trim(strtoupper($registro[0]))=="MENORES A 239,900.00")	
				$filaResumen=$registro[count($registro)-1];		

			if(trim(strtoupper($registro[1]))=="MAYORES O IGUALES A 239,900.00" || trim(strtoupper($registro[0]))=="MAYORES O IGUALES A 239,900.00")	
				$filaResumenIntermedia=$registro[count($registro)-1];	

									
								
			if(strtoupper($registro[0])=="TOTAL" && $banderaResumen==0)
				$banderaResumen=1;

			if(strtoupper($registro[0])=="TOTAL" && $banderaResumen==1)
				$filaResumen2=$registro[count($registro)-1];	
		}



		$erroresFilas=0;
		$mensajeErroresFilas="";

		if($filaConsolidada==0)
		{
			$mensajeErroresFilas="No se encontró la celda con el valor 'NUEVO FOLIO IDENTIFICADOR' para la revisión de la base consolidada";
			$erroresFilas++;
		}

		// else if($filaConsolidada2==0)
		// {
		// 	$mensajeErroresFilas="No se encontró la celda con el valor 'TOTAL' para la revisión de la base consolidada";
		// 	$erroresFilas++;
		// }

		else if($filaAnalitica==0)
		{
			$mensajeErroresFilas="No se encontró la celda con el valor 'NUEVO FOLIO IDENTIFICADOR' para la revisión de la base analítica";
			$erroresFilas++;
		}

		// else if($filaAnalitica2==0)
		// {
		// 	$mensajeErroresFilas="No se encontró la celda con el valor 'TOTAL' para la revisión de la base analítica";
		// 	$erroresFilas++;
		// }

		else if($filaResumen==0)
		{
			$mensajeErroresFilas="No se encontró la celda con el valor 'MENORES A 239,900.00' para la revisión de la base de datos de resumen";
			$erroresFilas++;
		}

		else if($filaResumenIntermedia==0)
		{
			$mensajeErroresFilas="No se encontró la celda con el valor 'MAYORES O IGUALES A 239,900.00' para la revisión de la base de datos de resumen";
			$erroresFilas++;
		}

		else if($filaResumen2==0)
		{
			$mensajeErroresFilas="No se encontró la celda con el valor 'TOTAL' para la revisión de la base de datos de resumen";
			$erroresFilas++;
		}



		if($erroresFilas>0)
		{
			echo $mensajeErroresFilas."<br><br>";
			unlink($file); //Borro el archivo
			?>
			<input type="button" value="Regresar" class="botonRojoChico" onclick="cargaModulo('bdinicial')">
			<br><br>
			<?php
			die;
		}






		//Valido que vengan las sociedades en la base de resumen en la columna D
		$sociedades="";
		$banderaInicio=0;
		$sociedadesResumen="";
		foreach($registrosResumen as $fila => $celdas)
		{	
			if($celdas[3]!="")
			{
				$sociedadesResumen[]=$celdas[3];
				if($banderaInicio==0)
					$banderaInicio=1;
			}
			if($celdas[3]==""&& $banderaInicio==1)
				break;			
		}
		if($sociedadesResumen=="")
		{
			echo "NO SE ENCONTRARON SOCIEDADES EN LA COLUMNA 'D' DE LA BASE DE RESUMEN<br><br>";
			unlink($file); //Borro el archivo
			?>
			<input type="button" value="Regresar" class="botonRojoChico" onclick="cargaModulo('bdinicial')">
			<br><br>
			<?php
			die;
		}





		//REVISO QUE LOS FOLIOS DE LA CONSOLIDADA COINCIDAN CON LAS SOCIEDADES DE LA BASE DE RESUMEN
		// foreach($registrosConsolidada as $indiceRegistros => $registro)
		// {
		// 	if(strlen($registro[0])==8 && trim($registro[0])!="" && strtoupper($registro[0]!="NUEVO FOLIO IDENTIFICADOR") && !esUltimaFilaConsolidada($registro))
		// 		$sociedadesAhorradoresConsolidada[]=substr($registro[0],0,3);
		// }
		// $sociedadesAhorradoresConsolidadaUnicos=array_unique($sociedadesAhorradoresConsolidada);
	


		// //Reviso que el numero de sociedades en la columna D de resumen sean las sociedades que aparecen en la consolidada
		// if(count($sociedadesResumen)!=count($sociedadesAhorradoresConsolidadaUnicos))
		// {
		// 	echo "LA BASE DE RESUMEN INDICA <strong>".count($sociedadesResumen)."</strong> SOCIEDADES Y LOS FOLIOS DE LA BASE CONSOLIDADA HACEN REFERENCIA A <strong>".count($sociedadesAhorradoresConsolidadaUnicos)."</strong> SOCIEDADES<br><br>";
		// 	echo "SOCIEDADES ENCONTRADAS EN LA BASE CONSOLIDADA: <strong>".implode(",",$sociedadesAhorradoresConsolidadaUnicos)."</strong>";
		// 	echo "<br><br>";
		// 	unlink($file); //Borro el archivo
			?>
			<!--
			<input type="button" value="Regresar" class="botonRojoChico" onclick="cargaModulo('bdinicial')">
			<br><br>
			-->
			<?php
		// 	die;
		// }




		//Valido que los folios de la consolidada sean consecutivos
		// $folioActual=1;
		// foreach($sociedadesAhorradoresConsolidadaUnicos as $k => $folioConsolidada)
		// {
		// 	if($folioActual<10)
		// 		$folioParaComparar="00".$folioActual;
		// 	if($folioActual<100)
		// 		$folioParaComparar="0".$folioActual;
		// 	if($folioActual<1000)
		// 		$folioParaComparar=$folioActual;

		// 	if($folioConsolidada!=$folioParaComparar)
		// 	{
		// 		echo "LAS SOCIEDADES INDICADAS EN LOS FOLIOS DE LOS AHORRADORES DE LA BASE CONSOLIDADA NO SON CONSECUTIVOS O NO COMIENZAN CON EL FOLIO 001<br><br>";
		// 		echo "SOCIEDADES ENCONTRADAS EN LA BASE CONSOLIDADA: <strong>".implode(",",$sociedadesAhorradoresConsolidadaUnicos)."</strong>";
		// 		echo "<br><br>";
		// 		unlink($file); //Borro el archivo
				?>
				<!--<input type="button" value="Regresar" class="botonRojoChico" onclick="cargaModulo('bdinicial')">
				<br><br>-->
				<?php
				//die;
			// }

			// $folioActual++;
		//}










		//REVISO QUE LOS FOLIOS DE LA ANALITICA COINCIDAN CON LAS SOCIEDADES DE LA BASE DE RESUMEN
		// foreach($registrosAnalitica as $indiceRegistros => $registro)
		// {
		// 	if(strlen($registro[0])==8 && trim($registro[0])!="" && strtoupper($registro[0]!="NUEVO FOLIO IDENTIFICADOR") && !esUltimaFilaAnalitica($registro))
		// 		$sociedadesAhorradoresAnalitica[]=substr($registro[0],0,3);
		// }
		// $sociedadesAhorradoresAnaliticaUnicos=array_unique($sociedadesAhorradoresAnalitica);

		// // echo "<pre>";
		// // 	print_r($sociedadesAhorradoresAnaliticaUnicos);
		// // echo "</pre>";
	
		// //Reviso que el numero de sociedades en la columna D de resumen sean las sociedades que aparecen en la analitica
		// if(count($sociedadesResumen)!=count($sociedadesAhorradoresAnaliticaUnicos))
		// {
		// 	echo "LA BASE DE RESUMEN INDICA <strong>".count($sociedadesResumen)."</strong> SOCIEDADES Y LOS FOLIOS DE LA BASE ANALÍTICA HACEN REFERENCIA A <strong>".count($sociedadesAhorradoresAnaliticaUnicos)."</strong> SOCIEDADES<br><br>";
		// 	echo "SOCIEDADES ENCONTRADAS EN LA BASE ANALÍTICA: <strong>".implode(",",$sociedadesAhorradoresAnaliticaUnicos)."</strong>";
		// 	echo "<br><br>";
		// 	unlink($file); //Borro el archivo
		 	?>
		 	<!--<input type="button" value="Regresar" class="botonRojoChico" onclick="cargaModulo('bdinicial')">
		 	<br><br>-->
			<?php
		// 	die;
		// }







		//Valido que los folios de la analitica sean consecutivos
		// $folioActual=1;
		// foreach($sociedadesAhorradoresAnaliticaUnicos as $k => $folioAnalitica)
		// {
		// 	if($folioActual<10)
		// 		$folioParaComparar="00".$folioActual;
		// 	if($folioActual<100)
		// 		$folioParaComparar="0".$folioActual;
		// 	if($folioActual<1000)
		// 		$folioParaComparar=$folioActual;

		// 	if($folioAnalitica!=$folioParaComparar)
		// 	{
		// 		echo "LAS SOCIEDADES INDICADAS EN LOS FOLIOS DE LOS AHORRADORES DE LA BASE ANALÍTICA NO SON CONSECUTIVOS O NO COMIENZAN CON EL FOLIO 001<br><br>";
		// 		echo "SOCIEDADES ENCONTRADAS EN LA BASE ANALÍTICA: <strong>".implode(",",$sociedadesAhorradoresAnaliticaUnicos)."</strong>";
		// 		echo "<br><br>";
		// 		unlink($file); //Borro el archivo
				?>
				<!--<input type="button" value="Regresar" class="botonRojoChico" onclick="cargaModulo('bdinicial')">
				<br><br>-->
				<?php
			// 	die;
			// }

			// $folioActual++;
		// }








		//Valido que la base de datos consolidada venga en orden alfabético
		// foreach($registrosConsolidada as $indiceRegistros => $registro)
		// {
		// 	if(trim($registro[2])!="" && strtoupper($registro[0]!="NUEVO FOLIO IDENTIFICADOR") && !esUltimaFilaConsolidada($registro))
		// 	{
		// 		$ahorradoresSinAcomodar[]=$registro[2];
		// 		$ahorradoresAcomodados[]=$registro[2];
		// 	}
		// }
		// asort($ahorradoresAcomodados);
		// foreach($ahorradoresSinAcomodar as $k => $arroradorSinAcomodar)
		// {
		// 	if($arroradorSinAcomodar!=$ahorradoresAcomodados[$k])
		// 	{				
		// 		echo "LOS AHORRADORES DE LA BASE CONSOLIDADA NO ESTAN ORDENADOS ALFABETICAMENTE<br><br>";			
		// 		unlink($file); //Borro el archivo
				?>
				<!--<input type="button" value="Regresar" class="botonRojoChico" onclick="cargaModulo('bdinicial')">
				<br><br>-->
				<?php
		// 		die;
		// 	}
		// }





		// $ahorradoresSinAcomodar="";
		// $ahorradoresAcomodados="";
		// //Valido que la base de datos analitica venga en orden alfabético
		// foreach($registrosAnalitica as $indiceRegistros => $registro)
		// {
		// 	if(trim($registro[2])!="" && strtoupper($registro[0]!="NUEVO FOLIO IDENTIFICADOR") && !esUltimaFilaAnalitica($registro))
		// 	{
		// 		$ahorradoresSinAcomodar[]=$registro[2];
		// 		$ahorradoresAcomodados[]=$registro[2];
		// 	}
		// }
		// asort($ahorradoresAcomodados);
		// foreach($ahorradoresSinAcomodar as $k => $arroradorSinAcomodar)
		// {
		// 	if($arroradorSinAcomodar!=$ahorradoresAcomodados[$k])
		// 	{				
		// 		echo "LOS AHORRADORES DE LA BASE ANALÍTICA NO ESTAN ORDENADOS ALFABETICAMENTE<br><br>";			
		// 		unlink($file); //Borro el archivo
				?>
				<!--<input type="button" value="Regresar" class="botonRojoChico" onclick="cargaModulo('bdinicial')">
				<br><br>-->
				<?php
		// 		die;
		// 	}
		// }




				




		?>
		<form  id="formulario" name="opcionesArchivo" method="post">		
			
				<fieldset name="fieldSetfilas" class="fieldsetZht">
					<legend>Confirma las <strong>filas</strong> desde donde <strong>comienza</strong> la revisión de cada hoja</legend>
					<br>
					Consolidada: <input required type="number" id="filaConsolidada" name="filaConsolidada" value="<?php echo $filaConsolidada; ?>" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					Analítica: <input required type="number" id="filaAnalitica" name="filaAnalitica" value="<?php echo $filaAnalitica; ?>">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					Resumen: <input required type="number" id="filaResumen" name="filaResumen" value="<?php echo $filaResumen; ?>" />
					<br><br>
				</fieldset>

				<br><br>

				<fieldset name="fieldSetfilasFinal" class="fieldsetZht">
					<legend>Confirma las <strong>filas</strong>  donde <strong>finaliza</strong> la revisión de cada hoja</legend>
					<br>
					Consolidada: <input required type="number" id="filaConsolidada2" name="filaConsolidada2" value="<?php echo $filaConsolidada2; ?>" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					Analítica: <input required type="number" id="filaAnalitica2" name="filaAnalitica2" value="<?php echo $filaAnalitica2; ?>">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					Resumen: <input required type="number" id="filaResumen2" name="filaResumen2" value="<?php echo $filaResumen2; ?>" />
					<br><br>				
				</fieldset>

				<br><br>

			<input type="hidden" id="a" name="a" value="checkFilasTodas" />
			


			<?php
				foreach($_REQUEST as $k => $v)
				{
					if($k!="PHPSESSID" && $k!="a")
						echo '<input type="hidden" id="'.$k.'" name="'.$k.'" value="'.$v.'" />';						
				}
			?>

			<input type="button" onclick="javascript:submitAxaj();" value="Continuar" class="botonRojo">
		</form>

		<?php
	}









	function checkFilasTodas()
	{
		global $_REQUEST;

		require("../bdinicial/classes.php"); 

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
		$sql="INSERT INTO basesCertificadas (archivo) VALUES ('".$file."')";		
		$res=mysql_query($sql);
		$idbasesCertificadas=mysql_insert_id();
		

		//// LA CONSOLIDADA ////		
		insertRegistros("consolidadasCertificadas",$idbasesCertificadas,$file,$hojaConsolidada,$filaConsolidada,$filaConsolidada2);
		limpiaUltimosRegistros($idbasesCertificadas,"consolidada");
	}



	function checkFilasTodasAnalitica()
	{

		global $_REQUEST;

		require("../bdinicial/classes.php"); 

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

		// OBTENGO EL ID DE LA REVISION TEMPORAL //
		$sql="SELECT idbasesCertificadas FROM basesCertificadas WHERE archivo='".$file."' ORDER BY 	idbasesCertificadas ASC ";
		$res=mysql_query($sql);
		$fil=mysql_fetch_assoc($res);
		$idbasesCertificadas=$fil["idbasesCertificadas"];


		//// LA ANALITICA ////		
		insertRegistros("analiticasCertificadas",$idbasesCertificadas,$file,$hojaAnalitica,$filaAnalitica,$filaAnalitica2);
		limpiaUltimosRegistros($idbasesCertificadas,"analitica");

	}




	function checkFilasTodasResumen()
	{

		global $_REQUEST;

		require("../bdinicial/classes.php"); 

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

		// OBTENGO EL ID DE LA REVISION TEMPORAL //
		$sql="SELECT idbasesCertificadas FROM basesCertificadas WHERE archivo='".$file."' ORDER BY 	idbasesCertificadas ASC ";
		$res=mysql_query($sql);
		$fil=mysql_fetch_assoc($res);
		$idbasesCertificadas=$fil["idbasesCertificadas"];


		/////  LA DE RESUMEN  ////
		insertRegistros("resumenCertificadas",$idbasesCertificadas,$file,$hojaResumen,$filaResumen,$filaResumen2);
		limpiaUltimosRegistros($idbasesCertificadas,"resumen");
	}









	function comenzarReporte()
	{
		global $_REQUEST,$mensaje;

		//REVISO QUE TENGA LA LEYENDA EN LA BASE DE RESUMEN
		require("../bdinicial/classes.php"); 

		$erroresTotalesReporte=0;
		$file=$_REQUEST["fileD"];
		$hojaResumen=$_REQUEST["hojaResumen"];
		$idrevisionesTemporales=$_REQUEST["idrevisionesTemporales"];

		// foreach($_REQUEST as $k => $v)
		// 	echo $k." -> ".$v."<br>";

		// OBTENGO EL ID DE LA REVISION TEMPORAL //
		$sql="SELECT idbasesCertificadas FROM basesCertificadas WHERE archivo='".$file."' ORDER BY 	idbasesCertificadas ASC ";
		$res=mysql_query($sql);
		$fil=mysql_fetch_assoc($res);
		$idbasesCertificadas=$fil["idbasesCertificadas"];
	
		$registrosResumen=getAllRegistros($file,$hojaResumen,0);
		$leyenda=0;

		$partesLeyenda[]="EN MI CAR";
		$partesLeyenda[]="CTER DE RESPONSABLE ESTATAL TITULAR DEL GOBIERNO DE ESTADO LIBRE Y SOBERANO DE";
		$partesLeyenda[]="CON LAS FACULTADES QUE ME CONFIERE EN LA CLAUSULA";
		$partesLeyenda[]="DEL CONVENIO DE COORDINACI";
		$partesLeyenda[]="N SUSCRITO EL";
		$partesLeyenda[]="CON NACIONAL FINANCIERA , S.N.C. COMO FIDUCIARIA DEL FIDEICOMISO QUE ADMINISTRA EL FONDO PARA EL FORTALECIMIENTO DE SOCIEDADES Y COOPERATIVAS DE AHORRO Y PRESTAMO  Y DE APOYO A SUS AHORRADORES (FIDEICOMISO)";
		$partesLeyenda[]="HAGO CONSTAR Y CERTIFICO QUE LAS BASE DE DATOS QUE SE ENTREGAN COMO RESULTADO DE LOS TRABAJOS DE AUDITORIA CONTABLE, QUE ESTE DOCUMENTO IMPRESO CONSTA DE";
		$partesLeyenda[]="FOJAS UTILES, CON VALOR DE";
		$partesLeyenda[]="Y RUBRICO EN CADA UNA DE ELLAS, ESTAS BASES DE DATOS HAN SIDO DEBIDAMENTE AUDITADAS Y VALIDADAS POR EL DESPACHO";
		$partesLeyenda[]="EN CALIDAD DE AUDITOR EXTERNO Y CONTIENEN EL PADRON DE AHORRADORES PLENAMENTE IDENTIFICADOS Y QUE ES FUNDAMENTAL PARA LLEVAR A CABO LA DETERMINACI";
		$partesLeyenda[]="N Y LIQUIDACI";
		$partesLeyenda[]="N DEL PAGO DEL SALDO NETO DE AHORRO CORRESPONDIENTE. ANEXO DISCO COMPACTO (CD) PARA COMPLEMENTAR LOS REQUERIMIENTOS DEL FIDEICOMISO, PARA LOS EDECTOS NECESARIOS LA PRESENTE CERTIFICACI";
		$partesLeyenda[]="N SE FIRMA EL";
		
		foreach ($registrosResumen as $fila => $celdas)
		{
			foreach($celdas as $columna => $valor)
			{
				$valorUpper=strtoupper($valor);
				if(strrpos($valorUpper,"EL QUE SUSCRIBE")===0)
				{				
					foreach($partesLeyenda as $k => $parteLeyenda)
					{
						if(strrpos($valorUpper,$parteLeyenda)>0)
							$leyenda++;						
						else
						{
							//echo "no se encontro: ".$parteLeyenda."<br>";
						}
					}			
				}
			}
		}

		


		if($leyenda<(count($partesLeyenda))-3)
		{
			echo "LA BASE DE RESUMEN NO CUENTA CON LA LEYENDA A PIE DE PÁGINA NECESARIA";
			$sql="DELETE FROM consolidadasCertificadas WHERE basesCertificadas_idbasesCertificadas='".$idbasesCertificadas."'";
			$res=mysql_query($sql);	
			$sql="DELETE FROM analiticasCertificadas WHERE basesCertificadas_idbasesCertificadas='".$idbasesCertificadas."'";
			$res=mysql_query($sql);		
			$sql="DELETE FROM resumenCertificadas WHERE basesCertificadas_idbasesCertificadas='".$idbasesCertificadas."'";
			$res=mysql_query($sql);	
			$sql="DELETE FROM basesCertificadas WHERE idbasesCertificadas='".$idbasesCertificadas."'";
			$res=mysql_query($sql);		
			unlink($file); //Borro el archivo

			?>		
			<br><br>
			<input type="button" value="Regresar" class="botonRojoChico" onclick="cargaModulo('conv')">
			<br><br>
			<?php
			die;
		}




		//REVISO QUE LAS BASES DE DATOS SEAN IGUALES	idrevisionesTemporales        idbasesCertificadas
		$igualesConsolidadas=1;
		$sql="SELECT * FROM consolidadasCertificadas WHERE basesCertificadas_idbasesCertificadas='".$idbasesCertificadas."' ORDER BY filaDocumentoOriginal ASC";
		$res=mysql_query($sql);
		while($fil=mysql_fetch_assoc($res))
		{
			
			$sqlT="SELECT * FROM consolidadasTemporales WHERE filaDocumentoOriginal='".$fil["filaDocumentoOriginal"]."' AND revisionesTemporales_idrevisionesTemporales='".$idrevisionesTemporales."' ORDER BY filaDocumentoOriginal ASC";
			$resT=mysql_query($sqlT);
			if(mysql_num_rows($resT)>0)
			{
				$filT=mysql_fetch_assoc($resT);
				foreach($fil as $campo => $valor)
				{
					if($filT[$campo]!=$valor && $campo!="idconsolidadasCertificadas" && $campo!="hojaDocumentoOriginal" && $campo!="basesCertificadas_idbasesCertificadas")
					{
						$cadena="En la fila ".$fil["filaDocumentoOriginal"]." de la base certificada, en el campo".$campo." se encontró el valor: ".$valor.". En la fila ".$filT["filaDocumentoOriginal"]." de la revisión temporal el valor es: ".$filT[$campo];
						$igualesConsolidadas=0;
						break;
					}
				}
				if($igualesConsolidadas==0)
					break;
			}
			else //No encontró la fila en las consolidadasTemporales
			{
				$igualesConsolidadas=0;
				$cadena="No se encontro nada en la fila ".$fil["filaDocumentoOriginal"]." de la revisión temporal";
				break;
			}
		}
		if($igualesConsolidadas==0)
		{
			echo "LA REVISION INICIAL SELECCIONADA NO COINCIDE CON LA BASE CONSOLIDADA QUE SUBIÓ AL SISTEMA<br><br>";
			echo $cadena."<br>";
			// $sql="DELETE FROM consolidadasCertificadas WHERE basesCertificadas_idbasesCertificadas='".$idbasesCertificadas."'";
			// $res=mysql_query($sql);	
			// $sql="DELETE FROM analiticasCertificadas WHERE basesCertificadas_idbasesCertificadas='".$idbasesCertificadas."'";
			// $res=mysql_query($sql);		
			// $sql="DELETE FROM resumenCertificadas WHERE basesCertificadas_idbasesCertificadas='".$idbasesCertificadas."'";
			// $res=mysql_query($sql);	
			// $sql="DELETE FROM basesCertificadas WHERE idbasesCertificadas='".$idbasesCertificadas."'";
			// $res=mysql_query($sql);		
			// unlink($file); //Borro el archivo
			?>		
			<br><br>
			<input type="button" value="Regresar" class="botonRojoChico" onclick="cargaModulo('conv')">
			<br><br>
			<?php
			die;
		}









		// REVISO LA ANALÍTICA //
		$igualesAnaliticas=1;
		$sql="SELECT * FROM analiticasCertificadas WHERE basesCertificadas_idbasesCertificadas='".$idbasesCertificadas."' ORDER BY filaDocumentoOriginal ASC";
		$res=mysql_query($sql);
		while($fil=mysql_fetch_assoc($res))
		{
			
			$sqlT="SELECT * FROM analiticasTemporales WHERE filaDocumentoOriginal='".$fil["filaDocumentoOriginal"]."' AND revisionesTemporales_idrevisionesTemporales='".$idrevisionesTemporales."' ORDER BY filaDocumentoOriginal ASC";
			$resT=mysql_query($sqlT);
			if(mysql_num_rows($resT)>0)
			{
				$filT=mysql_fetch_assoc($resT);
				foreach($fil as $campo => $valor)
				{
					if($filT[$campo]!=$valor && $campo!="idanaliticasCertificadas" && $campo!="hojaDocumentoOriginal" && $campo!="basesCertificadas_idbasesCertificadas")
					{
						$cadena="En la fila ".$fil["filaDocumentoOriginal"]." de la base certificada, en el campo".$campo." se encontró el valor: ".$valor.". En la fila ".$filT["filaDocumentoOriginal"]." de la revisión temporal el valor es: ".$filT[$campo];
						$igualesAnaliticas=0;
						break;
					}
				}
				if($igualesAnaliticas==0)
					break;
			}
			else //No encontró la fila en las consolidadasTemporales
			{
				$igualesAnaliticas=0;
				$cadena="No se encontro nada en la fila ".$fil["filaDocumentoOriginal"]." de la revisión temporal";
				break;
			}
		}
		if($igualesAnaliticas==0)
		{
			echo "LA REVISION INICIAL SELECCIONADA NO COINCIDE CON LA BASE ANALÍTICA QUE SUBIÓ AL SISTEMA<br><br>";
			echo $cadena."<br>";
			// $sql="DELETE FROM consolidadasCertificadas WHERE basesCertificadas_idbasesCertificadas='".$idbasesCertificadas."'";
			// $res=mysql_query($sql);	
			// $sql="DELETE FROM analiticasCertificadas WHERE basesCertificadas_idbasesCertificadas='".$idbasesCertificadas."'";
			// $res=mysql_query($sql);		
			// $sql="DELETE FROM resumenCertificadas WHERE basesCertificadas_idbasesCertificadas='".$idbasesCertificadas."'";
			// $res=mysql_query($sql);	
			// $sql="DELETE FROM basesCertificadas WHERE idbasesCertificadas='".$idbasesCertificadas."'";
			// $res=mysql_query($sql);		
			// unlink($file); //Borro el archivo
			?>		
			<br><br>
			<input type="button" value="Regresar" class="botonRojoChico" onclick="cargaModulo('conv')">
			<br><br>
			<?php
			die;
		}


		// REVISO LA DE RESUMEN //
		$igualesResumen=1;
		$sql="SELECT * FROM resumenCertificadas WHERE basesCertificadas_idbasesCertificadas='".$idbasesCertificadas."' ORDER BY filaDocumentoOriginal ASC";
		$res=mysql_query($sql);
		while($fil=mysql_fetch_assoc($res))
		{
			
			$sqlT="SELECT * FROM resumenTemporales WHERE filaDocumentoOriginal='".$fil["filaDocumentoOriginal"]."' AND revisionesTemporales_idrevisionesTemporales='".$idrevisionesTemporales."' ORDER BY filaDocumentoOriginal ASC";
			$resT=mysql_query($sqlT);
			if(mysql_num_rows($resT)>0)
			{
				$filT=mysql_fetch_assoc($resT);
				foreach($fil as $campo => $valor)
				{
					if($filT[$campo]!=$valor && $campo!="idresumenCertificadas" && $campo!="hojaDocumentoOriginal" && $campo!="basesCertificadas_idbasesCertificadas")
					{
						$cadena="En la fila ".$fil["filaDocumentoOriginal"]." de la base certificada, en el campo".$campo." se encontró el valor: ".$valor.". En la fila ".$filT["filaDocumentoOriginal"]." de la revisión temporal el valor es: ".$filT[$campo];
						$igualesResumen=0;
						break;
					}
				}
				if($igualesResumen==0)
					break;
			}
			else //No encontró la fila en las consolidadasTemporales
			{
				$igualesResumen=0;
				$cadena="No se encontro nada en la fila ".$fil["filaDocumentoOriginal"]." de la revisión temporal";
				break;
			}
		}
		if($igualesResumen==0)
		{
			echo "LA REVISION INICIAL SELECCIONADA NO COINCIDE CON LA BASE DE RESUMEN QUE SUBIÓ AL SISTEMA<br><br>";
			echo $cadena."<br>";
			// $sql="DELETE FROM consolidadasCertificadas WHERE basesCertificadas_idbasesCertificadas='".$idbasesCertificadas."'";
			// $res=mysql_query($sql);	
			// $sql="DELETE FROM analiticasCertificadas WHERE basesCertificadas_idbasesCertificadas='".$idbasesCertificadas."'";
			// $res=mysql_query($sql);		
			// $sql="DELETE FROM resumenCertificadas WHERE basesCertificadas_idbasesCertificadas='".$idbasesCertificadas."'";
			// $res=mysql_query($sql);	
			// $sql="DELETE FROM basesCertificadas WHERE idbasesCertificadas='".$idbasesCertificadas."'";
			// $res=mysql_query($sql);		
			// unlink($file); //Borro el archivo
			?>		
			<br><br>
			<input type="button" value="Regresar" class="botonRojoChico" onclick="cargaModulo('conv')">
			<br><br>
			<?php
			die;
		}



		
		?>
		<form id="formulario" action="./functions.php"  method="post">	
			<span class="exito">NO SE ENCONTRARON ERRORES EN LA BASE DE DATOS CERTIFICADA Y COINCIDE CON LA REVISIÓN ELEGIDA</span>
			<br><br>
			<input type="hidden" name="a" value="generaConvenio" />	
			<?php
				foreach($_REQUEST as $k => $v)
				{
					if($k!="PHPSESSID" && $k!="a")
						echo '<input type="hidden" id="'.$k.'" name="'.$k.'" value="'.$v.'" />';						
				}
			?>
			<input type="hidden" value="<?php echo $_REQUEST["idbasesCertificadas"]; ?>" name="idbasesCertificadas" />
			<input type="submit" value="Continuar" class="botonRojo">
		</form>
		<?php
		
	} //FUNCTION COMENZAR REPORTE






	function generaConvenio()
	{
		// if($fechaFirma!="")
		// {
		// 	$fechaFirma= date('Y-m-d', strtotime($fechaFirma));		
		// }
		// if($fechaDOF!="")
		// {
		// 	$fechaDOF= date('Y-m-d', strtotime($fechaDOF));
		// 	//Calculo la fecha de fin de registro (60 días naturales más)		
		// 	$fechaFinRegistro=$fechaDOF;
		// 	$fechaFinRegistro= date('Y-m-d', strtotime($fechaFinRegistro. ' + 60 days'));
		// 	//Calculo la fecha de fin de pago (180 días naturales más)		
		// 	$fechaFinPago=$fechaDOF;
		// 	$fechaFinPago= date('Y-m-d', strtotime($fechaFinPago. ' + 180 days'));
		// }

		$idbasesCertificadas=$_REQUEST["idbasesCertificadas"];
		$revisionTemporal=$_REQUEST["idrevisionesTemporales"];
		// $cuentaBancaria=$_REQUEST["cuentaBancaria"];
		// $CLABE=$_REQUEST["clabe"];
		// $banco=$_REQUEST["banco"];		
		$estado=$_REQUEST["estado"];
		$sesion=$_REQUEST["sesion"];
		$porcentajeContingencia=$_REQUEST["porcentajeContingencia"];
		$idStatusConvenio=$_REQUEST["statusConvenio_idstatusConvenio"];

		$fechaSesion=$_REQUEST["dateSesion"];
		$fechaSesion= date('Y-m-d', strtotime($fechaSesion));		
		

		$montoMaximoTotal=dameMontoMaximoPagoRevision($revisionTemporal);

		$montoMaximoDePagoEstado=$montoMaximoTotal*1.00/2.75;
		$montoMaximoDePagoEstado=round($montoMaximoDePagoEstado,2);

		$montoMaximoDePagoFipago=$montoMaximoTotal*1.75/2.75;
		$montoMaximoDePagoFipago=round($montoMaximoDePagoFipago,2);

		$contingenciaEstado=round(($montoMaximoDePagoEstado*$porcentajeContingencia/100),2);
		$contingenciaFipago=round(($montoMaximoDePagoFipago*$porcentajeContingencia/100),2);
		$montoContingenciaTotal=round(($contingenciaEstado+$contingenciaFipago),2);

		$totalEstado=$montoMaximoDePagoEstado+$contingenciaEstado;
		$totalFipago=$montoMaximoDePagoFipago+$contingenciaFipago;

		$montoTotalConvenio=$montoMaximoTotal+$montoContingenciaTotal;
		$montoTotalConvenio=round($montoTotalConvenio,2);

		$sql="INSERT INTO convenio 
					(
						statusConvenio_idstatusConvenio,
						usuarios_idusuarios,
						revisionesTemporales_idrevisionesTemporales,
						estado_idestado,
						porcentajeContingencia,
						fechaSesion,
						montoMaximoPagoTotal,
						montoMaximoPagoEstado,
						montoMaximoPagoFipago,
						montoContingenciaTotal,
						montoContingenciaEstado,
						montoContingenciaFipago,
						montoTotalConvenio,
						montoTotalEstado,
						montoTotalFipago,
						sesion
					) VALUES 			
					(
						'1',
						'".dameIdUserMd5($_SESSION["i"])."',
						'".$revisionTemporal."',
						'".$estado."',						
						'".$porcentajeContingencia."',
						'".$fechaSesion."',
						'".$montoMaximoTotal."',
						'".$montoMaximoDePagoEstado."',
						'".$montoMaximoDePagoFipago."',
						'".$montoContingenciaTotal."',
						'".$contingenciaEstado."',
						'".$contingenciaFipago."',
						'".$montoTotalConvenio."',
						'".$totalEstado."',
						'".$totalFipago."',
						'".$sesion."'
					)";
		$res=mysql_query($sql);
		if(!$res)
		{
			echo "<br><br>".$sql."<br>OCURRIO UN ERROR AL SUBIR EL CONVERNIO<br>".mysql_error();
			die;
		}
		echo "<br>EL CONVENIO FUE REGISTRADO CORRECTAMENTE<br><br>";
		$idconvenio=mysql_insert_id();

		$sql="UPDATE basesCertificadas SET convenio_idconvenio='".$idconvenio."' WHERE idbasesCertificadas='".$idbasesCertificadas."'";
		$res=mysql_query($sql);

		imprimeCuadroAportaciones($revisionTemporal);
		guardaLog(dameIdUserMd5($_SESSION["i"]),7,"convenio",$idconvenio);

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
					//Obtengo la última clave
					$sqlUlt="SELECT clave FROM sociedad ORDER BY idsociedad DESC LIMIT 1";
					$resUlt=mysql_query($sqlUlt);
					$filUlt=mysql_fetch_assoc($resUlt);
					$claveSoc=$filUlt["clave"]+1;

					$sqlUp="INSERT INTO sociedad (nombre,clave) VALUES ('".$sociedad."','".$claveSoc."')";
					$resUp=mysql_query($sqlUp);
					$idNuevaSociedad=mysql_insert_id();

					$sqlConSoc="INSERT INTO convenio_has_sociedad (convenio_idconvenio,sociedad_idsociedad) VALUES ('".$idconvenio."','".$idNuevaSociedad."')";
					$resConSoc=mysql_query($sqlConSoc);
					echo "La sociedad <strong>".$sociedad."</strong> fue registrada en el catálogo de sociedades con la clave <strong>".$claveSoc."</strong>";
				}
				else
				{
					$filSoc=mysql_fetch_assoc($resSoc);
					$idNuevaSociedad=$filSoc["idsociedad"];
					$sqlConSoc="INSERT INTO convenio_has_sociedad (convenio_idconvenio,sociedad_idsociedad) VALUES ('".$idconvenio."','".$idNuevaSociedad."')";
					$resConSoc=mysql_query($sqlConSoc);
					echo "La sociedad <strong>".$sociedad."</strong> con la clave <strong>".$filSoc["clave"]."</strong> fue asociada al convenio";
				}
				echo "</li>";
			}
		echo "</ol>";

		echo '<input type="button" onclick="cargaModulo(\'conv\');" value="Siguiente" class="botonRojo">';
	}



	function cuentaRegistros()
	{
		global $_REQUEST;
		$fileD=$_REQUEST["fileD"];

		// OBTENGO EL ID DE LA REVISION TEMPORAL
		$sql="SELECT idbasesCertificadas FROM basesCertificadas WHERE archivo='".$fileD."' ORDER BY idbasesCertificadas ASC ";
		$res=mysql_query($sql);
		$fil=mysql_fetch_assoc($res);
		$idbasesCertificadas=$fil["idbasesCertificadas"];

		//PRIMERO DE LA CONSOLIDADA
		$sql="SELECT COUNT(*) AS TOTAL FROM consolidadasCertificadas WHERE basesCertificadas_idbasesCertificadas='".$idbasesCertificadas."'";
		$res=mysql_query($sql);
		$fil=mysql_fetch_assoc($res);
		$totalConsolidada=$fil["TOTAL"];

		//LA ANALITICA
		$sql="SELECT COUNT(*) AS TOTAL FROM analiticasCertificadas WHERE basesCertificadas_idbasesCertificadas='".$idbasesCertificadas."'";
		$res=mysql_query($sql);
		$fil=mysql_fetch_assoc($res);
		$totalAnalitica=$fil["TOTAL"];

		//LA DE RESUMEN
		$sql="SELECT COUNT(*) AS TOTAL FROM resumenCertificadas WHERE basesCertificadas_idbasesCertificadas='".$idbasesCertificadas."'";
		$res=mysql_query($sql);
		$fil=mysql_fetch_assoc($res);
		$totalResumen=$fil["TOTAL"];


		// VERIFICO SI YA SE TERMINO //
		$sql="SELECT COUNT(*) AS TOTAL FROM consolidadasCertificadas WHERE UPPER(nombreAhorrador)='TOTAL' AND basesCertificadas_idbasesCertificadas='".$idbasesCertificadas."'";
		$res=mysql_query($sql);
		$fil=mysql_fetch_assoc($res);
		$totalFinalConsolidada=$fil["TOTAL"];

		$sql="SELECT COUNT(*) AS TOTAL FROM analiticasCertificadas WHERE UPPER(nombreAhorrador)='TOTAL' AND basesCertificadas_idbasesCertificadas='".$idbasesCertificadas."'";
		$res=mysql_query($sql);
		$fil=mysql_fetch_assoc($res);
		$totalFinalAnalitica=$fil["TOTAL"];


		$sql="SELECT COUNT(*) AS TOTAL FROM resumenCertificadas WHERE UPPER(descripcion)='TOTAL' AND basesCertificadas_idbasesCertificadas='".$idbasesCertificadas."'";
		$res=mysql_query($sql);
		$fil=mysql_fetch_assoc($res);
		$totalFinalResumen=$fil["TOTAL"];


		if($totalFinalResumen>2 && $totalFinalConsolidada>0 && $totalFinalAnalitica>0)
			$terminado=1;
		else
			$terminado=0;
		// VERIFICO SI YA SE TERMINO //

		echo $totalConsolidada."-".$totalAnalitica."-".$totalResumen."-".$idbasesCertificadas."-".$terminado;


	}






	function limpiaUltimosRegistros($idbasesCertificadas,$tipo)
	{
		if($tipo=="consolidada")
		{
			$sql="SELECT idconsolidadasCertificadas FROM consolidadasCertificadas WHERE basesCertificadas_idbasesCertificadas='".$idbasesCertificadas."' AND UPPER(nombreAhorrador)='TOTAL'";
			$res=mysql_query($sql);
			$fil=mysql_fetch_assoc($res);
			$idFinal=$fil["idconsolidadasCertificadas"];

			$sql="DELETE FROM consolidadasCertificadas WHERE basesCertificadas_idbasesCertificadas='$idbasesCertificadas' AND idconsolidadasCertificadas>'".$idFinal."'";
			$res=mysql_query($sql);
		}

		else if($tipo=="analitica")
		{
			$sql="SELECT idanaliticasCertificadas FROM analiticasCertificadas WHERE basesCertificadas_idbasesCertificadas='".$idbasesCertificadas."' AND UPPER(nombreAhorrador)='TOTAL'";
			$res=mysql_query($sql);
			$fil=mysql_fetch_assoc($res);
			$idFinal=$fil["idanaliticasCertificadas"];

			$sql="DELETE FROM analiticasCertificadas WHERE basesCertificadas_idbasesCertificadas='$idbasesCertificadas' AND idanaliticasCertificadas>'".$idFinal."'";
			$res=mysql_query($sql);
		}

		else if($tipo=="resumen")
		{
			$sql="SELECT idresumenCertificadas FROM resumenCertificadas WHERE basesCertificadas_idbasesCertificadas='".$idbasesCertificadas."' AND UPPER(descripcion)='TOTAL' ORDER BY idresumenCertificadas DESC LIMIT 1";
			$res=mysql_query($sql);
			$fil=mysql_fetch_assoc($res);
			$idFinal=$fil["idresumenCertificadas"];

			$sql="DELETE FROM resumenCertificadas WHERE basesCertificadas_idbasesCertificadas='$idbasesCertificadas' AND idresumenCertificadas>'".$idFinal."'";
			$res=mysql_query($sql);
		}
	}



?>

