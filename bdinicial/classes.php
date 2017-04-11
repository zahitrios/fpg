<?php
	
	require_once '../lib/spout-master/src/Spout/Autoloader/autoload.php'; 

	use Box\Spout\Reader\ReaderFactory;
	use Box\Spout\Common\Type;

	function insertRegistros($tipo,$idrevisionesTemporales,$file,$hoja,$filaInicial,$filaFinal)
	{
		$reader = ReaderFactory::create(Type::XLSX); 
		$reader->open($file);
		
		foreach ($reader->getSheetIterator() as $sheet) 
		{
			$sheetName = $sheet->getName();
		
			if(trim($sheetName)== trim($hoja))
			{
				$fila=1;
				foreach ($sheet->getRowIterator() as $row) 
			    {
			    	//if($fila>=$filaInicial && $fila<=$filaFinal && !filaVacia($row))
			    	if($fila>=$filaInicial && $fila<=$filaFinal)
			    	{
			    		$registro=Array();
			    		foreach($row as $k => $v)
				        {
				        	$registro[]=$v;				        	
				        }
				        $registro[]=$fila;

				        if($tipo=="consolidadasTemporales")				        
				        	 $sqlInsert="INSERT INTO consolidadasTemporales (revisionesTemporales_idrevisionesTemporales, nuevoFolioIdentificador, folioIdentificadorAnterior, nombreAhorrador,curp, parteSocial, cuentasAhorro, cuentasInversion, depositosGarantia, chequesNoCobrados, otrosDepositos, prestamosACargo, saldoNeto100, saldoNeto70, montoMaximoPago, calleYNumero, colonia, delegacionMunicipio, telefono, filaDocumentoOriginal,hojaDocumentoOriginal ) VALUES ('".$idrevisionesTemporales."', '".quitaCaracteresEspeciales($registro[0])."', '".quitaCaracteresEspeciales($registro[1])."', '".quitaCaracteresEspeciales($registro[2])."', '".quitaCaracteresEspeciales($registro[3])."', '".quitaCaracteresEspeciales($registro[4])."', '".quitaCaracteresEspeciales($registro[5])."', '".quitaCaracteresEspeciales($registro[6])."', '".quitaCaracteresEspeciales($registro[7])."', '".quitaCaracteresEspeciales($registro[8])."', '".quitaCaracteresEspeciales($registro[9])."', '".quitaCaracteresEspeciales($registro[10])."', '".quitaCaracteresEspeciales($registro[11])."', '".quitaCaracteresEspeciales($registro[12])."', '".quitaCaracteresEspeciales($registro[13])."', '".quitaCaracteresEspeciales($registro[14])."', '".quitaCaracteresEspeciales($registro[15])."', '".quitaCaracteresEspeciales($registro[16])."','".quitaCaracteresEspeciales($registro[17])."' ,'".$registro[count($registro)-1]."','".$hoja."')"; 
			    	
			    		else if($tipo=="analiticasTemporales")	
			    			$sqlInsert="INSERT INTO analiticasTemporales (revisionesTemporales_idrevisionesTemporales, nuevoFolioIdentificador, folioIdentificadorAnterior, nombreAhorrador, curp, tipoDocumentoPS, folioPS, importePS, tipoDocumentoCA, folioCA, importeCA, tipoDocumentoCI, folioCI, importeCI, tipoDocumentoDG, folioDG, importeDG, tipoDocumentoCNC, folioCNC, importeCNC, tipoDocumentoOtros, folioOtros, importeOtros, tipoDocumentoPrestamos, folioPrestamos, importePrestamos, saldoNeto100, saldoNeto70, montoMaximoPago, calleYNumero, delegacionMunicipio,colonia, telefono, filaDocumentoOriginal,hojaDocumentoOriginal ) VALUES ('".$idrevisionesTemporales."', '".quitaCaracteresEspeciales($registro[0])."', '".quitaCaracteresEspeciales($registro[1])."', '".quitaCaracteresEspeciales($registro[2])."', '".quitaCaracteresEspeciales($registro[3])."', '".quitaCaracteresEspeciales($registro[4])."', '".quitaCaracteresEspeciales($registro[5])."', '".quitaCaracteresEspeciales($registro[6])."', '".quitaCaracteresEspeciales($registro[7])."', '".quitaCaracteresEspeciales($registro[8])."', '".quitaCaracteresEspeciales($registro[9])."', '".quitaCaracteresEspeciales($registro[10])."', '".quitaCaracteresEspeciales($registro[11])."', '".quitaCaracteresEspeciales($registro[12])."', '".quitaCaracteresEspeciales($registro[13])."', '".quitaCaracteresEspeciales($registro[14])."', '".quitaCaracteresEspeciales($registro[15])."', '".quitaCaracteresEspeciales($registro[16])."', '".quitaCaracteresEspeciales($registro[17])."', '".quitaCaracteresEspeciales($registro[18])."', '".quitaCaracteresEspeciales($registro[19])."', '".quitaCaracteresEspeciales($registro[20])."', '".quitaCaracteresEspeciales($registro[21])."', '".quitaCaracteresEspeciales($registro[22])."', '".quitaCaracteresEspeciales($registro[23])."', '".quitaCaracteresEspeciales($registro[24])."', '".quitaCaracteresEspeciales($registro[25])."', '".quitaCaracteresEspeciales($registro[26])."', '".quitaCaracteresEspeciales($registro[27])."', '".quitaCaracteresEspeciales($registro[28])."', '".quitaCaracteresEspeciales($registro[29])."','".quitaCaracteresEspeciales($registro[30])."','".quitaCaracteresEspeciales($registro[31])."','".$registro[count($registro)-1]."','".$hoja."')";

			    		else if($tipo=="resumenTemporales")
			    			$sqlInsert="INSERT INTO resumenTemporales (revisionesTemporales_idrevisionesTemporales, descripcion, noAhorradores, parteSocial, cuentaAhorro, cuentaInversion, depositosGarantia, chequesNoCobrados, otrosDepositos, prestamosCargo, saldoNetoAhorro100, saldoNetoAhorro70, montoMaximoPago, filaDocumentoOriginal,hojaDocumentoOriginal ) VALUES ('".$idrevisionesTemporales."','".quitaCaracteresEspeciales($registro[0])."','".quitaCaracteresEspeciales($registro[1])."','".quitaCaracteresEspeciales($registro[2])."','".quitaCaracteresEspeciales($registro[3])."','".quitaCaracteresEspeciales($registro[4])."','".quitaCaracteresEspeciales($registro[5])."','".quitaCaracteresEspeciales($registro[6])."','".quitaCaracteresEspeciales($registro[7])."','".quitaCaracteresEspeciales($registro[8])."','".quitaCaracteresEspeciales($registro[9])."','".quitaCaracteresEspeciales($registro[10])."','".quitaCaracteresEspeciales($registro[11])."','".$registro[count($registro)-1]."','".$hoja."')";

			    		else if($tipo=="consolidadasCertificadas")
			    			$sqlInsert="INSERT INTO consolidadasCertificadas (basesCertificadas_idbasesCertificadas, nuevoFolioIdentificador, folioIdentificadorAnterior, nombreAhorrador, curp, parteSocial, cuentasAhorro, cuentasInversion, depositosGarantia, chequesNoCobrados, otrosDepositos, prestamosACargo, saldoNeto100, saldoNeto70, montoMaximoPago, calleYNumero, colonia, delegacionMunicipio, telefono, filaDocumentoOriginal, hojaDocumentoOriginal ) VALUES ('".$idrevisionesTemporales."', '".quitaCaracteresEspeciales($registro[0])."', '".quitaCaracteresEspeciales($registro[1])."', '".quitaCaracteresEspeciales($registro[2])."', '".quitaCaracteresEspeciales($registro[3])."', '".quitaCaracteresEspeciales($registro[4])."', '".quitaCaracteresEspeciales($registro[5])."', '".quitaCaracteresEspeciales($registro[6])."', '".quitaCaracteresEspeciales($registro[7])."', '".quitaCaracteresEspeciales($registro[8])."', '".quitaCaracteresEspeciales($registro[9])."', '".quitaCaracteresEspeciales($registro[10])."', '".quitaCaracteresEspeciales($registro[11])."', '".quitaCaracteresEspeciales($registro[12])."', '".quitaCaracteresEspeciales($registro[13])."', '".quitaCaracteresEspeciales($registro[14])."', '".quitaCaracteresEspeciales($registro[15])."', '".quitaCaracteresEspeciales($registro[16])."', '".quitaCaracteresEspeciales($registro[17])."' , '".$registro[count($registro)-1]."', '".$hoja."')";

			    		else if($tipo=="analiticasCertificadas")
			    			$sqlInsert="INSERT INTO analiticasCertificadas (basesCertificadas_idbasesCertificadas, nuevoFolioIdentificador, folioIdentificadorAnterior, nombreAhorrador, curp, tipoDocumentoPS, folioPS, importePS, tipoDocumentoCA, folioCA, importeCA, tipoDocumentoCI, folioCI, importeCI, tipoDocumentoDG, folioDG, importeDG, tipoDocumentoCNC, folioCNC, importeCNC, tipoDocumentoOtros, folioOtros, importeOtros, tipoDocumentoPrestamos, folioPrestamos, importePrestamos, saldoNeto100, saldoNeto70, montoMaximoPago, calleYNumero, delegacionMunicipio,colonia, telefono, filaDocumentoOriginal,hojaDocumentoOriginal ) VALUES ('".$idrevisionesTemporales."', '".quitaCaracteresEspeciales($registro[0])."', '".quitaCaracteresEspeciales($registro[1])."', '".$registro[2]."', '".$registro[3]."', '".$registro[4]."', '".$registro[5]."', '".$registro[6]."', '".$registro[7]."', '".$registro[8]."', '".$registro[9]."', '".$registro[10]."', '".$registro[11]."', '".$registro[12]."', '".$registro[13]."', '".$registro[14]."', '".$registro[15]."', '".$registro[16]."', '".$registro[17]."', '".$registro[18]."', '".$registro[19]."', '".$registro[20]."', '".$registro[21]."', '".$registro[22]."', '".$registro[23]."', '".$registro[24]."', '".$registro[25]."', '".$registro[26]."', '".$registro[27]."', '".$registro[28]."', '".$registro[29]."','".$registro[30]."','".$registro[31]."','".$registro[count($registro)-1]."','".$hoja."')";

			    		else if($tipo=="resumenCertificadas")
			    			$sqlInsert="INSERT INTO resumenCertificadas (basesCertificadas_idbasesCertificadas, descripcion, noAhorradores, parteSocial, cuentaAhorro, cuentaInversion, depositosGarantia, chequesNoCobrados, otrosDepositos, prestamosCargo, saldoNetoAhorro100, saldoNetoAhorro70, montoMaximoPago, filaDocumentoOriginal,hojaDocumentoOriginal ) VALUES ('".$idrevisionesTemporales."','".$registro[0]."','". $registro[1]."','". $registro[2]."','". $registro[3]."','". $registro[4]."','". $registro[5]."','". $registro[6]."','". $registro[7]."','". $registro[8]."','". $registro[9]."','". $registro[10]."','". $registro[11]."','". $registro[count($registro)-1]."','".$hoja."')";
			    		
			    		$resInsert=mysql_query($sqlInsert);
					    if(!$resInsert)
					    {
					    	echo "error: <br>".mysql_error()."<br>".$sqlInsert;
					    	die;
					    }
			    	}			        
			        $fila++;
			     }
			}
		}
		$reader->close();
	}






	function getAllRegistros($file,$hoja,$cuantos)
	{
		$reader = ReaderFactory::create(Type::XLSX); 
		$reader->open($file);
		$indiceRegresa=0;


		foreach ($reader->getSheetIterator() as $sheet) 
		{
			$sheetName = $sheet->getName();			
			if($sheetName==$hoja)
			{
				$fila=1;
				foreach ($sheet->getRowIterator() as $row) 
			    {		
			    	if(($fila>=1 && $fila<=$cuantos) || $cuantos==0) //Cuando voy a ingresar	    				    		
			    	{
			    		foreach($row as $k => $v)
				        	$regresa[$indiceRegresa][]=$v;

				        $regresa[$indiceRegresa][]=$fila;
			        	$indiceRegresa++;				        
			    	}
			        $fila++;
			        if($fila>$cuantos && $cuantos>0)
			        {
			        	$reader->close();
						return $regresa;
			        }
			    }			    
			}
		}

		$reader->close();
		return $regresa;
	}


	function getFilaFinal($file,$hoja,$tipo)
	{
		$reader = ReaderFactory::create(Type::XLSX); 
		$reader->open($file);		
		$regresa=0;
		$resumenTotales=0;

		if($tipo=="consolidada")
		{
			$columnaBuscar=2;
			$cadenaBuscar="TOTAL";
		}
		else if($tipo=="analitica")
		{
			$columnaBuscar=2;
			$cadenaBuscar="TOTAL";
		}
		else if($tipo=="resumen")
		{
			$columnaBuscar=0;
			$cadenaBuscar="TOTAL";
		}



		foreach ($reader->getSheetIterator() as $sheet) 
		{
			$sheetName = $sheet->getName();			
			if($sheetName==$hoja)
			{
				$fila=1;
				foreach ($sheet->getRowIterator() as $row) 
			    {	
			    	if(strtoupper(trim($row[$columnaBuscar]))==$cadenaBuscar)
			    	{
			    		if($tipo!="resumen" || ($tipo=="resumen"  &&  $resumenTotales==2))
			    		{
			    			$regresa=$fila;
			    			$reader->close();
							return $regresa;
						}
						else
						{
							$resumenTotales++;
						}
			    	}				       
				    $fila++;	        	
			    }			    
			}
		}

		$reader->close();
		return $regresa;
	}








	function filaVacia($fila)
	{
		foreach($fila as $k => $v)
			if(trim($v)!="")
				return false;

		return true;
	}


?>