<?php

	session_start();
	include_once ("../conf/functions.php");
	validarSession();

	$_SESSION["language_select"] = "es";
	$mensaje="";

	$idusuarios=dameIdUserMd5($_SESSION["i"]); 		
	if(usuarioTieneModulo($idusuarios,18)===false)//Valido que el usuario tenga el modulo de contenedores
	{
		echo "SU USUARIO NO PUEDE REALIZAR ESTA ACCION";
		die;
	}

?>

<html>
	<head>
		<title>FIPAGO - Contenedores</title>
		<meta charset="UTF-8">
		<link href="https://fonts.googleapis.com/css?family=Raleway:300,400,700" rel="stylesheet">
		
		<link rel="stylesheet" type="text/css" href="../styles.css">
		<link rel="stylesheet" type="text/css" href="./styles.css">		

		<link rel="stylesheet" type="text/css" href="<?php echo RUTA; ?>lib/CustomFileInputs/css/normalize.css" />
		<link rel="stylesheet" type="text/css" href="<?php echo RUTA; ?>lib/CustomFileInputs/css/demo.css" />
		<link rel="stylesheet" type="text/css" href="<?php echo RUTA; ?>lib/CustomFileInputs/css/component.css" />

		<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js" type="text/javascript"></script>

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

			<div class='titulos'>Contenedores</div>
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

							case "revisaCabecerasYGeneralidades":
								revisaCabecerasYGeneralidades();
							break;

							case "muestraResumenReporte":
								muestraResumenReporte();
							break;

							case "comenzarReporte":
								comenzarReporte();
							break;

							case "aprobarContenedor":
								aprobarContenedor();
							break;

							case "comienzaActualizaciones":
								comienzaActualizaciones();
							break;

							default:								
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
		$sql="SELECT * FROM contenedoresTemporales";
		$res=mysql_query($sql);
		while($fil=mysql_fetch_assoc($res))
		{
			$sqlE="SELECT COUNT(*) AS total FROM erroresContenedoresTemporales WHERE contenedoresTemporales_idcontenedoresTemporales='".$fil["idcontenedoresTemporales"]."'";
			$resE=mysql_query($sqlE);
			$filE=mysql_fetch_assoc($resE);

			$totalErrores=$filE["total"];

			$sqlU="UPDATE contenedoresTemporales SET totalErrores='".$totalErrores."' WHERE idcontenedoresTemporales='".$fil["idcontenedoresTemporales"]."'";
			$resU=mysql_query($sqlU);
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
		
		$ds->SelectCommand = "SELECT 
							contenedoresTemporales.*, 
							statusContenedores.descripcion,							 
							CONCAT(estado.nombre,' - ',DATE_FORMAT(convenio.fechaFirma,'%c %b, %Y')) AS descripcionConvenio  
							FROM 
							contenedoresTemporales 
							INNER JOIN convenio ON idconvenio=convenio_idconvenio  
							INNER JOIN statusContenedores ON idstatusContenedores=statusContenedores_idstatusContenedores 							
							INNER JOIN estado ON idestado=estado_idestado  
							ORDER BY fecha DESC ";

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
		$column->DataField = "idcontenedoresTemporales";
		$column->ReadOnly=true;		
		$grid->MasterTable->AddColumn($column);


		$column = new GridBoundColumn();
		$column->HeaderText = "Convenio";
		$column->DataField = "descripcionConvenio";		
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
		$column->HeaderText = "Oficio";
		$column->DataField = "oficio";		
		$grid->MasterTable->AddColumn($column);		

		$column = new GridDateTimeColumn();
		$column->HeaderText = "Fecha del oficio";
		$column->DataField = "fechaOficio";	
		$column->FormatString = "d M, Y";
		$column->Picker = new KoolDatePicker();
		$column->Picker->scriptFolder = $KoolControlsFolder."/KoolCalendar";
		$column->Picker->styleFolder = "sunset";	
		$column->Picker->DateFormat = "d M, Y";
		$grid->MasterTable->AddColumn($column);

		
		$column = new GridBoundColumn();
		$column->HeaderText = "Estatus";
		$column->DataField = "descripcion";		
		$grid->MasterTable->AddColumn($column);		


		$column = new GridBoundColumn();
		$column->HeaderText = "Errores";
		$column->DataField = "totalErrores";		
		$grid->MasterTable->AddColumn($column);		


		
		$grid->Localization->Load("../lib/KoolPHPSuite/KoolControls/KoolGrid/localization/es.xml");
		$grid->Process();

		?>
		<div class="tablaCentrada">			
			Contenedores revisados
			<br><br>
			<form id="form1" method="post">	
				<?php 
					echo $koolajax->Render();				
					echo $grid->Render();
				?>
			</form>
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


		$target_dir = "../contFiles/";
		//$target_dir = "../tmpFiles/";

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

		    			revisaCabecerasYGeneralidades($target_file);
		    		?>
		    	</span>
		    <?php
		}	
	}

	

	function revisaCabecerasYGeneralidades($file)
	{
		global $_REQUEST,$mensaje;		

		include("./classes.php"); 
		include("../lib/PHPExcel_1.8.0_doc/Classes/PHPExcel.php"); 

		$KoolControlsFolder="../lib/KoolPHPSuite/KoolControls";

		require $KoolControlsFolder."/KoolAjax/koolajax.php";
		require $KoolControlsFolder."/KoolCalendar/koolcalendar.php";
		$koolajax->scriptFolder = "../lib/KoolPHPSuite/KoolControls/KoolAjax"; 	

		$erroresCabeceras=0;

		$contenedorNo=getNumeroContenedor($file);
		$estado=getEstado($file);

		// $file=explode("/",$file);
		// $file=RUTA.$file[1]."/".$file[2];
		// echo "mando: ".$file."<br>";

		

		echo '<form  id="formulario" name="opcionesArchivo" method="post">	';

		echo "<br>";
		echo "Contenedor número: ".$contenedorNo."<br>";
		echo "Estado: ".$estado."<br>";
		echo "<br>";

		echo "<input type='hidden' name='contenedorNo' value='".$contenedorNo."' />";

			

		// BUSCO QUE VENGA UN NÚMERO DE CONTENEDOR //		
		if($contenedorNo=="") //El estado no existe
		{
			echo "<span class='error'>EL ARCHIVO NO ESPECIFICA NINGÚN NÚMERO DE CONTENEDOR EN LA COLUMNA <strong>F</strong></span>";
			echo "<br><br>";
			unlink($file); //Borro el archivo
			?>
			<input type="button" value="Regresar" class="botonRojoChico" onclick="cargaModulo('conts')">
			<br><br>
			<?php
			die;
		}


		// BUSCO QUE EL ESTADO EXISTA //
		$sql="SELECT * FROM estado WHERE UPPER(nombre)='".trim(strtoupper($estado))."'";
		$res=mysql_query($sql);
		
		if(mysql_num_rows($res)<1) //El estado no existe
		{
			echo "<span class='error'>EL ESTADO <strong>".$estado."</strong> NO EXISTE EN EL CATÁLOGO DE ENTIDADES FEDERATIVAS</span>";
			echo "<br><br>";
			unlink($file); //Borro el archivo
			?>
			<input type="button" value="Regresar" class="botonRojoChico" onclick="cargaModulo('conts')">
			<br><br>
			<?php
			die;
		}
		
		

		echo "<br><br>";
		$registros=getAllRegistros($file,0);
		$cabecera=0;
		$erroresCabeceras=0;
		$econtreTotal=0;
		$totalDelArchivoImporteExpediente=0;
		$totalDelArchivoImporteMinistrado=0;


		// VALIDO LA CABECERA //
		foreach($registros as $fila => $celdas)
		{	
			if(strtoupper($celdas[1])=="FOLIO IDENTIFICADOR")
			{
				$cabecera=$fila;
				break;
			}
			if($cabecera!=0)
					break;
		}


		
		foreach($registros as $fila => $celdas) //PARA ENCONTRAR EL TOTAL DEL ARCHIVO CALCULADO
		{
			foreach($celdas as $columna => $celda) 
			{
				if(strrpos($celda,"TOTAL")===false){}				
				else
					$econtreTotal=1;

				if($econtreTotal==1)
				{
					$totalDelArchivoImporteExpediente=$celdas[4];
					$totalDelArchivoImporteMinistrado=$celdas[5];
					$econtreTotal=2;
				}
				if($encontreTotal==2)
					break;
			}
			if($encontreTotal==2)
					break;
		}

		echo "<input type='hidden' name='totalDelArchivoImporteExpediente' value='".$totalDelArchivoImporteExpediente."' />";
		echo "<input type='hidden' name='totalDelArchivoImporteMinistrado' value='".$totalDelArchivoImporteMinistrado."' />";



		if($econtreTotal==0)//No se encontro el total
		{
			$erroresCabeceras++;
			echo "<br>";
			echo "<span class='error'>NO SE ENCONTRO LA CELDA <strong>TOTAL</strong> PARA OBTENER EL IMPORTE DEL EXPEDIENTE Y EL IMPORTE MINISTRADO DEL ARCHIVO</span>";
			echo "<br><br>";
		}
		if($econtreTotal>0 && $totalDelArchivoImporteExpediente==0)//No se encontro el total de los importes
		{
			$erroresCabeceras++;
			echo "<br>";
			echo "<span class='error'>NO SE ENCONTRO TOTAL DE LOS IMPORTES DE LOS EXPEDIENTES</span>";
			echo "<br><br>";
		}
		if($econtreTotal>0 && $totalDelArchivoImporteMinistrado==0)//No se encontro el total de lo ministrado
		{
			$erroresCabeceras++;
			echo "<br>";
			echo "<span class='error'>NO SE ENCONTRO TOTAL DE LO MINISTRADO</span>";
			echo "<br><br>";
		}



		if($cabecera==0)
		{
			$erroresCabeceras++;
			echo "<br>";
			echo "<span class='error'>NO SE ENCONTRO EN LA COLUMNA <strong>B</strong> 'FOLIO IDENTIFICADOR' PARA INICIAR CON LA REVISIÓN DEL ARCHIVO</span>";
			echo "<br>";
			echo "<strong>FORMATO PARA LA REVISIÓN DE CONTENEDORES</strong>";
			echo "<br>";
			imprimeCabeceraSolicitudContenedores();
			echo "<br><br>";	
		}
		else if(!validaCabeceraSolicitudContenedores($registros,$cabecera))
		{
			$erroresCabeceras++;
			echo "<br>";
			echo "<strong>FORMATO PARA LA REVISIÓN DE CONTENEDORES</strong>";
			echo "<br>";
			imprimeCabeceraSolicitudContenedores();
			echo "<br><br>";			
		}

		if($erroresCabeceras>0)
		{
			unlink($file); //Borro el archivo
			?>
			<input type="button" value="Regresar" class="botonRojoChico" onclick="cargaModulo('conts')">
			<br><br>
			<?php
			die;
		}

		echo "<input type='hidden' name='cabecera' value='".$cabecera."' />";



		
		// EL ESTADO SI EXISTE //
		$sql="SELECT * FROM estado WHERE UPPER(nombre)='".strtoupper($estado)."'";
		$fil=mysql_fetch_assoc($res);
		$idEstado=$fil["idestado"];

		echo "<input type='hidden' name='idEstado' value='".$idEstado."' />";



		//BUSCO SI YA HAY CONVENIOS FIRMADOS CON ESE ESTADO EN PROCESO
		$sql="SELECT * FROM convenio WHERE estado_idestado='".$idEstado."' AND statusConvenio_idstatusConvenio IN (3)"; 
		$res=mysql_query($sql);
		if(mysql_num_rows($res)<=0) //No hay convenios firmados con ese estado
		{
			echo "<span class='error'>NO EXISTEN CONVENIOS EN PROCESO CON EL ESTADO <strong>".$estado."</strong></span>";
			echo "<br><br>";
			//unlink($file); //Borro el archivo
			?>
			<input type="button" value="Regresar" class="botonRojoChico" onclick="cargaModulo('conts')">
			<br><br>
			<?php
			die;
		}


		
	

			//SI HAY CONVENIOS CON EL ESTADO
			echo "Seleccione el convenio con el que desea validar el contenedor<br>";
			echo "<select name='convenio' required>";
				while($fil=mysql_fetch_assoc($res))
				{
					echo "<option value='".$fil["idconvenio"]."'>".$fil["idconvenio"].".-  ".convierteTimeStampCorto($fil["fechaFirma"])." $ ".separarMiles($fil["montoTotalConvenio"])."</option>";
				}
			echo "</select>";


			$datesSesion = new KoolDatePicker("fechaOficio"); //Create calendar object
			$datesSesion->scriptFolder = $KoolControlsFolder."/KoolCalendar";//Set scriptFolder
			$datesSesion->styleFolder="default";		
			$datesSesion->DateFormat="Y/m/d";				 
			$datesSesion->Init();

			?>	
			<br><br>
			Folio del oficio: <input type="text" name="oficio" required>
			<br><br>
			Fecha del oficio: <?php echo $datesSesion->Render();?>
			<br><br>

			<br><br>
			<input type="hidden" id="a" name="a" value="comenzarReporte" />
			<input type="hidden" id="fileD" name="fileD" value="<?php echo $file; ?>" />
			

			<input type="submit" value="Continuar" class="botonRojo">
		</form>

		<?php
	}

	





	
	function comenzarReporte()
	{
		global $_REQUEST;
		include("./classes.php"); 

		// foreach($_REQUEST as $k => $v)
		// 	echo $k."->".$v."<br>";

		// echo "<br>acá ando zahit<br>";
		// die;

		$contenedorNo=$_REQUEST["contenedorNo"];
		$totalDelArchivoImporteExpediente=$_REQUEST["totalDelArchivoImporteExpediente"];
		$totalDelArchivoImporteMinistrado=$_REQUEST["totalDelArchivoImporteMinistrado"];
		$idEstado=$_REQUEST["idEstado"];
		$cabecera=$_REQUEST["cabecera"]+1;
		$idConvenio=$_REQUEST["convenio"];
		$file=$_REQUEST["fileD"];
		$oficio=$_REQUEST["oficio"];
		$fechaOficio=$_REQUEST["fechaOficio"];
		$fechaOficio=explode("/",$fechaOficio);
		$fechaOficio=implode("-",$fechaOficio);
		
		$totalErrores=0;

		//INSERTO EL CONTENEDOR
		$sql="INSERT INTO 
			contenedoresTemporales 
			(
				archivo,
				contenedorNo,
				convenio_idconvenio,
				statusContenedores_idstatusContenedores,
				oficio,
				fechaOficio
			) 
			VALUES 
			(
				'".$file."',
				'".$contenedorNo."',
				'".$idConvenio."',
				'1',
				'".$oficio."',
				'".$fechaOficio."' 
			)";
		$res=mysql_query($sql);
		$idcontenedoresTemporales=mysql_insert_id();
		guardaLog(dameIdUserMd5($_SESSION["i"]),12,"contenedoresTemporales",$idcontenedoresTemporales);



	

		//PRIMERO BUSCO CUANTOS CONTENEDORES TIENE YA ESE CONVENIO Y QUE EL contenedorNo COINCIDA
		$sql="SELECT COUNT(*) AS total FROM contenedoresTemporales INNER JOIN statusContenedores ON idstatusContenedores=statusContenedores_idstatusContenedores  WHERE convenio_idconvenio='".$idConvenio."' AND idstatusContenedores=3"; //Busco los contenedores que hayan sido aprovados
		$res=mysql_query($sql);
		$fil=mysql_fetch_assoc($res);
		$noDeberia=$fil["total"]+1;
		if($contenedorNo!=$noDeberia)
		{
			$cadenaError="El número de contenedor debe ser <strong>".$noDeberia."</strong> y el archivo dice <strong>".$contenedorNo."</strong>";
			echo "<span class='error'>".$cadenaError."</span><br>";
			guardaErrorContenedor($idcontenedoresTemporales,$cadenaError);			
		}
		echo "<br>";


	
		// INSERTO LOS REGISTROS //
		insertRegistros($idcontenedoresTemporales,$file,$cabecera+1);


		//LIMPIO LOS REGISTROS EN BLANCO
		$sqlClean="DELETE FROM registrosContenadores WHERE folioIdentificador='' AND contenedoresTemporales_idcontenedoresTemporales='".$idcontenedoresTemporales."'";
		$resClean=mysql_query($sqlClean);



		$foliosMalos=Array("0","1");


		//CHECO EL NUMERO CONSECUTIVO
		$consecutivo=1;
		$sqlCon="SELECT numero FROM registrosContenadores WHERE contenedoresTemporales_idcontenedoresTemporales='".$idcontenedoresTemporales."' ORDER BY idregistrosContenadores";
		$resCon=mysql_query($sqlCon);
		while($filCon=mysql_fetch_assoc($resCon))
		{
			if($filCon["numero"]!=$consecutivo)
			{
				$cadenaError="El número: <strong>".$filCon["numero"]."</strong> rompe con la cadena de consecutivos, debe ser <strong>".$consecutivo."</strong>";
				echo "<span class='error'>".$cadenaError."</span><br>";
				guardaErrorContenedor($idcontenedoresTemporales,$cadenaError);
			}

			$consecutivo++;
		}
		//CHECO EL NUMERO CONSECUTIVO
		echo "<br><br>";






		//CHECO QUE EL TOTAL DEL IMPORTE EXPEDIENTE VENGA BIEN CALCULADO
		$sqlSum="SELECT SUM(importeExpediente) AS total FROM registrosContenadores WHERE contenedoresTemporales_idcontenedoresTemporales='".$idcontenedoresTemporales."'";
		$resSum=mysql_query($sqlSum);
		$filSum=mysql_fetch_assoc($resSum);
		echo "Total de los importes de los expedientes indicado : <strong>$ ".separarMiles(round($totalDelArchivoImporteExpediente,2))."</strong><br>";
		echo "Total de los importes de los expedientes calculado: <strong>$ ".separarMiles(round($filSum["total"],2))."</strong><br>";
		if(round($totalDelArchivoImporteExpediente,2) == round($filSum["total"],2))
		{
			echo "<span class='exito'>CORRECTO</span>";
		}
		else
		{
			$cadenaError="El monto total de los importes de los expedientes indicado en el archivo está mal calculado";
			echo "<span class='error'>".$cadenaError."</span>";
			guardaErrorContenedor($idcontenedoresTemporales,$cadenaError);
		}
		//CHECO QUE EL TOTAL DEL IMPORTE EXPEDIENTE VENGA BIEN CALCULADO
		echo "<br><br>";






		//CHECO QUE EL TOTAL DE LO MINISTRADO VENGA BIEN CALCULADO
		$sqlSum="SELECT SUM(importeMinistrado) AS total FROM registrosContenadores WHERE contenedoresTemporales_idcontenedoresTemporales='".$idcontenedoresTemporales."'";
		$resSum=mysql_query($sqlSum);
		$filSum=mysql_fetch_assoc($resSum);
		echo "Total de lo ministrado indicado : <strong>$ ".separarMiles(round($totalDelArchivoImporteMinistrado,2))."</strong><br>";
		echo "Total de lo ministrado calculado: <strong>$ ".separarMiles(round($filSum["total"],2))."</strong><br>";
		if(round($totalDelArchivoImporteMinistrado,2) == round($filSum["total"],2))
		{
			echo "<span class='exito'>CORRECTO</span>";
		}
		else
		{
			$cadenaError="El monto total de lo ministrado indicado en el archivo está mal calculado";
			echo "<span class='error'>".$cadenaError."</span>";
			guardaErrorContenedor($idcontenedoresTemporales,$cadenaError);
		}
		//CHECO QUE EL TOTAL DE LO MINISTRADO VENGA BIEN CALCULADO
		echo "<br><br>";





		






		
		//BUSCO FOLIOS QUE NO ESTÉN EN EL CONVENIO
		$sqlFol="SELECT folioIdentificador FROM registrosContenadores WHERE contenedoresTemporales_idcontenedoresTemporales='".$idcontenedoresTemporales."' AND folioIdentificador NOT IN(SELECT folioIdentificador FROM ahorrador INNER JOIN convenio_has_ahorrador ON ahorrador_idahorrador=idahorrador WHERE convenio_idconvenio='".$idConvenio."')";
		$resFol=mysql_query($sqlFol);
		echo "Folios no encontrados en el convenio: <strong>".mysql_num_rows($resFol)."</strong>";
		if(mysql_num_rows($resFol)>0)
		{
			echo "<span class='botonMostrar' onclick='muestraOculta(\"divFoliosNoEncontrados\");' >Mostrar/Ocultar</span>";
			echo "<div class='oculta' id='divFoliosNoEncontrados'>";						
				echo "<ul>";									
					while($filFol=mysql_fetch_assoc($resFol))
					{
						$cadenaError="El siguiente folio no se encontró en el convenio: <strong>".$filFol["folioIdentificador"]."</strong> ";
						echo "<li><span class='error'>".$cadenaError."</span></li>";
						guardaErrorContenedor($idcontenedoresTemporales,$cadenaError);
						$foliosMalos[]=$filFol["folioIdentificador"];
					}
				echo "</ul>";
			echo "</div>";
		}		
		echo "<br><br>";
		//BUSCO FOLIOS QUE NO ESTÉN EN EL CONVENIO





		





		//BUSCO FOLIOS QUE ESTEN EN BAJA
		$sqlFol="SELECT DISTINCT(folioIdentificador) FROM registrosContenadores WHERE contenedoresTemporales_idcontenedoresTemporales='".$idcontenedoresTemporales."' AND folioIdentificador IN(SELECT folioIdentificador FROM ahorrador INNER JOIN convenio_has_ahorrador ON ahorrador_idahorrador=idahorrador WHERE baja=1 AND convenio_idconvenio='".$idConvenio."')";
		$resFol=mysql_query($sqlFol);
		echo "Folios dados de baja dentro del el convenio: <strong>".mysql_num_rows($resFol)."</strong>";
		if(mysql_num_rows($resFol)>0)
		{
			echo "<span class='botonMostrar' onclick='muestraOculta(\"divFoliosEnBaja\");' >Mostrar/Ocultar</span>";
			echo "<div class='oculta' id='divFoliosEnBaja'>";						
				echo "<ul>";									
					while($filFol=mysql_fetch_assoc($resFol))
					{
						$cadenaError="El siguiente folio: <strong>".$filFol["folioIdentificador"]."</strong> esta dado de baja, no puede ser aceptado en el contenedor";
						echo "<li><span class='error'>".$cadenaError."</span></li>";
						guardaErrorContenedor($idcontenedoresTemporales,$cadenaError);	
						$foliosMalos[]=$filFol["folioIdentificador"];							
					}
				echo "</ul>";
			echo "</div>";
		}		
		echo "<br><br>";
		//BUSCO FOLIOS QUE ESTEN EN BAJA





		






		//BUSCO FOLIOS REPETIDOS EN ESTE CONTENEDOR
		$sqlFol="SELECT folioIdentificador,COUNT(*) AS total FROM registrosContenadores WHERE contenedoresTemporales_idcontenedoresTemporales='".$idcontenedoresTemporales."' GROUP BY folioIdentificador HAVING total > 1";
		$resFol=mysql_query($sqlFol);
		echo "Folios repetidos en el contenedor: <strong>".mysql_num_rows($resFol)."</strong>";
		if(mysql_num_rows($resFol)>0)
		{
			echo "<span class='botonMostrar' onclick='muestraOculta(\"divFoliosRepetidos\");' >Mostrar/Ocultar</span>";
			echo "<div class='oculta' id='divFoliosRepetidos'>";						
				echo "<ul>";									
					while($filFol=mysql_fetch_assoc($resFol))
					{
						$cadenaError="El siguiente folio: <strong>".$filFol["folioIdentificador"]."</strong> se encuentra repetido en el contenedor";
						echo "<li><span class='error'>".$cadenaError."</span></li>";
						guardaErrorContenedor($idcontenedoresTemporales,$cadenaError);
						$foliosMalos[]=$filFol["folioIdentificador"];							
					}
				echo "</ul>";
			echo "</div>";
		}		
		echo "<br><br>";
		//BUSCO FOLIOS REPETIDOS EN ESTE CONTENEDOR






		






		//BUSCO QUE LOS NOMBRES SEAN LOS CORRECTOS DEL CONVENIO
		$sqlFol="SELECT nombreAhorrador FROM registrosContenadores WHERE contenedoresTemporales_idcontenedoresTemporales='".$idcontenedoresTemporales."' AND nombreAhorrador NOT IN(SELECT nombre FROM ahorrador INNER JOIN convenio_has_ahorrador ON ahorrador_idahorrador=idahorrador WHERE convenio_idconvenio='".$idConvenio."')";
		$resFol=mysql_query($sqlFol);
		echo "Nombres no encontrados en el convenio: <strong>".mysql_num_rows($resFol)."</strong> ";
		if(mysql_num_rows($resFol)>0)
		{
			echo "<span class='botonMostrar' onclick='muestraOculta(\"divNombresNoEncontrados\");' >Mostrar/Ocultar</span>";
			echo "<div class='oculta' id='divNombresNoEncontrados'>";						
				echo "<ul>";									
					while($filFol=mysql_fetch_assoc($resFol))
					{
						$cadenaError="El siguiente nombre no se encontró en el convenio: <strong>".$filFol["nombreAhorrador"]."</strong> ";
						echo "<li><span class='error'>".$cadenaError."</span></li>";
						guardaErrorContenedor($idcontenedoresTemporales,$cadenaError);
					}
				echo "</ul>";
			echo "</div>";
		}		
		echo "<br><br>";
		//BUSCO QUE LOS NOMBRES SEAN LOS CORRECTOS DEL CONVENIO







		$totalErrores=dameTotalErroresRevisionContenedores($idcontenedoresTemporales);
		echo "Total de errores encontrados: ".$totalErrores."<br><br>";
		if($totalErrores>0)
		{
			?>
			<br>
			<input type="button" value="Regresar" class="botonRojoChico" onclick="cargaModulo('conts')">
			<br><br>
			<?php
			die;
		}
		else
		{

			?>
			<form action='./' method="post">
			<br>
			<?php echo "<input type='hidden' name='idcontenedoresTemporales' value='".$idcontenedoresTemporales."'>"; ?>
			<input type="hidden" name="a" value="aprobarContenedor">
			<input type="button" value="Cancelar" class="botonRojoChico" onclick="cargaModulo('conts')">
			&nbsp;&nbsp;
			<input type="submit" value="Continuar" class="botonRojoChico" >
			<br><br>
			</form>
			<?php
		}

}




