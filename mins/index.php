<?php

	session_start();
	include_once ("../conf/functions.php");
	validarSession();

	$_SESSION["language_select"] = "es";
	$mensaje="";

	$idusuarios=dameIdUserMd5($_SESSION["i"]); 		
	if(usuarioTieneModulo($idusuarios,16)===false)//Valido que el usuario tenga el modulo de ministrasciones
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

			<div class='titulos'>Ministraciones</div>
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

							case "aprobarMinistracion":
								aprobarMinistracion();
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
		$sql="SELECT * FROM ministracionesTemporales";
		$res=mysql_query($sql);
		while($fil=mysql_fetch_assoc($res))
		{
			$sqlE="SELECT COUNT(*) AS total FROM erroresMinistracionesTemporales WHERE ministracionesTemporales_idmodificacionesTemporales='".$fil["idministracionesTemporales"]."'";
			$resE=mysql_query($sqlE);
			$filE=mysql_fetch_assoc($resE);

			$totalErrores=$filE["total"];

			$sqlU="UPDATE ministracionesTemporales SET totalErrores='".$totalErrores."' WHERE idministracionesTemporales='".$fil["idministracionesTemporales"]."'";
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
		
		$ds->SelectCommand = "SELECT ministracionesTemporales.*, statusMinistracion.descripcion FROM ministracionesTemporales INNER JOIN statusMinistracion ON idstatusMinistracion=statusMinistracion_idstatusMinistracion ORDER BY fecha DESC ";

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
		$column->DataField = "idministracionesTemporales";
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
		$column->HeaderText = "Convenio";
		$column->DataField = "convenio_idconvenio";		
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
			Revisiones realizadas
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

		$target_dir = "../minFiles/";
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

		$lote=getNumeroLote($file);
		$estado=getEstado($file);

		echo '<form  id="formulario" name="opcionesArchivo" method="post">	';

		echo "<br>";
		echo "Lote: ".$lote."<br>";
		echo "Estado: ".$estado."<br>";
		echo "<br>";

		echo "<input type='hidden' name='lote' value='".$lote."' />";
		

		// BUSCO QUE EL ESTADO EXISTA //
		$sql="SELECT * FROM estado WHERE UPPER(nombre)='".trim(strtoupper($estado))."'";
		$res=mysql_query($sql);
		
		if(mysql_num_rows($res)<1) //El estado no existe
		{
			echo "<span class='error'>EL ESTADO <strong>".$estado."</strong> NO EXISTE EN EL CATÁLOGO DE ENTIDADES FEDERATIVAS</span>";
			echo "<br><br>";
			unlink($file); //Borro el archivo
			?>
			<input type="button" value="Regresar" class="botonRojoChico" onclick="cargaModulo('mins')">
			<br><br>
			<?php
			die;
		}
		


		
		
		

		echo "<br><br>";
		$registros=getAllRegistros($file,0);
		$cabecera=0;
		$erroresCabeceras=0;

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
		if($cabecera==0)
		{
			$erroresCabeceras++;
			echo "<br>";
			echo "<span class='error'>NO SE ENCONTRO EN LA COLUMNA <strong>B</strong> 'FOLIO IDENTIFICADOR' PARA INICIAR CON LA REVISIÓN DEL ARCHIVO</span>";
			echo "<br>";
			echo "<strong>FORMATO PARA LA LA SOLICITUD DE MINISTRACIONES</strong>";
			echo "<br>";
			imprimeCabeceraSolicitudMinistracion();
			echo "<br><br>";	
		}
		else if(!validaCabeceraSolicitudMinistracion($registros,$cabecera))
		{
			$erroresCabeceras++;
			echo "<br>";
			echo "<strong>FORMATO PARA LA LA SOLICITUD DE MINISTRACIONES</strong>";
			echo "<br>";
			imprimeCabeceraSolicitudMinistracion();
			echo "<br><br>";			
		}
		if($erroresCabeceras>0)
		{
			unlink($file); //Borro el archivo
			?>
			<input type="button" value="Regresar" class="botonRojoChico" onclick="cargaModulo('mins')">
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



		//BUSCO SI YA HAY CONVENIOS FIRMADOS CON ESE ESTADO, PUBLICADOS O EN PROCESO
		$sql="SELECT * FROM convenio WHERE estado_idestado='".$idEstado."' AND statusConvenio_idstatusConvenio IN (3,4)"; 
		$res=mysql_query($sql);
		if(mysql_num_rows($res)<=0) //No hay convenios firmados con ese estado
		{
			echo "<span class='error'>NO EXISTEN CONVENIOS PUBLICADOS O EN PROCESO CON EL ESTADO <strong>".$estado."</strong></span>";
			echo "<br><br>";
			//unlink($file); //Borro el archivo
			?>
			<input type="button" value="Regresar" class="botonRojoChico" onclick="cargaModulo('mins')">
			<br><br>
			<?php
			die;
		}


		
	

		//SI HAY CONVENIOS CON EL ESTADO
		echo "Seleccione el convenio que desea ministrar<br>";
		echo "<select name='convenio' required>";
			while($fil=mysql_fetch_assoc($res))
			{
				echo "<option value='".$fil["idconvenio"]."'>".$fil["idconvenio"].".-  ".convierteTimeStampCorto($fil["fechaFirma"])." $ ".separarMiles($fil["montoTotalConvenio"])."</option>";
			}
		echo "</select>";


			


			$datesSesion = new KoolDatePicker("fechaOficio"); //Create calendar object
			$datesSesion->scriptFolder = $KoolControlsFolder."/KoolCalendar";//Set scriptFolder
			$datesSesion->styleFolder="default";						 
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


		$idEstado=$_REQUEST["idEstado"];
		$idConvenio=$_REQUEST["convenio"];
		$lote=$_REQUEST["lote"];
		$file=$_REQUEST["fileD"];
		$cabecera=$_REQUEST["cabecera"]+2;
		$totalErrores=0;


		//Inserto la revision
		$sql="INSERT INTO ministracionesTemporales (archivo, convenio_idconvenio, lote) VALUES ('".$file."','".$idConvenio."','".$lote."')";
		$res=mysql_query($sql);
		$idministracionesTemporales=mysql_insert_id();
		guardaLog(dameIdUserMd5($_SESSION["i"]),11,"ministracionesTemporales",$idministracionesTemporales);


		//Primero busco cuantas ministraciones tiene ya ese convenio y que el lote coincida
		$sql="SELECT COUNT(*) AS total FROM ministracionesTemporales INNER JOIN statusMinistracion ON idstatusMinistracion=statusMinistracion_idstatusMinistracion  WHERE convenio_idconvenio='".$idConvenio."' AND idstatusMinistracion IN(2,4)"; //Busco las ministraciones que hayan sido aprobadas y/o ministradas
		$res=mysql_query($sql);
		$fil=mysql_fetch_assoc($res);
		$loteDeberia=$fil["total"]+1;
		if($lote!=$loteDeberia)
		{
			$cadenaError="El lote correspondiente para la ministración debe ser <strong>".$loteDeberia."</strong> y el archivo dice <strong>".$lote."</strong>";
			echo $cadenaError."<br>";
			guardaErrorRevisionMinistracion($idministracionesTemporales,$cadenaError);			
		}
		echo "<br>";


		// INSERTO LOS REGISTROS //
		insertRegistros($idministracionesTemporales,$file,$cabecera);

		//LIMPIO LOS REGISTROS EN BLANCO
		$sqlClean="DELETE FROM registrosMinistraciones WHERE folioIdentificador='' AND ministracionesTemporales_idministracionesTemporales='".$idministracionesTemporales."'";
		$resClean=mysql_query($sqlClean);


		$foliosMalos=Array("0","1");


		
		//BUSCO FOLIOS QUE NO ESTÉN EN EL CONVENIO
		$sqlFol="SELECT folioIdentificador FROM registrosMinistraciones WHERE ministracionesTemporales_idministracionesTemporales='".$idministracionesTemporales."' AND folioIdentificador NOT IN(SELECT folioIdentificador FROM ahorrador INNER JOIN convenio_has_ahorrador ON ahorrador_idahorrador=idahorrador WHERE convenio_idconvenio='".$idConvenio."')";
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
						guardaErrorMinistracion($idministracionesTemporales,$cadenaError);
						$foliosMalos[]=$filFol["folioIdentificador"];
					}
				echo "</ul>";
			echo "</div>";
		}		
		echo "<br><br>";
		//BUSCO FOLIOS QUE NO ESTÉN EN EL CONVENIO







		//BUSCO FOLIOS QUE ESTEN EN BAJA
		$sqlFol="SELECT DISTINCT(folioIdentificador) FROM registrosMinistraciones WHERE ministracionesTemporales_idministracionesTemporales='".$idministracionesTemporales."' AND folioIdentificador IN(SELECT folioIdentificador FROM ahorrador INNER JOIN convenio_has_ahorrador ON ahorrador_idahorrador=idahorrador WHERE baja=1 AND convenio_idconvenio='".$idConvenio."')";
		$resFol=mysql_query($sqlFol);
		echo "Folios dados de baja dentro del el convenio: <strong>".mysql_num_rows($resFol)."</strong>";
		if(mysql_num_rows($resFol)>0)
		{
			echo "<span class='botonMostrar' onclick='muestraOculta(\"divFoliosEnBaja\");' >Mostrar/Ocultar</span>";
			echo "<div class='oculta' id='divFoliosEnBaja'>";						
				echo "<ul>";									
					while($filFol=mysql_fetch_assoc($resFol))
					{
						$cadenaError="El siguiente folio: <strong>".$filFol["folioIdentificador"]."</strong> esta dado de baja, no puede ser ministrado";
						echo "<li><span class='error'>".$cadenaError."</span></li>";
						guardaErrorMinistracion($idministracionesTemporales,$cadenaError);	
						$foliosMalos[]=$filFol["folioIdentificador"];							
					}
				echo "</ul>";
			echo "</div>";
		}		
		echo "<br><br>";
		//BUSCO FOLIOS QUE ESTEN EN BAJA








		//BUSCO FOLIOS REPETIDOS EN ESTA SOLICITUD DE MINISTRACION
		$sqlFol="SELECT folioIdentificador,COUNT(*) AS total FROM registrosMinistraciones WHERE ministracionesTemporales_idministracionesTemporales='".$idministracionesTemporales."' GROUP BY folioIdentificador HAVING total > 1";
		$resFol=mysql_query($sqlFol);
		echo "Folios repetidos en la solicitud de ministración: <strong>".mysql_num_rows($resFol)."</strong>";
		if(mysql_num_rows($resFol)>0)
		{
			echo "<span class='botonMostrar' onclick='muestraOculta(\"divFoliosRepetidos\");' >Mostrar/Ocultar</span>";
			echo "<div class='oculta' id='divFoliosRepetidos'>";						
				echo "<ul>";									
					while($filFol=mysql_fetch_assoc($resFol))
					{
						$cadenaError="El siguiente folio: <strong>".$filFol["folioIdentificador"]."</strong> se encuentra repetido en la solicitud de ministración";
						echo "<li><span class='error'>".$cadenaError."</span></li>";
						guardaErrorMinistracion($idministracionesTemporales,$cadenaError);
						$foliosMalos[]=$filFol["folioIdentificador"];							
					}
				echo "</ul>";
			echo "</div>";
		}		
		echo "<br><br>";
		//BUSCO FOLIOS REPETIDOS EN ESTA SOLICITUD DE MINISTRACION








		//BUSCO QUE LOS NOMBRES SEAN LOS CORRECTOS DEL CONVENIO
		$sqlFol="SELECT nombreAhorrador FROM registrosMinistraciones WHERE ministracionesTemporales_idministracionesTemporales='".$idministracionesTemporales."' AND nombreAhorrador NOT IN(SELECT nombre FROM ahorrador INNER JOIN convenio_has_ahorrador ON ahorrador_idahorrador=idahorrador WHERE convenio_idconvenio='".$idConvenio."')";
		$resFol=mysql_query($sqlFol);
		echo "Nombres no encontrados en el convenio: <strong>".mysql_num_rows($resFol)."</strong>";
		if(mysql_num_rows($resFol)>0)
		{
			echo "<span class='botonMostrar' onclick='muestraOculta(\"divNombresNoEncontrados\");' >Mostrar/Ocultar</span>";
			echo "<div class='oculta' id='divNombresNoEncontrados'>";						
				echo "<ul>";									
					while($filFol=mysql_fetch_assoc($resFol))
					{
						$cadenaError="El siguiente nombre no se encontró en el convenio: <strong>".$filFol["nombreAhorrador"]."</strong> ";
						echo "<li><span class='error'>".$cadenaError."</span></li>";
						guardaErrorMinistracion($idministracionesTemporales,$cadenaError);
					}
				echo "</ul>";
			echo "</div>";
		}		
		echo "<br><br>";
		//BUSCO QUE LOS NOMBRES SEAN LOS CORRECTOS DEL CONVENIO









		//VERIFICO QUE LAS SUMAS SEAN CORRECTAS
		$sqlFol="SELECT *,(parteSocial+cuentasAhorro+cuentasInversion+depositosGarantia+chequesNoCobrados+otrosDepositos+prestamosCargo) AS suma FROM registrosMinistraciones WHERE ministracionesTemporales_idministracionesTemporales='".$idministracionesTemporales."' AND folioIdentificador NOT IN(".implode(",",$foliosMalos).") AND (parteSocial+cuentasAhorro+cuentasInversion+depositosGarantia+chequesNoCobrados+otrosDepositos+prestamosCargo) <> saldoTotal"; 
		$resFol=mysql_query($sqlFol);
		echo "Montos mal calculados por ahorrador: <strong>".mysql_num_rows($resFol)."</strong>";
		if(mysql_num_rows($resFol)>0)
		{
			echo "<span class='botonMostrar' onclick='muestraOculta(\"divMontosMalCalculados\");' >Mostrar/Ocultar</span>";
			echo "<div class='oculta' id='divMontosMalCalculados'>";						
				echo "<ul>";									
					while($filFol=mysql_fetch_assoc($resFol))
					{
						$cadenaError="La suma de montos del ahorrador: <strong>".$filFol["nombreAhorrador"]."</strong> debe ser <strong>$ ".separarMiles($filFol["suma"])."</strong> y el archivo indica <strong>$ ".separarMiles($filFol["saldoTotal"])."</strong> ";
						echo "<li><span class='error'>".$cadenaError."</span></li>";
						guardaErrorMinistracion($idministracionesTemporales,$cadenaError);
						$foliosMalos[]=$filFol["folioIdentificador"];
					}
				echo "</ul>";
			echo "</div>";
		}	
		//VERIFICO QUE LAS SUMAS SEAN CORRECTAS
		echo "<br><br>";





		// VERIFICO QUE EL MONTO A MINISTRAR SEA EL 70%$sqlFol="SELECT *,(parteSocial+cuentasAhorro+cuentasInversion+depositosGarantia+chequesNoCobrados+otrosDepositos+prestamosCargo) AS suma FROM registrosMinistraciones WHERE ministracionesTemporales_idministracionesTemporales='".$idministracionesTemporales."' AND folioIdentificador NOT IN(".implode(",",$foliosMalos).") AND (parteSocial+cuentasAhorro+cuentasInversion+depositosGarantia+chequesNoCobrados+otrosDepositos+prestamosCargo) <> saldoTotal"; 
		$sqlFol="SELECT *,ROUND((saldoTotal*0.70),2) AS paraMinistrar FROM registrosMinistraciones WHERE ministracionesTemporales_idministracionesTemporales='".$idministracionesTemporales."' AND folioIdentificador NOT IN(".implode(",",$foliosMalos).") AND ROUND((saldoTotal*0.70),2) <> montoMinistrar"; 
		$resFol=mysql_query($sqlFol);
		echo "Motos para ministrar mal calculados por ahorrador: <strong>".mysql_num_rows($resFol)."</strong>";
		if(mysql_num_rows($resFol)>0)
		{
			echo "<span class='botonMostrar' onclick='muestraOculta(\"divMontosMinistrarMalCalculados\");' >Mostrar/Ocultar</span>";
			echo "<div class='oculta' id='divMontosMinistrarMalCalculados'>";						
				echo "<ul>";									
					while($filFol=mysql_fetch_assoc($resFol))
					{
						$cadenaError="El monto para ministrar del ahorrador: <strong>".$filFol["nombreAhorrador"]."</strong> debe ser <strong>$ ".separarMiles($filFol["paraMinistrar"])."</strong> y el archivo indica <strong>$ ".separarMiles($filFol["montoMinistrar"])."</strong> ";
						echo "<li><span class='error'>".$cadenaError."</span></li>";
						guardaErrorMinistracion($idministracionesTemporales,$cadenaError);
						$foliosMalos[]=$filFol["folioIdentificador"];
					}
				echo "</ul>";
			echo "</div>";
		}
		// VERIFICO QUE EL MONTO A MINISTRAR SEA EL 70%
		echo "<br><br>";












		//REVISO TODOS LOS IMPORTES
		$camposMinistraciones=Array("parteSocial","cuentasAhorro","cuentasInversion","depositosGarantia","chequesNoCobrados","otrosDepositos","prestamosCargo");
		$camposAhorrador=Array("sps","sca","sci","sdg","scnc","sod","spc");
		$leyendas=Array("Parte social","Cuentas de ahorro","Cuentas de inversión","Depósitos en garantía","Cheques no cobrados","Otros depósitos","Préstamos a cargo");

		$sqlFol="SELECT * FROM registrosMinistraciones WHERE ministracionesTemporales_idministracionesTemporales='".$idministracionesTemporales."' AND folioIdentificador NOT IN(".implode(",",$foliosMalos).")";
		$resFol=mysql_query($sqlFol);
		while($filFol=mysql_fetch_assoc($resFol))
		{
			echo "<div class='separador'></div>";
			echo "Revisando los importes de: <strong>".dameNombreAhorrador($filFol["folioIdentificador"])."</strong><br>";
			$sqlAhorrador="SELECT * FROM ahorrador WHERE folioIdentificador='".$filFol["folioIdentificador"]."'";
			$resAhorrador=mysql_query($sqlAhorrador);
			$filAhorrador=mysql_fetch_assoc($resAhorrador);

			foreach($camposMinistraciones as $indice => $campoMinistraciones)
			{
				if($filFol[$campoMinistraciones]>0)
				{
					echo $leyendas[$indice]." registrado <strong> $ ".separarMiles($filAhorrador[$camposAhorrador[$indice]])."</strong><br>";
					echo $leyendas[$indice]." indicado <strong> $ ".separarMiles($filFol[$campoMinistraciones])."</strong><br>";
					//if(($filAhorrador[$camposAhorrador[$indice]]>=$filFol[$campoMinistraciones] && $campoMinistraciones!="montoMinistrar") || ($filAhorrador[$camposAhorrador[$indice]]<=$filFol[$campoMinistraciones] && $campoMinistraciones=="montoMinistrar"))
					if($filAhorrador[$camposAhorrador[$indice]]>=$filFol[$campoMinistraciones] )
					{
						echo "<span class='exito'>CORRECTO</span>";
					}
					else
					{
						$cadenaError="EL MONTO EN ".strtoupper($leyendas[$indice])." DEBE SER $ ".separarMiles($filAhorrador[$camposAhorrador[$indice]])." Y EL ARCHIVO INDICA $ ".separarMiles($filFol[$campoMinistraciones]);
						echo "<span class='error'>".$cadenaError."</span>";
						guardaErrorMinistracion($idministracionesTemporales,$cadenaError);
					}

					echo "<br><br>";
				}
			}

			//VALIDO QUE NO SE PIDA MÁS DE LO QUE ES SU MONTO MÁXIMO DE PAGO
			if($filFol["montoMinistrar"]>$filAhorrador["montoMaximo"])
			{
				$cadenaError="EL MONTO PARA MINISTRAR MÁXIMO DEBE SER $ ".separarMiles($filAhorrador["montoMaximo"])." Y EL ARCHIVO INDICA $ ".separarMiles($filFol["montoMinistrar"]);
				echo "<span class='error'>".$cadenaError."</span>";
				guardaErrorMinistracion($idministracionesTemporales,$cadenaError);
			}

			echo "<br><br>";
		}
		echo "<br><br>";
		//REVISO TODOS LOS IMPORTES








		$totalErrores=dameTotalErroresRevisionMinistracion($idministracionesTemporales);
		echo "Total de errores encontrados: ".$totalErrores."<br><br>";
		if($totalErrores>0)
		{
			?>
			<br>
			<input type="button" value="Regresar" class="botonRojoChico" onclick="cargaModulo('mins')">
			<br><br>
			<?php
			die;
		}
		else
		{

			?>
			<form action='./' method="post">
			<br>
			<?php echo "<input type='hidden' name='idministracionesTemporales' value='".$idministracionesTemporales."'>"; ?>
			<input type="hidden" name="a" value="aprobarMinistracion">
			<input type="button" value="Cancelar" class="botonRojoChico" onclick="cargaModulo('mins')">
			&nbsp;&nbsp;
			<input type="submit" value="Continuar" class="botonRojoChico" >
			<br><br>
			</form>
			<?php
		}

}




