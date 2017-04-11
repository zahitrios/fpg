<?php

	session_start();
	include_once ("../conf/functions.php");
	validarSession();
	ob_start();


	$_SESSION["language_select"] = "es";
	$KoolControlsFolder="../lib/KoolPHPSuite/KoolControls";

	require $KoolControlsFolder."/KoolAjax/koolajax.php";
	require $KoolControlsFolder."/KoolGrid/koolgrid.php";
	require $KoolControlsFolder."/KoolGrid/ext/datasources/MySQLiDataSource.php";
	require $KoolControlsFolder."/KoolCalendar/koolcalendar.php";

	$koolajax->scriptFolder = "../lib/KoolPHPSuite/KoolControls/KoolAjax"; 	

	$link=conectDBReturn();
	$ds = new MySQLDataSource($link);
	
	$ds->SelectCommand = "SELECT log.*,usuarios.nombre AS usuario, actividades.nombre AS actividad  
						FROM log 
						INNER JOIN actividades ON idactividades=actividades_idactividades 
						INNER JOIN usuarios ON idusuarios=usuarios_idusuarios 
						ORDER BY fecha DESC, idlog DESC";
	// $ds->UpdateCommand = "UPDATE modulos SET orden='@orden', nombre='@nombre', directorio='@directorio' WHERE idmodulos=@idmodulos";
	// $ds->DeleteCommand = "";
	// $ds->InsertCommand = "INSERT INTO modulos (orden,nombre,directorio) VALUES ('@orden','@nombre','@directorio')";
 	
 	$grid = new KoolGrid("grid");

	$grid->scriptFolder="../lib/KoolPHPSuite/KoolControls/KoolGrid";
	$grid->styleFolder="../lib/KoolPHPSuite/KoolControls/KoolGrid/styles/office2010blue"; 

	$grid->AjaxEnabled = true;
	$grid->AjaxLoadingImage =  "../lib/KoolPHPSuite/KoolControls/KoolAjax/loading/5.gif";	
	$grid->DataSource = $ds;
	$grid->MasterTable->Pager = new GridPrevNextAndNumericPager();
	$grid->Width = "860px";
	$grid->ColumnWrap = true;
	$grid->PageSize  = 30;
	$grid->AllowEditing = true;
	$grid->AllowDeleting = false;
	$grid->AllowResizing = true;

	$column = new GridDropDownColumn();
	$column->HeaderText = "Usuario";
	$column->DataField = "usuario";
	$todos=dameGridTable("usuarios","nombre");
    foreach($todos as $indice => $registro)
    {
    	$column->AddItem($registro["nombre"],$registro["idusuario"]);
    }
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

	$column = new GridDropDownColumn();
	$column->HeaderText = "Actividad";
	$column->DataField = "actividad";
	$todos=dameGridTable("actividades","nombre");
    foreach($todos as $indice => $registro)
    {
    	$column->AddItem($registro["nombre"],$registro["nombre"]);
    }
	$grid->MasterTable->AddColumn($column);



	$column = new GridBoundColumn();
	$column->HeaderText = "Tabla";
	$column->DataField = "tabla";
	$grid->MasterTable->AddColumn($column);

	$column = new GridBoundColumn();
	$column->HeaderText = "Id campo";
	$column->DataField = "id";
	$grid->MasterTable->AddColumn($column);
	
	$grid->MasterTable->AllowFiltering = true;

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
		<title>FIPAGO - Log</title>
		<meta charset="UTF-8">

		<link href="https://fonts.googleapis.com/css?family=Raleway:300,400,700" rel="stylesheet">
		<link rel="stylesheet" type="text/css" href="../styles.css">		

		<script language="javascript" src="../functions.js"></script>

	</head>


	<body>
		
		<div id="menuLateral">
			<img src="<?php echo RUTA; ?>img/logo.jpg" style="width:100%;">
			<div class="itemMenu" onclick="cargaModulo('home');">Inicio</div>
				<?php
					cargaModulos();
				?>
			<div class="itemMenu" onclick="cargaModulo('logout');">Salir</div>
		</div>



		<div id="containerPrincipal">
				
				<div class='titulos'>Log de actividades</div>
				<div class='usuarioLogueado'><?php echo nombreUsuarioLogeado(); ?></div>
				<div style="clear:both;"></div>	


				<div class="tablaCentrada">
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

					</form>
				</div>

		</div>
		<div style="clear:both;"></div>
		
	</body>

</html>