<?php
	
	require_once '../lib/spout-master/src/Spout/Autoloader/autoload.php'; 

	use Box\Spout\Reader\ReaderFactory;
	use Box\Spout\Common\Type;

	function insertRegistros($idcontenedoresTemporales,$file,$filaInicial)
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
				       	$sqlInsert="INSERT INTO registrosContenadores 
				       				(
				       				numero,
				       				folioIdentificador,
				       				nombreAhorrador,
				       				representanteAlbacea,
				       				importeExpediente,
				       				importeMinistrado,
				       				contenedoresTemporales_idcontenedoresTemporales
				       				) 
				       				VALUES 
				       				(
				       					'".$registro[0]."',
					       				'".$registro[1]."',
					       				'".$registro[2]."',
					       				'".$registro[3]."',
					       				'".$registro[4]."',
					       				'".$registro[5]."',
					       				'".$idcontenedoresTemporales."' 
				       				) "; 
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






	function getNumeroContenedor($file)
	{
		$reader = ReaderFactory::create(Type::XLSX); 
		$reader->open($file);
		$indiceRegresa=0;
		$regresa="";
		$fila=1;

		foreach ($reader->getSheetIterator() as $sheet) 
		{	
			foreach ($sheet->getRowIterator() as $row) 
		    {	
	    		if(trim(strtoupper($row[4]))=="CONTENEDOR NO.:")
	    		{
	    			$regresa=$row[5];
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
			foreach ($sheet->getRowIterator() as $row) 
		    {	
	    		if(trim(strtoupper($row[0]))=="ENTIDAD FEDERATIVA:")
	    		{	
	    			$regresa=$row[1];
	    			$reader->close();
					return $regresa;
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