<?php
	session_start();
	include_once ("../conf/functions.php");
	validarSession();
	ob_start();

	$_SESSION["language_select"] = "es";

	$idusuarios=dameIdUserMd5($_SESSION["i"]);
	if(usuarioTieneModulo($idusuarios,12)===false)//Valido que el usuario tenga el modulo de ahorradores
	{
		echo "SU USUARIO NO PUEDE REALIZAR ESTA ACCION";
		die;
	}
?>
<html>
	<head>
		<title>FIPAGO - Ahorradores</title>
		<meta charset="UTF-8">

		<link href="https://fonts.googleapis.com/css?family=Raleway:300,400,700" rel="stylesheet">
		<link rel="stylesheet" type="text/css" href="../styles.css">
		<link rel="stylesheet" type="text/css" href="./styles.css">		

		<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  		<script src="//code.jquery.com/jquery-1.12.4.js"></script>
  		<script src="//code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

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
				
				<div class='titulos'>Ahorradores</div>
				<div class='usuarioLogueado'><?php echo nombreUsuarioLogeado(); ?></div>
				<div style="clear:both;"></div>	

				<div class="tablaCentrada" >
					<?php
						$action=$_REQUEST["a"];
						switch ($action)
						{

							default:
								mostrarCuadroAhorradores();
							break;
						}
					?>
				</div>				
		</div>


		<div id="draggable" class="ui-widget-content">
			
		</div>

	</body>
</html>


