<?php

	session_start();
	include_once ("../conf/functions.php");
	validarSession();
	$_SESSION["language_select"] = "es";


	$idusuarios=dameIdUserMd5($_SESSION["i"]); 		
	if(usuarioTieneModulo($idusuarios,13)===false)//Valido que el usuario tenga el modulo de convenios
	{
		echo "SU USUARIO NO PUEDE REALIZAR ESTA ACCION";
		die;
	}


	$KoolControlsFolder="../lib/KoolPHPSuite/KoolControls";
	require $KoolControlsFolder."/KoolAjax/koolajax.php";
	require $KoolControlsFolder."/KoolGrid/koolgrid.php";
	require $KoolControlsFolder."/KoolCalendar/koolcalendar.php";

	$koolajax->scriptFolder = "../lib/KoolPHPSuite/KoolControls/KoolAjax"; 	

	$link=conectDBReturn();
	$ds = new MySQLDataSource($link);
	
	$ds->SelectCommand = "SELECT * FROM variables ORDER BY nombre ASC";
	$ds->UpdateCommand = "UPDATE variables SET nombre='@nombre', valor='@valor', vigenciaInicial='@vigenciaInicial',vigenciaFinal='@vigenciaFinal' WHERE idvariables=@idvariables";
	//$ds->DeleteCommand = "";
	$ds->InsertCommand = "INSERT INTO variables (nombre,valor,vigenciaInicial,vigenciaFinal) VALUES ('@nombre','@valor','@vigenciaInicial','vigenciaFinal')";
 	
 	$grid = new KoolGrid("grid");

	$grid->scriptFolder="../lib/KoolPHPSuite/KoolControls/KoolGrid";
	$grid->styleFolder="../lib/KoolPHPSuite/KoolControls/KoolGrid/styles/office2010blue"; 

	$grid->AjaxEnabled = true;
	$grid->AjaxLoadingImage =  "../lib/KoolPHPSuite/KoolControls/KoolAjax/loading/5.gif";	
	$grid->DataSource = $ds;
	$grid->MasterTable->Pager = new GridPrevNextAndNumericPager();
	$grid->Width = "860px";
	$grid->ColumnWrap = true;
	$grid->PageSize  = 40;
	$grid->AllowEditing = true;
	$grid->AllowDeleting = false;
	$grid->AllowResizing = true;
	$grid->MasterTable->ShowFunctionPanel = true;	
	
	
	$column = new GridBoundColumn();
	$column->HeaderText = "Id";
	$column->DataField = "idvariables";
	$column->ReadOnly = true;
	$grid->MasterTable->AddColumn($column);

	$column = new GridBoundColumn();
	$column->HeaderText = "Nombre";
	$column->DataField = "nombre";
	$grid->MasterTable->AddColumn($column);

	$column = new GridBoundColumn();
	$column->HeaderText = "Valor";
	$column->DataField = "valor";
	$grid->MasterTable->AddColumn($column);

	$column = new GridDateTimeColumn();
	$column->HeaderText = "Fecha de vigencia inicial";
	$column->DataField = "vigenciaInicial";	
	$column->FormatString = "d M, Y";
	$column->Picker = new KoolDatePicker();
	$column->Picker->scriptFolder = $KoolControlsFolder."/KoolCalendar";
	$column->Picker->styleFolder = "sunset";	
	$column->Picker->DateFormat = "d M, Y";
	$grid->MasterTable->AddColumn($column);


	$column = new GridDateTimeColumn();
	$column->HeaderText = "Fecha de vigencia final";
	$column->DataField = "vigenciaFinal";	
	$column->FormatString = "d M, Y";
	$column->Picker = new KoolDatePicker();
	$column->Picker->scriptFolder = $KoolControlsFolder."/KoolCalendar";
	$column->Picker->styleFolder = "sunset";	
	$column->Picker->DateFormat = "d M, Y";
	$grid->MasterTable->AddColumn($column);


	$grid->AutoGenerateEditColumn = true;
	
	$column = new GridEditDeleteColumn();
	
	//$grid->MasterTable->AllowFiltering = true;

	$grid->Localization->Load("../lib/KoolPHPSuite/KoolControls/KoolGrid/localization/es.xml");
	$grid->Process();
?>

<html>
	<head>
		<title>FIPAGO - Módulos</title>
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
				
				<div class='titulos'>Variables del sistema</div>
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