function aprobarContenedor()
{
	global $_REQUEST;

	$idcontenedoresTemporales=$_REQUEST["idcontenedoresTemporales"];

	$sqlMin="UPDATE ministracionesTemporales SET statusContenedores_idstatusContenedores=3 WHERE idcontenedoresTemporales=".$idcontenedoresTemporales;
	$resMin=mysql_query($sqlMin);

	echo "EL CONTENEDOR HA SIDO MARCADO COMO ACEPTADO";
	echo "<br><br>";
	?>
	<form action="" method="post">
		Al dar click en <strong>Continuar</strong> este contenedor pasará al módulo de revisiones
		<br><br>
		<input type="button" value="Cancelar" class="botonRojoChico"  onclick="cargaModulo('conts')">
		&nbsp;&nbsp;&nbsp;
		<input type="submit" value="Continuar" class="botonRojoChico" >
		<input type="hidden" name="a" value="comienzaActualizaciones" />
		<?php echo "<input type='hidden' name='idcontenedoresTemporales' value='".$idcontenedoresTemporales."'>"; ?>
		<br><br>
	</form>
	<?php

}




function comienzaActualizaciones()
{
	global $_REQUEST;


	echo "<br>pasando todo a verificaciones<br>";
	die;

	$erroresMinistraciones=0;
	$idcontenedoresTemporales=$_REQUEST["idcontenedoresTemporales"];
	$totalMinistracion=0;

	$sql="SELECT * FROM ministracionesTemporales WHERE idcontenedoresTemporales='".$idcontenedoresTemporales."'";
	$res=mysql_query($sql);
	$ministracionTemporal=mysql_fetch_assoc($res);

	$sql="SELECT * FROM convenio WHERE idconvenio='".$ministracionTemporal["convenio_idconvenio"]."'";
	$res=mysql_query($sql);
	$convenio=mysql_fetch_assoc($res);

	$sql="SELECT * FROM estado WHERE idestado='".$convenio["estado_idestado"]."'";
	$res=mysql_query($sql);
	$estado=mysql_fetch_assoc($res);	


	$sql="SELECT * FROM sociedad INNER JOIN convenio_has_sociedad ON sociedad_idsociedad=idsociedad WHERE convenio_idconvenio='".$convenio["idconvenio"]."'";
	$res=mysql_query($sql);
	while($fil=mysql_fetch_assoc($res))
	{
		$sociedades[]=$fil;
	}



	//REVISO TODOS LOS IMPORTES
	$camposMinistraciones=Array("parteSocial","cuentasAhorro","cuentasInversion","depositosGarantia","chequesNoCobrados","otrosDepositos","prestamosCargo");
	$rubrosTablas=Array("ahorradorParteSocial","ahorradorCuentasAhorro","ahorradorCuentasInversion","ahorradorDepositosGarantia","ahorradorChequesNoCobrados","ahorradorOtrosDepositos","ahorradorPrestamosCargo");
	$camposAhorrador=Array("sps","sca","sci","sdg","scnc","sod","spc");
	$leyendas=Array("Parte social","Cuentas de ahorro","Cuentas de inversión","Depósitos en garantía","Cheques no cobrados","Otros depósitos","Préstamos a cargo");

	$sqlFol="SELECT * FROM registrosContenadores WHERE contenedoresTemporales_idcontenedoresTemporales='".$idcontenedoresTemporales."'";
	$resFol=mysql_query($sqlFol);
	while($filFol=mysql_fetch_assoc($resFol))
	{
		echo "<div class='separador'></div>";
		echo "Guardando la ministración de: <strong>".dameNombreAhorrador($filFol["folioIdentificador"])."</strong><br>";
		
		$solicitudMinistradoAhorrador=0;
		$sqlAhorrador="SELECT * FROM ahorrador WHERE folioIdentificador='".$filFol["folioIdentificador"]."'";
		$resAhorrador=mysql_query($sqlAhorrador);
		$filAhorrador=mysql_fetch_assoc($resAhorrador);

		$saldoAnterior=dameSaldoParaMinistrarAhorrador($filAhorrador["folioIdentificador"]);
				
		$sqlSave="INSERT INTO ahorradoresMinistrados (montoMinistrado, ahorrador_idahorrador, registrosContenadores_idregistrosContenadores ) VALUES ('".$filFol["montoMinistrar"]."', '".$filAhorrador["idahorrador"]."', '".$filFol["idregistrosContenadores"]."')";
		$resSave=mysql_query($sqlSave);
		$solicitudMinistradoAhorrador+=$filFol["montoMinistrar"];
				
		echo "<br><br>";
		//RESUMEN DEL AHORRADOR
		echo "SALDO ANTERIOR DEL AHORADOR: $ ".separarMiles($saldoAnterior)."<br>";
		echo "SOLICITUD DE LO MINISTRADO: $ ".separarMiles($solicitudMinistradoAhorrador)."<br>";
		echo "SALDO ACTUAL DEL AHORADOR: $ ".separarMiles(dameSaldoParaMinistrarAhorrador($filAhorrador["folioIdentificador"]))."<br>";
		echo "<br><br>";

		$totalMinistracion+=$solicitudMinistradoAhorrador;
	}
	//REVISO TODOS LOS IMPORTES

	echo "<div class='separador'></div>";
	echo "<br><br>";
	//RESUMEN FINAL DE LA MINISTRACION
	echo "<strong>";
	echo "TOTAL DE LA MINISTRACIÓN: $ ".separarMiles($totalMinistracion)."<br>";
	echo "APORTACIÓN ESTATAL: $ ".separarMiles(round($totalMinistracion/2.75),2)."<br>";
	echo "APORTACIÓN FEDERAL: $ ".separarMiles(round($totalMinistracion*1.75/2.75),2)."<br>";
	echo "<div class='separador'></div>";
	echo "LOTE: ".$ministracionTemporal["lote"]."<br>";
	echo "ESTADO: ".$estado["nombre"]."<br>";
	echo "CONVENIO: ".$convenio["idconvenio"]." - $ ".separarMiles($convenio["montoTotalConvenio"])."<br>";
	echo "SOCIEDADES: <ul>";
	foreach($sociedades as $k => $sociedad)
	{
		echo "<li>".$sociedad["clave"]."-".$sociedad["nombre"]."</li>";
	}
	echo "</ul>";
	echo "</strong>";

	echo "<br><br>";


	
	
	$sqlMin="UPDATE ministracionesTemporales SET statusMinistracion_idstatusMinistracion=4 WHERE idcontenedoresTemporales=".$idcontenedoresTemporales;
	$resMin=mysql_query($sqlMin);
	echo "<br><br>";
	?>
	<input type="button" value="Continuar" class="botonRojoChico" onclick="cargaModulo('conts')">
	<br><br>
	<?php

}

	


