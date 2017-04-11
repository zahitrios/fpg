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
	
	$ds->SelectCommand = "SELECT *  FROM statusConvenio ORDER BY idstatusConvenio ASC";
	$ds->UpdateCommand = "UPDATE statusConvenio SET descripcion='@descripcion' WHERE idstatusConvenio=@idstatusConvenio";
	$ds->InsertCommand = "INSERT INTO statusConvenio (descripcion) VALUES ('@descripcion')";
 	
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
				$idstatusConvenio=mysql_insert_id();
				guardaLog(dameIdUserMd5($_SESSION["i"]),5,"statusConvenio",$idstatusConvenio);
			}
		}
		function OnRowConfirmEdit($row,$args)
		{
			$idstatusConvenio=$args["NewDataItem"]["idstatusConvenio"];

			if($args["Successful"]==1)
			{	
				guardaLog(dameIdUserMd5($_SESSION["i"]),6,"statusConvenio",$idstatusConvenio);
			}
			
		}
	}
	$grid->EventHandler = new MyGridEventHandler();
	
	$column = new GridBoundColumn();
	$column->HeaderText = "Id";
	$column->DataField = "idstatusConvenio";
	$column->ReadOnly = true;
	$column->Width = "50px";
	$grid->MasterTable->AddColumn($column);


	$column = new GridBoundColumn();
	$column->HeaderText = "Status";
	$column->DataField = "descripcion";
	$grid->MasterTable->AddColumn($column);




	$grid->Localization->Load("../lib/KoolPHPSuite/KoolControls/KoolGrid/localization/es.xml");
	


?>

<html>
	<head>
		<title>FIPAGO - Status de convenios</title>
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
				
				<div class='titulos'>Status de convenios</div>
				<div class='usuarioLogueado'><?php echo nombreUsuarioLogeado(); ?></div>
				<div style="clear:both;"></div>	


				<div class="tablaCentrada">
					<form id="form1" method="post">				

						<?php 
							//$grid->ClientSettings->ClientEvents["OnConfirmInsert"] = "Handle_OnConfirmInsert";
							$grid->Process();
							echo $koolajax->Render();
							echo $grid->Render();
						?>

					</form>
				</div>

		</div>
		<div style="clear:both;"></div>
		
	</body>

</html>