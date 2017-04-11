<?php

	session_start();
	include_once ("../conf/functions.php");
	validarSession();
	ob_start();
	$_SESSION["language_select"] = "es";

	$KoolControlsFolder="../lib/KoolPHPSuite/KoolControls";
	require $KoolControlsFolder."/KoolAjax/koolajax.php";
	require $KoolControlsFolder."/KoolGrid/koolgrid.php";
	

	$koolajax->scriptFolder = "../lib/KoolPHPSuite/KoolControls/KoolAjax"; 	

	$link=conectDBReturn();
	$ds = new MySQLDataSource($link);
	
	$ds->SelectCommand = "SELECT * FROM usuarios ORDER BY nombre ASC";
	$ds->UpdateCommand = "UPDATE usuarios SET nombre='@nombre', user='@user', roles_idroles='@roles_idroles', statusUsuarios_idstatusUsuarios='@statusUsuarios_idstatusUsuarios' WHERE idusuarios=@idusuarios";
	//$ds->DeleteCommand = "DELETE FROM usuarios WHERE idusuarios=@idusuarios";
	$ds->InsertCommand = "INSERT INTO usuarios (nombre,user,pss,roles_idroles,statusUsuarios_idstatusUsuarios) VALUES ('@nombre','@user',MD5('@pss'),'@roles_idroles','@statusUsuarios_idstatusUsuarios')";
 	
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
	$column->DataField = "idusuarios";
	$column->ReadOnly = true;
	$grid->MasterTable->AddColumn($column);

	$column = new GridBoundColumn();
	$column->HeaderText = "Nombre";
	$column->DataField = "nombre";
	$grid->MasterTable->AddColumn($column);

	$column = new GridBoundColumn();
	$column->HeaderText = "Usuario";
	$column->DataField = "user";
	$grid->MasterTable->AddColumn($column);

	$column = new GridDropDownColumn();
	$column->HeaderText = "Rol";
	$column->DataField = "roles_idroles";
	$todos=dameGridTable("roles","nombre");
    foreach($todos as $indice => $registro)
    {
    	$column->AddItem($registro["nombre"],$registro["idroles"]);
    }
	$grid->MasterTable->AddColumn($column);


	$column = new GridDropDownColumn();
	$column->HeaderText = "Status";
	$column->DataField = "statusUsuarios_idstatusUsuarios";
	$todos=dameGridTable("statusUsuarios");
    foreach($todos as $indice => $registro)
    {
    	$column->AddItem($registro["descripcion"],$registro["idstatusUsuarios"]);
    }
	$grid->MasterTable->AddColumn($column);



	$grid->AutoGenerateEditColumn = true;	
	$column = new GridEditDeleteColumn();
	
	//$grid->MasterTable->AllowFiltering = true;




	class MyInsertTemplate implements GridTemplate
	{
		function Render($_row)
		{
			$html  = "Nombre: <input id='nombre'  name='nombre' type='text' /> &nbsp;&nbsp;";
			$html  .= "Usuario: <input id='user'  name='user' type='text' />&nbsp;&nbsp;"; 
			$html  .= "Password: <input id='pss'  name='pss' type='text' />&nbsp;&nbsp;"; 
			
			$html  .= "Rol: ";
			$html  .= "<select name='roles_idroles' id='roles_idroles'>";
			$todos=dameGridTable("roles","nombre");
		    foreach($todos as $indice => $registro)
		    {
		    	$html  .= "<option value='".$registro["idroles"]."'>".$registro["nombre"]."</option>";
		    }
			$html  .= "</select>&nbsp;&nbsp;";


			$html  .= "Status: ";
			$html  .= "<select name='statusUsuarios_idstatusUsuarios' id='statusUsuarios_idstatusUsuarios'>";
			$todos=dameGridTable("statusUsuarios");
		    foreach($todos as $indice => $registro)
		    {
		    	$html  .= "<option value='".$registro["idstatusUsuarios"]."'>".$registro["descripcion"]."</option>";
		    }
			$html  .= "</select>";


			$html  .= "<br><br>"; 


			$html .= "<input type='button' value='Aceptar' onclick='grid_confirm_insert(this)'/> &nbsp;&nbsp;"; 
			$html .= "<input type='button' value='Cancelar' onclick='grid_cancel_insert(this)'/>";

			return $html;
		}
		function GetData($_row)
		{
			return array("nombre"=>$_POST["nombre"],"user"=>$_POST["user"],"pss"=>$_POST["pss"],"roles_idroles"=>$_POST["roles_idroles"],"statusUsuarios_idstatusUsuarios"=>$_POST["statusUsuarios_idstatusUsuarios"]);
		}		
	}
	
	$grid->MasterTable->InsertSettings->Mode = "Template";
	$grid->MasterTable->InsertSettings->Template = new MyInsertTemplate();

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
		<title>FIPAGO - Usuarios</title>
		<meta charset="UTF-8">

		<link href="https://fonts.googleapis.com/css?family=Raleway:300,400,700" rel="stylesheet">
		<link rel="stylesheet" type="text/css" href="../styles.css">
		<link rel="stylesheet" type="text/css" href="styles.css">		

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
				
				<div class='titulos'>Usuarios</div>
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