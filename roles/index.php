<?php

	session_start();
	include_once ("../conf/functions.php");
	validarSession();
	$_SESSION["language_select"] = "es";

	$KoolControlsFolder="../lib/KoolPHPSuite/KoolControls";
	require $KoolControlsFolder."/KoolAjax/koolajax.php";
	require $KoolControlsFolder."/KoolGrid/koolgrid.php";


	$koolajax->scriptFolder = "../lib/KoolPHPSuite/KoolControls/KoolAjax"; 	

	$link=conectDBReturn();
	$ds = new MySQLDataSource($link);
	
	$ds->SelectCommand = "SELECT * FROM roles ORDER BY nombre ASC";
	$ds->UpdateCommand = "UPDATE roles SET nombre='@nombre' WHERE idroles=@idroles";
	//$ds->DeleteCommand = "";
	$ds->InsertCommand = "INSERT INTO roles (nombre) VALUES ('@nombre')";





	$dsModulos = new MySQLDataSource($link);
	$dsModulos->SelectCommand = "SELECT modulos.nombre,roles_has_modulos.roles_idroles AS idroles  FROM modulos INNER JOIN roles_has_modulos ON modulos_idmodulos=idmodulos  ";

	$tablaModulos = new GridTableView();
	$tablaModulos->Width = "100%";
	$tablaModulos->DataSource = $dsModulos;
	$tablaModulos->AddRelationField("idroles","idroles");	
	$tablaModulos->AllowEditing = true;	
	
	$column = new GridBoundColumn();
	$column->HeaderText = "Módulos";
	$column->DataField = "nombre";
	$column->ReadOnly = true;	
	$tablaModulos->AddColumn($column);





 	
 	$grid = new KoolGrid("grid");

	$grid->scriptFolder="../lib/KoolPHPSuite/KoolControls/KoolGrid";
	$grid->styleFolder="../lib/KoolPHPSuite/KoolControls/KoolGrid/styles/office2010blue"; 

	$grid->AjaxEnabled = true;
	$grid->AjaxLoadingImage =  "../lib/KoolPHPSuite/KoolControls/KoolAjax/loading/5.gif";	
	$grid->MasterTable->DataSource = $ds;
	$grid->MasterTable->Pager = new GridPrevNextAndNumericPager();
	$grid->Width = "860px";
	$grid->ColumnWrap = true;
	$grid->PageSize  = 40;
	$grid->AllowEditing = true;
	$grid->AllowDeleting = false;
	$grid->AllowResizing = true;
	$grid->MasterTable->ShowFunctionPanel = true;	
	$grid->MasterTable->AutoGenerateExpandColumn = true;
	$grid->MasterTable->AddDetailTable($tablaModulos); 
	
	
	$column = new GridBoundColumn();
	$column->HeaderText = "Id";
	$column->DataField = "idroles";
	$column->ReadOnly = true;
	$grid->MasterTable->AddColumn($column);

	$column = new GridBoundColumn();
	$column->HeaderText = "Nombre";
	$column->DataField = "nombre";
	$grid->MasterTable->AddColumn($column);

	$grid->MasterTable->AutoGenerateEditColumn = true;
	
	//$column = new GridEditDeleteColumn();	
	//$grid->MasterTable->AllowFiltering = true;

	$grid->Localization->Load("../lib/KoolPHPSuite/KoolControls/KoolGrid/localization/es.xml");
	$grid->Process();
 
?>





?>

<html>
	<head>
		<title>FIPAGO - Roles</title>
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
				
				<div class='titulos'>Roles</div>
				<div class='usuarioLogueado'><?php echo nombreUsuarioLogeado(); ?></div>
				<div style="clear:both;"></div>	


				<div class="tablaCentrada">
					<form id="form1" method="post">				

						<?php 
							echo $koolajax->Render();
							echo $grid->Render();
						?>

					</form>
				</div>

		</div>
		<div style="clear:both;"></div>
		
	</body>

</html>