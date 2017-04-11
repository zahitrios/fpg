<?php

	session_start();
	include_once ("../conf/functions.php");
	validarSession();
	ob_start();

	$idusuarios=dameIdUserMd5($_SESSION["i"]); 		
	if(usuarioTieneModulo($idusuarios,9)===false)//Valido que el usuario tenga el modulo de documentos de identidad
	{
		echo "SU USUARIO NO PUEDE REALIZAR ESTA ACCION";
		die;
	}


	$_SESSION["language_select"] = "es";
	$KoolControlsFolder="../lib/KoolPHPSuite/KoolControls";

	require $KoolControlsFolder."/KoolAjax/koolajax.php";
	require $KoolControlsFolder."/KoolGrid/koolgrid.php";
	require $KoolControlsFolder."/KoolGrid/ext/datasources/MySQLiDataSource.php";
	require $KoolControlsFolder."/KoolCalendar/koolcalendar.php";


	$koolajax->scriptFolder = "../lib/KoolPHPSuite/KoolControls/KoolAjax"; 	

	$link=conectDBReturn();
	$ds = new MySQLDataSource($link);
	
	$ds->SelectCommand = "SELECT *  FROM documentosIdentidad  						
						  ORDER BY iddocumentosIdentidad ASC";

	$ds->UpdateCommand = "UPDATE documentosIdentidad SET nombre='@nombre' WHERE documentosIdentidad=@documentosIdentidad";
	$ds->InsertCommand = "INSERT INTO documentosIdentidad (nombre) VALUES ('@nombre')";
 	
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
	$grid->FontSize="9px";
	$grid->AllowEditing = true;
	$grid->AllowDeleting = false;
	$grid->AllowResizing = true;
	$grid->MasterTable->AllowFiltering = true;
	$grid->MasterTable->ShowFunctionPanel = true;	
	$grid->AutoGenerateEditColumn = true;


	class MyGridEventHandler extends GridEventHandler
	{
		function OnConfirmInsert($tableview,$args)
		{
			//$iddocumentos=$args["NewDataItem"]["iddocumentos"];
			if($args["Successful"]==1)			
			{				
				$iddocumentos=mysql_insert_id();
				guardaLog(dameIdUserMd5($_SESSION["i"]),3,"documentos",$iddocumentos);
			}
		}
		function OnRowConfirmEdit($row,$args)
		{
			$iddocumentos=$args["NewDataItem"]["iddocumentos"];

			if($args["Successful"]==1)
			{	
				guardaLog(dameIdUserMd5($_SESSION["i"]),4,"documentos",$iddocumentos);
			}
			
		}
	}
	$grid->EventHandler = new MyGridEventHandler();




	
	$column = new GridBoundColumn();
	$column->HeaderText = "Id";
	$column->DataField = "iddocumentosIdentidad";
	$column->ReadOnly = true;
	$column->Width = "50px";
	$grid->MasterTable->AddColumn($column);


	$column = new GridBoundColumn();
	$column->HeaderText = "Documento";
	$column->DataField = "nombre";
	$grid->MasterTable->AddColumn($column);




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
		<title>FIPAGO - Documentos</title>
		<meta charset="UTF-8">

		<link href="https://fonts.googleapis.com/css?family=Raleway:300,400,700" rel="stylesheet">
		<link rel="stylesheet" type="text/css" href="../styles.css">		

		<script language="javascript" src="../functions.js"></script>
		<script language="javascript" src="./functions.js"></script>

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
				
				<div class='titulos'>Catálogo de documentos de identidad</div>
				<div class='usuarioLogueado'><?php echo nombreUsuarioLogeado(); ?></div>
				<div style="clear:both;"></div>	


				<div class="tablaCentrada">
					<form id="form1" method="post">				

						<?php 
							//$grid->ClientSettings->ClientEvents["OnConfirmInsert"] = "Handle_OnConfirmInsert";
							$grid->Process();
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