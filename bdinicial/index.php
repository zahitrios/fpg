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
?>

<html>
	<head>
		<title>FIPAGO - Base de datos</title>
		<meta charset="UTF-8">
		<link href="https://fonts.googleapis.com/css?family=Raleway:300,400,700" rel="stylesheet">
		
		<link rel="stylesheet" type="text/css" href="../styles.css">
		<link rel="stylesheet" type="text/css" href="styles.css">		

		<link rel="stylesheet" type="text/css" href="<?php echo RUTA; ?>lib/CustomFileInputs/css/normalize.css" />
		<link rel="stylesheet" type="text/css" href="<?php echo RUTA; ?>lib/CustomFileInputs/css/demo.css" />
		<link rel="stylesheet" type="text/css" href="<?php echo RUTA; ?>lib/CustomFileInputs/css/component.css" />

		<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js" type="text/javascript"></script>
		<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  		<script src="//code.jquery.com/jquery-1.12.4.js"></script>
  		<script src="//code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

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
			<img src="<?php echo RUTA; ?>img/logo.jpg" style="width:100%;">
			<div class="itemMenu" onclick="cargaModulo('home');">Inicio</div>
				<?php
					cargaModulos();
					cargaConstantesDelSistema();
				?>
			<div class="itemMenu" onclick="cargaModulo('logout');">Salir</div>
		</div>

		<div id="containerPrincipal">

			<div class='titulos'>Revisión inicial de base de datos</div>
			<div class='usuarioLogueado'><?php echo nombreUsuarioLogeado(); ?></div>
			<div style="clear:both;"></div>	


			<div class="tablaCentrada">
			
					<?php
						$action=$_REQUEST["a"];

						actualizaNumeroErrores();
						
						switch($action)
						{
							case "upload":
								upload();
							break;

							case "comenzarReporteConsolidada":
								comenzarReporteConsolidada();
							break;

							case "comenzarReporteAnalitica":
								comenzarReporteAnalitica();
							break;

							case "comenzarReporteResumen":
								comenzarReporteResumen();
							break;

							case "revisaCabecerasYGeneralidades":
								revisaCabecerasYGeneralidades();
							break;

							case "muestraResumenReporte":
								muestraResumenReporte();
							break;

							case "purify":
								purify();
								formularioSubida();
								gridRevisiones();
							break;

							case "eliminaError":
								eliminaError();
							break;

							case "lanzaCuadroUnionSociedadesDocumentos":
								lanzaCuadroUnionSociedadesDocumentos();
							break;

							case "guardaRelacionSociedadesDocumentos":
								guardaRelacionSociedadesDocumentos();
							break;
							
							default:
								actualizaNumeroErrores();
								formularioSubida();
								gridRevisiones();
							break;
						}
					?>
			</div>
		</div>
		<div style="clear:both;"></div>		
	</body>
</html>



