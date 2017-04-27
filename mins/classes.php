<?php
	
	require_once '../lib/spout-master/src/Spout/Autoloader/autoload.php'; 

	use Box\Spout\Reader\ReaderFactory;
	use Box\Spout\Common\Type;

	function insertRegistros($idministracionesTemporales,$file,$filaInicial)
	{
		$reader = ReaderFactory::create(Type::XLSX); 
		$reader->open($file);
		
		foreach ($reader->getSheetIterator() as $sheet) 
		{
			$sheetName = $sheet->getName();
			
			$fila=1;
			foreach ($sheet->getRowIterator() as $row) 
		    {
		    	//if($fila>=$filaInicial && $fila<=$filaFinal && !filaVacia($row))
		    	if($fila>=$filaInicial )
		    	{
		    		$registro=Array();
		    		foreach($row as $k => $v)
			        {
			        	$registro[]=$v;				        	
			        }
			        $registro[]=$fila;

			        if(trim($registro[0])!="")
			        {
				       	$sqlInsert="INSERT INTO registrosMinistraciones (ministracionesTemporales_idministracionesTemporales, numero, folioIdentificador, nombreAhorrador, representanteAlbacea, parteSocial, cuentasAhorro, cuentasInversion, depositosGarantia, chequesNoCobrados, otrosDepositos, prestamosCargo, saldoTotal, montoMinistrar ) VALUES ('".$idministracionesTemporales."', '".$registro[0]."', '".$registro[1]."', '".$registro[2]."', '".$registro[3]."', '".$registro[4]."', '".$registro[5]."', '".$registro[6]."', '".$registro[7]."', '".$registro[8]."', '".$registro[9]."', '".$registro[10]."', '".$registro[11]."', '".$registro[12]."') "; 
				       	$resInsert=mysql_query($sqlInsert);
					    if(!$resInsert)
					    {
					    	echo "error: <br>".mysql_error()."<br>".$sqlInsert;
					    	die;
					    }
					}
		    	}		        
		        $fila++;
		     }
			
			break;
		}
		$reader->close();
	}




	function getAllRegistros($file,$cuantos)
	{
		$reader = ReaderFactory::create(Type::XLSX); 
		$reader->open($file);
		$indiceRegresa=0;
		$regresa=Array();


		foreach ($reader->getSheetIterator() as $sheet) 
		{			
			$fila=1;
			foreach ($sheet->getRowIterator() as $row) 
		    {		
		    	if(($fila>=1 && $fila<=$cuantos) || $cuantos==0) //Cuando voy a ingresar	    				    		
		    	{
		    		foreach($row as $k => $v)
		    		{
			        	$regresa[$indiceRegresa][]=$v;
			        	//echo $fila.".- ".$k." -> ".$v."<br>";
		    		}

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
			break;
		}

		$reader->close();
		return $regresa;
	}






	function getNumeroLote($file)
	{
		$reader = ReaderFactory::create(Type::XLSX); 
		$reader->open($file);
		$indiceRegresa=0;
		$regresa="";

		foreach ($reader->getSheetIterator() as $sheet) 
		{	
			foreach ($sheet->getRowIterator() as $row) 
		    {	
	    		if($row[7]!="")
	    		{
	    			$regresa=$row[7];
	    			$reader->close();
					return $regresa;
	    		}
		    }
		}

		$reader->close();
		return $regresa;
	}



	function getEstado($file)
	{
		$reader = ReaderFactory::create(Type::XLSX); 
		$reader->open($file);
		$indiceRegresa=0;
		$regresa="";

		foreach ($reader->getSheetIterator() as $sheet) 
		{	
			$fila=1;
			foreach ($sheet->getRowIterator() as $row) 
		    {	
	    		if($fila==4)
	    		{
	    			$regresa=$row[3];
	    			$reader->close();
					return $regresa;
	    		}
	    		$fila++;
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