function muestraResumenReporte()
{
	global $_REQUEST,$mensaje;

	$erroresTotalesReporte=0;

	$idcontenedoresTemporales=$_REQUEST["idcontenedoresTemporales"];

	$sqlErr="SELECT COUNT(*) AS total FROM erroresContenedoresTemporales WHERE  contenedoresTemporales_idcontenedoresTemporales='".$idcontenedoresTemporales."'";
	$resErr=mysql_query($sqlErr);
	$filErr=mysql_fetch_assoc($resErr);
	$erroresTotalesReporte=$filErr["total"];

	echo "<br><br>";
	echo "<span class='subTitulos' style='font-weight:bold; color:#ff0000;'>Resumen del reporte</span>";
	echo "<div id='divSoloErrores'>";
		echo "TOTAL DE ERRORES ENCONTRADOS: ".$erroresTotalesReporte."<br><br>";
		muestraErroresContenedor($idcontenedoresTemporales);			
	echo "</div>";
	echo "<br><br>";


	// $sql="SELECT * FROM ministracionesTemporales WHERE idcontenedoresTemporales='".$idcontenedoresTemporales."'";
	// $res=mysql_query($sql);
	// $ministracionTemporal=mysql_fetch_assoc($res);

	// if($ministracionTemporal["statusMinistracion_idstatusMinistracion"]==4) //Una ministracion ejectuada
	// {


	// 	$sql="SELECT * FROM convenio WHERE idconvenio='".$ministracionTemporal["convenio_idconvenio"]."'";
	// 	$res=mysql_query($sql);
	// 	$convenio=mysql_fetch_assoc($res);

	// 	$sql="SELECT * FROM estado WHERE idestado='".$convenio["estado_idestado"]."'";
	// 	$res=mysql_query($sql);
	// 	$estado=mysql_fetch_assoc($res);	


	// 	$sql="SELECT * FROM sociedad INNER JOIN convenio_has_sociedad ON sociedad_idsociedad=idsociedad WHERE convenio_idconvenio='".$convenio["idconvenio"]."'";
	// 	$res=mysql_query($sql);
	// 	while($fil=mysql_fetch_assoc($res))
	// 	{
	// 		$sociedades[]=$fil;
	// 	}



	// 	//REVISO TODOS LOS IMPORTES
	// 	$camposMinistraciones=Array("parteSocial","cuentasAhorro","cuentasInversion","depositosGarantia","chequesNoCobrados","otrosDepositos","prestamosCargo");
	// 	$rubrosTablas=Array("ahorradorParteSocial","ahorradorCuentasAhorro","ahorradorCuentasInversion","ahorradorDepositosGarantia","ahorradorChequesNoCobrados","ahorradorOtrosDepositos","ahorradorPrestamosCargo");
	// 	$camposAhorrador=Array("sps","sca","sci","sdg","scnc","sod","spc");
	// 	$leyendas=Array("Parte social","Cuentas de ahorro","Cuentas de inversión","Depósitos en garantía","Cheques no cobrados","Otros depósitos","Préstamos a cargo");

	// 	$sqlFol="SELECT * FROM registrosContenadores WHERE contenedoresTemporales_idcontenedoresTemporales='".$idcontenedoresTemporales."'";
	// 	$resFol=mysql_query($sqlFol);
	// 	while($filFol=mysql_fetch_assoc($resFol))
	// 	{
	// 		echo "<div class='separador'></div>";
	// 		echo "Se ministró al ahorrador: <strong>".dameNombreAhorrador($filFol["folioIdentificador"])."</strong><br>";
			
	// 		$solicitudMinistradoAhorrador=0;
	// 		$sqlAhorrador="SELECT * FROM ahorrador WHERE folioIdentificador='".$filFol["folioIdentificador"]."'";
	// 		$resAhorrador=mysql_query($sqlAhorrador);
	// 		$filAhorrador=mysql_fetch_assoc($resAhorrador);

	// 		$solicitudMinistradoAhorrador+=$filFol["montoMinistrar"];
					
	// 		//RESUMEN DEL AHORRADOR
	// 		echo "SOLICITUD DE LO MINISTRADO: $ ".separarMiles($solicitudMinistradoAhorrador)."<br>";
	// 		echo "<br><br>";

	// 		$totalMinistracion+=$solicitudMinistradoAhorrador;
	// 	}
	// 	//REVISO TODOS LOS IMPORTES


	// 	echo "<div class='separador'></div>";
	// 	echo "<br><br>";
	// 	//RESUMEN FINAL DE LA MINISTRACION
	// 	echo "<strong>";
	// 	echo "TOTAL DE LA MINISTRACIÓN: $ ".separarMiles($totalMinistracion)."<br>";
	// 	echo "APORTACIÓN ESTATAL: $ ".separarMiles(round($totalMinistracion/2.75),2)."<br>";
	// 	echo "APORTACIÓN FEDERAL: $ ".separarMiles(round($totalMinistracion*1.75/2.75),2)."<br>";
	// 	echo "<div class='separador'></div>";
	// 	echo "LOTE: ".$ministracionTemporal["lote"]."<br>";
	// 	echo "ESTADO: ".$estado["nombre"]."<br>";
	// 	echo "CONVENIO: ".$convenio["idconvenio"]." - $ ".separarMiles($convenio["montoTotalConvenio"])."<br>";
	// 	echo "SOCIEDADES: <ul>";
	// 	foreach($sociedades as $k => $sociedad)
	// 	{
	// 		echo "<li>".$sociedad["clave"]."-".$sociedad["nombre"]."</li>";
	// 	}
	// 	echo "</ul>";
	// 	echo "</strong>";

		//echo "<br><br>";
	//}

	
	?>
	<input type="button" value="Regresar" class="botonRojoChico" onclick="cargaModulo('conts')">
	<br><br>
	<?php
}



?>