function aprobarMinistracion()
{
	global $_REQUEST;

	$idministracionesTemporales=$_REQUEST["idministracionesTemporales"];

	$sqlMin="UPDATE ministracionesTemporales SET statusMinistracion_idstatusMinistracion=1 WHERE idministracionesTemporales=".$idministracionesTemporales;
	$resMin=mysql_query($sqlMin);

	echo "LA MINISTRACIÓN HA SIDO MARCADA COMO ACEPTADA";
	echo "<br><br>";
	?>
	<form action="" method="post">
		Al dar click en <strong>Continuar</strong> se se harán las modificaciones al convenio y al padrón de ahorradores correspondientes a esta ministración
		<br><br>
		<input type="button" value="Cancelar" class="botonRojoChico"  onclick="cargaModulo('mins')">
		&nbsp;&nbsp;&nbsp;
		<input type="submit" value="Continuar" class="botonRojoChico" >
		<input type="hidden" name="a" value="comienzaActualizaciones" />
		<?php echo "<input type='hidden' name='idministracionesTemporales' value='".$idministracionesTemporales."'>"; ?>
		<br><br>
	</form>
	<?php

}



function comienzaActualizaciones()
{
	global $_REQUEST;

	$erroresMinistraciones=0;
	$idministracionesTemporales=$_REQUEST["idministracionesTemporales"];
	$totalMinistracion=0;

	$sql="SELECT * FROM ministracionesTemporales WHERE idministracionesTemporales='".$idministracionesTemporales."'";
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

	$sqlFol="SELECT * FROM registrosMinistraciones WHERE ministracionesTemporales_idministracionesTemporales='".$idministracionesTemporales."'";
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
				
		$sqlSave="INSERT INTO ahorradoresMinistrados (montoMinistrado, ahorrador_idahorrador, registrosMinistraciones_idregistrosMinistraciones ) VALUES ('".$filFol["montoMinistrar"]."', '".$filAhorrador["idahorrador"]."', '".$filFol["idregistrosMinistraciones"]."')";
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


	
	
	$sqlMin="UPDATE ministracionesTemporales SET statusMinistracion_idstatusMinistracion=4 WHERE idministracionesTemporales=".$idministracionesTemporales;
	$resMin=mysql_query($sqlMin);
	echo "<br><br>";
	?>
	<input type="button" value="Continuar" class="botonRojoChico" onclick="cargaModulo('mins')">
	<br><br>
	<?php

}

	