<?php

	function mostrarCuadroAhorradores()
	{
		global $_REQUEST;

		$idconvenio=$_REQUEST["ic"];
		if($idconvenio=="")
			$idconvenio=1;

		$KoolControlsFolder="../lib/KoolPHPSuite/KoolControls";

		require $KoolControlsFolder."/KoolAjax/koolajax.php";
		require $KoolControlsFolder."/KoolGrid/koolgrid.php";
		require $KoolControlsFolder."/KoolCalendar/koolcalendar.php";
		require $KoolControlsFolder."/KoolListBox/koollistbox.php";
		require $KoolControlsFolder."/KoolTabs/kooltabs.php";

		$koolajax->scriptFolder = "../lib/KoolPHPSuite/KoolControls/KoolAjax"; 	

		$link=conectDBReturn();

		$ds = new MySQLDataSource($link);		
		$ds->SelectCommand = "SELECT folioIdentificador,nombre,montoAl100,montoAl70,montoMaximo,baja,montoMinistrado FROM ahorrador LEFT JOIN ahorradoresMinistrados ON idahorrador=ahorrador_idahorrador ORDER BY folioIdentificador";


		$dsDetalle = new MySQLDataSource($link);
		$dsDetalle->SelectCommand = "SELECT folioIdentificador,sca,sci,sps,sdg,scnc,spc,sod FROM ahorrador ORDER BY folioIdentificador";


		$tablaDetalle = new GridTableView();
		$tablaDetalle->Width = "100%";
		$tablaDetalle->DataSource = $dsDetalle;
		$tablaDetalle->AddRelationField("folioIdentificador","folioIdentificador");	
		$tablaDetalle->AllowEditing = false;
		$tablaDetalle->AllowFiltering = false;
		
		$column = new GridCurrencyColumn();
		$column->Locale = "es_MX";
		$column->FormatString = "%n";
		$column->HeaderText = "Parte social";
		$column->DataField = "sps";
		$tablaDetalle->AddColumn($column);

		$column = new GridCurrencyColumn();
		$column->Locale = "es_MX";
		$column->FormatString = "%n";
		$column->HeaderText = "Cuentas de ahorro";
		$column->DataField = "sca";
		$tablaDetalle->AddColumn($column);

		$column = new GridCurrencyColumn();
		$column->Locale = "es_MX";
		$column->FormatString = "%n";
		$column->HeaderText = "Cuentas de inversión";
		$column->DataField = "sci";
		$tablaDetalle->AddColumn($column);


		$column = new GridCurrencyColumn();
		$column->Locale = "es_MX";
		$column->FormatString = "%n";
		$column->HeaderText = "Depositos en garantía";
		$column->DataField = "sdg";
		$tablaDetalle->AddColumn($column);

		$column = new GridCurrencyColumn();
		$column->Locale = "es_MX";
		$column->FormatString = "%n";
		$column->HeaderText = "Cheques no cobrados";
		$column->DataField = "scnc";
		$tablaDetalle->AddColumn($column);

		$column = new GridCurrencyColumn();
		$column->Locale = "es_MX";
		$column->FormatString = "%n";
		$column->HeaderText = "Otros depósitos";
		$column->DataField = "sod";
		$tablaDetalle->AddColumn($column);

		$column = new GridCurrencyColumn();
		$column->Locale = "es_MX";
		$column->FormatString = "%n";
		$column->HeaderText = "Préstamos a cargo";
		$column->DataField = "spc";
		$tablaDetalle->AddColumn($column);

		




	 	$grid = new KoolGrid("grid");

		$grid->scriptFolder="../lib/KoolPHPSuite/KoolControls/KoolGrid";
		$grid->styleFolder="../lib/KoolPHPSuite/KoolControls/KoolGrid/styles/office2010blue"; 

		$grid->AjaxEnabled = true;
		$grid->AjaxLoadingImage =  "../lib/KoolPHPSuite/KoolControls/KoolAjax/loading/5.gif";	
		$grid->DataSource = $ds;
		$grid->MasterTable->Pager = new GridPrevNextAndNumericPager();
		$grid->Width = "1100px";
		$grid->ColumnWrap = true;
		$grid->PageSize  = 50;
		$grid->AllowEditing = false;
		$grid->AllowDeleting = false;
		$grid->AllowResizing = true;
		$grid->AllowFiltering = true;
		$grid->AutoGenerateEditColumn = false;
		$grid->MasterTable->ShowFunctionPanel = false;		
		$grid->MasterTable->AllowFiltering = true;				
		$grid->MasterTable->AllowHovering = true;
		$grid->MasterTable->AllowSelecting = true;
		$grid->MasterTable->AutoGenerateExpandColumn = true;
		$grid->MasterTable->AddDetailTable($tablaDetalle);


		//Register Client-side event handler
		$grid->ClientSettings->ClientEvents["OnRowSelect"] = "Handle_OnRowSelect";

		
		$column = new GridBoundColumn();
		$column->HeaderText = "Folio identificador";
		$column->DataField = "folioIdentificador";		
		$column->ReadOnly = true;
		$column->Width = "150px";	
		$column->AllowSorting = true;
		$grid->MasterTable->AddColumn($column);

		$column = new GridBoundColumn();
		$column->HeaderText = "Nombre";
		$column->DataField = "nombre";		
		$column->ReadOnly = true;
		$column->Width = "400px";	
		$column->AllowSorting = true;		
		$grid->MasterTable->AddColumn($column);

		$column = new GridCurrencyColumn();
		$column->Locale = "es_MX";
		$column->FormatString = "%n";
		$column->HeaderText = "Monto al 100%";
		$column->DataField = "montoAl100";
		$column->Width = "150px";	
		$column->AllowSorting = true;
		$grid->MasterTable->AddColumn($column);

		$column = new GridCurrencyColumn();
		$column->Locale = "es_MX";
		$column->FormatString = "%n";
		$column->HeaderText = "Monto al 70%";
		$column->DataField = "montoAl70";
		$column->Width = "150px";	
		$column->AllowSorting = true;
		$grid->MasterTable->AddColumn($column);



		$column = new GridCurrencyColumn();
		$column->Locale = "es_MX";
		$column->FormatString = "%n";
		$column->HeaderText = "Monto máximo de pago";
		$column->DataField = "montoMaximo";
		$column->Width = "150px";	
		$column->AllowSorting = true;
		$grid->MasterTable->AddColumn($column);





		$column = new GridCurrencyColumn();
		$column->Locale = "es_MX";
		$column->FormatString = "%n";
		$column->HeaderText = "Monto ministrado";
		$column->DataField = "montoMinistrado";
		$column->Width = "150px";	
		$column->AllowSorting = true;
		$grid->MasterTable->AddColumn($column);








		class MyGridEventHandler extends GridEventHandler
		{
			function OnRowPreRender($row,$args)
			{
				//$row: The grid row object.
				//$args: No data
				
				if ($row->DataItem['baja'] == 1) {
						$row->CssClass = "bajaAhorador"; // Make the row in red color.
				}
			}
		}
		$grid->EventHandler = new MyGridEventHandler();

		


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
			</form>
		<?php
	}

?>