<?php

	

	function actualizaNumeroErrores()
	{
		$sql="SELECT * FROM revisionesTemporales";
		$res=mysql_query($sql);
		while($fil=mysql_fetch_assoc($res))
		{
			$sqlE="SELECT COUNT(*) AS total FROM erroresRevisiones WHERE revisionesTemporales_idrevisionesTemporales='".$fil["idrevisionesTemporales"]."'";
			$resE=mysql_query($sqlE);
			$filE=mysql_fetch_assoc($resE);

			$totalErrores=$filE["total"];

			$sqlU="UPDATE revisionesTemporales SET totalErrores='".$totalErrores."' WHERE idrevisionesTemporales='".$fil["idrevisionesTemporales"]."'";
			$resU=mysql_query($sqlU);
		}
	}

	function purify()
	{
		$sql="SELECT * FROM revisionesTemporales WHERE idrevisionesTemporales NOT IN(SELECT revisionesTemporales_idrevisionesTemporales FROM convenio) AND totalErrores>0";
		$res=mysql_query($sql);
		while($fil=mysql_fetch_assoc($res))
		{
			unlink($fil["archivo"]);

			$sqlDel="DELETE FROM log WHERE tabla='revisionesTemporales' AND id='".$fil["idrevisionesTemporales"]."' ";
			$resDel=mysql_query($sqlDel);

			$sqlDel="DELETE FROM revisionesTemporales WHERE idrevisionesTemporales='".$fil["idrevisionesTemporales"]."'";
			$resDel=mysql_query($sqlDel);
		}
	}

	function gridRevisiones()
	{
		$_SESSION["language_select"] = "es";
		$KoolControlsFolder="../lib/KoolPHPSuite/KoolControls";

		require $KoolControlsFolder."/KoolAjax/koolajax.php";
		require $KoolControlsFolder."/KoolGrid/koolgrid.php";
		require $KoolControlsFolder."/KoolGrid/ext/datasources/MySQLiDataSource.php";
		require $KoolControlsFolder."/KoolCalendar/koolcalendar.php";

		$koolajax->scriptFolder = "../lib/KoolPHPSuite/KoolControls/KoolAjax"; 	

		$link=conectDBReturn();
		$ds = new MySQLDataSource($link);
		
		$ds->SelectCommand = "SELECT revisionesTemporales.idrevisionesTemporales,
									 revisionesTemporales.fecha,
									 revisionesTemporales.totalErrores,
									 estado.nombre AS estado, 
									 SUBSTRING(revisionesTemporales.archivo,13) AS archivo FROM revisionesTemporales INNER JOIN estado ON idestado=estado_idestado ORDER BY fecha DESC ";
		$grid = new KoolGrid("grid");

		$grid->scriptFolder="../lib/KoolPHPSuite/KoolControls/KoolGrid";
		$grid->styleFolder="../lib/KoolPHPSuite/KoolControls/KoolGrid/styles/office2010blue"; 
		
		$grid->ClientSettings->ClientEvents["OnRowClick"] = "Handle_OnRowClick";

		$grid->AjaxEnabled = true;
		$grid->AjaxLoadingImage =  "../lib/KoolPHPSuite/KoolControls/KoolAjax/loading/5.gif";	
		$grid->DataSource = $ds;
		$grid->MasterTable->Pager = new GridPrevNextAndNumericPager();
		$grid->Width = "860px";
		$grid->ColumnWrap = true;
		$grid->PageSize  = 10;
		$grid->AllowEditing = true;
		$grid->AllowDeleting = false;
		$grid->AllowResizing = true;
		
		$column = new GridBoundColumn();
		$column->HeaderText = "Id";
		$column->DataField = "idrevisionesTemporales";
		$column->ReadOnly=true;		
		$grid->MasterTable->AddColumn($column);

		$column = new GridDateTimeColumn();
		$column->HeaderText = "Fecha";
		$column->DataField = "fecha";	
		$column->FormatString = "d M, Y";
		$column->Picker = new KoolDatePicker();
		$column->Picker->scriptFolder = $KoolControlsFolder."/KoolCalendar";
		$column->Picker->styleFolder = "sunset";	
		$column->Picker->DateFormat = "d M, Y";
		$grid->MasterTable->AddColumn($column);

		$column = new GridBoundColumn();
		$column->HeaderText = "Estado";
		$column->DataField = "estado";		
		$grid->MasterTable->AddColumn($column);	

	


		$column = new GridBoundColumn();
		$column->HeaderText = "Archivo";
		$column->DataField = "archivo";		
		$grid->MasterTable->AddColumn($column);		


		$column = new GridBoundColumn();
		$column->HeaderText = "Errores";
		$column->DataField = "totalErrores";		
		$grid->MasterTable->AddColumn($column);		

		$grid->Localization->Load("../lib/KoolPHPSuite/KoolControls/KoolGrid/localization/es.xml");
		$grid->Process();

		?>
		<div class="tablaCentrada">			
			Revisiones realizadas
			<br><br>
			<form id="form1" method="post">	
				<?php 
					echo $koolajax->Render();				
					echo $grid->Render();
				?>
			</form>
			<br>
			<strong>Para revisar el reporte de un registro da click sobre la revisión deseada</strong>
			<br><br>
			<span class='botonRojoChico' onclick='depurarRevisiones();'>DEPURAR</span>
			<br><br><br>
		</div>
		<?php

	}

	function formularioSubida()
	{
		global $_REQUEST,$mensaje;
		?>
		<br>
		<form id="formulario" method="post" enctype="multipart/form-data" action="./">
			
		
			<div class="box">
				<input type="file" name="fileToUpload" id="file-5" class="inputfile inputfile-4" data-multiple-caption="{count} archivo seleccionado" style="display:none;" />
				<label for="file-5">
					<figure>
						<svg xmlns="http://www.w3.org/2000/svg" width="20" height="17" viewBox="0 0 20 17">
							<path d="M10 0l-5.2 4.9h3.3v5.1h3.8v-5.1h3.3l-5.2-4.9zm9.3 11.5l-3.2-2.1h-2l3.4 2.6h-3.5c-.1 0-.2.1-.2.1l-.8 2.3h-6l-.8-2.2c-.1-.1-.1-.2-.2-.2h-3.6l3.4-2.6h-2l-3.2 2.1c-.4.3-.7 1-.6 1.5l.6 3.1c.1.5.7.9 1.2.9h16.3c.6 0 1.1-.4 1.3-.9l.6-3.1c.1-.5-.2-1.2-.7-1.5z"/>
						</svg>
					</figure>
					<span>Elegir un archivo&hellip;</span>
				</label>
			</div>



			<br><br>
			<input type="submit" value="Subir" class="botonRojoChico">
			
			<input type="hidden" name="a" value="upload">
		</form>
		<script src="<?php echo RUTA; ?>lib/CustomFileInputs/js/custom-file-input.js"></script>
		<br><br>
		<span class="mensaje"><?php echo $mensaje; ?></span>		
		<?php
	}


	function upload()
	{
		global $_REQUEST,$mensaje;

		$target_dir = "../tmpFiles/";
		$target_file = $target_dir . basename($_FILES["fileToUpload"]["name"]);
		$uploadOk = 1;

		$imageFileType = pathinfo($target_file,PATHINFO_EXTENSION);

		if ($_FILES["fileToUpload"]["size"] > 20000000) 
		{
		    $mensaje= "El archivo es demasiado grande, intente con uno menor a 20 megas";
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
			formularioSubida();
		}
		else //todo bien
		{
		    if (move_uploaded_file($_FILES["fileToUpload"]["tmp_name"], $target_file)) 
		    {
		        $mensaje="El archivo fue subido correctamente";
		    } 
		    else 
		    {
		       $mensaje="Ocurrio un eror al subir el archivo";
		    }
		    ?>
		    	<span class="mensaje">
		    		<?php echo $mensaje; ?>
		    		<br>		    		
		    		<?php
		    			muestraPosiblesHojas($target_file);
		    		?>
		    	</span>
		    <?php
		}	
	}

	function muestraPosiblesHojas($file)
	{
		include("../lib/PHPExcel_1.8.0_doc/Classes/PHPExcel.php"); 

		$KoolControlsFolder="../lib/KoolPHPSuite/KoolControls";

		require $KoolControlsFolder."/KoolListBox/koollistbox.php";

	
		$Reader = PHPExcel_IOFactory::createReaderForFile($file);
		$Reader->setReadDataOnly(true); // set this, to not read all excel properties, just data
		$worksheetData = $Reader->listWorksheetInfo($file);
		$sheetCount=count($worksheetData);

		
		echo "Hojas en el documento: <strong>".$sheetCount."</strong> (incluyendo hojas ocultas)<br><br>";
		
		$opcionesHojas="";
		foreach($worksheetData as $hojas => $hoja)
		{
			$opcionesHojas.="<option value='".$hoja["worksheetName"]."'>".$hoja["worksheetName"]."</option>";
		}
		
		?>
		<form  id="formulario" name="opcionesArchivo" method="post">		
			<fieldset name="fieldSetHojas" class="fieldsetZht">
				<legend>Selecciona las hojas del documento que serán analizadas</legend>
				<br>
				Consolidada: <select name="hojaConsolidada"><?php echo $opcionesHojas; ?></select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				Analítica: <select name="hojaAnalitica"><?php echo $opcionesHojas; ?></select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				Resumen: <select name="hojaResumen"><?php echo $opcionesHojas; ?></select>
				<br><br>
			</fieldset>

			<br><br>

			<fieldset name="fieldSetDocumentosValor" class="fieldsetZht">
				<legend>Selecciona los documentos de valor que serán aceptados</legend>

				<div class="dd-lists">
					<input id="selected-input" type="hidden" name="documentosValor">
					<div class="dd-list-container">
						<input id="dd-list-search" type="text" class="dd-list-search" placeholder="Buscar...">
						<button type="button" id="dd-add-all" class="dd-button">>> Todos</button>
						<ul id="src-list" class="dd-source dd-list">
							<?php $options = dameGridTable("documentosValor","nombre","");
							foreach($options as $key => $opt): ?>
								<li class="dd-list-item" data-value="<?= $opt["iddocumentosValor"]?>"><?= $opt["nombre"] ?></li>
							<?php endforeach; ?>
						</ul>
					</div>
					<div class="dd-list-container">
						<button type="button" id="dd-delete-all" class="dd-button">X Borrar todos</button>
						<ul id="dest-list" class="dd-dest dd-list clean"></ul>
					</div>
				</div>

				<br><br>
				<input type='button' class='botonRojo' onclick='javascript:muestra("draggable");' value='Agregar nuevo documento al catálogo'>
				<br><br>
				




				<div id="draggable" class="ui-widget-content">
					<br><br>
					<input type='text' placeholder='Nuevo documento de valor' id='nombreNuevoDocumento' name='nombreNuevoDocumento' style='width:450px;' />
					<br><br>
					<input type='submit' value='Cancelar' class='botonRojoChico' onclick='javascript:oculta("draggable")'>
					&nbsp;&nbsp;&nbsp;
					<input type='submit' value='Guardar' class='botonRojoChico' onclick='javascript:guardaNuevoDocumento();'>
				</div>




				<script>
					// Search, drag & drop list
					(function () {

						var search = document.getElementById("dd-list-search");
						var selected_input = document.getElementById("selected-input");
						var src_list = document.getElementById("src-list");
						var dest_list = document.getElementById("dest-list");
						var add_all_btn = document.getElementById("dd-add-all");
						var delete_all_btn = document.getElementById("dd-delete-all");

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
                             
                              
                              
                              
                               <?php
							//First listbox

							// $listbox = new KoolListBox("listbox");
							// $listbox->rutaZht = RUTA."lib/KoolP";
							// $listbox->styleFolder = "default"; 

							// $todos=dameGridTable("documentosValor","nombre","");
							// foreach($todos as $indice => $registro)
							// 	$listbox->AddItem(new ListBoxItem(htmlentities($registro["nombre"]),$registro["iddocumentosValor"]));
                            
							// $listbox->UseCheckBoxes = true;	
					
       //                       $listbox->Init();

                        	
                             
							// echo $listbox->Render();
                              
                                  ?>

					       
			</fieldset>
			<br><br>



			<fieldset name="fieldSetEntidad" class="fieldsetZht">
				<legend>Selecciona la entidad federativa para esta revisión</legend>
					

					<select required name="estado" id="estado" required>
						<option value=''>Elija un estado</option>
						<?php
							$todosEstados=dameGridTable("estado","nombre");
							foreach($todosEstados as $indice => $estado)
								echo "<option value='".$estado["idestado"]."'>".$estado["nombre"]."</option>";
						?>
					</select>
						
					
			</fieldset>



			<br><br>
			<input type="hidden" name="a" value="revisaCabecerasYGeneralidades" />
			<input type="hidden" name="fileD" value="<?php echo $file; ?>" />
			<input type="submit" value="Continuar" class="botonRojo">
		</form>

		<?php
	}



	function revisaCabecerasYGeneralidades()
	{
		global $_REQUEST,$mensaje;		
		
		$KoolControlsFolder="../lib/KoolPHPSuite/KoolControls";

		require $KoolControlsFolder."/KoolListBox/koollistbox.php";

		include("./classes.php"); 
		include("../lib/PHPExcel_1.8.0_doc/Classes/PHPExcel.php"); 

		$file=$_REQUEST["fileD"];
		$hojaConsolidada=$_REQUEST["hojaConsolidada"];
		$hojaAnalitica=$_REQUEST["hojaAnalitica"];
		$hojaResumen=$_REQUEST["hojaResumen"];	
		$estado=$_REQUEST["estado"];	
		$erroresCabeceras=0;

		//Obtengo la fila final
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



		// //Busco las filas dos
		// $filaConsolidada2=getFilaFinal($file,$hojaConsolidada,"consolidada");
		// $filaAnalitica2=getFilaFinal($file,$hojaAnalitica,"analitica");
		// $filaResumen2=getFilaFinal($file,$hojaResumen,"resumen");


		
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
			<input type="hidden" id="fileD" name="fileD" value="<?php echo $file; ?>" />
			<input type="hidden" id="estado" name="estado" value="<?php echo $estado; ?>" />
			
			<input type="hidden" id="hojaConsolidada" name="hojaConsolidada" value="<?php echo $hojaConsolidada; ?>" />
			<input type="hidden" id="hojaAnalitica" name="hojaAnalitica" value="<?php echo $hojaAnalitica; ?>" />
			<input type="hidden" id="hojaResumen" name="hojaResumen" value="<?php echo $hojaResumen; ?>" />

			<?php
				

				echo "<input type='hidden' name='documentosValor' id='documentosValor' value='".$_REQUEST["documentosValor"]."' />";
			?>

			<input type="button" onclick="javascript:submitAxaj();" value="Continuar" class="botonRojo">
		</form>

		<?php
	}



	
	function lanzaCuadroUnionSociedadesDocumentos()
	{
		global $_REQUEST;

		$idrevisionesTemporales=$_REQUEST["idrevisionesTemporales"];
		$documentosValor=explode(",",$_REQUEST["documentosValor"]);

		// foreach($_REQUEST as $k => $v)
		// 	echo $k." -> ".$v."<br>";
		?>
		<form  id="formulario" method="post">
			<?php

				echo "<strong>RELACIONA LAS SOCIEDADES CON LOS DOCUMENTOS DE VALOR QUE SERÁN ACEPTADOS PARA ESTA REVISIÓN</strong><br><br>";

				//PARA CADA SOCIEDAD PONGO LOS DOCUMENTOS QUE SE SELECCIONARON EN EL CONVENIO
				$sql ="SELECT * FROM sociedadesTemporales WHERE revisionesTemporales_idrevisionesTemporales='".$idrevisionesTemporales."'";
				$res=mysql_query($sql);
				while($fil=mysql_fetch_assoc($res))
				{
					?>
					<div class='separador'></div><?php echo $fil["nombre"]; ?>

					<div class="cajonCuadroDocumentos">
						<?php
							foreach($documentosValor as $key => $opt)
								echo '<input type="checkbox"  name="sociedad_'.$fil["idsociedadesTemporales"].'_documento_'.$opt.'" value="'.$opt.'"> '.dameNombreDocumentoValor($opt).'<br>';
						?>
					</div>
					<?php
				}
				//FIN PARA CADA SOCIEDAD PONGO LOS DOCUMENTOS QUE SE SELECCIONARON EN EL CONVENIO
				?>

				<br>
				<br>
				

					<input type="hidden" name="a" value="guardaRelacionSociedadesDocumentos" />
					<input type="hidden" name="idrevisionesTemporales" value="<?php echo $idrevisionesTemporales; ?>" />

					<br><br>

					<?php
						foreach($_REQUEST as $k => $v)
						{								
							if($k!="a" && $k!="PHPSESSID")
								echo "<input type='hidden' name='".$k."' value='".$v."' />";								
						}
					?>

					<input type="submit" value="Siguiente" class="botonRojo">
		
		</form>
		<?php

	}

	function guardaRelacionSociedadesDocumentos()
	{
		global $_REQUEST;

		$idrevisionesTemporales=$_REQUEST["idrevisionesTemporales"];

		$sociedades=Array();
		foreach($_REQUEST as $k => $v)
		{
			if(strpos($k,"documento_"))
			{
				$partes=explode("_",$k);
				//$sociedades[$partes[1]][]=$partes[3];
				$sql="INSERT INTO documentosValorSociedadesTemporales (sociedadesTemporales_idsociedadesTemporales,documentosValor_iddocumentosValor) VALUES (".$partes[1].",".$partes[3].")";
				$res=mysql_query($sql);
			}
		}

		comenzarReporteConsolidada();
	}


	function comenzarReporteConsolidada($getErrores=0)
	{
		global $_REQUEST,$mensaje;

		$erroresTotalesReporte=0;

		//$idrevisionesTemporales=$_REQUEST["idrevisionesTemporales"];

		$file=$_REQUEST["fileD"];

		// OBTENGO EL ID DE LA REVISION TEMPORAL
		$sql="SELECT idrevisionesTemporales FROM revisionesTemporales WHERE archivo='".$file."' ORDER BY idrevisionesTemporales ASC ";
		$res=mysql_query($sql);
		$fil=mysql_fetch_assoc($res);
		$idrevisionesTemporales=$fil["idrevisionesTemporales"];

		
		$sql="SELECT hojaDocumentoOriginal FROM consolidadasTemporales WHERE revisionesTemporales_idrevisionesTemporales='".$idrevisionesTemporales."'";
		$res=mysql_query($sql);
		$fil=mysql_fetch_assoc($res);
		$hojaConsolidada=$fil["hojaDocumentoOriginal"];
	
		echo "<span class='subTitulos' style='font-weight:bold;'>Detalle del reporte de la base consolidada</span>";

		?>
			<div id='divDetalleErrores'>
				<fieldset class="fieldsetZht fieldSetReporte">
					<legend><strong>Reporte sobre la base de datos consolidada</strong></legend>
					<br>
					<?php
						

						$totalAhorradoresBaseConsolidada=dameTotalAhorradoresConsolidada($idrevisionesTemporales);
						$numeroFoliosRepetidosConsolidada=dameNumeroFoliosRepetidosConsolidada($idrevisionesTemporales);						
						$foliosEnBlancoConsolidada=dameNumeroFoliosEnBlancoConsolidada($idrevisionesTemporales,"revision");

						echo "Total de ahorradores de la base consolidada: <strong>".$totalAhorradoresBaseConsolidada."</strong><br><br>";
						

						echo "Folios en blanco de la base consolidada: <strong>".$foliosEnBlancoConsolidada."</strong>";
						if($foliosEnBlancoConsolidada>0)
						{
							$erroresTotalesReporte++;
							echo "<span class='botonMostrar' onclick='muestraOculta(\"divFoliosEnBlancoConsolidada\");' >Mostrar/Ocultar</span>";
							echo "<div class='oculta' id='divFoliosEnBlancoConsolidada'>";						
								$foliosBlancos=dameFoliosEnBlancoConsolidada($idrevisionesTemporales);
								$filasEnBlanco=implode(",",$foliosBlancos);								
								echo "<ul>";									
									$cadenaError="Aparecen folios en blanco en las siguientes filas: <strong>".$filasEnBlanco."</strong> de la hoja <strong>".$hojaConsolidada."</strong>";
									echo "<li>".$cadenaError."</li>";
									guardaErrorRevision($idrevisionesTemporales,$cadenaError);								
								echo "</ul>";
							echo "</div>";
						}
						echo "<br><br>";





						echo "Nuevos folios repetidos de la base consolidada: <strong>".$numeroFoliosRepetidosConsolidada."</strong>";
						if($numeroFoliosRepetidosConsolidada>0)
						{
							$erroresTotalesReporte++;
							echo "<span class='botonMostrar' onclick='muestraOculta(\"divFoliosRepetidosConsolidada\");' >Mostrar/Ocultar</span>";
							echo "<div class='oculta' id='divFoliosRepetidosConsolidada'>";						
								$foliosRepetidos[]=dameFoliosRepetidosConsolidada($idrevisionesTemporales);
								echo "<ul>";
									foreach($foliosRepetidos as $indice => $folio)
									{
										$folio=implode("",$folio);
										$sqlFoliosRepetidos="SELECT filaDocumentoOriginal FROM consolidadasTemporales WHERE nuevoFolioIdentificador='".$folio."' AND revisionesTemporales_idrevisionesTemporales='".$idrevisionesTemporales."'";					
										$resFoliosRepetidos=mysql_query($sqlFoliosRepetidos);
										$filas="";
										while($filFoliosRepetidos=mysql_fetch_assoc($resFoliosRepetidos))					
											$filas[]=$filFoliosRepetidos["filaDocumentoOriginal"];
										
										$filas=implode(", ",$filas);
										echo "<li>El folio <strong>".$folio."</strong> aparece en las filas <strong>".$filas."</strong> de la hoja <strong>".$hojaConsolidada."</strong></li>";
										$cadenaError="El folio <strong>".$folio."</strong> aparece en las filas <strong>".$filas."</strong> de la hoja <strong>".$hojaConsolidada."</strong>";
										guardaErrorRevision($idrevisionesTemporales,$cadenaError);
									}	
								echo "</ul>";
							echo "</div>";
						}
						echo "<br><br>";








						//// REVISO FILAS VACÍAS ////
						$sql="SELECT * FROM consolidadasTemporales WHERE TRIM(nuevoFolioIdentificador)='' AND TRIM(folioIdentificadorAnterior)='' AND TRIM(nombreAhorrador)='' AND parteSocial=0 AND cuentasAhorro=0 AND cuentasInversion=0 AND depositosGarantia=0 AND chequesNoCobrados=0 AND otrosDepositos=0 AND prestamosACargo=0 AND saldoNeto100=0 AND saldoNeto70=0 AND montoMaximoPago=0 AND TRIM(calleYNumero)='' AND TRIM(colonia)='' AND TRIM(delegacionMunicipio)='' AND TRIM(telefono)='' AND TRIM(curp)='' AND revisionesTemporales_idrevisionesTemporales='".$idrevisionesTemporales."'";
						$res=mysql_query($sql);
						echo "Registros en blanco de la base consolidada: <strong>".mysql_num_rows($res)."</strong>";
						if(mysql_num_rows($res)>0)
						{
							echo "<span class='botonMostrar' onclick='muestraOculta(\"divRegistrosVaciosConsolidada\");'>Mostrar/Ocultar</span>";
							echo "<div class='oculta' id='divRegistrosVaciosConsolidada'>";						
								echo "<ul>";
									while($fil=mysql_fetch_assoc($res))
									{
										$cadenaError="La fila ".$fil["filaDocumentoOriginal"]." de la base consolidada esta vacía";
										echo "<li>".$cadenaError."</li>";
										guardaErrorRevision($idrevisionesTemporales,$cadenaError);										
									}
								echo "</ul>";
							echo "</div>";
						}
						//// REVISO FILAS VACÍAS ////
						echo "<br><br>";








						////REVISO NOMBRES REPETIDOS////
						$nombresRepetidos=dameNombreRepetidosConsolidada($idrevisionesTemporales);
						echo "Nombres repetidos de la base consolidada: <strong>".count($nombresRepetidos)."</strong>";
						if(count($nombresRepetidos)>0)
						{
							$erroresTotalesReporte++;
							echo "<span class='botonMostrar' onclick='muestraOculta(\"divNombresRepetidosConsolidada\");'>Mostrar/Ocultar</span>";
							echo "<div class='oculta' id='divNombresRepetidosConsolidada'>";						
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
										$cadenaError="El nombre <strong>".$nombre."</strong> aparece en las filas <strong>".$filas."</strong> de la hoja <strong>".$hojaConsolidada."</strong>";
										guardaErrorRevision($idrevisionesTemporales,$cadenaError);
									}	
								echo "</ul>";
							echo "</div>";		
						}
						echo "<br><br>";









						// REVISO SALDOS NEGATIVOS
						$leyendas="";
						$campos="";
						$leyendas=array("parte social","cuentas de ahorro","cuentas de inversión","depositos en garantía","cheques no cobrados","otros depósitos","préstamos a cargo","saldo neto de ahorro al 100%","saldo neto de ahorro al 70%","monto máximo de pago");
						$campos=array("parteSocial","cuentasAhorro","cuentasInversion","depositosGarantia","chequesNoCobrados","otrosDepositos","prestamosACargo","saldoNeto100","saldoNeto70","montoMaximoPago");
						foreach($campos as $k => $campo)
						{							
							$sql="SELECT ".$campo.",filaDocumentoOriginal FROM consolidadasTemporales WHERE ".$campo."<0 AND revisionesTemporales_idrevisionesTemporales='".$idrevisionesTemporales."' ";
							$res=mysql_query($sql);		
							echo "Saldos negativos en ".$leyendas[$k].": <strong>".mysql_num_rows($res)."</strong>";					
							if(mysql_num_rows($res)>0)
							{
								echo "<span class='botonMostrar' onclick='muestraOculta(\"divSaldosNegativosConsolidada".$k."\");'>Mostrar/Ocultar</span>";
								echo "<div class='oculta' id='divSaldosNegativosConsolidada".$k."'>";
									while($fil=mysql_fetch_assoc($res))
									{
										$cadenaError= "<span class='error'>La fila ".$fil["filaDocumentoOriginal"]." de la base consolidada muestra saldo negativo en el campo ".$leyendas[$k].": $ ".separarMiles($fil[$campo])."</span>";
										echo $cadenaError."<br>";
										guardaErrorRevision($idrevisionesTemporales,$cadenaError);										
									}
								echo "</div>";
							}
							echo "<br><br>";
						}
						echo "<br><br>";
							









					
						// REVISO TODOS LOS IMPORTES
						$leyendas="";
						$campos="";
						$leyendas=array("parte social","cuentas de ahorro","cuentas de inversión","depositos en garantía","cheques no cobrados","otros depósitos","préstamos a cargo","saldo neto de ahorro al 100%","saldo neto de ahorro al 70%","monto máximo de pago");
						$campos=array("parteSocial","cuentasAhorro","cuentasInversion","depositosGarantia","chequesNoCobrados","otrosDepositos","prestamosACargo","saldoNeto100","saldoNeto70","montoMaximoPago");
						foreach($campos as $k => $campo)
						{
							$leyenda=$leyendas[$k];							
							$sql="SELECT SUM(".$campo.") AS totalCalculado FROM consolidadasTemporales WHERE UPPER(nombreAhorrador)<>'TOTAL' AND revisionesTemporales_idrevisionesTemporales='".$idrevisionesTemporales."' ";
							$res=mysql_query($sql);
							$fil=mysql_fetch_assoc($res);
							$totalCalculado=round($fil["totalCalculado"],2);
							echo "Saldo total calculado de ".$leyenda.": <strong> $ ".separarMiles($totalCalculado)."</strong><br>";

							//Indicado
							$sql="SELECT ".$campo." FROM consolidadasTemporales WHERE UPPER(nombreAhorrador)='TOTAL' AND revisionesTemporales_idrevisionesTemporales='".$idrevisionesTemporales."' ";
							$res=mysql_query($sql);
							$fil=mysql_fetch_assoc($res);
							$totalIndicado=$fil[$campo];
							echo "Saldo total indicado &nbsp;&nbsp;de ".$leyenda.": <strong> $".separarMiles($totalIndicado)."</strong><br>";

							if($totalCalculado==$totalIndicado)
								echo "<span class='exito'>Los montos calculados de ".$leyenda." coinciden con el monto indicado en el documento</span>";
							else
							{
								$erroresTotalesReporte++;
								$cadenaError= "<span class='error'>Los montos calculados de ".$leyenda." NO coinciden con el monto indicado en el documento</span>";
								echo $cadenaError;
								guardaErrorRevision($idrevisionesTemporales,$cadenaError);
							}
							echo "<br><br>";
						}







						
						// MONTOS MAL CALCULADOS POR AHORRADOR				
						$error=0;
						$mensaje="";
						$mensaje.="<ul>";
						$sql="SELECT * FROM consolidadasTemporales WHERE UPPER(nombreAhorrador)<>'TOTAL' AND revisionesTemporales_idrevisionesTemporales='".$idrevisionesTemporales."'";
						$res=mysql_query($sql);						
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
									$mensaje.= "<li> El saldo neto de ahorro al 100% del ahorrador <strong>".$ahorrador["nombreAhorrador"]."</strong> indicado en la fila <strong>".$ahorrador["filaDocumentoOriginal"]."</strong> de la hoja ".$hojaConsolidada." debe ser <strong> $".separarMiles($saldoCalculado100)."</strong> y en el documento se indica que es de <strong> $".separarMiles($saldoIndicado100)."</strong></li>";
									$cadenaError= "El saldo neto de ahorro al 100% del ahorrador <strong>".$ahorrador["nombreAhorrador"]."</strong> indicado en la fila <strong>".$ahorrador["filaDocumentoOriginal"]."</strong> de la hoja ".$hojaConsolidada." debe ser <strong> $".separarMiles($saldoCalculado100)."</strong> y en el documento se indica que es de <strong> $".separarMiles($saldoIndicado100)."</strong>";
									guardaErrorRevision($idrevisionesTemporales,$cadenaError);
								}

								//Reviso saldo neto al 70%
								$saldoCalculado70=$saldoCalculado100*0.70;
								$saldoCalculado70=round($saldoCalculado70,2);
								$saldoIndicado70=$ahorrador["saldoNeto70"];					
								if(round($saldoCalculado70,2)!=round($saldoIndicado70,2))
								{
									$error++;
									$erroresTotalesReporte++;
									$mensaje.= "<li> El saldo neto de ahorro al 70% del ahorrador <strong>".$ahorrador["nombreAhorrador"]."</strong> indicado en la fila <strong>".$ahorrador["filaDocumentoOriginal"]."</strong> de la hoja ".$hojaConsolidada." debe ser <strong> $".separarMiles($saldoCalculado70)."</strong> y en el documento se indica que es de <strong> $".separarMiles($saldoIndicado70)."</strong></li>";
									$cadenaError= "El saldo neto de ahorro al 70% del ahorrador <strong>".$ahorrador["nombreAhorrador"]."</strong> indicado en la fila <strong>".$ahorrador["filaDocumentoOriginal"]."</strong> de la hoja ".$hojaConsolidada." debe ser <strong> $".separarMiles($saldoCalculado70)."</strong> y en el documento se indica que es de <strong> $".separarMiles($saldoIndicado70)."</strong>";
									guardaErrorRevision($idrevisionesTemporales,$cadenaError);
								}

								//Reviso el monto máximo de pago
								$montoMaximoCalculado=$saldoCalculado70;
								if($montoMaximoCalculado>MONTO_MAXIMO_PAGO_70)
									$montoMaximoCalculado=MONTO_MAXIMO_PAGO_70;
								$montoMaximoIndicado=$ahorrador["montoMaximoPago"];					
								if($montoMaximoCalculado!=$montoMaximoIndicado)
								{
									$error++;
									$erroresTotalesReporte++;
									$mensaje.= "<li> El monto máximo de pago del ahorrador <strong>".$ahorrador["nombreAhorrador"]."</strong> indicado en la fila <strong>".$ahorrador["filaDocumentoOriginal"]."</strong> de la hoja ".$hojaConsolidada." debe ser <strong> $".separarMiles($montoMaximoCalculado)."</strong> y en el documento se indica que es de <strong> $".separarMiles($montoMaximoIndicado)."</strong></li>";
									$cadenaError= "El monto máximo de pago del ahorrador <strong>".$ahorrador["nombreAhorrador"]."</strong> indicado en la fila <strong>".$ahorrador["filaDocumentoOriginal"]."</strong> de la hoja ".$hojaConsolidada." debe ser <strong> $".separarMiles($montoMaximoCalculado)."</strong> y en el documento se indica que es de <strong> $".separarMiles($montoMaximoIndicado)."</strong>";
									guardaErrorRevision($idrevisionesTemporales,$cadenaError);
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
						echo "<br><br>";







						// // BUSCO DIRECCIONES INCOMPLETAS //
						// $sql="SELECT COUNT(*) AS total FROM consolidadasTemporales WHERE (calleYNumero='' OR colonia='' OR delegacionMunicipio='') AND (UPPER(nombreAhorrador)<>'TOTAL' AND nuevoFolioIdentificador<>'' AND revisionesTemporales_idrevisionesTemporales='".$idrevisionesTemporales."')";
						// $res=mysql_query($sql);
						// $fil=mysql_fetch_array($res);
						// $direccionesIncompletas=$fil["total"];
						// echo "Direcciones incompletas de la base consolidada: <strong>".$direccionesIncompletas."</strong>";
						// if($direccionesIncompletas>0)
						// {
						// 	$erroresTotalesReporte++;
						// 	$filas="";
						// 	echo "<span class='botonMostrar' onclick='muestraOculta(\"divDireccionesIncompletasConsolidada\");' >Mostrar/Ocultar</span>";
						// 	echo "<div class='oculta' id='divDireccionesIncompletasConsolidada'>";
						// 		$sql="SELECT filaDocumentoOriginal FROM consolidadasTemporales WHERE (calleYNumero='' OR colonia='' OR delegacionMunicipio='') AND (UPPER(nombreAhorrador)<>'TOTAL' AND nuevoFolioIdentificador<>'' AND revisionesTemporales_idrevisionesTemporales='".$idrevisionesTemporales."') LIMIT 100";
						// 		$res=mysql_query($sql);	
						// 		while($fil=mysql_fetch_assoc($res))
						// 		{
						// 			$filas[]=$fil["filaDocumentoOriginal"];		
						// 		}
							
						// 		$filas=implode(", ",$filas);					
						// 		$cadenaError="<br>La dirección esta incompleta en las filas <strong>".$filas."</strong> de la hoja <strong>".$hojaConsolidada."</strong>";					
						// 		echo $cadenaError;
						// 		guardaErrorRevision($idrevisionesTemporales,$cadenaError);
						// 	echo "</div>";
						// }
						// echo "<br><br>";








						// BUSCO DOBLES ESPACIOS //
						// $camposDoblesEspacios=Array("nombreAhorrador","curp","calleYNumero","colonia","delegacionMunicipio","telefono");
						// $leyendasDoblesEspacios=Array("Nombre del ahorrador","CURP","Calle y número","Colonia","Delegación o Municipio","Teléfono");

						$camposDoblesEspacios=Array("nombreAhorrador","curp");
						$leyendasDoblesEspacios=Array("Nombre del ahorrador","CURP");

						foreach($camposDoblesEspacios as $k => $campo)
						{
							$sql="SELECT COUNT(*) AS total FROM consolidadasTemporales WHERE ".$campo." LIKE '%  %' AND revisionesTemporales_idrevisionesTemporales='".$idrevisionesTemporales."'";
							$res=mysql_query($sql);
							$fil=mysql_fetch_assoc($res);
							echo "Dobles espacios encontrados en el campo ".$leyendasDoblesEspacios[$k]." : <strong>".$fil["total"]."</strong>";
							if($fil["total"]>0)
							{
								echo "<span class='botonMostrar' onclick='muestraOculta(\"divDoblesEspaciosConsolidada".$k."\");' >Mostrar/Ocultar</span>";

								echo "<div class='oculta' id='divDoblesEspaciosConsolidada".$k."'>";
									echo "<ul>";
									$sql="SELECT * FROM consolidadasTemporales WHERE ".$campo." LIKE '%  %' AND revisionesTemporales_idrevisionesTemporales='".$idrevisionesTemporales."' LIMIT 100";
									$res=mysql_query($sql);
									while($fil=mysql_fetch_assoc($res))
									{
										$cadenaError="Se encontraron dobles espacios en el campo <strong>".$leyendasDoblesEspacios[$k]."</strong>: <strong>".addslashes($fil[$campo])."</strong>";
										echo "<li>".$cadenaError."</li>";
										guardaErrorRevision($idrevisionesTemporales,$cadenaError);
									}
									echo "</ul>";
								echo "</div>";
							}
							echo "<br><br>";

						}
						







						
						// BUSCO CARACTERES ESPECIALES //
						$camposDoblesEspacios=Array("nombreAhorrador","curp");
						$leyendasDoblesEspacios=Array("Nombre del ahorrador","CURP");
						foreach($camposDoblesEspacios as $k => $campo)
						{							
							$sql="SELECT COUNT(*) AS total FROM consolidadasTemporales WHERE ".$campo." regexp '[^a-zA-Z0-9\ \ñ\Ñ\/ ]' AND revisionesTemporales_idrevisionesTemporales='".$idrevisionesTemporales."'";
							//SELECT COUNT(*) AS total FROM consolidadasTemporales WHERE nombreAhorrador regexp'[^a-zA-Z0-9\ \ñ\Ñ\/ ]' AND revisionesTemporales_idrevisionesTemporales='1'
							$res=mysql_query($sql);
							$fil=mysql_fetch_assoc($res);
							echo "Caracteres especiales en el campo ".$leyendasDoblesEspacios[$k]." : <strong>".$fil["total"]."</strong>";
							if($fil["total"]>0)
							{
								echo "<span class='botonMostrar' onclick='muestraOculta(\"divCaracteresEspecialesConsolidada".$k."\");' >Mostrar/Ocultar</span>";

								echo "<div class='oculta' id='divCaracteresEspecialesConsolidada".$k."'>";
									echo "<ul>";
									$sql="SELECT * FROM consolidadasTemporales WHERE ".$campo." regexp '[^a-zA-Z0-9\ \ñ\Ñ\/ ]' AND revisionesTemporales_idrevisionesTemporales='".$idrevisionesTemporales."' LIMIT 100";
									$res=mysql_query($sql);
									while($fil=mysql_fetch_assoc($res))
									{
										$cadenaError="Se encontraron caracteres especiales en el campo <strong>".$leyendasDoblesEspacios[$k]."</strong>: <strong>".addslashes($fil[$campo])."</strong>";
										echo "<li>".$cadenaError."</li>";
										guardaErrorRevision($idrevisionesTemporales,$cadenaError);
									}
									echo "</ul>";
								echo "</div>";
							}

							echo "<br><br>";
						}




						echo "<br><br><br>";

						
						
					?>
					<br>
					<br>
					<form  id="formulario" method="post">

						<input type="hidden" name="a" value="comenzarReporteAnalitica" />
						<input type="hidden" name="idrevisionesTemporales" value="<?php echo $idrevisionesTemporales; ?>" />

						<br><br>

						<?php
							foreach($_REQUEST as $k => $v)
							{								
								if($k!="a" && $k!="PHPSESSID")
									echo "<input type='hidden' name='".$k."' value='".$v."' />";								
							}
						?>

						<input type="submit" value="Siguiente" class="botonRojo">
					
					</form>
				</fieldset>
			</div>			
		<?php
	}







	function comenzarReporteAnalitica()
	{
			$idrevisionesTemporales=$_REQUEST["idrevisionesTemporales"];
			$fileD=$_REQUEST["fileD"];
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

			//$ahorradoresConsolidada=dameDatosTodosAhorradoresConsolidada($idrevisionesTemporales);
			

			echo "<span class='subTitulos' style='font-weight:bold;'>Detalle del reporte de la base analítica</span>";
			?>			
			<div id='divDetalleErrores'>
				<fieldset class="fieldsetZht fieldSetReporte">
					<legend><strong>Reporte sobre la base de datos analítica</strong></legend>
					<br>
						<?php

							// REVISO FOLIOS REPETIDOS //					
							$sql="SELECT nuevoFolioIdentificador,COUNT(nuevoFolioIdentificador) AS total FROM analiticasTemporales WHERE (nuevoFolioIdentificador<>0 OR nuevoFolioIdentificador<>'') AND revisionesTemporales_idrevisionesTemporales='".$idrevisionesTemporales."' GROUP BY nuevoFolioIdentificador HAVING total>1";
							$res=mysql_query($sql);
							$foliosRepetidosBaseAnalitica=mysql_num_rows($res);
							echo "Nuevos folios repetidos de la base analítica: <strong>".$foliosRepetidosBaseAnalitica."</strong>";
							if($foliosRepetidosBaseAnalitica>0)
							{
								$erroresTotalesReporte++;
								echo "<span class='botonMostrar' onclick='muestraOculta(\"divFoliosRepetidosAnalitica\");' >Mostrar/Ocultar</span>";
								echo "<div class='oculta' id='divFoliosRepetidosAnalitica'>";
									$sql="SELECT nuevoFolioIdentificador,COUNT(nuevoFolioIdentificador) AS total FROM analiticasTemporales WHERE (nuevoFolioIdentificador<>0 OR nuevoFolioIdentificador<>'') AND revisionesTemporales_idrevisionesTemporales='".$idrevisionesTemporales."' GROUP BY nuevoFolioIdentificador HAVING total>1 LIMIT 100";
									$res=mysql_query($sql);	
									while($fil=mysql_fetch_assoc($res))		
									{
										$foliosRepetidos[]=$fil["nuevoFolioIdentificador"];
										echo "<ul>";
											foreach($foliosRepetidos as $indice => $folio)
											{
												$sqlFoliosRepetidos="SELECT filaDocumentoOriginal FROM analiticasTemporales WHERE nuevoFolioIdentificador='".$folio."' AND revisionesTemporales_idrevisionesTemporales='".$idrevisionesTemporales."' LIMIT 500";					
												$resFoliosRepetidos=mysql_query($sqlFoliosRepetidos);
												$filas="";
												while($filFoliosRepetidos=mysql_fetch_assoc($resFoliosRepetidos))					
													$filas[]=$filFoliosRepetidos["filaDocumentoOriginal"];
												
												$filas=implode(", ",$filas);					
												$cadenaError="El folio <strong>".$folio."</strong> aparece en las filas <strong>".$filas."</strong> de la hoja <strong>".$hojaAnalitica."</strong>";
												echo "<li>".$cadenaError."</li>";
												guardaErrorRevision($idrevisionesTemporales,$cadenaError);
											}	
										echo "</ul>";
									}
									
								echo "</div>";
							}
							echo "<br><br>";

							








							// BUSCO FOLIOS EN BLANCO //
							$sql="SELECT filaDocumentoOriginal FROM analiticasTemporales WHERE revisionesTemporales_idrevisionesTemporales='".$idrevisionesTemporales."' AND UPPER(nombreAhorrador)<>'TOTAL' AND nombreAhorrador<>'' AND nuevoFolioIdentificador=''";
							$res=mysql_query($sql);
							echo "Folios en blanco en la base analítica: <strong>".mysql_num_rows($res)."</strong>";
							if(mysql_num_rows($res)>0)
							{
								echo "<span class='botonMostrar' onclick='muestraOculta(\"divFoliosNoEncontrados\");'>Mostrar/Ocultar</span>";
								echo "<div class='oculta' id='divFoliosNoEncontrados'>";								
									echo "<ul>";
										$sql="SELECT filaDocumentoOriginal FROM analiticasTemporales WHERE revisionesTemporales_idrevisionesTemporales='".$idrevisionesTemporales."' AND UPPER(nombreAhorrador)<>'TOTAL' AND nombreAhorrador<>'' AND nuevoFolioIdentificador='' LIMIT 100";
										$res=mysql_query($sql);
										while($fil=mysql_fetch_assoc($res))	
										{
											$filasFoliosEnBlanco[]=$fil["filaDocumentoOriginal"];
											$cadenaError= "En la fila <strong>".$fil["filaDocumentoOriginal"]."</strong>  de la hoja <strong>".$hojaAnalitica."</strong> aparecen folios en blanco";
											echo "<li>".$cadenaError."</li>";
											guardaErrorRevision($idrevisionesTemporales,$cadenaError);
										}
										
									echo "</ul>";
								echo "</div>";			
							}
							if(is_array($filasFoliosEnBlanco))
								$filasFoliosEnBlanco=implode(",",$filasFoliosEnBlanco);
							else
								$filasFoliosEnBlanco="0";
							echo "<br><br>";
							// BUSCO FOLIOS EN BLANCO //





							////REVISO FILAS VACÍAS////
							$sql="SELECT * FROM analiticasTemporales WHERE TRIM(nuevoFolioIdentificador)=''AND TRIM(folioIdentificadorAnterior)=''AND TRIM(nombreAhorrador)=''AND TRIM(tipoDocumentoPS)=''AND TRIM(folioPS)=''AND importePS=0 AND TRIM(tipoDocumentoCA)=''AND TRIM(folioCA)=''AND importeCA=0 AND TRIM(tipoDocumentoCI)=''AND TRIM(folioCI)=''AND importeCI=0 AND TRIM(tipoDocumentoDG)=''AND TRIM(folioDG)=''AND importeDG=0 AND TRIM(tipoDocumentoCNC)=''AND TRIM(folioCNC)=''AND importeCNC=0 AND TRIM(tipoDocumentoOtros)=''AND TRIM(folioOtros)=''AND importeOtros=0 AND TRIM(tipoDocumentoPrestamos)=''AND TRIM(folioPrestamos)=''AND importePrestamos=0 AND saldoNeto100=0 AND saldoNeto70=0 AND montoMaximoPago=0 AND TRIM(calleYNumero)=''AND TRIM(delegacionMunicipio)=''AND TRIM(telefono)=''AND TRIM(curp)='' AND revisionesTemporales_idrevisionesTemporales='".$idrevisionesTemporales."'";
							$res=mysql_query($sql);
							echo "Registros en blanco de la base analítica: <strong>".mysql_num_rows($res)."</strong>";
							if(mysql_num_rows($res)>0)
							{
								echo "<span class='botonMostrar' onclick='muestraOculta(\"divRegistrosVaciosAnalitica\");'>Mostrar/Ocultar</span>";
								echo "<div class='oculta' id='divRegistrosVaciosAnalitica'>";						
									echo "<ul>";
										while($fil=mysql_fetch_assoc($res))
										{											
											$cadenaError="La fila ".$fil["filaDocumentoOriginal"]." de la base analítica esta vacía";
											echo "<li>".$cadenaError."</li>";
											guardaErrorRevision($idrevisionesTemporales,$cadenaError);
										}
									echo "</ul>";
								echo "</div>";
							}
							////REVISO FILAS VACÍAS////
							echo "<br><br>";







							
							// REVISO FOLIOS QUE NO ESTEN EN LA CONSOLIDADA //
							$sql="SELECT nuevoFolioIdentificador FROM analiticasTemporales WHERE filaDocumentoOriginal NOT IN(".$filasFoliosEnBlanco.") AND revisionesTemporales_idrevisionesTemporales='".$idrevisionesTemporales."' AND UPPER(nombreAhorrador)<>'TOTAL' AND nombreAhorrador<>'' AND nuevoFolioIdentificador NOT IN(SELECT nuevoFolioIdentificador FROM consolidadasTemporales WHERE revisionesTemporales_idrevisionesTemporales='".$idrevisionesTemporales."' AND UPPER(nombreAhorrador)<>'TOTAL' AND nombreAhorrador<>'')";
							$res=mysql_query($sql);
							//$foliosNoEncontrados = array_diff($foliosAhorradoresConsolidada, $foliosAnalitica);
							echo "Folios que no se encuentran en ambas bases (CONSOLIDADA Y ANALITICA): <strong>".mysql_num_rows($res)."</strong>";
							if(mysql_num_rows($res)>0)
							{
								echo "<span class='botonMostrar' onclick='muestraOculta(\"divFoliosNoEncontrados\");'>Mostrar/Ocultar</span>";
								echo "<div class='oculta' id='divFoliosNoEncontrados'>";								
									echo "<ul>";
										$sql="SELECT nuevoFolioIdentificador FROM analiticasTemporales WHERE revisionesTemporales_idrevisionesTemporales='".$idrevisionesTemporales."' AND UPPER(nombreAhorrador)<>'TOTAL' AND nombreAhorrador<>'' AND nuevoFolioIdentificador NOT IN(SELECT nuevoFolioIdentificador FROM consolidadasTemporales WHERE revisionesTemporales_idrevisionesTemporales='".$idrevisionesTemporales."' AND UPPER(nombreAhorrador)<>'TOTAL' AND nombreAhorrador<>'') LIMIT 100";
										$res=mysql_query($sql);
										while($fil=mysql_fetch_assoc($res))	
										{
											$cadenaError= "El folio <strong>".$fil["nuevoFolioIdentificador"]."</strong>  de la hoja <strong>".$hojaAnalitica."</strong> no aparece en la base consolidada de la hoja <strong>".$hojaConsolidada."</strong>";
											echo "<li>".$cadenaError."</li>";
											guardaErrorRevision($idrevisionesTemporales,$cadenaError);
										}
										
									echo "</ul>";
								echo "</div>";			
							}
							echo "<br><br>";











							// REVISO NOMBRES REPETIDOS //
							$sql="SELECT nombreAhorrador,COUNT(nombreAhorrador) AS total FROM analiticasTemporales WHERE nombreAhorrador<>'' AND revisionesTemporales_idrevisionesTemporales='".$idrevisionesTemporales."' GROUP BY nombreAhorrador HAVING total>1";
							$res=mysql_query($sql);		
							$nombresRepetidosBaseAnalitica=mysql_num_rows($res);
							echo "Nombres repetidos de la base analítica: <strong>".$nombresRepetidosBaseAnalitica."</strong>";
							if($nombresRepetidosBaseAnalitica>0)
							{
								$erroresTotalesReporte++;
								echo "<span class='botonMostrar' onclick='muestraOculta(\"divNombresRepetidosAnalitica\");'>Mostrar/Ocultar</span>";
								echo "<div class='oculta' id='divNombresRepetidosAnalitica'>";
									echo "<ul>";
										$sql="SELECT nombreAhorrador,COUNT(nombreAhorrador) AS total FROM analiticasTemporales WHERE nombreAhorrador<>'' AND revisionesTemporales_idrevisionesTemporales='".$idrevisionesTemporales."' GROUP BY nombreAhorrador HAVING total>1 LIMIT 100";
										$res=mysql_query($sql);	
										while($fil=mysql_fetch_assoc($res))
										{
											$sqlR="SELECT filaDocumentoOriginal FROM analiticasTemporales WHERE nombreAhorrador='".$fil["nombreAhorrador"]."' AND revisionesTemporales_idrevisionesTemporales='".$idrevisionesTemporales."'";
											$resR=mysql_query($sqlR);
											while($filR=mysql_fetch_assoc($resR))
											{
												$filasNR[]=$filR["filaDocumentoOriginal"];
											}

											$filasS=implode(",",$filasNR);

											$cadenaError= "El nombre <strong>".$fil["nombreAhorrador"]."</strong> aparece repetido de la hoja <strong>".$hojaAnalitica."</strong> filas: <strong>".$filasS."</strong>";
											echo "<li>".$cadenaError."</li>";
											guardaErrorRevision($idrevisionesTemporales,$cadenaError);	
										}
									echo "</ul>";
										
								echo "</div>";		
							}
							echo "<br><br>";






							






							// BUSCO NOMBRES DE LA ANALITICA QUE NO ESTEN EN LA CONSOLIDADA //
							//$sql="SELECT DISTINCT(nombreAhorrador) FROM analiticasTemporales WHERE revisionesTemporales_idrevisionesTemporales='".$idrevisionesTemporales."' AND UPPER(nombreAhorrador)<>'TOTAL' AND nombreAhorrador<>'' AND nombreAhorrador NOT IN(SELECT DISTINCT(nombreAhorrador) FROM consolidadasTemporales WHERE revisionesTemporales_idrevisionesTemporales='".$idrevisionesTemporales."' AND UPPER(nombreAhorrador)<>'TOTAL' AND nombreAhorrador<>'')";
							// $sql="SELECT a.nombreAhorrador FROM analiticasTemporales a LEFT JOIN consolidadasTemporales c ON a.nombreAhorrador = c.nombreAhorrador WHERE c.nombreAhorrador IS NULL AND a.revisionesTemporales_idrevisionesTemporales='".$idrevisionesTemporales."' AND c.revisionesTemporales_idrevisionesTemporales='".$idrevisionesTemporales."' AND UPPER(a.nombreAhorrador)<>'TOTAL' AND a.nombreAhorrador<>'' AND UPPER(c.nombreAhorrador)<>'TOTAL' AND c.nombreAhorrador<>''";
							// $res=mysql_query($sql);
							
							// echo "Nombres en la base analítica NO encontrados en la base de datos consolidada: <strong>".mysql_num_rows($res)."</strong>";
							// if(mysql_num_rows($res)>0)
							// {
							// 	echo "<span class='botonMostrar' onclick='muestraOculta(\"divNombresAnaliticaNoEncontradosConsolidada\");'>Mostrar/Ocultar</span>";
							// 	echo "<div class='oculta' id='divNombresAnaliticaNoEncontradosConsolidada'>";									
							// 		echo "<ul>";
							// 			while($fil=mysql_fetch_assoc($res))
							// 			{
							// 				$cadenaError="El nombre <strong>".$fil["nombreAhorrador"]."</strong> aparece en la base analitica de la hoja <strong>".$hojaAnalitica."</strong> pero no aparece en la base de datos consolidada";
							// 				echo "<li>".$cadenaError."</li>";
							// 				guardaErrorRevision($idrevisionesTemporales,$cadenaError);
							// 			}
							// 		echo "</ul>";
							// 	echo "</div>";
							// }
							// echo "<br><br>";

							




							// REVISO SALDOS NEGATIVOS
							$leyendas="";
							$campos="";
							$leyendas=array("importes de parte social","importes de cuentas de ahorro","importes de cuentas de inversión","importes de depositos en garantía","importes de cheques no cobrados","importes de otros depósitos","prestamos a cargo","saldos netos de ahorro al 100%","saldos netos de ahorro al 70%","montos máximo de pago");
							$campos=array("importePS","importeCA","importeCI","importeDG","importeCNC","importeOtros","importePrestamos","saldoNeto100","saldoNeto70","montoMaximoPago");
							foreach($campos as $k => $campo)
							{							
								$sql="SELECT ".$campo.",filaDocumentoOriginal FROM analiticasTemporales WHERE ".$campo."<0 AND revisionesTemporales_idrevisionesTemporales='".$idrevisionesTemporales."' ";
								$res=mysql_query($sql);		
								echo "Saldos negativos en ".$leyendas[$k].": <strong>".mysql_num_rows($res)."</strong>";					
								if(mysql_num_rows($res)>0)
								{
									echo "<span class='botonMostrar' onclick='muestraOculta(\"divSaldosNegativosAnalitica".$k."\");'>Mostrar/Ocultar</span>";
									echo "<div class='oculta' id='divSaldosNegativosAnalitica".$k."'>";
										while($fil=mysql_fetch_assoc($res))
										{
											$cadenaError= "<span class='error'>La fila ".$fil["filaDocumentoOriginal"]." de la base analítica muestra saldo negativo en el campo ".$leyendas[$k].": $ ".separarMiles($fil[$campo])."</span>";
											echo $cadenaError."<br>";
											guardaErrorRevision($idrevisionesTemporales,$cadenaError);										
										}
									echo "</div>";
								}
								echo "<br><br>";
							}
							echo "<br><br>";
							














							// REVISO TODOS LOS IMPORTES //
							// $saldosAnalitica=calculaSaldosAnalitica($idrevisionesTemporales);
							$leyendas="";
							$campos="";

							//$campos=array("parteSocial","cuentasAhorro","cuentasInversion","depositosGarantia","chequesNoCobrados","otrosDepositos","prestamosACargo","saldoNeto100","saldoNeto70","montoMaximoPago");
							//$sumasCamposConsolidada=dameSumaCampos($ahorradoresConsolidada,$campos);

							$leyendas=array("importes de parte social","importes de cuentas de ahorro","importes de cuentas de inversión","importes de depositos en garantía","importes de cheques no cobrados","importes de otros depósitos","prestamos a cargo","saldos netos de ahorro al 100%","saldos netos de ahorro al 70%","montos máximo de pago");
							$campos=array("importePS","importeCA","importeCI","importeDG","importeCNC","importeOtros","importePrestamos","saldoNeto100","saldoNeto70","montoMaximoPago");
							$camposC=array("parteSocial","cuentasAhorro","cuentasInversion","depositosGarantia","chequesNoCobrados","otrosDepositos","prestamosACargo","saldoNeto100","saldoNeto70","montoMaximoPago");

						
							// $sumasAnalitica=dameSumaCampos($saldosAnalitica,$campos);
							
							$totalCalculado=0;
							$totalIndicado=0;
							$totalIndicadoC=0;
							$totalCalculadoC=0;

							foreach($campos as $k => $campo)
							{
								$leyenda=$leyendas[$k];

								$sql="SELECT SUM(".$campo.") AS totalCalculado FROM analiticasTemporales WHERE UPPER(nombreAhorrador)<>'TOTAL' AND revisionesTemporales_idrevisionesTemporales='".$idrevisionesTemporales."' ";
								$res=mysql_query($sql);
								$fil=mysql_fetch_assoc($res);
								$totalCalculado=round($fil["totalCalculado"],2);
								//$totalCalculado=round($sumasAnalitica[$campo],2);
								echo "Saldo total calculado en la base analítica de ".$leyenda.": <strong> $ ".separarMiles($totalCalculado)."</strong><br>";
								
								//INDICADO
								$sql="SELECT ".$campo." FROM analiticasTemporales WHERE UPPER(nombreAhorrador)='TOTAL' AND revisionesTemporales_idrevisionesTemporales='".$idrevisionesTemporales."' ";
								$res=mysql_query($sql);
								$fil=mysql_fetch_assoc($res);
								$totalIndicado=$fil[$campo];
								echo "Saldo total indicado en la base analítica &nbsp;&nbsp;de ".$leyenda.": <strong> $ ".separarMiles($totalIndicado)."</strong><br>";

								// CALCULADO CONSOLIDADA //
								$sql="SELECT SUM(".$camposC[$k].") AS totalCalculado FROM consolidadasTemporales WHERE UPPER(nombreAhorrador)<>'TOTAL' AND revisionesTemporales_idrevisionesTemporales='".$idrevisionesTemporales."' ";						
								$res=mysql_query($sql);
								$fil=mysql_fetch_assoc($res);
								$totalCalculadoC=round($fil["totalCalculado"],2);
								echo "Saldo total calculado en la base consolidada de ".$leyenda.": <strong> $ ".separarMiles($totalCalculadoC)."</strong><br>";
								
								// INDICADO CONSOLIDADA//
								$sql="SELECT ".$camposC[$k]." FROM consolidadasTemporales WHERE UPPER(nombreAhorrador)='TOTAL' AND revisionesTemporales_idrevisionesTemporales='".$idrevisionesTemporales."' ";
								$res=mysql_query($sql);
								$fil=mysql_fetch_assoc($res);
								$totalIndicadoC=$fil[$camposC[$k]];
								echo "Saldo total indicado en la base consolidada &nbsp;&nbsp;de ".$leyenda.": <strong> $ ".separarMiles($totalIndicadoC)."</strong><br>";

								if($totalCalculado==$totalIndicado && $totalCalculadoC==$totalIndicadoC && $totalIndicadoC==$totalIndicado && $totalCalculado==$totalCalculadoC)
									echo "<span class='exito'>Los montos calculados de ".$leyenda." coinciden con el monto indicado en el documento</span>";
								else
								{
									$erroresTotalesReporte++;
									$cadenaError="<span class='error'>Los montos calculados de ".$leyenda." NO coinciden con el monto indicado en el documento</span>";
									echo $cadenaError;
									guardaErrorRevision($idrevisionesTemporales,$cadenaError);
								}
								echo "<br><br>";
							}
							echo "<br><br>";








							// MONTOS MAL CALCULADOS POR AHORRADOR //							
							$error=0;
							$mensaje.="<ul>";
							$saldosErroneosAnalitica=calculaSaldosAnalitica($idrevisionesTemporales);
							foreach($saldosErroneosAnalitica as $folio => $cadenaError)
								$mensaje.="<li>".$cadenaError."</li>";

							$mensaje.="</ul>";

							if(count($saldosErroneosAnalitica)==0)
								echo "Saldos mal indicados por ahorrador: <strong>0</strong>";
							else
							{
								echo "Saldos mal indicados por ahorrador: <strong>".count($saldosErroneosAnalitica)."</strong>";
								echo "<span class='botonMostrar' onclick='muestraOculta(\"divSaldosMalCalculadosPorAhorradorAnalitica\");'>Mostrar/Ocultar</span>";
								echo "<br><br>";
								echo "<div class='oculta' id='divSaldosMalCalculadosPorAhorradorAnalitica'>";
									echo $mensaje;
								echo "</div>";
							}
							echo "<br><br>";



							







							// BUSCO DOBLES ESPACIOS //
							// $camposDoblesEspacios=Array("nombreAhorrador","curp","calleYNumero","colonia","delegacionMunicipio","telefono");
							// $leyendasDoblesEspacios=Array("Nombre del ahorrador","CURP","Calle y número","Colonia","Delegación o Municipio","Teléfono");

							$camposDoblesEspacios=Array("nombreAhorrador","curp");
							$leyendasDoblesEspacios=Array("Nombre del ahorrador","CURP");

							foreach($camposDoblesEspacios as $k => $campo)
							{
								$sql="SELECT * FROM analiticasTemporales WHERE ".$campo." LIKE '%  %' AND revisionesTemporales_idrevisionesTemporales='".$idrevisionesTemporales."'";
								$res=mysql_query($sql);
								echo "Dobles espacios encontrados en el campo ".$leyendasDoblesEspacios[$k]." : <strong>".mysql_num_rows($res)."</strong>";
								if(mysql_num_rows($res)>0)
								{
									echo "<span class='botonMostrar' onclick='muestraOculta(\"divDoblesEspaciosAnalitica".$k."\");' >Mostrar/Ocultar</span>";

									echo "<div class='oculta' id='divDoblesEspaciosAnalitica".$k."'>";
										echo "<ul>";
										while($fil=mysql_fetch_assoc($res))
										{
											$cadenaError="Se encontraron dobles espacios en el campo <strong>".$leyendasDoblesEspacios[$k]."</strong>: <strong>".$fil[$campo]."</strong>";
											echo "<li>".$cadenaError."</li>";
											guardaErrorRevision($idrevisionesTemporales,$cadenaError);
										}
										echo "</ul>";
									echo "</div>";
								}
								echo "<br><br>";

							}

							echo "<br>";




							// BUSCO CARACTERES ESPECIALES //
							$camposDoblesEspacios=Array("nombreAhorrador","curp");
							$leyendasDoblesEspacios=Array("Nombre del ahorrador","CURP");
							foreach($camposDoblesEspacios as $k => $campo)
							{							
								$sql="SELECT * FROM analiticasTemporales WHERE ".$campo." regexp '[^a-zA-Z0-9\ \ñ\Ñ\/ ]' AND revisionesTemporales_idrevisionesTemporales='".$idrevisionesTemporales."'";
								$res=mysql_query($sql);
								echo "Caracteres especiales en el campo ".$leyendasDoblesEspacios[$k]." : <strong>".mysql_num_rows($res)."</strong>";
								if(mysql_num_rows($res)>0)
								{
									echo "<span class='botonMostrar' onclick='muestraOculta(\"divEspecialesAnalitica".$k."\");' >Mostrar/Ocultar</span>";
									echo "<div class='oculta' id='divEspecialesAnalitica".$k."'>";
										echo "<ul>";
										$sql="SELECT * FROM analiticasTemporales WHERE ".$campo." regexp '[^a-zA-Z0-9\ \ñ\Ñ\/ ]' AND revisionesTemporales_idrevisionesTemporales='".$idrevisionesTemporales."' LIMIT 100";
										$res=mysql_query($sql);
										while($fil=mysql_fetch_assoc($res))
										{
											$cadenaError="Se encontraron caracteres especiales en el campo <strong>".$leyendasDoblesEspacios[$k]."</strong>: <strong>".$fil[$campo]."</strong>";
											echo "<li>".$cadenaError."</li>";
											guardaErrorRevision($idrevisionesTemporales,$cadenaError);
										}
										echo "</ul>";
									echo "</div>";
								}
								echo "<br><br>";

							}


							echo "<br><br><br>";




						?>




					<br><br><br>
					<form  id="formulario" method="post">

						<input type="hidden" name="a" value="comenzarReporteResumen" />

						<br><br>

						<?php
							foreach($_REQUEST as $k => $v)
							{								
								if($k!="a" && $k!="PHPSESSID")
									echo "<input type='hidden' name='".$k."' value='".$v."' />";								
							}
						?>

						<input type="submit" value="Siguiente" class="botonRojo">
					
					</form>

				</fieldset>


			</div>
			<?php
		}
	





		function comenzarReporteResumen()
		{
				$idrevisionesTemporales=$_REQUEST["idrevisionesTemporales"];
				$fileD=$_REQUEST["fileD"];
				$hojaConsolidada=$_REQUEST["hojaConsolidada"];
				$hojaAnalitica=$_REQUEST["hojaAnalitica"];
				$hojaResumen=$_REQUEST["hojaResumen"];
				$filaConsolidada=$_REQUEST["filaConsolidada"];
				$filaAnalitica=$_REQUEST["filaAnalitica"];
				$filaResumen=$_REQUEST["filaResumen"];
				$filaConsolidada2=$_REQUEST["filaConsolidada2"];
				$filaAnalitica2=$_REQUEST["filaAnalitica2"];
				$filaResumen2=$_REQUEST["filaResumen2"];
				

				//$saldosAnalitica=calculaSaldosAnalitica($idrevisionesTemporales);

				
				echo "<span class='subTitulos' style='font-weight:bold;'>Detalle del reporte de la base de resumen</span>";
				?>


				<div id='divDetalleErrores'>
					<fieldset class="fieldsetZht fieldSetReporte">
						<legend><strong>Reporte sobre la base de datos de resumen</strong></legend>
						<br>
						<?php
							
							// NOMBRO TODAS LAS SOCIEDADES //
							$sql="SELECT DISTINCT(descripcion) FROM resumenTemporales WHERE descripcion NOT LIKE 'MENORES%' AND descripcion NOT LIKE 'MAYORES%'  AND  revisionesTemporales_idrevisionesTemporales='".$idrevisionesTemporales."' AND UPPER(descripcion)<>'TOTAL' AND descripcion<>'' ORDER BY idresumenTemporales ASC";
							$res=mysql_query($sql);					
							echo 'Listado de sociedades <span class="botonMostrar" onclick="muestraOculta(\'divNombreSociedades\');">Mostrar/Ocultar</span>';
							echo "<div style='display:block;' id='divNombreSociedades'>";						
								echo "<ol>";
									while($fil=mysql_fetch_assoc($res))
									{
										echo "<li>";
											echo "<strong>".$fil["descripcion"]."</strong>";
											//Busco que la sociedad este dada de alta
											$sqlCompSoc="SELECT COUNT(*) AS total FROM sociedad WHERE UPPER(nombre)='".strtoupper($fil["descripcion"])."'";
											$resCompSoc=mysql_query($sqlCompSoc);
											$filCompSoc=mysql_fetch_assoc($resCompSoc);
											if($filCompSoc["total"]==0)
											{
												echo " -  La sociedad <strong>NO</strong> se encuentra registrada";
												$sociedadesNoRegistradas[]=$fil["descripcion"];
											}
											else
											{
												echo " -  La sociedad ya se encuentra registrada";
												$sociedadesYaRegistradas[]=$fil["descripcion"];
											}

										echo "</li>";
									}
									
								echo "</ol>";
							echo "</div>";
							echo "<br><br>";
							

							
							//BUSCO LOS DOCUMENTOS DE VALOR POR SOCIEDAD QUE ESTEN LIGADOS AL AHORRADOR

								$archivos=Array("tipoDocumentoPS","tipoDocumentoCA","tipoDocumentoCI","tipoDocumentoDG","tipoDocumentoCNC","tipoDocumentoOtros","tipoDocumentoPrestamos");
								$leyendas=Array("parte social","cuentas de ahorro","cuentas de inversión","depósitos en garantia","cheques no cobrados","otros documentos","prestamos a cargo");
								
								$sqlSocTem="SELECT * FROM sociedadesTemporales WHERE revisionesTemporales_idrevisionesTemporales='".$idrevisionesTemporales."'";
								$resSocTem=mysql_query($sqlSocTem);
								while($filSocTem=mysql_fetch_assoc($resSocTem)) //PARA CADA SOCIEDAD TEMPORAL TRAIGO EL FOLIO Y EL NOMBRE
								{
									$documentosValor=Array();
									$idsociedadesTemporales=$filSocTem["idsociedadesTemporales"];
									$folioSociedadTemporal=$filSocTem["folio"];
									$nombreSociedadTemporal=$filSocTem["nombre"];

									//TRAIGO TODOS LOS DOCUMENTOS DE VALOR ASOCIADOS A ESTA SOCIEDA
									$sqlDocVal="SELECT documentosValor.nombre FROM documentosValorSociedadesTemporales INNER JOIN documentosValor ON iddocumentosValor=documentosValor_iddocumentosValor WHERE sociedadesTemporales_idsociedadesTemporales='".$idsociedadesTemporales."'";
									$resDocVal=mysql_query($sqlDocVal);
									while($filDocVal=mysql_fetch_assoc($resDocVal))
										$documentosValor[]="'".$filDocVal["nombre"]."'";

									$documentosValor=implode(",",$documentosValor);

									//echo "Los documentos de valor de la sociedad temporal ".$nombreSociedadTemporal." son ".$documentosValor."<br>";

									//BUSCO LOS DOCUMENTOS DE VALOR QUE NO ESTÉN EN LA LISTA
									foreach($archivos as $indiceArchivo => $archivo)
									{
										$sqlRevisionDocumentos="SELECT * FROM analiticasTemporales WHERE nuevoFolioIdentificador LIKE '".$folioSociedadTemporal."%' AND ".$archivo." NOT IN(".$documentosValor.") AND revisionesTemporales_idrevisionesTemporales='".$idrevisionesTemporales."' AND nuevoFolioIdentificador<>''";
										$resRevisionDocumentos=mysql_query($sqlRevisionDocumentos);
										if(mysql_num_rows($resRevisionDocumentos)>0)
										{
											while($filRevisionDocumentos=mysql_fetch_assoc($resRevisionDocumentos))
											{
												$cadenaError="En la fila ".$filRevisionDocumentos["filaDocumentoOriginal"]." de la base analítica esta el documento <strong>".$filRevisionDocumentos[$archivo]."</strong> el cuál no está asociado a la sociedad <strong>".$nombreSociedadTemporal."</strong>";
												echo "<span class='error'>".$cadenaError."</span><br>";
												guardaErrorRevision($idrevisionesTemporales,$cadenaError);
											}
										}
									}
								}

							//FIN DE BUSCO LOS DOCUMENTOS DE VALOR POR SOCIEDAD QUE ESTEN LIGADOS AL AHORRADOR




							echo "<br><br>";
							$sumasMenores = array("noAhorradores"=>0,"parteSocial"=>0,"cuentaAhorro"=>0,"cuentaInversion"=>0,"depositosGarantia"=>0,"chequesNoCobrados"=>0,"otrosDepositos"=>0,"prestamosCargo"=>0,"saldoNetoAhorro100"=>0,"saldoNetoAhorro70"=>0,"montoMaximoPago"=>0);
							$sumasMayores = array("noAhorradores"=>0,"parteSocial"=>0,"cuentaAhorro"=>0,"cuentaInversion"=>0,"depositosGarantia"=>0,"chequesNoCobrados"=>0,"otrosDepositos"=>0,"prestamosCargo"=>0,"saldoNetoAhorro100"=>0,"saldoNetoAhorro70"=>0,"montoMaximoPago"=>0);
							$camposResumen = array("noAhorradores","parteSocial","cuentaAhorro","cuentaInversion","depositosGarantia","chequesNoCobrados","otrosDepositos","prestamosCargo","saldoNetoAhorro100","saldoNetoAhorro70","montoMaximoPago");
							$camposConsolidada = array("","parteSocial","cuentasAhorro","cuentasInversion","depositosGarantia","chequesNoCobrados","otrosDepositos","prestamosACargo","saldoNeto100","saldoNeto70","montoMaximoPago");
							$camposAnalitica = array("","importePS","importeCA","importeCI","importeDG","importeCNC","importeOtros","importePrestamos","saldoNeto100","saldoNeto70","montoMaximoPago");
							$leyendas = array("No. total de ahorradores","Total de parte social ($)","Total en cuentas de ahorro ($)","Total en cuentas de inversión ($)","Total en depósitos en garantía ($)","Total en cheques no cobrados ($)","Total en otros depósitos ($)","Total en préstamos a cargo ($)","Total en saldos netos al 100% ($)","Total en saldos netos al 70% ($)","Total en montos máximo de pagos ($)");
							
							$foliosCajas=array("001","002","003","004","005","006","007","008","009","010","011","012","013","014","015","016","017","018","019","020","021","022","023","024","025","026","027","028","029","030","031","032","033","034","035","036","037","038","039","040","041","042","043","044","045","046","047","048","049","050","051","052","053","054","055","056","057","058","059","060","061","062","063","064","065","066","067","068","069","070","071","072","073","074","075","076","077","078","079","080");
							
							



							//INICIO Reviso sociedad por sociedad //
							$sql="SELECT DISTINCT(descripcion) FROM resumenTemporales WHERE revisionesTemporales_idrevisionesTemporales='".$idrevisionesTemporales."' AND UPPER(descripcion)<>'TOTAL' AND descripcion<>'' ORDER BY idresumenTemporales ASC";
							$res=mysql_query($sql);
							$contadorFoliosCajas=0;
							while($fil=mysql_fetch_assoc($res))		
							{
								$folioCaja=$foliosCajas[$contadorFoliosCajas];

								echo '<strong>'.$fil["descripcion"].'</strong> folio ('.$folioCaja.')';
								echo "<br>";

								echo "<div class='sangria'>";

									// MENORES  A 239,900.00 //
									echo "<span class='subTitulos'>Menores a 239,900.00</span><br>";
									echo "<div class='sangria'>";								
										$sqlD="SELECT * FROM resumenTemporales WHERE descripcion='".$fil["descripcion"]."' AND  revisionesTemporales_idrevisionesTemporales='".$idrevisionesTemporales."' ORDER BY idresumenTemporales ASC LIMIT 1";
										$resD=mysql_query($sqlD);
										$filD=mysql_fetch_assoc($resD);
										foreach($camposResumen as $indice => $campo)
										{
											$sumasMenores[$campo]+=$filD[$campo];
											if($campo=="noAhorradores") //Busco solo el total
												echo $leyendas[$indice]." indicados en la base de resumen:&nbsp;&nbsp; <strong>".$filD[$campo]."</strong><br>";
											else
												echo $leyendas[$indice]." indicados en la base de resumen:&nbsp;&nbsp; <strong> $ ".separarMiles($filD[$campo])."</strong><br>";

											if($campo=="noAhorradores") //Busco solo el total
											{
												$sqlC="SELECT COUNT(*) AS total ";
												$totalCalculadoAnalitica=dameTotalAhorradoresAnaliticaPorCaja("menores",$idrevisionesTemporales,$folioCaja,"revision");
											}									
											else									
											{
												$sqlC="SELECT SUM(".$camposConsolidada[$indice].") AS total ";
											}
											
																				
											$sqlC.=" FROM consolidadasTemporales WHERE nuevoFolioIdentificador LIKE '".$folioCaja."%' ";
											$sqlC.=" AND revisionesTemporales_idrevisionesTemporales='".$idrevisionesTemporales."'";
											$sqlC.=" AND saldoNeto100<239900";

											$resC=mysql_query($sqlC);
											$filC=mysql_fetch_assoc($resC);

											if($campo=="noAhorradores") //Busco solo el total
												echo $leyendas[$indice]." calculados en la base consolidada: <strong>".round($filC["total"],2)."</strong><br>";
											else
												echo $leyendas[$indice]." calculados en la base consolidada: <strong> $ ".separarMiles(round($filC["total"],2))."</strong><br>";
											
											if(round($filC["total"],2)==round($filD[$campo],2))									
												echo "<span class='exito'>LOS TOTALES COINCIDEN</span>";									
											else
											{
												$erroresTotalesReporte++;																			
												echo "<span class='error'>LOS TOTALES NO COINCIDEN</span>";
												$cadenaError=$leyendas[$indice]." mal indicado en el rubro menores a 239900 de la sociedad: <strong>".$fil["descripcion"]."</strong>";
												guardaErrorRevision($idrevisionesTemporales,$cadenaError);
											}
											echo "<br><br>";
										}
									echo "</div>";
									// MENORES  A 239,900.00 //
									




									// MAYORES O IGUALES A 239,900.00 //
									echo "<br>";
									echo "<span class='subTitulos'>Mayores o iguales a 239,900.00</span><br>"; 
									echo "<div class='sangria'>";								
										$sqlD="SELECT * FROM resumenTemporales WHERE descripcion='".$fil["descripcion"]."' AND  revisionesTemporales_idrevisionesTemporales='".$idrevisionesTemporales."' ORDER BY idresumenTemporales DESC LIMIT 1";
										$resD=mysql_query($sqlD);
										$filD=mysql_fetch_assoc($resD);	
										foreach($camposResumen as $indice => $campo)
										{
											$sumasMayores[$campo]+=$filD[$campo];

											if($campo=="noAhorradores") 
												echo $leyendas[$indice]." indicados: <strong>".$filD[$campo]."</strong><br>";
											else
												echo $leyendas[$indice]." indicados: <strong> $ ".separarMiles($filD[$campo])."</strong><br>";

											if($campo=="noAhorradores") //Busco solo el total
											{
												$sqlC="SELECT COUNT(*) AS total ";
												$totalCalculadoAnalitica=dameTotalAhorradoresAnaliticaPorCaja("mayores",$idrevisionesTemporales,$folioCaja);
											}
											
											else									
											{
												$sqlC="SELECT SUM(".$camposConsolidada[$indice].") AS total ";												
											}
																				
											$sqlC.=" FROM consolidadasTemporales WHERE nuevoFolioIdentificador LIKE '".$folioCaja."%' ";
											$sqlC.=" AND revisionesTemporales_idrevisionesTemporales='".$idrevisionesTemporales."'";
											$sqlC.=" AND saldoNeto100>=239900";									
											$resC=mysql_query($sqlC);
											$filC=mysql_fetch_assoc($resC);

											if($campo=="noAhorradores") 
												echo $leyendas[$indice]." calculados: <strong>".round($filC["total"],2)."</strong><br>";
											else
												echo $leyendas[$indice]." calculados: <strong> $ ".separarMiles(round($filC["total"],2))."</strong><br>";

											if(round($filC["total"],2)==round($filD[$campo],2))
												echo "<span class='exito'>LOS TOTALES COINCIDEN</span>";									
											else			
											{
												$erroresTotalesReporte++;						
												echo "<span class='error'>LOS TOTALES NO COINCIDEN</span>";
												$cadenaError=$leyendas[$indice]." mal indicado en el rubro mayores o iguales a 239900 de la sociedad: <strong>".$fil["descripcion"]."</strong>";
												guardaErrorRevision($idrevisionesTemporales,$cadenaError);
											}
											echo "<br><br>";


										}
										// MAYORES O IGUALES A 239,900.00 //
									echo "</div>";

								echo "</div>";
								
								$folioCaja++;

								echo "<br><br><br>";

								$contadorFoliosCajas++;
							}
							//FIN Reviso sociedad por sociedad //







							/*** TOTALES INDICADOS VS CALCULADOS***/

							//Menores a 239,900.00
							echo "<br><strong>TOTALES INDICADOS VS TOTALES CALCULADOS MENORES A 239,900.00 DE LA BASE DE RESUMEN</strong><br><br>";
							echo "<div class='sangria'>";
								$sqlD="SELECT * FROM resumenTemporales WHERE UPPER(descripcion)='TOTAL' AND revisionesTemporales_idrevisionesTemporales='".$idrevisionesTemporales."' ORDER BY idresumenTemporales ASC LIMIT 1";
								$resD=mysql_query($sqlD);
								$filD=mysql_fetch_assoc($resD);	
								foreach($camposResumen as $indiceCamposResumen => $campoResumen)
								{
									if($campoResumen=="noAhorradores")
									{
										echo $leyendas[$indiceCamposResumen]." <strong>indicados</strong>:&nbsp;&nbsp; <strong>".$sumasMenores[$campoResumen]."</strong><br>";
										echo $leyendas[$indiceCamposResumen]." <strong>sumados</strong>: <strong>".$filD[$campoResumen]."</strong><br>";
									}
									else
									{
										echo $leyendas[$indiceCamposResumen]." <strong>indicados</strong>:&nbsp;&nbsp; <strong> $".separarMiles($sumasMenores[$campoResumen])."</strong><br>";
										echo $leyendas[$indiceCamposResumen]." <strong>sumados</strong>: <strong> $".separarMiles($filD[$campoResumen])."</strong><br>";
									}

									
									
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
										$cadenaError="EN LA BASE DE RESUMEN LOS TOTALES INDICADOS NO COINCIDENCON LOS CALCULADOS PARA AHORRADORES MENORES A $239,900.00";
										guardaErrorRevision($idrevisionesTemporales,$cadenaError);
									}
									echo "<br><br>";
								}
							echo "</div>";


							//Mayores o iguales a 239,900.00
							echo "<br><strong>TOTALES INDICADOS VS TOTALES CALCULADOS MAYORES O IGUALES A 239,900.00 DE LA BASE DE RESUMEN</strong><br><br>";
							echo "<div class='sangria'>";
								$sqlD="SELECT * FROM resumenTemporales WHERE UPPER(descripcion)='TOTAL' AND revisionesTemporales_idrevisionesTemporales='".$idrevisionesTemporales."' ORDER BY idresumenTemporales ASC LIMIT 2";
								$resD=mysql_query($sqlD);
								$filD=mysql_fetch_assoc($resD);
								$filD=mysql_fetch_assoc($resD);

								foreach($camposResumen as $indiceCamposResumen => $campoResumen)
								{
									if($campoResumen=="noAhorradores")
									{
										echo $leyendas[$indiceCamposResumen]." <strong>indicados</strong>:&nbsp;&nbsp; <strong> ".$sumasMayores[$campoResumen]."</strong><br>";
										echo $leyendas[$indiceCamposResumen]." <strong>sumados</strong>: <strong>".$filD[$campoResumen]."</strong><br>";
									}
									else
									{
										echo $leyendas[$indiceCamposResumen]." <strong>indicados</strong>:&nbsp;&nbsp; <strong> $ ".separarMiles($sumasMayores[$campoResumen])."</strong><br>";
										echo $leyendas[$indiceCamposResumen]." <strong>sumados</strong>: <strong> $ ".separarMiles($filD[$campoResumen])."</strong><br>";
									}
									
									
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
										$cadenaError="EN LA BASE DE RESUMEN LOS TOTALES INDICADOS NO COINCIDENCON LOS CALCULADOS PARA AHORRADORES MAYORES O IGUALES A $239,900.00";
										guardaErrorRevision($idrevisionesTemporales,$cadenaError);
									}
									echo "<br><br>";
								}
							echo "</div>";


							//ACTUALIZO LOS ERRORES		
							$sqlErr="SELECT COUNT(*) AS total FROM erroresRevisiones WHERE  revisionesTemporales_idrevisionesTemporales='".$idrevisionesTemporales."'";
							$resErr=mysql_query($sqlErr);
							$filErr=mysql_fetch_assoc($resErr);
							$erroresTotalesReporte=$filErr["total"];

							$sqlUpdate="UPDATE revisionesTemporales SET totalErrores='".$erroresTotalesReporte."' WHERE  idrevisionesTemporales='".$idrevisionesTemporales."'";
							$resUpdate=mysql_query($sqlUpdate);

						?>
					</fieldset>
			</div>		

			<br><br>
			<?php
			
			//LA LISTA DE LOS ARCHIVOS
			// echo "<span class='subTitulos' style='font-weight:bold; color:#59016f;'>Documentos encontrados</span>";
			// echo "<div id='divListaArchivos'>";
			// 	muestraCuadroArchivos($idrevisionesTemporales);
			// echo "</div>";
			// echo "<br><br>";

		


			//LA LISTA DE SOCIEDADES
			echo "<span class='subTitulos' style='font-weight:bold; color:#59016f;'>Resumen de sociedades</span>";
			echo "<div id='divListaArchivos'>";
				echo "NÚMERO SOCIEDADES YA REGISTRADAS: ".count($sociedadesYaRegistradas);
				if($sociedadesYaRegistradas!="")
				{
								
					echo "<ul>";
						foreach ($sociedadesYaRegistradas as $k => $v)
							echo "<li>".$v."</li>";
					echo "</ul>";
					echo "<br><br>";
				}
				echo "<br><br>";
				echo "NÚMERO DE SOCIEDADES NO REGISTRADAS: ".count($sociedadesNoRegistradas);		
				echo "<br>";		
				if($sociedadesNoRegistradas!="")
				{
					echo "SOCIEDADES NO REGISTRADAS: ";
					echo "<ul>";
						foreach ($sociedadesNoRegistradas as $k => $v)
							echo "<li>".$v."</li>";
					echo "</ul>";
				}
			echo "</div>";
			

			echo "<br><br><br>";

		?>
	
		<br>
		<br>
		<form  id="formulario" method="post">

			<input type="hidden" name="a" value="muestraResumenReporte" />

			<br><br>

			<?php
				foreach($_REQUEST as $k => $v)
				{								
					if($k!="a" && $k!="PHPSESSID")
						echo "<input type='hidden' name='".$k."' value='".$v."' />";								
				}
			?>

			<input type="submit" value="Siguiente" class="botonRojo">
		
		</form>


		<?php
	}



	



	function muestraResumenReporte()
	{
		global $_REQUEST,$mensaje;

		$erroresTotalesReporte=0;

		$idrevisionesTemporales=$_REQUEST["idrevisionesTemporales"];

		if(isset($_REQUEST["documentosValor"]))
		{
			$documentosValor=$_REQUEST["documentosValor"];
			$documentosValor=explode(",",$documentosValor);

			foreach($documentosValor as $k => $v)
			{
				if($v!="")
					$aux[]=$v;
			}
			$documentosValor=implode(",", $aux);

			//Obtengo el nombre del documento elegido
			$sql="SELECT UPPER(nombre) AS nombre FROM documentosValor WHERE iddocumentosValor IN(".$documentosValor.")";			
			$res=mysql_query($sql);
			while($fil=mysql_fetch_assoc($res))
				$documentosValorNombre[]=strtoupper(trim($fil["nombre"]));
			
			$archivos[]="tipoDocumentoPS";
			$archivos[]="tipoDocumentoCA";
			$archivos[]="tipoDocumentoCI";
			$archivos[]="tipoDocumentoDG";
			$archivos[]="tipoDocumentoCNC";
			$archivos[]="tipoDocumentoOtros";
			$archivos[]="tipoDocumentoPrestamos";
		
			foreach($archivos as $k => $archivo)
			{
				//Reviso los documentos que vienen en el excel
				$sql="SELECT DISTINCT(UPPER(".$archivo.")) AS archivo FROM analiticasTemporales WHERE  revisionesTemporales_idrevisionesTemporales='".$idrevisionesTemporales."' AND ".$archivo."<>''";
				$res=mysql_query($sql);		
				while($fil=mysql_fetch_assoc($res))
				{
					$documentosValorArchivo[]=strtoupper(trim($fil["archivo"]));
				}
			}

			$documentosValorArchivo=array_unique($documentosValorArchivo);

			foreach($documentosValorArchivo as $k => $archivo)
			{				
				if(!in_array(strtoupper(trim($archivo)),$documentosValorNombre))
				{					
					$cadenaError="El documento ".$archivo." indicado en el archivo no se encuentra en la lista de documentos aceptados para esta revisión";
					guardaErrorRevision($idrevisionesTemporales,$cadenaError);
				}
				
			}
		}







		$sqlErr="SELECT COUNT(*) AS total FROM erroresRevisiones WHERE  revisionesTemporales_idrevisionesTemporales='".$idrevisionesTemporales."'";
		$resErr=mysql_query($sqlErr);
		$filErr=mysql_fetch_assoc($resErr);
		$erroresTotalesReporte=$filErr["total"];

		echo "<br><br>";
		echo "<span class='subTitulos' style='font-weight:bold; color:#ff0000;'>Resumen del reporte</span>";
		echo "<div id='divSoloErrores'>";
			echo "TOTAL DE ERRORES ENCONTRADOS: ".$erroresTotalesReporte."<br><br>";
			muestraErroresRevision($idrevisionesTemporales,1);			
		echo "</div>";
		echo "<br><br>";

		echo "<span class='subTitulos' style='font-weight:bold; color:#59016f;'>Archivos indicados en el archivo</span>";


		echo "<div id='divListaArchivos'>";
			muestraCuadroArchivos($idrevisionesTemporales);
		echo "</div>";


		echo "<br><br>";
		?>
		<input type="button" value="Regresar" class="botonRojoChico" onclick="cargaModulo('bdinicial')">
		<br><br>
		<?php
	}




	function eliminaError()
	{
		global $_REQUEST;

		$iderroresRevisiones=$_REQUEST["id"];

		$sql="SELECT * FROM erroresRevisiones WHERE iderroresRevisiones='".$iderroresRevisiones."'";
		$res=mysql_query($sql);
		$fil=mysql_fetch_assoc($res);
		$idrevisionesTemporales=$fil["revisionesTemporales_idrevisionesTemporales"];

		$sql="DELETE FROM erroresRevisiones WHERE iderroresRevisiones='".$iderroresRevisiones."'";
		$res=mysql_query($sql);

		//Recalculo los errores
		$sqlErr="SELECT COUNT(*) AS total FROM erroresRevisiones WHERE  revisionesTemporales_idrevisionesTemporales='".$idrevisionesTemporales."'";
		$resErr=mysql_query($sqlErr);
		$filErr=mysql_fetch_assoc($resErr);
		$totalErrores=$filErr["total"];


		$sqlUp="UPDATE revisionesTemporales SET totalErrores='".$totalErrores."' WHERE idrevisionesTemporales='".$idrevisionesTemporales."'";
		$resUpd=mysql_query($sqlUp);

		$_REQUEST["idrevisionesTemporales"]=$idrevisionesTemporales;
		muestraResumenReporte();
	}

	desconectaDB($link);

?>





