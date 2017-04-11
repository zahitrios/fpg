<?php

	session_start();
	include_once ("../conf/functions.php");
	validarSession();
	ob_start();
	$_SESSION["language_select"] = "es";

	$idusuarios=dameIdUserMd5($_SESSION["i"]); 		
	if(usuarioTieneModulo($idusuarios,5)===false)//Valido que el usuario tenga el modulo de convenios
	{
		echo "SU USUARIO NO PUEDE REALIZAR ESTA ACCION";
		die;
	}
	cargaConstantesDelSistema();
	$KoolControlsFolder="../lib/KoolPHPSuite/KoolControls";

	require $KoolControlsFolder."/KoolAjax/koolajax.php";
	require $KoolControlsFolder."/KoolGrid/koolgrid.php";
	require $KoolControlsFolder."/KoolCalendar/koolcalendar.php";
	require $KoolControlsFolder."/KoolListBox/koollistbox.php";
	require $KoolControlsFolder."/KoolTabs/kooltabs.php";

	$koolajax->scriptFolder = "../lib/KoolPHPSuite/KoolControls/KoolAjax"; 	

	$link=conectDBReturn();
	$ds = new MySQLDataSource($link);
	
	$ds->SelectCommand = "SELECT * FROM convenio ORDER BY fechaFirma DESC";

	$dsSociedades = new MySQLDataSource($link);
	$dsSociedades->SelectCommand = "SELECT sociedad.*,convenio_has_sociedad.convenio_idconvenio AS idconvenio  FROM sociedad INNER JOIN convenio_has_sociedad ON sociedad_idsociedad=idsociedad";

	$tablaSociedades = new GridTableView();
	$tablaSociedades->Width = "100%";
	$tablaSociedades->DataSource = $dsSociedades;
	$tablaSociedades->AddRelationField("idconvenio","idconvenio");	
	$tablaSociedades->AllowEditing = false;	
	
	$column = new GridBoundColumn();
	$column->HeaderText = "Clave";
	$column->DataField = "clave";
	$tablaSociedades->AddColumn($column);

	$column = new GridBoundColumn();
	$column->HeaderText = "Sociedades";
	$column->DataField = "nombre";
	$tablaSociedades->AddColumn($column);
 	
 	$grid = new KoolGrid("grid");

	$grid->scriptFolder="../lib/KoolPHPSuite/KoolControls/KoolGrid";
	$grid->styleFolder="../lib/KoolPHPSuite/KoolControls/KoolGrid/styles/office2010blue"; 

	$grid->AjaxEnabled = true;
	$grid->AjaxLoadingImage =  "../lib/KoolPHPSuite/KoolControls/KoolAjax/loading/5.gif";	
	$grid->DataSource = $ds;
	$grid->MasterTable->Pager = new GridPrevNextAndNumericPager();
	$grid->Width = "1000px";
	$grid->ColumnWrap = false;
	$grid->PageSize  = 40;
	$grid->AllowEditing = false;
	$grid->AllowDeleting = false;
	$grid->AllowResizing = true;
	$grid->AllowFiltering = true;
	$grid->AutoGenerateEditColumn = false;
	$grid->MasterTable->ShowFunctionPanel = false;		
	$grid->MasterTable->AllowFiltering = true;
	$grid->MasterTable->EditSettings->Mode = "Form";
	$grid->MasterTable->AutoGenerateExpandColumn = true;
	$grid->MasterTable->AllowHovering = true;
	$grid->MasterTable->AllowSelecting = true;
	$grid->MasterTable->AddDetailTable($tablaSociedades); 

	//Register Client-side event handler
	$grid->ClientSettings->ClientEvents["OnRowSelect"] = "Handle_OnRowSelect";

	$column = new GridBoundColumn();
	$column->HeaderText = "Id";
	$column->DataField = "idconvenio";
	$column->Width = "10px";
	$column->ReadOnly = true;
	$grid->MasterTable->AddColumn($column);

	$column = new GridDropDownColumn();
	$column->HeaderText = "Status";
	$column->DataField = "statusConvenio_idstatusConvenio";
	$column->Width = "110px";
	$todos=dameGridTable("statusConvenio");
    foreach($todos as $indice => $registro)    
    	$column->AddItem($registro["descripcion"],$registro["idstatusConvenio"]);    
	$grid->MasterTable->AddColumn($column);

	$column = new GridDropDownColumn();
	$column->HeaderText = "Estado";
	$column->DataField = "estado_idestado";
	$column->Width = "110px";
	$todos=dameGridTable("estado");
    foreach($todos as $indice => $registro)    
    	$column->AddItem($registro["nombre"],$registro["idestado"]);    
	$grid->MasterTable->AddColumn($column);

	$column = new GridDropDownColumn();
	$column->HeaderText = "Subido por";
	$column->DataField = "usuarios_idusuarios";
	$column->Width = "110px";
	$todos=dameGridTable("usuarios");
    foreach($todos as $indice => $registro)    
    	$column->AddItem($registro["nombre"],$registro["idusuarios"]);    
	$grid->MasterTable->AddColumn($column);

	$column = new GridCurrencyColumn();
	$column->Locale = "es_MX";
	$column->FormatString = "%n";
	$column->HeaderText = "Monto máximo de pago";
	$column->DataField = "montoMaximoPagoTotal";
	$column->Width = "100px";	
	$grid->MasterTable->AddColumn($column);

	$column = new GridCurrencyColumn();
	$column->Locale = "es_MX";
	$column->FormatString = "%n";
	$column->HeaderText = "Fondo de contingencia";
	$column->DataField = "montoContingenciaTotal";
	$column->Width = "100px";	
	$grid->MasterTable->AddColumn($column);

	$column = new GridCurrencyColumn();
	$column->Locale = "es_MX";
	$column->FormatString = "%n";
	$column->HeaderText = "Monto total";
	$column->DataField = "montoTotalConvenio";
	$column->Width = "100px";	
	$grid->MasterTable->AddColumn($column);


	$grid->Localization->Load("../lib/KoolPHPSuite/KoolControls/KoolGrid/localization/es.xml");
	$grid->Process();

	if(isset($_POST["IgnorePaging"]))
	{
		$grid->ExportSettings->IgnorePaging = true;
	}
	
	if(isset($_POST["ExportToExcel"]))
	{
		ob_end_clean();
		$grid->GetInstanceMasterTable()->ExportToExcel();
	}	
	if(isset($_POST["ExportToWord"]))
	{
		ob_end_clean();
		$grid->GetInstanceMasterTable()->ExportToWord();
	}	
	if(isset($_POST["ExportToCSV"]))
	{
		ob_end_clean();
		$grid->GetInstanceMasterTable()->ExportToCSV();
	}
	if(isset($_POST["ExportToPDF"]))
	{
		ob_end_clean();
		$grid->GetInstanceMasterTable()->ExportToPDF();
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

		<link rel="stylesheet" type="text/css" href="<?php echo RUTA; ?>/lib/CustomFileInputs/css/normalize.css" />
		<link rel="stylesheet" type="text/css" href="<?php echo RUTA; ?>/lib/CustomFileInputs/css/demo.css" />
		<link rel="stylesheet" type="text/css" href="<?php echo RUTA; ?>/lib/CustomFileInputs/css/component.css" />
		

		<script language="javascript" src="../functions.js"></script>
		<script language="javascript" src="./functions.js"></script>

		<script src="<?php echo RUTA; ?>lib/dom-to-image-master/src/dom-to-image.js"></script>
	</head>


	<body onload="marcaRequeridos();">

		<div id="cargando">
			<img id="imagenCargando" src="<?php echo RUTA; ?>img/cargando.gif" />
			<br>
			<span id="progreso"></span>
		</div>

		
		<div id="menuLateral">
			<img src="<?php echo RUTA; ?>img/logo.jpg" style="width:100%;">
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



				<form id="formTabs" name="formTabs" action="./index.php" method="post">
					<?php 
						$kts = new KoolTabs("kts");
						$kts->scriptFolder = $KoolControlsFolder."/KoolTabs";
						$kts->styleFolder="silver";
							
						$kts->addTab("root","lista","Lista de convenios");	
						$kts->addTab("root","generaCuadro","Generar cuadro de aportaciones");
						$kts->addTab("root","altaProyecto","Crear un convenio");
																	
						$_select_tab = "lista";

						$estiloGrid="block";						
						$estiloProyecto="none";
						$estiloCuadroAportaciones="none";

						if(isset($_REQUEST["kts_selected"]))
						{
							$_select_tab = $_REQUEST["kts_selected"];
							
							if($_select_tab=="lista")
							{
								$estiloGrid="block";								
								$estiloProyecto="none";
								$estiloCuadroAportaciones="none";							
							}
							else if($_select_tab=="altaProyecto")
							{
								$estiloProyecto="block";
								$estiloGrid="none";																
								$estiloCuadroAportaciones="none";								
							}
							else if($_select_tab=="generaCuadro")
							{
								$estiloProyecto="none";
								$estiloGrid="none";								
								$estiloCuadroAportaciones="block";								
							}
						}

						$kts->getTab($_select_tab)->selected = true;
						echo $kts->Render();
					?>
					<script type="text/javascript">
						kts.registerEvent("OnSelect",function(sender,arg)
						{
							document.getElementById("formTabs").submit();
						});
					</script>
				</form>



				
				<!-- DIV GRID CUADRO APORTACIONES -->			
				<div id="divGridConvenios" class="tablaCentrada" style="display:<?php echo $estiloCuadroAportaciones; ?>;">

					CUADRO DE APORTACIONES
					<br><br>					
					<?php
					$revisiones=0;
					//$sqlRev="SELECT * FROM revisionesTemporales WHERE totalErrores=0 AND idrevisionesTemporales NOT IN (SELECT revisionesTemporales_idrevisionesTemporales FROM convenio)";
					$sqlRev="SELECT * FROM revisionesTemporales WHERE totalErrores=0 ";
					$resRev=mysql_query($sqlRev);
					echo "<div class='mitadIzquierda' style='width:30% !important;'>";
						while($filRev=mysql_fetch_assoc($resRev))
						{
							$revisiones++;
							$nombreArchivo=explode("/",$filRev["archivo"]);
							$nombreArchivo=$nombreArchivo[count($nombreArchivo)-1];
														
							echo "<strong>".$nombreArchivo."</strong><br>";
							echo "Subida el ".convierteTimeStampCorto($filRev["fecha"])." por ".nombreUsuarioMD5($_SESSION["i"])."<br>";
							echo "Monto máximo de pago: $ ".separarMiles(dameMontoMaximoPagoRevision($filRev["idrevisionesTemporales"]))."<br>";
							echo "Total ahorradores: ".dameTotalAhorradoresRevision($filRev["idrevisionesTemporales"])."<br>";
							echo "Sociedades: ".dameTotalSociedadesRevision($filRev["idrevisionesTemporales"])."<br>";
							echo "Fondo de contingencia: <input type='number' id='fondo_".$filRev["idrevisionesTemporales"]."' name='fondo_".$filRev["idrevisionesTemporales"]."' value='".(PORCENTAJE_CONTINGENCIA)."' style='width:40px;'>%<br>";
							echo "<br>";
							echo "<span class='botonGris' onclick='generaCuadro(\"".$filRev["idrevisionesTemporales"]."\");'>Generar cuadro de aportaciones</span>";
							echo "<br><br><br>";
						}						
					echo "</div>";	

					echo "<div id='mitadDerecha' class='mitadDerecha' style='width:70% !important;'>";
							echo "<div id='divTabla' style='background-color:#FFFFFF;'>";
							echo "</div>";
							
							echo "<span class='botonRojoChico' id='botonExportar' style='display:none;'' onclick='convertirCuadroAimagen(\"divTabla\");'>Exportar imagen</span>";
					echo "</div>";

					?>
					<div style="clear:both;"></div>
					<br><br>

				</div>
				<!-- FIN DIV GRID CUADRO APORTACIONES -->			





				<!-- DIV GRID CONVENIOS -->			
				<div id="divGridConvenios" class="tablaCentrada" style="display:<?php echo $estiloGrid; ?>;">
					<form id="form1" method="post">
						<?php 
							echo $koolajax->Render();
						?>
						<div class="divOpcionesExportacion">
							<input type="submit" name="ExportToCSV" value = "Exportar a CSV" />
							<input type="submit" name="ExportToExcel" value = "Exportar a Excel" />
							<input type="submit" name="ExportToWord" value = "Exportar a Word" />
							<input type="submit" name="ExportToPDF" value = "Exportar a PDF" />
							&nbsp;&nbsp;
							<input type="checkbox" id="IgnorePaging" name="IgnorePaging"/> <label for="IgnorePaging">Ignorar Paginación</label>
						</div>
						<?php
							echo $grid->Render();
						?>
						<br><br>
						<strong>Para editar el detalle de un convenio da click sobre el convenio deseado</strong>
					</form>
				</div>
				<!-- FIN DIV GRID CONVENIOS -->			









			
				<!-- DIV ALTA CONVENIOS -->			
				<div id="divProyectoConvenios" class="tablaCentrada" style="display:<?php echo $estiloProyecto; ?>;">
					<form id="formulario" action="./functions.php" enctype="multipart/form-data" id="formAltaConvenios" name="formAltaConvenios" method="post" class="formularioUpload">						
						<span class='subTitulos'>CREACIÓN DE CONVENIO</span>
						
						<?php
							if($_REQUEST["mensaje"]!="")
							{
								echo "<br><br><span class='error'>".strtoupper($_REQUEST["mensaje"])."</span>";
							}
						?>

						<br><br><br>
						<?php																			
							$datesSesion = new KoolDatePicker("dateSesion"); //Create calendar object
							$datesSesion->scriptFolder = $KoolControlsFolder."/KoolCalendar";//Set scriptFolder
							$datesSesion->styleFolder="default";						 
							$datesSesion->Init();

							// $dateDOF = new KoolDatePicker("dateDOFP"); //Create calendar object
							// $dateDOF->scriptFolder = $KoolControlsFolder."/KoolCalendar";//Set scriptFolder
							// $dateDOF->styleFolder="default";						 
							// $dateDOF->Init();
							// $todosDocumentosIdentidad=dameGridTable("documentos WHERE catalogoTipoDocumentos_idcatalogoTipoDocumentos=1","nombre");
							// $todosDocumentosValor=dameGridTable("documentos WHERE catalogoTipoDocumentos_idcatalogoTipoDocumentos=2","nombre");

							$todosEstados=dameGridTable("estado","nombre");
							$todosBancos=dameGridTable("bancos","nombre");
						?>

						<div class="mitadIzquierda">	
								
								Estado del convenio: <strong>Autorizado no firmado</strong>
								<br><br>


								Entidad federativa: 							
								<select required name="estado" id="estado" required>
									<option value=''>Elija un estado</option>
									<?php
										foreach($todosEstados as $indice => $estado)
											echo "<option value='".$estado["idestado"]."'>".$estado["nombre"]."</option>";
									?>
								</select>
								<br><br>

								Porcentaje aportado para el fondo de contingencia: <input required type="number" name="porcentajeContingencia" id="porcentajeContingencia" maxlength="2" minlength="2" size="2" value="15" /> %
								<br><br>



								<!-- Banco: 
								<select name="banco" id="banco" required>
									<option value=''>Elija un banco</option>
									<?php
										foreach($todosBancos as $indice => $banco)
											echo "<option value='".$banco["idbancos"]."'>".$banco["nombreCorto"]."</option>";
									?>
								</select>
								<br><br>


								Cuenta bancaria: <input required type="text" name="cuentaBancaria" id="cuentaBancaria"  minlength="4" title="Debe introducir al menos 4 dígitos"/>
								<br><br>

								CLABE: <input required type="text" name="clabe" id="clabe" minlength="18" title="Debe introducir al menos 18 dígitos"//>
								<br><br> -->	




								Fecha de la sesión del comité: <?php echo $datesSesion->Render();?>
								<br><br>

								Sesión: <input required type="text" name="sesion" id="sesion"/>
								<br><br>

								Base de datos certificada: <br>
								<div class="box" style="width: 400px; float: left; height: 200px; clear: both; padding-top: 18px; border-radius:10px;">
									<input type="file" required name="fileToUpload" id="file-5" class="inputfile inputfile-4" data-multiple-caption="{count} archivo seleccionado" style="display:none;" />
									<label for="file-5">
										<figure>
											<svg xmlns="http://www.w3.org/2000/svg" width="20" height="17" viewBox="0 0 20 17">
												<path d="M10 0l-5.2 4.9h3.3v5.1h3.8v-5.1h3.3l-5.2-4.9zm9.3 11.5l-3.2-2.1h-2l3.4 2.6h-3.5c-.1 0-.2.1-.2.1l-.8 2.3h-6l-.8-2.2c-.1-.1-.1-.2-.2-.2h-3.6l3.4-2.6h-2l-3.2 2.1c-.4.3-.7 1-.6 1.5l.6 3.1c.1.5.7.9 1.2.9h16.3c.6 0 1.1-.4 1.3-.9l.6-3.1c.1-.5-.2-1.2-.7-1.5z"/>
											</svg>
										</figure>
										<script src="<?php echo RUTA; ?>/lib/CustomFileInputs/js/custom-file-input.js"></script>
										<span>Elegir un archivo&hellip;</span>
									</label>
								</div>
								<br><br>
						</div>


						<div class="mitadDerecha">
								Asociar a una revisión de base de datos:<br><br>
								<?php
									$revisiones=0;
									$sqlRev="SELECT * FROM revisionesTemporales WHERE totalErrores=0 AND idrevisionesTemporales NOT IN(SELECT revisionesTemporales_idrevisionesTemporales FROM convenio) ";
									$resRev=mysql_query($sqlRev);
									echo "<div class='sangria'>";
										while($filRev=mysql_fetch_assoc($resRev))
										{
											$revisiones++;
											$nombreArchivo=explode("/",$filRev["archivo"]);
											$nombreArchivo=$nombreArchivo[count($nombreArchivo)-1];
											
											echo "<input type='radio' name='revisionesTemporales_idrevisionesTemporales' value='".$filRev["idrevisionesTemporales"]."' required> ";
											echo "<strong>".$nombreArchivo."</strong><br>";
											echo "Subida el ".convierteTimeStampCorto($filRev["fecha"])." por ".nombreUsuarioMD5($_SESSION["i"])."<br>";
											echo "Monto máximo de pago: $ ".separarMiles(dameMontoMaximoPagoRevision($filRev["idrevisionesTemporales"]))."<br>";
											echo "Total ahorradores: ".dameTotalAhorradoresRevision($filRev["idrevisionesTemporales"])."<br>";
											echo "Sociedades: ".dameTotalSociedadesRevision($filRev["idrevisionesTemporales"])."<br>";
											echo "<br>";
										}
										if($revisiones==0)
										{
											echo "<span class='error'>ES NECESARIO HACER UNA REVISIÓN DE LA BASE DE DATOS ANTES DE CREAR UN CONVENIO</span><br><br>";
											echo "<a href='/bdinicial'>CREAR AHORA</a>";
										}
									echo "</div>";
								?>
						</div>

						<div style="clear:both;"></div>
						<br><br>

						<input type="hidden" name="a" value="altaConvenio" />
						<input type="hidden" name="statusConvenio_idstatusConvenio" value="1" /> <!-- convenio en proyecto -->
						<?php
							if($revisiones>0)
							{
								echo '<input type="submit" value="Siguiente" class="botonRojo">';
							}
						?>						
					</form>
				</div>
				<!-- FIN ALTA CONVENIOS -->	










		</div>
		<div style="clear:both;"></div>
		
	</body>

</html>

