<?php

	include_once ("config.php");
	if(!isset($link))
		$link=conectDBReturn();

	function cargaModulos()
	{
		global $link;

		$sql="SELECT modulos.* FROM modulos 
			  INNER JOIN roles_has_modulos ON idmodulos=modulos_idmodulos 
			  INNER JOIN roles ON idroles=roles_has_modulos.roles_idroles 
			  INNER JOIN usuarios ON roles_has_modulos.roles_idroles=idroles 
		WHERE MD5(idusuarios)='".$_SESSION["i"]."' ORDER BY orden ASC";

		$res=mysql_query($sql);
		while($fil=mysql_fetch_assoc($res))
		{
			echo '<div class="itemMenu" onclick="cargaModulo(\''.$fil["directorio"].'\');">';
				echo $fil["nombre"];
			echo '</div>';
		}	

	}

	function validarSession()
	{
		global $link;

		$sql="SELECT * FROM usuarios WHERE statusUsuarios_idstatusUsuarios=1 AND MD5(user)='".$_SESSION["u"]."' AND MD5(pss)='".$_SESSION["p"]."' AND MD5(idusuarios)='".$_SESSION["i"]."'";
		
		$res=mysql_query($sql);

		if(mysql_num_rows($res)<=0)
		{

			logout();
		}

		return 1;
	}

	function logout()
	{
		session_destroy();
		direccionaLogin();
	}

	function intentaLogin()
	{
		global $_REQUEST;
	

		$sql="SELECT * FROM usuarios WHERE statusUsuarios_idstatusUsuarios=1 AND user='".$_REQUEST["user"]."' AND pss=MD5('".$_REQUEST["pss"]."')";
		$res=mysql_query($sql);

		if(mysql_num_rows($res)<=0)
		{
			$mensaje="Datos incorrectos";
		}

		else if(mysql_num_rows($res)===1)
		{
			$mensaje=1;
			$fil=mysql_fetch_assoc($res);

			$_SESSION["i"]=md5($fil["idusuarios"]);
			$_SESSION["u"]=md5($fil["user"]);
			$_SESSION["p"]=md5($fil["pss"]);

			guardaLog(dameIdUserMd5($_SESSION["i"]),1,'',0);
			cargaConstantesDelSistema();
		}


		return $mensaje;
	}

	function cargaConstantesDelSistema()
	{
		global $_REQUEST;	

		$sql="SELECT * FROM variables";
		$res=mysql_query($sql);
		while($fil=mysql_fetch_assoc($res))
		{
			if($fil["idvariables"]==1)
				define("PORCENTAJE_CONTINGENCIA",$fil["valor"]); 
			if($fil["idvariables"]==2)
				define("MONTO_MAXIMO_PAGO_70",$fil["valor"]); 
			if($fil["idvariables"]==3)
				define("MONTO_MAXIMO_PAGO_100",$fil["valor"]); 
		}
	}

	function direccionaLogin()
	{
		header("Location: ".RUTA);
	}

	function direccionaHome()
	{
		header("Location: ".RUTA."home.php");
	}

	function nombreUsuarioLogeado()
	{
		global $_REQUEST;
		global $link;

		$sql="SELECT nombre FROM usuarios WHERE MD5(idusuarios)='".$_SESSION["i"]."'";
		
		$res=mysql_query($sql);
		$fil=mysql_fetch_assoc($res);

		$regresa=$fil["nombre"];

		return $regresa;
	}

	function nombreUsuarioMD5($idmd5)
	{
		global $_REQUEST;
		global $link;

		$sql="SELECT nombre FROM usuarios WHERE MD5(idusuarios)='".$idmd5."'";
		
		$res=mysql_query($sql);
		$fil=mysql_fetch_assoc($res);

		$regresa=$fil["nombre"];

		return $regresa;
	}

	function dameIdUserMd5($idmd5="")
	{
		$link="";		
		$regresa="";

		global $link;

		$sql="SELECT idusuarios FROM usuarios WHERE MD5(idusuarios)='".$idmd5."'";			
		$res=mysql_query($sql);
		$fil=mysql_fetch_assoc($res);
		
		$regresa=$fil["idusuarios"];
		
		return $regresa;
	}

	function usuarioTieneModulo($idusuarios,$modulo)
	{
		$link="";		
		$regresa="";

		global $link;

		$sql="SELECT roles_idroles FROM usuarios WHERE idusuarios='".$idusuarios."'";			
		$res=mysql_query($sql);
		$fil=mysql_fetch_assoc($res);
		$rolDelUsuario=$fil["roles_idroles"];		
		
		$sql2="SELECT COUNT(*) AS total FROM modulos INNER JOIN roles_has_modulos ON modulos_idmodulos=idmodulos WHERE modulos.idmodulos='".$modulo."' AND roles_has_modulos.roles_idroles='".$rolDelUsuario."'";
		$res2=mysql_query($sql2);
		$fil2=mysql_fetch_assoc($res2);
		if($fil2["total"]==1)
			return true;
		
		return false;
	}

	function guardaLog($user,$actividad,$tabla,$id)
	{
		global $link;

		$sql="INSERT INTO log (usuarios_idusuarios,	actividades_idactividades,tabla,id) VALUES ('".$user."','".$actividad."','".$tabla."','".$id."')";
		
		$res=mysql_query($sql);
		
	}


	function dameGridTable($tabla,$orden=1,$condicion="")
	{
		$link="";
		global $link;
		$regresa="";

		$sql="SELECT * FROM ".$tabla." $condicion ORDER BY ".$orden;
		$res=mysql_query($sql);
		while($fil=mysql_fetch_assoc($res))
		{
			$regresa[]=$fil;
		}

		return $regresa;		
	}


	function convierteTimeStamp($timestamp)
	{
			$regreso=explode(" ",$timestamp);
			$fecha=$regreso[0];
			$hora=$regreso[1];
			$meses[]="Enero";
			$meses[]="Febreo";
			$meses[]="Marzo";
			$meses[]="Abril";
			$meses[]="Mayo";
			$meses[]="Junio";
			$meses[]="Julio";
			$meses[]="Agosto";
			$meses[]="Septiembre";
			$meses[]="Octubre";
			$meses[]="Noviembre";
			$meses[]="Diciembre";

			$fecha=explode("-",$fecha);
			$fechaFinal=$fecha["2"]." de ".$meses[$fecha[1]-1]." ".$fecha[0];
			$fechaFinal.=" ".$hora;

			return $fechaFinal;
	}
	
	function convierteTimeStampCorto($timestamp)
	{
		$regreso=explode(" ",$timestamp);
		$fecha=$regreso[0];
		$hora=$regreso[1];
		$meses[]="Ene";
		$meses[]="Feb";
		$meses[]="Mar";
		$meses[]="Abr";
		$meses[]="May";
		$meses[]="Jun";
		$meses[]="Jul";
		$meses[]="Ago";
		$meses[]="Sep";
		$meses[]="Oct";
		$meses[]="Nov";
		$meses[]="Dic";

		$fecha=explode("-",$fecha);
		$fechaFinal=$fecha["2"]." ".$meses[$fecha[1]-1]." ".$fecha[0];
		//$fechaFinal.=" ".$hora;

		return $fechaFinal;
	}

	function dameMontoMaximoPagoRevision($idrevisionesTemporales)
	{
		$link="";
		global $link;
		$totalIndicado=0;

		$sql="SELECT montoMaximoPago FROM consolidadasTemporales WHERE UPPER(nombreAhorrador)='TOTAL' AND revisionesTemporales_idrevisionesTemporales='".$idrevisionesTemporales."' ";
		$res=mysql_query($sql);
		$fil=mysql_fetch_assoc($res);

		$totalIndicado=$fil["montoMaximoPago"];
		
		return $totalIndicado;		
	}

	function dameTotalAhorradoresRevision($idrevisionesTemporales)
	{
		$link="";
		global $link;
		$totalAhorradores=0;

		//Numero total de ahorradores base consolidada 
		$sql="SELECT COUNT(*) AS total FROM consolidadasTemporales WHERE revisionesTemporales_idrevisionesTemporales='".$idrevisionesTemporales."' AND UPPER(nombreAhorrador)<>'TOTAL' AND nombreAhorrador<>'' ";
		$res=mysql_query($sql);
		$fil=mysql_fetch_assoc($res);
		$totalAhorradores=$fil["total"];
		
		return $totalAhorradores;
	}

	function dameTotalSociedadesRevision($idrevisionesTemporales)
	{
		$link="";
		global $link;
		$totalSociedades=0;

		$sql="SELECT COUNT(DISTINCT(descripcion)) AS total FROM resumenTemporales WHERE revisionesTemporales_idrevisionesTemporales='".$idrevisionesTemporales."' AND UPPER(descripcion)<>'TOTAL' AND descripcion<>'' ORDER BY idresumenTemporales ASC";
		$res=mysql_query($sql);	
		$fil=mysql_fetch_assoc($res);
		$totalSociedades=$fil["total"];
		
		return $totalSociedades;
	}
	function dameTodasSociedadesRevision($idrevisionesTemporales)
	{
		$link="";
		global $link;
		$regresa="";

		$sql="SELECT DISTINCT(descripcion)  FROM resumenTemporales WHERE revisionesTemporales_idrevisionesTemporales='".$idrevisionesTemporales."' AND UPPER(descripcion)<>'TOTAL' AND descripcion<>'' ORDER BY idresumenTemporales ASC";
		$res=mysql_query($sql);	
		while($fil=mysql_fetch_assoc($res))
			$regresa[]=$fil["descripcion"];

		return $regresa;
	}

	function separarMiles($cantidad)
	{
	
		$finalEntero="";
		$negativo=0;

		if($cantidad<0)
		{
			$cantidad=$cantidad*(-1);
			$negativo=1;
		}
		

		$entero=explode(".",$cantidad);
		if(is_array($entero))
		{
			$decimal=$entero[1];
			$entero=$entero[0];
		}
		else
		{
			$entero=$cantidad;
		}

		$string=strrev($entero);
		$string=str_split($string);
		if(strlen($entero)>3)
		{
			$indice=0;
			foreach($string as $k => $v)
			{
				$finalEntero.=$v;
				$indice++;
				if($indice%3==0)
					$finalEntero.=",";

			}
			$finalEntero=strrev($finalEntero);
		}
		else
			$finalEntero=$entero;

		if(strlen($decimal)<2)
			$decimal=$decimal."0";

		if($decimal>0)
			$numeroFinal=$finalEntero.".".$decimal;
		else
			$numeroFinal=$finalEntero.".00";

		$primerDigito=$numeroFinal[0];
		$numeroAuxiliar="";
		if($primerDigito==",")
		{
			$numeroFinal[0]="";
		}

		$numeroFinal=trim($numeroFinal);


		if($negativo==0)
			return $numeroFinal;
		else
			return "-".$numeroFinal;
	}

	function validaCabeceraResumen($registrosResumen,$cabecera,$debug=1)
	{
		$cabecera2=$cabecera+1;

		$textos =array("DESCRIPCIÓN", "NO DE AHORRADORES", "SALDO", "PARTE SOCIAL", "CUENTA DE AHORRO", "CUENTA DE INVERSIÓN", "DEPÓSITOS EN GARANTÍA", "CHEQUES NO COBRADOS", "OTROS DEPÓSITOS", "PRÉSTAMOS A CARGO", "SALDO NETO DE AHORRO 100%", "SALDO NETO DE AHORRO 70%", "MONTO MÁXIMO DE PAGO 100%");
		$textos2=array("DESCRIPCION", "NO DE AHORRADORES", "SALDO", "PARTE SOCIAL", "CUENTA DE AHORRO", "CUENTA DE INVERSION", "DEPOSITOS EN GARANTIA", "CHEQUES NO COBRADOS", "OTROS DEPOSITOS", "PRESTAMOS A CARGO", "SALDO NETO DE AHORRO 100%", "SALDO NETO DE AHORRO 70%", "MONTO MAXIMO DE PAGO 100%");
		$filas=array($cabecera, $cabecera, $cabecera, $cabecera2, $cabecera2, $cabecera2, $cabecera2, $cabecera2, $cabecera2, $cabecera2, $cabecera, $cabecera, $cabecera);
		$columnas=array(0, 1, 2, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11);
		$letras=array("A", "B", "C", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L");

		$errores=0;
		foreach ($textos as $indice => $texto)
		{
			if(trim(strtoupper($registrosResumen[$filas[$indice]][$columnas[$indice]]))!=$textos[$indice] && trim(strtoupper($registrosResumen[$filas[$indice]][$columnas[$indice]]))!=$textos2[$indice])
			{
				if($errores==0 && $debug==1)
					echo "<span class='error'>SE ENCONTRARON ERRORES EN LA CABECERA DE LA BASE DE RESUMEN</span><br>";
				if($debug==1)
				echo "LA CELDA ".$letras[$indice].($filas[$indice]+1)." ES <strong>".$registrosResumen[$filas[$indice]][$columnas[$indice]]."</strong> Y DEBE SER <strong>".$textos2[$indice]."</strong> <br>";
				$errores++;
			}
		}
		if($errores>0)
			return false;
		
		return true;
	}

	function validaCabeceraAnalitica($registrosAnalitica,$cabecera,$debug=1)
	{
		$cabecera2=$cabecera+1;
		$cabecera3=$cabecera2+1;

		$textos=array("NUEVO FOLIO IDENTIFICADOR", "FOLIO IDENTIFICADOR ANTERIOR", "NOMBRE DEL AHORRADOR", "CURP", "SALDO", "PARTE SOCIAL", "CUENTAS DE AHORRO", "CUENTAS DE INVERSIÓN", "DEPÓSITOS EN GARANTÍA", "CHEQUES NO COBRADOS", "OTROS DEPÓSITOS", "PRÉSTAMOS A CARGO", "SALDO NETO DE AHORRO 100%", "SALDO NETO DE AHORRO 70%", "MONTO MÁXIMO DE PAGO 100%", "CALLE", "COLONIA", "DELEGACIÓN O MUNICIPIO", "TELÉFONO", "TIPO DE DOCUMENTO", "FOLIO", "IMPORTE", "TIPO DE DOCUMENTO", "FOLIO", "IMPORTE", "TIPO DE DOCUMENTO", "FOLIO", "IMPORTE", "TIPO DE DOCUMENTO", "FOLIO", "IMPORTE", "TIPO DE DOCUMENTO", "FOLIO", "IMPORTE", "TIPO DE DOCUMENTO", "FOLIO", "IMPORTE", "TIPO DE DOCUMENTO", "FOLIO", "IMPORTE");
		$textos2=array("NUEVO FOLIO IDENTIFICADOR", "FOLIO IDENTIFICADOR ANTERIOR", "NOMBRE DEL AHORRADOR", "CURP", "SALDO", "PARTE SOCIAL", "CUENTAS DE AHORRO", "CUENTAS DE INVERSION", "DEPOSITOS EN GARANTIA", "CHEQUES NO COBRADOS", "OTROS DEPOSITOS", "PRESTAMOS A CARGO", "SALDO NETO DE AHORRO 100%", "SALDO NETO DE AHORRO 70%", "MONTO MAXIMO DE PAGO 100%", "CALLE", "COLONIA", "DELEGACION O MUNICIPIO", "TELEFONO", "TIPO DE DOCUMENTO", "FOLIO", "IMPORTE", "TIPO DE DOCUMENTO", "FOLIO", "IMPORTE", "TIPO DE DOCUMENTO", "FOLIO", "IMPORTE", "TIPO DE DOCUMENTO", "FOLIO", "IMPORTE", "TIPO DE DOCUMENTO", "FOLIO", "IMPORTE", "TIPO DE DOCUMENTO", "FOLIO", "IMPORTE", "TIPO DE DOCUMENTO", "FOLIO", "IMPORTE");
		$filas=array($cabecera, $cabecera, $cabecera, $cabecera, $cabecera, $cabecera2, $cabecera2, $cabecera2, $cabecera2, $cabecera2, $cabecera2, $cabecera2, $cabecera, $cabecera, $cabecera, $cabecera, $cabecera, $cabecera, $cabecera, $cabecera3, $cabecera3, $cabecera3, $cabecera3, $cabecera3, $cabecera3, $cabecera3, $cabecera3, $cabecera3, $cabecera3, $cabecera3, $cabecera3, $cabecera3, $cabecera3, $cabecera3, $cabecera3, $cabecera3, $cabecera3, $cabecera3, $cabecera3, $cabecera3 );
		$columnas=array(0, 1, 2, 3, 4, 4, 7, 10, 13, 16, 19, 22, 25, 26, 27, 28, 29, 30, 31, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24 );
		$letras=array("A", "B", "C", "D", "E", "E", "H", "K", "N", "Q", "T", "W", "Z", "AA", "AB", "AC", "AD", "AE", "AF", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y");
		
		$errores=0;
		foreach ($textos as $indice => $texto)
		{
			if(trim(strtoupper($registrosAnalitica[$filas[$indice]][$columnas[$indice]]))!=$textos[$indice] && trim(strtoupper($registrosAnalitica[$filas[$indice]][$columnas[$indice]])!=$textos2[$indice]))
			{
				if($errores==0 && $debug==1)
					echo "<span class='error'>SE ENCONTRARON ERRORES EN LA CABECERA DE LA BASE ANALÍTICA</span><br>";
				if($debug==1)
					echo "LA CELDA ".$letras[$indice].($filas[$indice]+1)." ES <strong>".$registrosAnalitica[$filas[$indice]][$columnas[$indice]]."</strong> Y DEBE SER <strong>".$textos2[$indice]."</strong> <br>";
				
				$errores++;
			}				
		}
		if($errores>0)
			return false;
		
		return true;
	}

	function validaCabeceraModificacionesAnalitica($registrosAnalitica,$cabecera,$debug=1)
	{
		
		$cabecera2=$cabecera+1;
		$cabecera3=$cabecera2+1;

		$textos=array ("ESTATUS", "NO.", "NUEVO FOLIO IDENTIFICADOR", "NOMBRE DEL AHORRADOR", "CURP", "SALDO", "SALDO NETO DE AHORRO 100%", "SALDO NETO DE AHORRO 70%", "MONTO MÁXIMO DE PAGO", "OBSERVACIONES", "PARTE SOCIAL", "CUENTA DE AHORRO", "CUENTA DE INVERSIÓN", "DEPÓSITOS EN GARANTÍA", "CHEQUES NO COBRADOS", "OTROS DEPÓSITOS", "PRÉSTAMOS A CARGO", "FOLIO", "TIPO DE DOCUMENTO", "IMPORTE", "FOLIO", "TIPO DE DOCUMENTO", "IMPORTE", "FOLIO", "TIPO DE DOCUMENTO", "IMPORTE", "FOLIO", "TIPO DE DOCUMENTO", "IMPORTE", "FOLIO", "TIPO DE DOCUMENTO", "IMPORTE", "FOLIO", "TIPO DE DOCUMENTO", "IMPORTE", "FOLIO", "TIPO DE DOCUMENTO", "IMPORTE"); 
		$textos2=array ("ESTATUS", "NO.", "NUEVO FOLIO IDENTIFICADOR", "NOMBRE DEL AHORRADOR", "CURP", "SALDO", "SALDO NETO DE AHORRO 100%", "SALDO NETO DE AHORRO 70%", "MONTO MAXIMO DE PAGO", "OBSERVACIONES", "PARTE SOCIAL", "CUENTA DE AHORRO", "CUENTA DE INVERSION", "DEPOSITOS EN GARANTIA", "CHEQUES NO COBRADOS", "OTROS DEPOSITOS", "PRESTAMOS A CARGO", "FOLIO", "TIPO DE DOCUMENTO", "IMPORTE", "FOLIO", "TIPO DE DOCUMENTO", "IMPORTE", "FOLIO", "TIPO DE DOCUMENTO", "IMPORTE", "FOLIO", "TIPO DE DOCUMENTO", "IMPORTE", "FOLIO", "TIPO DE DOCUMENTO", "IMPORTE", "FOLIO", "TIPO DE DOCUMENTO", "IMPORTE", "FOLIO", "TIPO DE DOCUMENTO", "IMPORTE");
	
		$filas=array ($cabecera, $cabecera, $cabecera, $cabecera, $cabecera, $cabecera, $cabecera, $cabecera, $cabecera, $cabecera, $cabecera2, $cabecera2, $cabecera2, $cabecera2, $cabecera2, $cabecera2, $cabecera2, $cabecera3, $cabecera3, $cabecera3, $cabecera3, $cabecera3, $cabecera3, $cabecera3, $cabecera3, $cabecera3, $cabecera3, $cabecera3, $cabecera3, $cabecera3, $cabecera3, $cabecera3, $cabecera3, $cabecera3, $cabecera3, $cabecera3, $cabecera3, $cabecera3 );
	
		$columnas=array (0, 1, 2, 3, 4, 5, 26, 27, 28, 29, 5, 8, 11, 14, 17, 20, 23, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25);
		$letras=array ("A", "B", "C", "D", "E", "F", "AA", "AB", "AC", "AD", "F", "I", "L", "O", "R", "U", "X", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "W", "X", "Y", "Z");
		
		$errores=0;

		foreach ($textos as $indice => $texto)
		{
			if(trim(strtoupper($registrosAnalitica[$filas[$indice]][$columnas[$indice]]))!=$textos[$indice] && trim(strtoupper($registrosAnalitica[$filas[$indice]][$columnas[$indice]]))!=$textos2[$indice])
			{
				if($errores==0 && $debug==1)
					echo "<span class='error'>SE ENCONTRARON ERRORES EN LA CABECERA DE LA BASE ANALÍTICA</span><br>";
				
				if($debug==1)
					echo "LA CELDA ".$letras[$indice].($filas[$indice]+1)." ES <strong>".$registrosAnalitica[$filas[$indice]][$columnas[$indice]]."</strong> Y DEBE SER <strong>".$textos2[$indice]."</strong> <br>";
				
				$errores++;
			}
		}
		if($errores>0)
			return false;
		
		return true;
	}


	function validaCabeceraSolicitudMinistracion($registros,$cabecera,$debug=1)
	{
		$textos=array ("NO. (*)", "FOLIO IDENTIFICADOR", "NOMBRE DEL AHORRADOR", "REPRESENTANTE LEGAL O ALBACEA O HEREDERO O BENEFICIARIO", "PARTE SOCIAL", "CUENTAS DE AHORRO", "CUENTAS DE INVERSIÓN", "DEPÓSITOS EN GARANTÍA", "CHEQUES NO COBRADOS", "OTROS DEPÓSITOS", "PRÉSTAMOS A CARGO", "TOTAL (100%)", "MONTO A MINISTRAR (70%)");
		$textos2=array ("NO.", "FOLIO IDENTIFICADOR", "NOMBRE DEL AHORRADOR", "REPRESENTANTE LEGAL O ALBACEA O HEREDERO O BENEFICIARIO", "PARTE SOCIAL", "CUENTAS DE AHORRO", "CUENTAS DE INVERSION", "DEPOSITOS EN GARANTIA", "CHEQUES NO COBRADOS", "OTROS DEPOSITOS", "PRESTAMOS A CARGO", "TOTAL 100%", "MONTO A MINISTRAR 70%");
		
		$filas=array ($cabecera, $cabecera, $cabecera, $cabecera, $cabecera, $cabecera, $cabecera, $cabecera, $cabecera, $cabecera, $cabecera, $cabecera, $cabecera );
		
		$columnas=array (0,1,2,3,4,5,6,7,8,9,10,11,12);
		$letras=array ("A", "B", "C", "D", "E","F", "G", "H", "I", "J", "K", "L", "M");
		
		$errores=0;

		foreach ($textos as $indice => $texto)
		{
			if(trim(strtoupper($registros[$filas[$indice]][$columnas[$indice]]))!=$textos[$indice] && trim(strtoupper($registros[$filas[$indice]][$columnas[$indice]]))!=$textos2[$indice])
			{
				if($errores==0 && $debug==1)
					echo "<span class='error'>SE ENCONTRARON ERRORES EN LA CABECERA DE LA SOLICITUD DE MINISTRACIÓN</span><br>";
				
				if($debug==1)
					echo "LA CELDA ".$letras[$indice].($filas[$indice]+1)." ES <strong>".$registros[$filas[$indice]][$columnas[$indice]]."</strong> Y DEBE SER <strong>".$textos[$indice]."</strong> <br>";
				
				$errores++;
			}
		}
		if($errores>0)
			return false;
		
		return true;
	}



	function imprimeCabeceraModificacionesAnalitica()
	{
		echo '
			<table align="center" border="1" cellpadding="0" cellspacing="0" style="font-size:8px;">
				  <tr>
				    <th rowspan="3">ESTATUS</th>
				    <th rowspan="3">No.</th>
				    <th rowspan="3">NUEVO FOLIO IDENTIFICADOR</th>
				    <th rowspan="3">NOMBRE DEL AHORRADOR</th>
				    <th colspan="21">SALDO</th>
				    <th rowspan="3">SALDO NETO DE AHORRO 100%</th>
				    <th rowspan="3">SALDO NETO DE AHORRO 70%</th>
				    <th rowspan="3">MONTO MÁXIMO DE PAGO</th>
				    <th rowspan="3">OBSERVACIONES</th>
				  </tr>
				  <tr>
				    <td colspan="3">PARTE SOCIAL</td>
				    <td colspan="3">CUENTA DE AHORRO</td>
				    <td colspan="3">CUENTA DE INVERSIÓN</td>
				    <td colspan="3">DEPÓSITOS EN GARANTÍA</td>
				    <td colspan="3">CHEQUES NO COBRADOS</td>
				    <td colspan="3">OTROS DEPÓSITOS</td>
				    <td colspan="3">PRÉSTAMOS A CARGO</td>
				  </tr>
				  <tr>
				    <td>FOLIO</td>
				    <td>TIPO DE DOCUMENTO</td>
				    <td>IMPORTE</td>
				    <td>FOLIO</td>
				    <td>TIPO DE DOCUMENTO</td>
				    <td>IMPORTE</td>
				    <td>FOLIO</td>
				    <td>TIPO DE DOCUMENTO</td>
				    <td>IMPORTE</td>
				    <td>FOLIO</td>
				    <td>TIPO DE DOCUMENTO</td>
				    <td>IMPORTE</td>
				    <td>FOLIO</td>
				    <td>TIPO DE DOCUMENTO</td>
				    <td>IMPORTE</td>
				    <td>FOLIO</td>
				    <td>TIPO DE DOCUMENTO</td>
				    <td>IMPORTE</td>
				    <td>FOLIO</td>
				    <td>TIPO DE DOCUMENTO</td>
				    <td>IMPORTE</td>
				  </tr>
				</table>
		';
	}

	function existeAhorradorEnPadron($folioAhorrador)
	{

		$sql="SELECT COUNT(*) AS total FROM ahorrador WHERE folioIdentificador='".$folioAhorrador."'";
		$res=mysql_query($sql);
		$fil=mysql_fetch_assoc($res);
		if($fil["total"]>0)
			return true;

		return false;
	}


	function esUltimaFilaConsolidada($fila)
	{
		foreach($fila as $k => $celda)
			if(trim(strtoupper($celda))=='TOTAL')
				return true;

		return false;
	}

	function esUltimaFilaAnalitica($fila)
	{
		foreach($fila as $k => $celda)
			if(trim(strtoupper($celda))=='TOTAL')
				return true;

		return false;
	}


	function esUltimaFilaModificacionesConsolidada($fila)
	{
		foreach($fila as $k => $celda)
			if(trim(strtoupper($celda))=='TOTAL DICE:' || trim(strtoupper($celda))=='TOTAL DICE')
				return true;

		return false;
	}


	function esUltimaFilaModificacionesAnalitica($fila)
	{
		foreach($fila as $k => $celda)
			if(trim(strtoupper($celda))=='TOTAL DICE:' || trim(strtoupper($celda))=='TOTAL DICE')
				return true;

		return false;
	}





	function validaCabeceraConsolidada($registrosConsolidada,$cabecera,$debug=1)
	{
		$cabecera2=$cabecera+1;

		$textos=array("NUEVO FOLIO IDENTIFICADOR","FOLIO IDENTIFICADOR ANTERIOR","NOMBRE DEL AHORRADOR","CURP","SALDO","SALDO NETO DE AHORRO 100 %","SALDO NETO DE AHORRO 70 %","MONTO MÁXIMO DE PAGO","CALLE Y NÚMERO","COLONIA","DELEGACIÓN O MUNICIPIO","TELÉFONO","PARTE SOCIAL","CUENTAS DE AHORRO","CUENTAS DE INVERSIÓN","DEPÓSITOS EN GARANTÍA","CHEQUES NO COBRADOS","OTROS DEPÓSITOS","PRÉSTAMOS A CARGO");
		$textos2=array("NUEVO FOLIO IDENTIFICADOR","FOLIO IDENTIFICADOR ANTERIOR","NOMBRE DEL AHORRADOR","CURP","SALDO","SALDO NETO DE AHORRO 100 %","SALDO NETO DE AHORRO 70 %","MONTO MAXIMO DE PAGO","CALLE Y NUMERO","COLONIA","DELEGACION O MUNICIPIO","TELEFONO","PARTE SOCIAL","CUENTAS DE AHORRO","CUENTAS DE INVERSION","DEPOSITOS EN GARANTIA","CHEQUES NO COBRADOS","OTROS DEPOSITOS","PRESTAMOS A CARGO");
		$filas=array($cabecera,$cabecera,$cabecera,$cabecera,$cabecera,$cabecera,$cabecera,$cabecera,$cabecera,$cabecera,$cabecera,$cabecera,$cabecera2,$cabecera2,$cabecera2,$cabecera2,$cabecera2,$cabecera2,$cabecera2);
		$columnas=array(0,1,2,3,4,11,12,13,14,15,16,17,4,5,6,7,8,9,10);
		$letras=array("A","B","C","D","E","L","M","N","O","P","Q","R","E","F","G","H","I","J","K");
		$errores=0;
		foreach ($textos as $indice => $texto)
		{
			if(trim(strtoupper($registrosConsolidada[$filas[$indice]][$columnas[$indice]]))!=$textos[$indice] && trim(strtoupper($registrosConsolidada[$filas[$indice]][$columnas[$indice]]))!=$textos2[$indice])
			{
				if($errores==0 && $debug==1)
					echo "<span class='error'>SE ENCONTRARON ERRORES EN LA CABECERA DE LA BASE CONSOLIDADA</span><br>";
				
				if($debug==1)
					echo "LA CELDA ".$letras[$indice].($filas[$indice]+1)." ES <strong>".$registrosConsolidada[$filas[$indice]][$columnas[$indice]]."</strong> Y DEBE SER <strong>".$textos2[$indice]."</strong> <br>";
				
				$errores++;
			}
		}
		if($errores>0)
			return false;
		
		return true;
	}

	function validaCabeceraModificacionesConsolidada($registrosConsolidada,$cabecera,$debug=1)
	{
		
		// foreach($registrosConsolidada as $indice => $fila)
		// {
		// 	foreach($fila as $k => $v)
		// 	{
		// 		echo $k." - ".$v."<br>";
		// 	}
		// 	echo "<br><br>";
		// }


		$cabecera2=$cabecera+1;

		$textos=array("ESTATUS", "NO.", "NUEVO FOLIO IDENTIFICADOR", "NOMBRE DEL AHORRADOR", "CURP", "SALDO", "SALDO NETO DE AHORRO 100%", "SALDO NETO DE AHORRO 70%", "MONTO MÁXIMO DE PAGO", "OBSERVACIONES", "PARTE SOCIAL", "CUENTA DE AHORRO", "CUENTA DE INVERSIÓN", "DEPÓSITOS EN GARANTÍA", "CHEQUES NO COBRADOS", "OTROS DEPÓSITOS", "PRÉSTAMOS A CARGO");
		$textos2=array("ESTATUS", "NO.", "NUEVO FOLIO IDENTIFICADOR", "NOMBRE DEL AHORRADOR", "CURP", "SALDO", "SALDO NETO DE AHORRO 100%", "SALDO NETO DE AHORRO 70%", "MONTO MAXIMO DE PAGO", "OBSERVACIONES", "PARTE SOCIAL", "CUENTA DE AHORRO", "CUENTA DE INVERSION", "DEPOSITOS EN GARANTIA", "CHEQUES NO COBRADOS", "OTROS DEPOSITOS", "PRESTAMOS A CARGO");
		
		$filas=array($cabecera, $cabecera, $cabecera, $cabecera, $cabecera, $cabecera, $cabecera, $cabecera, $cabecera, $cabecera, $cabecera2, $cabecera2, $cabecera2, $cabecera2, $cabecera2, $cabecera2, $cabecera2);

		$columnas=array(0, 1, 2, 3, 4, 5, 12, 13, 14, 15, 5, 6, 7, 8, 9, 10, 11 );
		$letras=array("A", "B", "C", "D", "E", "F", "M", "N", "O", "P", "F", "G", "H", "I", "J", "K", "L");
		
		$errores=0;

		foreach ($textos as $indice => $texto)
		{
			//echo "comparo: ".trim(strtoupper($registrosConsolidada[$filas[$indice]][$columnas[$indice]]))." - con - ".$textos[$indice]."<br>";
			
			if(trim(strtoupper($registrosConsolidada[$filas[$indice]][$columnas[$indice]]))!=$textos[$indice] && trim(strtoupper($registrosConsolidada[$filas[$indice]][$columnas[$indice]]))!=$textos2[$indice])
			{
				if($errores==0 && $debug==1)
					echo "<span class='error'>SE ENCONTRARON ERRORES EN LA CABECERA DE LA BASE CONSOLIDADA</span><br>";
				
				if($debug==1)
					echo "LA CELDA ".$letras[$indice].($filas[$indice]+1)." ES <strong>".$registrosConsolidada[$filas[$indice]][$columnas[$indice]]."</strong> Y DEBE SER <strong>".$textos2[$indice]."</strong> <br>";
				
				$errores++;
			}
		}
		if($errores>0)
			return false;
		
		return true;
	}

	function imprimeCabeceraModificacionesConsolidada()
	{
		echo '
		<table align="center" border="1" cellpadding="0" cellspacing="0" style="font-size:10px;">
		  <tr>
		    <th rowspan="2">ESTATUS</th>
		    <th rowspan="2">No.</th>
		    <th rowspan="2">NUEVO FOLIO IDENTIFICADOR</th>
		    <th rowspan="2">NOMBRE DEL AHORRADOR</th>
		    <th colspan="7">SALDO</th>
		    <th rowspan="2">SALDO NETO DE AHORRO 100%</th>
		    <th rowspan="2">SALDO NETO DE AHORRO 70%</th>
		    <th rowspan="2">MONTO MÁXIMO DE PAGO</th>
		    <th rowspan="2">OBSERVACIONES</th>
		  </tr>
		  <tr>
		    <td>PARTE SOCIAL</td>
		    <td>CUENTA DE AHORRO</td>
		    <td>CUENTA DE INVERSIÓN</td>
		    <td>DEPÓSITOS EN GARANTÍA</td>
		    <td>CHEQUES NO COBRADOS</td>
		    <td>OTROS DEPÓSITOS</td>
		    <td>PRÉSTAMOS A CARGO</td>
		  </tr>
		</table>
			';
	}

	
	function dameNombresConsolidada($id,$tipo="revision")
	{		
		if($tipo=="revision")		
		{
			$tabla="consolidadasTemporales";			
			$campo="revisionesTemporales_idrevisionesTemporales";
		}
		
		else if($tipo=="certificada")		
		{
			$tabla="consolidadasCertificadas";
			$campo="basesCertificadas_idbasesCertificadas";
		}

		$sql="SELECT DISTINCT(nombreAhorrador) FROM ".$tabla." WHERE ".$campo."='".$id."'";
		$res=mysql_query($sql);	
		while($fil=mysql_fetch_assoc($res))
		{
			$regresa[]=strtoupper(trim($fil["nombreAhorrador"]));
		}

		return $regresa;
		
	}

	function dameNombresAnalitica($id,$tipo="revision")
	{		
		if($tipo=="revision")
		{
			$tabla="analiticasTemporales";
			$campo="revisionesTemporales_idrevisionesTemporales";
		}
		else if($tipo=="certificada")
		{
			$tabla="analiticasCertificadas";
			$campo="basesCertificadas_idbasesCertificadas";
		}
		$sql="SELECT DISTINCT(nombreAhorrador) FROM ".$tabla." WHERE ".$campo."='".$id."'";
		$res=mysql_query($sql);	
		while($fil=mysql_fetch_assoc($res))
		{
			$regresa[]=strtoupper(trim($fil["nombreAhorrador"]));
		}

		return $regresa;
		
	}


	function getFolioPorNombreConsolidada($nombreRealAhorrador,$idrevisionesTemporales)
	{
		$link="";
		global $link;
		
		$sql="SELECT nuevoFolioIdentificador FROM consolidadasTemporales WHERE nombreAhorrador='".$nombreRealAhorrador."' AND revisionesTemporales_idrevisionesTemporales='".$idrevisionesTemporales."' ";
		$res=mysql_query($sql);	
		$fil=mysql_fetch_assoc($res);
		$regresa=$fil["nuevoFolioIdentificador"];
		
		return $regresa;
	}

	function dameTotalAhorradoresConsolidada($id,$tipo="revision")
	{
		$link="";
		global $link;

		if($tipo=="revision")
		{
			$tabla="consolidadasTemporales";
			$campo="revisionesTemporales_idrevisionesTemporales";
		}
		else if($tipo=="certificada")
		{
			$tabla="consolidadasCertificadas";
			$campo="basesCertificadas_idbasesCertificadas";
		}

		//Numero total de ahorradores base consolidada 
		$sql="SELECT COUNT(*) AS total FROM ".$tabla." WHERE ".$campo."='".$id."' AND UPPER(nombreAhorrador)<>'TOTAL' AND nombreAhorrador<>'' ";
		$res=mysql_query($sql);
		$fil=mysql_fetch_assoc($res);
		$totalAhorradoresBaseConsolidada=$fil["total"];

		return $totalAhorradoresBaseConsolidada;
	}

	function dameNumeroFoliosRepetidosConsolidada($id,$tipo="revision")
	{
		
		$link="";
		global $link;

		if($tipo=="revision")
		{
			$tabla="consolidadasTemporales";
			$campo="revisionesTemporales_idrevisionesTemporales";
		}
		else if($tipo=="certificada")
		{
			$tabla="consolidadasCertificadas";
			$campo="basesCertificadas_idbasesCertificadas";
		}

		$sql="SELECT nuevoFolioIdentificador,COUNT(nuevoFolioIdentificador) AS total FROM ".$tabla." WHERE ".$campo."='".$id."' AND nuevoFolioIdentificador<>'' GROUP BY nuevoFolioIdentificador HAVING total>1";
		$res=mysql_query($sql);		
		$foliosRepetidosBaseConsolidad=mysql_num_rows($res);

		return $foliosRepetidosBaseConsolidad;
	}

	function dameFoliosRepetidosConsolidada($idrevisionesTemporales)
	{
		$link="";
		global $link;

		$sql="SELECT nuevoFolioIdentificador,COUNT(*) AS total FROM consolidadasTemporales WHERE nuevoFolioIdentificador<>'' AND revisionesTemporales_idrevisionesTemporales='".$idrevisionesTemporales."' GROUP BY nuevoFolioIdentificador HAVING total>1";
		$res=mysql_query($sql);		
		while($fil=mysql_fetch_assoc($res))		
			$foliosRepetidos[]=$fil["nuevoFolioIdentificador"];	

		return $foliosRepetidos;
	}

	function dameNombreRepetidosConsolidada($id,$tipo="revision")
	{
		$link="";
		global $link;

		if($tipo=="revision")
		{
			$campo="revisionesTemporales_idrevisionesTemporales";
			$tabla="consolidadasTemporales";
		}

		$sql="SELECT nombreAhorrador,COUNT(*) AS total FROM ".$tabla." WHERE nombreAhorrador<>'' AND ".$campo."='".$id."' GROUP BY nombreAhorrador HAVING total>1";
		$res=mysql_query($sql);		
		while($fil=mysql_fetch_assoc($res))		
			$nombresRepetidos[]=$fil["nombreAhorrador"];	

		return $nombresRepetidos;
	}

	function dameNumeroFoliosEnBlancoConsolidada($id,$tipo="revision")
	{
		$link="";
		global $link;

		if($tipo=="revision")
		{
			$tabla="consolidadasTemporales";
			$campo="revisionesTemporales_idrevisionesTemporales";
		}
		else if($tipo=="certificada")
		{
			$tabla="consolidadasCertificadas";
			$campo="basesCertificadas_idbasesCertificadas";
		}

		$sql="SELECT COUNT(*) AS total FROM ".$tabla." WHERE ".$campo."='".$id."' AND nuevoFolioIdentificador='' AND UPPER(nuevoFolioIdentificador)<>'TOTAL' AND UPPER(nombreAhorrador)<>'TOTAL'";
		$res=mysql_query($sql);	
		$fil=mysql_fetch_assoc($res);	
		$foliosEnBlancoBaseConsolidad=$fil["total"];

		return $foliosEnBlancoBaseConsolidad;
	}

	function dameFoliosEnBlancoConsolidada($idrevisionesTemporales)
	{
		$link="";
		global $link;
		$regresa="";
		
		$sql="SELECT filaDocumentoOriginal FROM consolidadasTemporales WHERE revisionesTemporales_idrevisionesTemporales='".$idrevisionesTemporales."' AND nuevoFolioIdentificador='' AND UPPER(nuevoFolioIdentificador)<>'TOTAL' ";
		$res=mysql_query($sql);	
		while($fil=mysql_fetch_assoc($res))
			$regresa[]=$fil["filaDocumentoOriginal"];

		return $regresa;
	}


	function dameDatosTodosAhorradoresConsolidada($id,$tipo="revision")
	{
		$link="";
		global $link;
		$ahorradores="";

		if($tipo=="revision")
		{
			$tabla="consolidadasTemporales";
			$campo="revisionesTemporales_idrevisionesTemporales";
		}
		else if($tipo=="certificada")
		{
			$tabla="consolidadasCertificadas";
			$campo="basesCertificadas_idbasesCertificadas";
		}

		$sql="SELECT * FROM ".$tabla." WHERE ".$campo."='".$id."' AND UPPER(nombreAhorrador)<>'TOTAL' AND nombreAhorrador<>'' ";
		$res=mysql_query($sql);
		while($fil=mysql_fetch_assoc($res))			
			$ahorradores[]=$fil;
		
		return $ahorradores;			
	}

	function dameSumaCampos($ahorradores,$camposAsUMAR)
	{
		$sumas="";
		foreach($ahorradores as $indiceAhorradores => $ahorrador)
		{
			foreach($ahorrador as $campo => $valor)
			{
				if(in_array($campo, $camposAsUMAR))
					$sumas[$campo]+=$valor;
			}
		}
		return $sumas;
	}

	function dameTotalAhorradoresAnalitcia($idrevisionesTemporales)
	{
		$link="";
		global $link;
		
		$sql="SELECT COUNT(*) AS total FROM analiticasTemporales WHERE  nombreAhorrador<>'' AND UPPER(nombreAhorrador)<>'TOTAL' AND revisionesTemporales_idrevisionesTemporales='".$idrevisionesTemporales."' ";
		$res=mysql_query($sql);	
		$fil=mysql_fetch_assoc($res);
		$regresa=$fil["total"];
		
		return $regresa;	
	}

	function dameTotalAhorradoresAnalitciaPorCaja($idrevisionesTemporales,$folio,$longitudFolio)
	{
		$link="";
		global $link;
		
		$sql="SELECT COUNT(*) AS total FROM analiticasTemporales WHERE nuevoFolioIdentificador LIKE '".$folio."%' AND LENGTH(nuevoFolioIdentificador)='".$longitudFolio."' AND nombreAhorrador<>'' AND UPPER(nombreAhorrador)<>'TOTAL' AND revisionesTemporales_idrevisionesTemporales='".$idrevisionesTemporales."' ";
		$res=mysql_query($sql);	
		$fil=mysql_fetch_assoc($res);
		$regresa=$fil["total"];
		
		return $regresa;	
	}

	function dameTotalAhorradoresAnaliticaPorCaja($mayoresomenores,$id,$folio,$tipo="revision")
	{
		$link="";
		global $link;

		if($mayoresomenores=="mayores")
			$operador=">=";
		else if($mayoresomenores=="menores")
			$operador="<";

		if($tipo=="revision")
		{
			$tabla="analiticasTemporales";
			$campo="revisionesTemporales_idrevisionesTemporales";
		}
		else if($tipo=="certificada")
		{
			$tabla="analiticasCertificadas";
			$campo="basesCertificadas_idbasesCertificadas";
		}

		
		$sql="SELECT COUNT(*) AS total FROM ".$tabla." WHERE saldoNeto100".$operador."'239900' AND nuevoFolioIdentificador LIKE '".$folio."%' AND nombreAhorrador<>'' AND UPPER(nombreAhorrador)<>'TOTAL' AND ".$campo."='".$id."' ";
		$res=mysql_query($sql);	
		$fil=mysql_fetch_assoc($res);
		$regresa=$fil["total"];
		
		return $regresa;	
	}

	function calculaSaldosAnalitica($id,$tipo="revision")
	{
		$link="";
		global $link;
		$regresa=Array ();
		$malCalculados=Array ();

		if($tipo=="revision")
		{
			$tabla="analiticasTemporales";
			$campo="revisionesTemporales_idrevisionesTemporales";
		}
		else if($tipo=="certificada")
		{
			$tabla="analiticasCertificadas";
			$campo="basesCertificadas_idbasesCertificadas";
		}


		$montoCalculadoAl100=0;
		$contador=0;
		
		$sql="SELECT * FROM ".$tabla." WHERE UPPER(nombreAhorrador)<>'TOTAL' AND ".$campo."='".$id."'";
		$res=mysql_query($sql);	
		while($ahorrador=mysql_fetch_assoc($res))
		{
			$folioActual=$ahorrador["nuevoFolioIdentificador"];
			$nombreActual=$ahorrador["nombreAhorrador"];

			if($contador==0)
			{
				$folioReal=$ahorrador["nuevoFolioIdentificador"];
				$nombreReal=$ahorrador["nombreAhorrador"];

				$importePS+=$ahorrador["importePS"];
				$importeCA+=$ahorrador["importeCA"];
				$importeCI+=$ahorrador["importeCI"];
				$importeDG+=$ahorrador["importeDG"];
				$importeCNC+=$ahorrador["importeCNC"];
				$importeOtros+=$ahorrador["importeOtros"];
				$importePrestamos+=$ahorrador["importePrestamos"];
				$saldoNeto100+=$ahorrador["saldoNeto100"];
				$saldoNeto70+=$ahorrador["saldoNeto70"];
				$montoMaximoPago+=$ahorrador["montoMaximoPago"];
			}
			if($folioActual==0) //Sigo sumando del ahorrador anterior $folioReal
			{					
				$importePS+=$ahorrador["importePS"];
				$importeCA+=$ahorrador["importeCA"];
				$importeCI+=$ahorrador["importeCI"];
				$importeDG+=$ahorrador["importeDG"];
				$importeCNC+=$ahorrador["importeCNC"];
				$importeOtros+=$ahorrador["importeOtros"];
				$importePrestamos+=$ahorrador["importePrestamos"];
				$saldoNeto100+=$ahorrador["saldoNeto100"];
				$saldoNeto70+=$ahorrador["saldoNeto70"];
				$montoMaximoPago+=$ahorrador["montoMaximoPago"];
			}
			if($folioActual!=0 && $contador!=0)//Ya es un ahorrador nuevo
			{					
				//Calculo todos los importes
				$montoCalculadoAl100=$importePS+$importeCA+$importeCI+$importeDG+$importeCNC+$importeOtros-$importePrestamos;
				$montoCalculadoAl100=round($montoCalculadoAl100,2);

				$regresa[$folioReal]["montoCalculadoAl100"]=round($montoCalculadoAl100,2);
				$regresa[$folioReal]["nombreAhorrador"]=$nombreReal;
				$regresa[$folioReal]["importePS"]=$importePS;
				$regresa[$folioReal]["importeCA"]=$importeCA;
				$regresa[$folioReal]["importeCI"]=$importeCI;
				$regresa[$folioReal]["importeDG"]=$importeDG;
				$regresa[$folioReal]["importeCNC"]=$importeCNC;
				$regresa[$folioReal]["importeOtros"]=$importeOtros;
				$regresa[$folioReal]["importePrestamos"]=$importePrestamos;
				$regresa[$folioReal]["saldoNeto100"]=$saldoNeto100;
				$regresa[$folioReal]["saldoNeto70"]=$saldoNeto70;
				$regresa[$folioReal]["montoMaximoPago"]=$montoMaximoPago;


				// VERIFICO SI ESTA MAL CALCULADO //
				if($regresa[$folioReal]["saldoNeto100"]!=$regresa[$folioReal]["montoCalculadoAl100"])
					$malCalculados[$folioReal]="El saldo neto de ahorro al 100% del ahorrador <strong>".$regresa[$folioReal]["nombreAhorrador"]."</strong> indicado en la base analítica debe ser <strong> $ ".separarMiles($regresa[$folioReal]["montoCalculadoAl100"])."</strong> y en el documento se indica que es de <strong> $ ".separarMiles($regresa[$folioReal]["saldoNeto100"])."</strong>";;
				

				$montoCalculadoAl70=$regresa[$folioReal]["montoCalculadoAl100"]*0.70;
				$montoCalculadoAl70=round($montoCalculadoAl70,2);	
				if($montoCalculadoAl70!=$regresa[$folioReal]["saldoNeto70"])
					$malCalculados[$folioReal]="El saldo neto de ahorro al 70% del ahorrador <strong>".$regresa[$folioReal]["nombreAhorrador"]."</strong> indicado en la base analítica debe ser <strong> $ ".separarMiles($montoCalculadoAl70)."</strong> y en el documento se indica que es de <strong> $ ".separarMiles($regresa[$folioReal]["saldoNeto70"])."</strong>";

				
				$montoMaximoCalculado=$montoCalculadoAl70;
				if($montoMaximoCalculado>MONTO_MAXIMO_PAGO_70)
					$montoMaximoCalculado=MONTO_MAXIMO_PAGO_70;
				$montoMaximoCalculado=round($montoMaximoCalculado,2);

				if($montoMaximoCalculado!=$regresa[$folioReal]["montoMaximoPago"])
				{
					//echo "valido: ".$montoMaximoCalculado." con ".$regresa[$folioReal]["montoMaximoPago"]."<br>";
					$malCalculados[$folioReal]="El monto máximo de pago del ahorrador <strong>".$regresa[$folioReal]["nombreAhorrador"]."</strong> indicado en la base analítica debe ser <strong> $ ".separarMiles($montoMaximoCalculado)."</strong> y en el documento se indica que es de <strong> $ ".separarMiles($regresa[$folioReal]["montoMaximoPago"])."</strong>";
				}
				// VERIFICO SI ESTA MAL CALCULADO //
				
				// if(count($malCalculados)>=100)
				// 	return $malCalculados;



				//Inicio el nuevo ahorrador
				$regresa=Array ();
				$folioReal=$folioActual;
				$nombreReal=$nombreActual;
				$importePS=$ahorrador["importePS"];
				$importeCA=$ahorrador["importeCA"];
				$importeCI=$ahorrador["importeCI"];
				$importeDG=$ahorrador["importeDG"];
				$importeCNC=$ahorrador["importeCNC"];
				$importeOtros=$ahorrador["importeOtros"];
				$importePrestamos=$ahorrador["importePrestamos"];
				$saldoNeto100=$ahorrador["saldoNeto100"];
				$saldoNeto70=$ahorrador["saldoNeto70"];
				$montoMaximoPago=$ahorrador["montoMaximoPago"];
			}
			$contador++;				
		}


		//Sumo el último ahorrador							
		$montoCalculadoAl100=$importePS+$importeCA+$importeCI+$importeDG+$importeCNC+$importeOtros-$importePrestamos;
		$montoCalculadoAl100=round($montoCalculadoAl100,2);
		
		$regresa[$folioReal]["montoCalculadoAl100"]=round($montoCalculadoAl100,2);
		$regresa[$folioReal]["nombreAhorrador"]=$nombreReal;
		$regresa[$folioReal]["importePS"]=round($importePS,2);
		$regresa[$folioReal]["importeCA"]=round($importeCA,2);
		$regresa[$folioReal]["importeCI"]=round($importeCI,2);
		$regresa[$folioReal]["importeDG"]=round($importeDG,2);
		$regresa[$folioReal]["importeCNC"]=round($importeCNC,2);
		$regresa[$folioReal]["importeOtros"]=round($importeOtros,2);
		$regresa[$folioReal]["importePrestamos"]=round($importePrestamos,2);
		$regresa[$folioReal]["saldoNeto100"]=round($saldoNeto100,2);
		$regresa[$folioReal]["saldoNeto70"]=round($saldoNeto70,2);
		$regresa[$folioReal]["montoMaximoPago"]=round($montoMaximoPago,2);

		// VERIFICO SI ESTA MAL CALCULADO //
		if($regresa[$folioReal]["saldoNeto100"]!=$regresa[$folioReal]["montoCalculadoAl100"])
			$malCalculados[$folioReal]="El saldo neto de ahorro al 100% del ahorrador <strong>".$regresa[$folioReal]["nombreAhorrador"]."</strong> indicado en la base analítica debe ser <strong> $ ".separarMiles($regresa[$folioReal]["montoCalculadoAl100"])."</strong> y en el documento se indica que es de <strong> $ ".separarMiles($regresa[$folioReal]["saldoNeto100"])."</strong>";;
		

		$montoCalculadoAl70=$regresa[$folioReal]["montoCalculadoAl100"]*0.70;
		$montoCalculadoAl70=round($montoCalculadoAl70,2);	
		if($montoCalculadoAl70!=$regresa[$folioReal]["saldoNeto70"])
			$malCalculados[$folioReal]="El saldo neto de ahorro al 70% del ahorrador <strong>".$regresa[$folioReal]["nombreAhorrador"]."</strong> indicado en la base analítica debe ser <strong> $ ".separarMiles($montoCalculadoAl70)."</strong> y en el documento se indica que es de <strong> $ ".separarMiles($regresa[$folioReal]["saldoNeto70"])."</strong>";

		
		$montoMaximoCalculado=$montoCalculadoAl70;
		if($montoMaximoCalculado>MONTO_MAXIMO_PAGO_70)
			$montoMaximoCalculado=MONTO_MAXIMO_PAGO_70;
		if($montoMaximoCalculado!=$regresa[$folioReal]["montoMaximoPago"])
			$malCalculados[$folioReal]="El monto máximo de pago del ahorrador <strong>".$regresa[$folioReal]["nombreAhorrador"]."</strong> indicado en la base analítica debe ser <strong> $ ".separarMiles($montoMaximoCalculado)."</strong> y en el documento se indica que es de <strong> $ ".separarMiles($regresa[$folioReal]["montoMaximoPago"])."</strong>";

		// VERIFICO SI ESTA MAL CALCULADO //

		
		
		return $malCalculados;
	}

	function sumaPorCampoAhorradoresAnaliticaPorCaja($folioCaja,$campoASumar,$tipo)
	{
		$regresa=0;

		foreach($todaRevisionAnalitica as $folioAhorrador => $saldos)
		{

			if(($tipo=="menores" && $saldos["saldoNeto100"]<239900) || ($tipo=="mayores" && $saldos["saldoNeto100"]>=239900) )
			{
				//Evaluo si el folio del ahorrador es de la caja
				if(substr($folioAhorrador,0,3) == $folioCaja)
					$regresa+=$saldos[$campoASumar];
				
			}				
		}
		return $regresa;
	}

	function dameErroresRevision($idrevisionesTemporales)
	{
		$link="";
		global $link;
		
		$sql="SELECT totalErrores FROM revisionesTemporales WHERE idrevisionesTemporales='".$idrevisionesTemporales."'";
		$res=mysql_query($sql);	
		$fil=mysql_fetch_assoc($res);
		$regresa=$fil["totalErrores"];
		
		return $regresa;	
	}

	function dameMontoBaseConsolidada($idrevisionesTemporales)
	{
		$link="";
		global $link;

		$calculado=0;
		$indicado=0;

		$sql="SELECT SUM(montoMaximoPago) AS total FROM consolidadasTemporales WHERE revisionesTemporales_idrevisionesTemporales='".$idrevisionesTemporales."' AND UPPER(nombreAhorrador)<>'TOTAL' AND nombreAhorrador<>''";
		$res=mysql_query($sql);
		$fil=mysql_fetch_assoc($res);
		$calculado=$fil["total"];
		$calculado=round($calculado,2);

		$sql="SELECT montoMaximoPago AS total FROM consolidadasTemporales WHERE revisionesTemporales_idrevisionesTemporales='".$idrevisionesTemporales."' AND UPPER(nombreAhorrador)='TOTAL'";
		$res=mysql_query($sql);
		$fil=mysql_fetch_assoc($res);
		$indicado=$fil["total"];
		$indicado=round($indicado,2);
		
		if($indicado==$calculado)
			return $calculado;			
		else
			return 0;
	}

	function damePorcentajeContingenciaConsolidada($idrevisionesTemporales)
	{
		$link="";
		global $link;

		$regresa=0;
		
		$sql="SELECT porcentajeContingencia FROM convenio WHERE revisionesTemporales_idrevisionesTemporales='".$idrevisionesTemporales."'";
		$res=mysql_query($sql);
		$fil=mysql_fetch_assoc($res);
		$regresa=$fil["porcentajeContingencia"];
		
		return $regresa;
	}

	function dameDetalleConvenio($idconvenio)
	{
		$link="";
		global $link;

		$regresa="";
		
		$sql="SELECT 
			convenio.*,
			estado.nombre AS nombreEstado,
			estado.clave AS claveEstado, 
			bancos.nombreCorto AS nombreCortoBanco,
			bancos.nombre AS nombreBanco, 
			usuarios.nombre AS nombreUsuario, 
			COUNT(convenio_has_sociedad.sociedad_idsociedad) AS numeroSociedades 
			FROM 
			convenio 
			INNER JOIN estado ON estado_idestado=idestado 
			INNER JOIN bancos ON bancos_idbancos=idbancos 
			INNER JOIN usuarios ON idusuarios=usuarios_idusuarios  
			INNER JOIN convenio_has_sociedad ON convenio_idconvenio=idconvenio 
			WHERE idconvenio='".$idconvenio."'";
		$res=mysql_query($sql);
		$fil=mysql_fetch_assoc($res);
		$regresa=$fil;
		
		return $regresa;
	}

	function guardaErrorRevision($idrevisionesTemporales,$descripcion)
	{
		$link="";
		global $link;

		$regresa="";

		$descripcion=str_replace("%<li>%", "", $descripcion);
		$descripcion=str_replace("%</li>%", "", $descripcion);
		
		$sql="INSERT INTO erroresRevisiones (revisionesTemporales_idrevisionesTemporales,descripcion) VALUES ('".$idrevisionesTemporales."','".$descripcion."')";
		$res=mysql_query($sql);
		
		$regresa=$fil;
		
		return $regresa;
	}


	function guardaErrorModificacion($idmodificaciones,$descripcion)
	{
		$link="";
		global $link;
		
		$sql="INSERT INTO erroresModificaciones (modificaciones_idmodificaciones,descripcion) VALUES ('".$idmodificaciones."','".$descripcion."')";
		$res=mysql_query($sql);
		if(!$res)
			echo "<br>error: <br>".$sql."<br>".mysql_error();
	}



	function guardaErrorMinistracion($idMinistracion,$descripcion)
	{
		$link="";
		global $link;
		
		$sql="INSERT INTO erroresMinistracionesTemporales (ministracionesTemporales_idmodificacionesTemporales,descripcion) VALUES ('".$idMinistracion."','".$descripcion."')";
		$res=mysql_query($sql);
		if(!$res)
			echo "<br>error: <br>".$sql."<br>".mysql_error();
	}


	function guardaErrorRevisionMinistracion($idministracionesTemporales,$descripcion)
	{
		$link="";
		global $link;

		$regresa="";

		
		$sql="INSERT INTO ministracionesTemporales (idministracionesTemporales,descripcion) VALUES ('".$idministracionesTemporales."','".$descripcion."')";
		$res=mysql_query($sql);
		
		
	}


	function dameTotalErroresRevisionMinistracion($idministracionesTemporales)
	{
		$link="";
		global $link;

		$regresa=0;

		
		
		$sql="SELECT COUNT(*) AS total FROM  erroresMinistracionesTemporales WHERE ministracionesTemporales_idmodificacionesTemporales='".$idministracionesTemporales."'";
		$res=mysql_query($sql);
		$fil=mysql_fetch_assoc($res);
		
		$regresa=$fil["total"];
		
		return $regresa;
	}



	function muestraErroresRevision($idrevisionesTemporales,$eliminar=0)
	{
		$link="";
		global $link;

		
		$sql="SELECT * FROM  erroresRevisiones WHERE revisionesTemporales_idrevisionesTemporales='".$idrevisionesTemporales."'";
		$res=mysql_query($sql);
		while($fil=mysql_fetch_assoc($res))
		{
			echo $fil["descripcion"];

			//if($eliminar=1 && !(strpos($fil["descripcion"],"$")===false ||  strpos($fil["descripcion"],"documento")===false ))
			//if($eliminar=1 && !(strpos($fil["descripcion"],"$")===false))
			if($eliminar==1 )
			{
				echo "<br><input class='botonRojoChico' onclick='eliminaError(\"".$fil["iderroresRevisiones"]."\");' type='button' value='Marcar como resuelto'><br><br>";
			}
			echo "<br><br>";
		}
	}

	function muestraErroresModificacion($idmodificaciones)
	{
		$link="";
		global $link;

		
		$sql="SELECT * FROM  erroresModificaciones WHERE modificaciones_idmodificaciones='".$idmodificaciones."'";
		$res=mysql_query($sql);
		while($fil=mysql_fetch_assoc($res))
		{
			echo $fil["descripcion"];
			// if($eliminar=1)
			// {
			// 	echo "&nbsp;&nbsp;<input class='botonRojoChico' onclick='eliminaError(\"".$fil["iderroresRevisiones"]."\");' type='button' value='Marcar como resuelto'>";
			// }
			echo "<br><br>";
		}
	}

	function muestraErroresMinistracion($ministracionesTemporales_idmodificacionesTemporales)
	{

		$link="";
		global $link;

		
		$sql="SELECT * FROM  erroresMinistracionesTemporales WHERE ministracionesTemporales_idmodificacionesTemporales='".$ministracionesTemporales_idmodificacionesTemporales."'";
		$res=mysql_query($sql);
		while($fil=mysql_fetch_assoc($res))
		{
			echo $fil["descripcion"];
			// if($eliminar=1)
			// {
			// 	echo "&nbsp;&nbsp;<input class='botonRojoChico' onclick='eliminaError(\"".$fil["iderroresRevisiones"]."\");' type='button' value='Marcar como resuelto'>";
			// }
			echo "<br><br>";
		}

	}

	function imprimeCabeceraSolicitudMinistracion()
	{
		echo '
			<table align="center" border="1" cellpadding="0" cellspacing="0" style="font-size:10px;">
			  <tr>
			    <th>NO. (*)</th>
			    <th>FOLIO IDENTIFICADOR</th>
			    <th>NOMBRE DEL AHORRADOR</th>
			    <th>REPRESENTANTE LEGAL O ALBACEA O HEREDERO O BENEFICIARIO</th>
			    <th>PARTE SOCIAL</th>
			    <th>CUENTAS  DE AHORRO</th>
			    <th>CUENTAS  DE INVERSIÓN</th>
			    <th>DEPÓSITOS EN GARANTÍA</th>
			    <th>CHEQUES NO COBRADOS</th>
			    <th>OTROS DEPÓSITOS</th>
			    <th>PRÉSTAMOS A CARGO</th>
			    <th>TOTAL (100%)</th>
			    <th>MONTO A MINISTRAR (70%)</th>
			  </tr>
			</table>
		';
	}

	function imprimeCabeceraResumen()
	{
		echo '
			<table align="center" border="1" cellpadding="0" cellspacing="0" style="font-size:10px;">
				  <tr>
				    <th rowspan="2">DESCRIPCIÓN</th>
				    <th rowspan="2">No DE AHORRADORES</th>
				    <th colspan="7">SALDO</th>
				    <th rowspan="2">SALDO NETO DE AHORRO 100%</th>
				    <th rowspan="2">SALDO NETO DE AHORRO 70%</th>
				    <th rowspan="2">MONTO MÁXIMO DE PAGO 100%</th>
				  </tr>
				  <tr>
				    <td align="center">PARTE SOCIAL</td>
				    <td align="center">CUENTA DE AHORRO</td>
				    <td align="center">CUENTA DE INVERSIÓN</td>
				    <td align="center">DEPÓSITOS EN GARANTÍA</td>
				    <td align="center">CHEQUES NO COBRADOS</td>
				    <td align="center">OTROS DEPÓSITOS</td>
				    <td align="center">PRÉSTAMOS A CARGO</td>
				  </tr>
			</table>';
	}


	function imprimeCabeceraAnalitica()
	{
		echo '
			<table align="center" border="1" cellpadding="0" cellspacing="0" style="font-size:8px;">
			  <tr>
			    <th rowspan="3">NUEVO FOLIO IDENTIFICADOR</th>
			    <th rowspan="3">FOLIO IDENTIFICADOR ANTERIOR</th>
			    <th rowspan="3">NOMBRE DEL AHORRADOR</th>
			    <th rowspan="3">CURP</th>
			    <th colspan="21">SALDO</th>
			    <th rowspan="3">SALDO NETO DE AHORRO 100%</th>
			    <th rowspan="3">SALDO NETO DE AHORRO 70%</th>
			    <th rowspan="3">MONTO MÁXIMO DE PAGO 100%</th>
			    <th rowspan="3">CALLE</th>
			    <th rowspan="3">COLONIA</th>
			    <th rowspan="3">DELEGACIÓN O MUNICIPIO</th>
			    <th rowspan="3">TELÉFONO</th>
			  </tr>
			  <tr>
			    <td align="center" colspan="3">PARTE SOCIAL</td>
			    <td align="center" colspan="3">CUENTAS DE AHORRO</td>
			    <td align="center" colspan="3">CUENTAS DE INVERSIÓN</td>
			    <td align="center" colspan="3">DEPÓSITOS EN GARANTÍA</td>
			    <td align="center" colspan="3">CHEQUES NO COBRADOS</td>
			    <td align="center" colspan="3">OTROS DEPÓSITOS</td>
			    <td align="center" colspan="3">PRÉSTAMOS A CARGO</td>
			  </tr>
			  <tr>
			    <td align="center">TIPO DE DOCUMENTO</td>
			    <td align="center">FOLIO</td>
			    <td align="center">IMPORTE</td>
			    <td align="center">TIPO DE DOCUMENTO</td>
			    <td align="center">FOLIO</td>
			    <td align="center">IMPORTE</td>
			    <td align="center">TIPO DE DOCUMENTO</td>
			    <td align="center">FOLIO</td>
			    <td align="center">IMPORTE</td>
			    <td align="center">TIPO DE DOCUMENTO</td>
			    <td align="center">FOLIO</td>
			    <td align="center">IMPORTE</td>
			    <td align="center">TIPO DE DOCUMENTO</td>
			    <td align="center">FOLIO</td>
			    <td align="center">IMPORTE</td>
			    <td align="center">TIPO DE DOCUMENTO</td>
			    <td align="center">FOLIO</td>
			    <td align="center">IMPORTE</td>
			    <td align="center">TIPO DE DOCUMENTO</td>
			    <td align="center">FOLIO</td>
			    <td align="center">IMPORTE</td>
			  </tr>
			</table>
		';
	}


	function imprimerCabeceraConsolidada()
	{
		echo '
		<table align="center" border="1" cellpadding="0" cellspacing="0" style="font-size:10px;">
			<tr>
				<td align="center" rowspan="2">NUEVO FOLIO IDENTIFICADOR</td>
				<td align="center" rowspan="2">FOLIO IDENTIFICADOR ANTERIOR</td>
				<td align="center" rowspan="2">NOMBRE DEL AHORRADOR</td>
				<td align="center" rowspan="2">CURP</td>
				<td align="center" colspan="7">SALDO</td>
				<td align="center" rowspan="2">SALDO NETO DE AHORRO 100 %</td>
				<td align="center" rowspan="2">SALDO NETO DE AHORRO 70 %</td>
				<td align="center" rowspan="2">MONTO MÁXIMO DE PAGO</td>
				<td align="center" rowspan="2">CALLE Y NÚMERO</td>	
				<td align="center" rowspan="2">COLONIA</td>
				<td align="center" rowspan="2">DELEGACIÓN O MUNICIPIO</td>					
				<td align="center" rowspan="2">TELÉFONO</td>					
			</tr>
			<tr>					
				<td align="center">PARTE SOCIAL</td>
				<td align="center">CUENTAS DE AHORRO</td>
				<td align="center">CUENTAS DE INVERSIÓN</td>
				<td align="center">DEPÓSITOS EN GARANTÍA</td>
				<td align="center">CHEQUES NO COBRADOS</td>
				<td align="center">OTROS DEPÓSITOS</td>
				<td align="center">PRÉSTAMOS A CARGO</td>					
			</tr>
		</table>
		';
	}

	function imprimeCuadroAportaciones($revisionTemporal,$porcentajeContingencia="")
	{

		if($porcentajeContingencia=="")
			$porcentajeContingencia=damePorcentajeContingenciaConsolidada($revisionTemporal);

		$totalAhorradores=dameTotalAhorradoresConsolidada($revisionTemporal);
		$montoMaximoDePago=dameMontoBaseConsolidada($revisionTemporal);		

		$montoMaximoDePagoEstado=$montoMaximoDePago*1.00/2.75;
		$montoMaximoDePagoEstado=round($montoMaximoDePagoEstado,2);

		$montoMaximoDePagoFipago=$montoMaximoDePago*1.75/2.75;
		$montoMaximoDePagoFipago=round($montoMaximoDePagoFipago,2);

		$contingenciaEstado=$montoMaximoDePagoEstado*$porcentajeContingencia/100;
		$contingenciaFipago=$montoMaximoDePagoFipago*$porcentajeContingencia/100;

		$totalEstado=$montoMaximoDePagoEstado+$contingenciaEstado;
		$totalFipago=$montoMaximoDePagoFipago+$contingenciaFipago;


		echo '<table cellpadding="0" cellspacing="0"  align="center" sytle="font-size:12px;">';
			echo '<tr>';
				echo '<td colspan="7" class="bordeTabla" align="center" style="font-weight:bold; font-size:16px;">APORTACIONES ESTATALES Y FEDERALES PARA FIRMA DE CONVENIO (MONTOS EN PESOS)</td>';
			echo '</tr>';
			echo '<tr>	';
				echo '<td class="bordeTabla" align="center">CONCEPTO</td>';
				echo '<td class="bordeTabla" align="center">AHORRADORES</td>';
				echo '<td class="bordeTabla" align="center">MONTO MÁXIMO DE PAGO</td>';
				echo '<td class="bordeTabla" align="center">PROPORCIÓN</td>';
				echo '<td class="bordeTabla" align="center">APORTACIONES</td>';
				echo '<td class="bordeTabla" align="center">'.$porcentajeContingencia.'% FONDO DE CONTINGENCIAS</td>';
				echo '<td class="bordeTabla" align="center">CONVENIO</td>';
			echo '</tr>';
			echo '<tr>';
				echo '<td class="bordeTabla">BASES DE DATOS</td>';
				echo '<td class="bordeTabla" align="center">'.$totalAhorradores.'</td>';
				echo '<td class="bordeTabla" align="right">$'.separarMiles($montoMaximoDePago).'</td>';
				echo '<td class="bordeTabla" align="center">-</td>';
				echo '<td class="bordeTabla" align="center">-</td>';
				echo '<td class="bordeTabla" align="center">-</td>';
				echo '<td class="bordeTabla" align="center">-</td>';
			echo '</tr>';
			echo '<tr>';
				echo '<td class="bordeTabla">ENTIDAD FEDEREATIVA</td>';
				echo '<td class="bordeTabla" align="center">-</td>';
				echo '<td class="bordeTabla" align="center">-</td>';
				echo '<td class="bordeTabla" align="center">1.00</td>';
				echo '<td class="bordeTabla" align="right">$'.separarMiles($montoMaximoDePagoEstado).'</td>';
				echo '<td class="bordeTabla" align="right">$'.separarMiles(round($contingenciaEstado,2)).'</td>';
				echo '<td class="bordeTabla" align="right">$'.separarMiles(round($totalEstado,2)).'</td>';
			echo '</tr>';
			echo '<tr>';
				echo '<td class="bordeTabla">FEDERACIÓN</td>';
				echo '<td class="bordeTabla" align="center">-</td>';
				echo '<td class="bordeTabla" align="center">-</td>';
				echo '<td class="bordeTabla" align="center">1.75</td>';
				echo '<td class="bordeTabla" align="right">$'.separarMiles($montoMaximoDePagoFipago).'</td>';
				echo '<td class="bordeTabla" align="right">$'.separarMiles(round($contingenciaFipago,2)).'</td>';
				echo '<td class="bordeTabla" align="right">$'.separarMiles(round($totalFipago,2)).'</td>';
			echo '</tr>';
			echo '<tr>';
				echo '<td class="bordeTabla negritas">TOTAL</td>';
				echo '<td class="bordeTabla negritas" align="center">'.$totalAhorradores.'</td>';
				echo '<td class="bordeTabla negritas" align="right">$'.separarMiles($montoMaximoDePago).'</td>';
				echo '<td class="bordeTabla negritas" align="center">2.75</td>';
				echo '<td class="bordeTabla negritas" align="right">$'.separarMiles($montoMaximoDePagoFipago + $montoMaximoDePagoEstado).'</td>';
				echo '<td class="bordeTabla negritas" align="right">$'.separarMiles(round($contingenciaFipago + $contingenciaEstado,2)).'</td>';
				echo '<td class="bordeTabla negritas" align="right">$'.separarMiles(round($totalFipago + $totalEstado,2)).'</td>';
			echo '</tr>';
		echo '</table><br><br>';

		

	}

	function dameIdRevisionConvenio($idconvenio)
	{
		$sql="SELECT revisionesTemporales_idrevisionesTemporales FROM convenio WHERE idconvenio='".$idconvenio."'";
		$res=mysql_query($sql);
		$fil=mysql_fetch_assoc($res);

		return $fil["revisionesTemporales_idrevisionesTemporales"];
	}

	function dameIdCertificadaConvenio($idconvenio)
	{
		$sql="SELECT idbasesCertificadas FROM basesCertificadas WHERE convenio_idconvenio='".$idconvenio."'";
		$res=mysql_query($sql);
		$fil=mysql_fetch_assoc($res);

		return $fil["idbasesCertificadas"];
	}

	function dameClaveEstadoConvenio($idConvenio)
	{
		$sql="SELECT clave FROM estado INNER JOIN convenio ON estado_idestado=idestado WHERE convenio.idconvenio='".$idConvenio."'";
		
		$res=mysql_query($sql);
		$fil=mysql_fetch_assoc($res);

		return $fil["clave"];
	}

	function dameNombreEstadoConvenio($idConvenio)
	{
		$sql="SELECT nombre FROM estado INNER JOIN convenio ON estado_idestado=idestado WHERE convenio.idconvenio='".$idConvenio."'";
		
		$res=mysql_query($sql);
		$fil=mysql_fetch_assoc($res);

		return $fil["nombre"];
	}

	function dameSociedadDelAhorradorRevision($idconsolidadasTemporales)
	{
		$sql="SELECT nombreAhorrador,revisionesTemporales_idrevisionesTemporales FROM consolidadasTemporales WHERE idconsolidadasTemporales='".$idconsolidadasTemporales."'";
		$res=mysql_query($sql);
		$fil=mysql_fetch_assoc($res);

		$nombreAhorrador=$fil["nombreAhorrador"];
		$idrevisionesTemporales=$fil["revisionesTemporales_idrevisionesTemporales"];

		$sql="SELECT nuevoFolioIdentificador FROM analiticasTemporales WHERE nombreAhorrador='".$nombreAhorrador."'";
		$res=mysql_query($sql);
		$fil=mysql_fetch_assoc($res);

		$folioAhorrador=$fil["nuevoFolioIdentificador"];
		$folioSociedadAhorrador=substr($folioAhorrador,0,3);

		$sociedades=dameSociedadesRevision($idrevisionesTemporales);

		return $sociedades[$folioSociedadAhorrador];
	}

	function dameSociedadesRevision($idrevisionesTemporales)
	{
		// TRAIGO TODAS LAS SOCIEDADES //
		$foliosCajas=array("001","002","003","004","005","006","007","008","009","010","011","012","013","014","015","016","017","018","019","020","021","022","023","024","025","026","027","028","029","030","031","032","033","034","035","036","037","038","039","040","041","042","043","044","045","046","047","048","049","050","051","052","053","054","055","056","057","058","059","060","061","062","063","064","065","066","067","068","069","070");
		
		$sql="SELECT DISTINCT(descripcion) FROM resumenTemporales WHERE revisionesTemporales_idrevisionesTemporales='".$idrevisionesTemporales."' AND UPPER(descripcion)<>'TOTAL' AND descripcion<>'' ORDER BY idresumenTemporales ASC";
		$res=mysql_query($sql);
		$contadorFoliosCajas=0;
		while($fil=mysql_fetch_assoc($res))	
		{
			$folioCaja=$foliosCajas[$contadorFoliosCajas];
			$sociedades[$folioCaja]["nombre"]=$fil["descripcion"];

			//Busco la clave de la sociedad ya insertada
			$sql2="SELECT clave FROM sociedad WHERE nombre='".$fil["descripcion"]."'";
			$res2=mysql_query($sql2);
			$fil2=mysql_fetch_assoc($res2);
			$sociedades[$folioCaja]["clave"]=$fil2["clave"];


			$contadorFoliosCajas++;
		}

		return $sociedades;
	}


	function dameSociedadesConvenio($idconvenio)
	{
		$sql="SELECT * FROM sociedad INNER JOIN convenio_has_sociedad ON idsociedad=sociedad_idsociedad WHERE convenio_idconvenio='".$idconvenio."'";
		$res=mysql_query($sql);
		while($fil=mysql_fetch_assoc($res))
		{
			$sociedades[$fil["clave"]]=$fil["nombre"];
		}

		return $sociedades;
	}


	function dameNumeroConveniosPorEstado($claveEstado,$idconvenio)
	{
		$sql="SELECT COUNT(*) AS total FROM convenio INNER JOIN estado ON idestado=estado_idestado WHERE convenio.idconvenio<>'".$idconvenio."' AND estado.clave='".$claveEstado."'";
		$res=mysql_query($sql);
		$fil=mysql_fetch_assoc($res);


		return $fil["total"];
	}


	function dameIdDocumentos($idrevisionesTemporales)
	{
		global $_REQUEST,$mensaje;
		
		$sqlDocs="SELECT documentosValor_iddocumentosValor,nombre FROM documentosValor INNER JOIN revisionesTemporales_has_documentosValor ON iddocumentosValor=documentosValor_iddocumentosValor WHERE revisionesTemporales_idrevisionesTemporales='".$idrevisionesTemporales."' ORDER BY nombre ASC";
		
		$resDocs=mysql_query($sqlDocs);
		$indice=0;
		while($filDocs=mysql_fetch_assoc($resDocs))
		{
			$regresa[$indice][0]=$filDocs["documentosValor_iddocumentosValor"];
			$regresa[$indice][1]=$filDocs["nombre"];

			$indice++;
		}

		return $regresa;
		
	}

	function dameIdDocumentosSinAgregar($idrevisionesTemporales)
	{
		global $_REQUEST,$mensaje;
		
		$sqlDocs="SELECT iddocumentosValor,nombre FROM documentosValor WHERE iddocumentosValor NOT IN(SELECT documentosValor_iddocumentosValor FROM revisionesTemporales_has_documentosValor WHERE revisionesTemporales_idrevisionesTemporales='".$idrevisionesTemporales."') ORDER BY nombre ASC";
		
		$resDocs=mysql_query($sqlDocs);
		$indice=0;
		while($filDocs=mysql_fetch_assoc($resDocs))
		{
			$regresa[$indice][0]=$filDocs["iddocumentosValor"];
			$regresa[$indice][1]=$filDocs["nombre"];

			$indice++;
		}

		return $regresa;
		
	}



	function dameDocumentos($idrevisionesTemporales)
	{
		global $_REQUEST,$mensaje;
		
		$archivos[]="tipoDocumentoPS";
		$archivos[]="tipoDocumentoCA";
		$archivos[]="tipoDocumentoCI";
		$archivos[]="tipoDocumentoDG";
		$archivos[]="tipoDocumentoCNC";
		$archivos[]="tipoDocumentoOtros";
		$archivos[]="tipoDocumentoPrestamos";
	
		foreach($archivos as $k => $archivo)
		{
			$sql="SELECT DISTINCT(UPPER(".$archivo.")) AS archivo
		          FROM analiticasTemporales 
		          WHERE  revisionesTemporales_idrevisionesTemporales='".$idrevisionesTemporales."' AND ".$archivo."<>''";
			
		   //echo $sql."<br><br>";
			$res=mysql_query($sql);				
			
			while($fil=mysql_fetch_assoc($res))
			{
				$archivosFinales[]=$fil["archivo"];
			}
		}

		//echo "salieron: ".count($archivosFinales)."<br>";

		$archivosFinales=array_unique($archivosFinales);
		$regresa="";

		foreach($archivosFinales as $k => $v)		
			$regresa[]=trim($v);

		return $regresa;
		
	}

	function dameNombreAhorrador($folioIdentificador)
	{
		$sql="SELECT nombre FROM ahorrador WHERE folioIdentificador='".$folioIdentificador."'";
		$res=mysql_query($sql);
		$fil=mysql_fetch_assoc($res);

		return $fil["nombre"];
	}

	function ahorradorEstaBaja($folioIdentificador)
	{
		$sql="SELECT baja FROM ahorrador WHERE folioIdentificador='".$folioIdentificador."'";
		$res=mysql_query($sql);
		$fil=mysql_fetch_assoc($res);

		return $fil["baja"];
	}

	function validaSociedadLigadaAlConvenio($sociedadNuevoAhorrador,$idconvenio)
	{
		$sociedadNuevoAhorrador = ltrim($sociedadNuevoAhorrador, '0');
		$sql="SELECT idsociedad FROM sociedad WHERE clave='".$sociedadNuevoAhorrador."'";
		$res=mysql_query($sql);
		if(mysql_num_rows($res)>0)
		{
			$fil=mysql_fetch_assoc($res);

			$sql2="SELECT COUNT(*) AS total FROM convenio_has_sociedad WHERE sociedad_idsociedad='".$fil["idsociedad"]."'";
			$res2=mysql_query($sql2);
			if(mysql_num_rows($res2)>0)
				return true;
		}

		

		return false;
	}

	function dameIdAhorrador($folioIdentificador)
	{
		$sql="SELECT idahorrador FROM ahorrador WHERE folioIdentificador='".$folioIdentificador."'";
		$res=mysql_query($sql);
		$fil=mysql_fetch_assoc($res);

		return $fil["idahorrador"];
	}


	function muestraCuadroArchivos($idrevisionesTemporales)
	{
		global $_REQUEST,$mensaje;
		
		$archivos[]="tipoDocumentoPS";
		$archivos[]="tipoDocumentoCA";
		$archivos[]="tipoDocumentoCI";
		$archivos[]="tipoDocumentoDG";
		$archivos[]="tipoDocumentoCNC";
		$archivos[]="tipoDocumentoOtros";
		$archivos[]="tipoDocumentoPrestamos";
	
		foreach($archivos as $k => $archivo)
		{
			$sql="SELECT DISTINCT(UPPER(".$archivo.")) AS archivo
		          FROM analiticasTemporales 
		          WHERE  revisionesTemporales_idrevisionesTemporales='".$idrevisionesTemporales."' AND ".$archivo."<>''";
			
			$res=mysql_query($sql);				
			
			while($fil=mysql_fetch_assoc($res))
			{
				$archivosFinales[]=$fil["archivo"];
			}
		}

		$archivosFinales=array_unique($archivosFinales);

		echo "<ol>";
			foreach($archivosFinales as $k => $v)
			{
				echo "<li>".$v."</li>";
			}
		echo "</ol>";


		?>
		<br><br>
		<?php
	}


	function filaEnCeros($fila)
	{
		foreach($fila as $indice => $valor)
		{
			if($valor!=0 && $valor!="")
				return false;
		}

		return true;
	}

	function getNombreBanco($idbancos)
	{
		$link="";
		global $link;
		
		$sql="SELECT nombreCorto FROM  bancos WHERE idbancos='".$idbancos."'";
		$res=mysql_query($sql);
		$fil=mysql_fetch_assoc($res);
		return $fil["nombreCorto"];
	}


	function quitaCaracteresEspeciales($cadena)
	{
		$cadena=str_replace("'","",$cadena);
		$cadena=str_replace('"','',$cadena);

		return $cadena;
	}


	function string_to_ascii($string)
	{
	    
	    for ($i = 0; $i < strlen($string); $i++) 
	    { 
	    	echo "El ascii de ".$string[$i]." es ".ord($string[$i])."<br>";
	    }
	}

	function eliminaAcentos($string) 
	{
		    if ( !preg_match('/[\x80-\xff]/', $string) )
		        return $string;

		    $chars = array(
		    // Decompositions for Latin-1 Supplement
		    chr(195).chr(128) => 'A', chr(195).chr(129) => 'A',
		    chr(195).chr(130) => 'A', chr(195).chr(131) => 'A',
		    chr(195).chr(132) => 'A', chr(195).chr(133) => 'A',
		    chr(195).chr(135) => 'C', chr(195).chr(136) => 'E',
		    chr(195).chr(137) => 'E', chr(195).chr(138) => 'E',
		    chr(195).chr(139) => 'E', chr(195).chr(140) => 'I',
		    chr(195).chr(141) => 'I', chr(195).chr(142) => 'I',
		    chr(195).chr(143) => 'I', chr(195).chr(145) => 'N',
		    chr(195).chr(146) => 'O', chr(195).chr(147) => 'O',
		    chr(195).chr(148) => 'O', chr(195).chr(149) => 'O',
		    chr(195).chr(150) => 'O', chr(195).chr(153) => 'U',
		    chr(195).chr(154) => 'U', chr(195).chr(155) => 'U',
		    chr(195).chr(156) => 'U', chr(195).chr(157) => 'Y',
		    chr(195).chr(159) => 's', chr(195).chr(160) => 'a',
		    chr(195).chr(161) => 'a', chr(195).chr(162) => 'a',
		    chr(195).chr(163) => 'a', chr(195).chr(164) => 'a',
		    chr(195).chr(165) => 'a', chr(195).chr(167) => 'c',
		    chr(195).chr(168) => 'e', chr(195).chr(169) => 'e',
		    chr(195).chr(170) => 'e', chr(195).chr(171) => 'e',
		    chr(195).chr(172) => 'i', chr(195).chr(173) => 'i',
		    chr(195).chr(174) => 'i', chr(195).chr(175) => 'i',
		    chr(195).chr(177) => 'n', chr(195).chr(178) => 'o',
		    chr(195).chr(179) => 'o', chr(195).chr(180) => 'o',
		    chr(195).chr(181) => 'o', chr(195).chr(182) => 'o',
		    chr(195).chr(182) => 'o', chr(195).chr(185) => 'u',
		    chr(195).chr(186) => 'u', chr(195).chr(187) => 'u',
		    chr(195).chr(188) => 'u', chr(195).chr(189) => 'y',
		    chr(195).chr(191) => 'y',
		    // Decompositions for Latin Extended-A
		    chr(196).chr(128) => 'A', chr(196).chr(129) => 'a',
		    chr(196).chr(130) => 'A', chr(196).chr(131) => 'a',
		    chr(196).chr(132) => 'A', chr(196).chr(133) => 'a',
		    chr(196).chr(134) => 'C', chr(196).chr(135) => 'c',
		    chr(196).chr(136) => 'C', chr(196).chr(137) => 'c',
		    chr(196).chr(138) => 'C', chr(196).chr(139) => 'c',
		    chr(196).chr(140) => 'C', chr(196).chr(141) => 'c',
		    chr(196).chr(142) => 'D', chr(196).chr(143) => 'd',
		    chr(196).chr(144) => 'D', chr(196).chr(145) => 'd',
		    chr(196).chr(146) => 'E', chr(196).chr(147) => 'e',
		    chr(196).chr(148) => 'E', chr(196).chr(149) => 'e',
		    chr(196).chr(150) => 'E', chr(196).chr(151) => 'e',
		    chr(196).chr(152) => 'E', chr(196).chr(153) => 'e',
		    chr(196).chr(154) => 'E', chr(196).chr(155) => 'e',
		    chr(196).chr(156) => 'G', chr(196).chr(157) => 'g',
		    chr(196).chr(158) => 'G', chr(196).chr(159) => 'g',
		    chr(196).chr(160) => 'G', chr(196).chr(161) => 'g',
		    chr(196).chr(162) => 'G', chr(196).chr(163) => 'g',
		    chr(196).chr(164) => 'H', chr(196).chr(165) => 'h',
		    chr(196).chr(166) => 'H', chr(196).chr(167) => 'h',
		    chr(196).chr(168) => 'I', chr(196).chr(169) => 'i',
		    chr(196).chr(170) => 'I', chr(196).chr(171) => 'i',
		    chr(196).chr(172) => 'I', chr(196).chr(173) => 'i',
		    chr(196).chr(174) => 'I', chr(196).chr(175) => 'i',
		    chr(196).chr(176) => 'I', chr(196).chr(177) => 'i',
		    chr(196).chr(178) => 'IJ',chr(196).chr(179) => 'ij',
		    chr(196).chr(180) => 'J', chr(196).chr(181) => 'j',
		    chr(196).chr(182) => 'K', chr(196).chr(183) => 'k',
		    chr(196).chr(184) => 'k', chr(196).chr(185) => 'L',
		    chr(196).chr(186) => 'l', chr(196).chr(187) => 'L',
		    chr(196).chr(188) => 'l', chr(196).chr(189) => 'L',
		    chr(196).chr(190) => 'l', chr(196).chr(191) => 'L',
		    chr(197).chr(128) => 'l', chr(197).chr(129) => 'L',
		    chr(197).chr(130) => 'l', chr(197).chr(131) => 'N',
		    chr(197).chr(132) => 'n', chr(197).chr(133) => 'N',
		    chr(197).chr(134) => 'n', chr(197).chr(135) => 'N',
		    chr(197).chr(136) => 'n', chr(197).chr(137) => 'N',
		    chr(197).chr(138) => 'n', chr(197).chr(139) => 'N',
		    chr(197).chr(140) => 'O', chr(197).chr(141) => 'o',
		    chr(197).chr(142) => 'O', chr(197).chr(143) => 'o',
		    chr(197).chr(144) => 'O', chr(197).chr(145) => 'o',
		    chr(197).chr(146) => 'OE',chr(197).chr(147) => 'oe',
		    chr(197).chr(148) => 'R',chr(197).chr(149) => 'r',
		    chr(197).chr(150) => 'R',chr(197).chr(151) => 'r',
		    chr(197).chr(152) => 'R',chr(197).chr(153) => 'r',
		    chr(197).chr(154) => 'S',chr(197).chr(155) => 's',
		    chr(197).chr(156) => 'S',chr(197).chr(157) => 's',
		    chr(197).chr(158) => 'S',chr(197).chr(159) => 's',
		    chr(197).chr(160) => 'S', chr(197).chr(161) => 's',
		    chr(197).chr(162) => 'T', chr(197).chr(163) => 't',
		    chr(197).chr(164) => 'T', chr(197).chr(165) => 't',
		    chr(197).chr(166) => 'T', chr(197).chr(167) => 't',
		    chr(197).chr(168) => 'U', chr(197).chr(169) => 'u',
		    chr(197).chr(170) => 'U', chr(197).chr(171) => 'u',
		    chr(197).chr(172) => 'U', chr(197).chr(173) => 'u',
		    chr(197).chr(174) => 'U', chr(197).chr(175) => 'u',
		    chr(197).chr(176) => 'U', chr(197).chr(177) => 'u',
		    chr(197).chr(178) => 'U', chr(197).chr(179) => 'u',
		    chr(197).chr(180) => 'W', chr(197).chr(181) => 'w',
		    chr(197).chr(182) => 'Y', chr(197).chr(183) => 'y',
		    chr(197).chr(184) => 'Y', chr(197).chr(185) => 'Z',
		    chr(197).chr(186) => 'z', chr(197).chr(187) => 'Z',
		    chr(197).chr(188) => 'z', chr(197).chr(189) => 'Z',
		    chr(197).chr(190) => 'z', chr(197).chr(191) => 's'
		    );

		    $string = strtr($string, $chars);

		    return $string;
	}


?>