function muestraResumenReporte()
{
	global $_REQUEST,$mensaje;

	$erroresTotalesReporte=0;

	$idministracionesTemporales=$_REQUEST["idministracionesTemporales"];

	$sqlErr="SELECT COUNT(*) AS total FROM erroresMinistracionesTemporales WHERE  ministracionesTemporales_idmodificacionesTemporales='".$idministracionesTemporales."'";
	$resErr=mysql_query($sqlErr);
	$filErr=mysql_fetch_assoc($resErr);
	$erroresTotalesReporte=$filErr["total"];

	echo "<br><br>";
	echo "<span class='subTitulos' style='font-weight:bold; color:#ff0000;'>Resumen del reporte</span>";
	echo "<div id='divSoloErrores'>";
		echo "TOTAL DE ERRORES ENCONTRADOS: ".$erroresTotalesReporte."<br><br>";
		muestraErroresMinistracion($idministracionesTemporales);			
	echo "</div>";
	echo "<br><br>";


	$sql="SELECT * FROM ministracionesTemporales WHERE idministracionesTemporales='".$idministracionesTemporales."'";
	$res=mysql_query($sql);
	$ministracionTemporal=mysql_fetch_assoc($res);

	if($ministracionTemporal["statusMinistracion_idstatusMinistracion"]==4) //Una ministracion ejectuada
	{


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

		$sqlFol="SELECT * FROM registrosMinistraciones WHERE ministracionesTemporales_idministracionesTemporales='".$idministracionesTemporales."'";
		$resFol=mysql_query($sqlFol);
		while($filFol=mysql_fetch_assoc($resFol))
		{
			echo "<div class='separador'></div>";
			echo "Se ministró al ahorrador: <strong>".dameNombreAhorrador($filFol["folioIdentificador"])."</strong><br>";
			
			$solicitudMinistradoAhorrador=0;
			$sqlAhorrador="SELECT * FROM ahorrador WHERE folioIdentificador='".$filFol["folioIdentificador"]."'";
			$resAhorrador=mysql_query($sqlAhorrador);
			$filAhorrador=mysql_fetch_assoc($resAhorrador);

			$solicitudMinistradoAhorrador+=$filFol["montoMinistrar"];
					
			//RESUMEN DEL AHORRADOR
			echo "SOLICITUD DE LO MINISTRADO: $ ".separarMiles($solicitudMinistradoAhorrador)."<br>";
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
	}

	
	?>
	<input type="button" value="Regresar" class="botonRojoChico" onclick="cargaModulo('mins')">
	<br><br>
	<?php
}



?>





