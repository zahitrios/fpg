<?php
	
	require_once '../lib/spout-master/src/Spout/Autoloader/autoload.php'; 

	use Box\Spout\Reader\ReaderFactory;
	use Box\Spout\Common\Type;

	function insertRegistrosModificaciones($file,$hoja,$filaInicial,$filaFinal)
	{
		$reader = ReaderFactory::create(Type::XLSX); 
		$reader->open($file);
		$indiceRegresa=0;

		foreach ($reader->getSheetIterator() as $sheet) 
		{
			$sheetName = $sheet->getName();
			
			if($sheetName== $hoja)
			{
				$fila=1;
				foreach ($sheet->getRowIterator() as $row) 
			    {
			    	if($fila>=$filaInicial && $fila<=$filaFinal)
			    	{
			    		foreach($row as $k => $v)
				        {
				        	$regresa[$indiceRegresa][]=$v;				        	
				        }
				        $regresa[$indiceRegresa][]=$fila;
				        $indiceRegresa++;				        
			    	}
			        
			        $fila++;
			    }
			}
		}
		$reader->close();

		return $regresa;
	}


	function getAllRegistros($file,$hoja,$tipo)
	{
		$reader = ReaderFactory::create(Type::XLSX); 
		$reader->open($file);
		$indiceRegresa=0;

		if($tipo=="consolidada")
			$columnaMaxima=15;
		else if($tipo=="analitica")
			$columnaMaxima=29;


		foreach ($reader->getSheetIterator() as $sheet) 
		{
			$sheetName = $sheet->getName();
			
			if($sheetName==$hoja)
			{
				$fila=1;
				foreach ($sheet->getRowIterator() as $row) 
			    {			    	
			    	$columna=0;			    		
		    		foreach($row as $k => $v)
			        {			        	
			        	$regresa[$indiceRegresa][]=$v;	
			        	$columna++;	
			        	if($columna>$columnaMaxima)
			        		break;
			        }
			        $regresa[$indiceRegresa][]=$fila;
			        $indiceRegresa++;	
			        
			        $fila++;
			    }
			}
		}
		$reader->close();

		return $regresa;
	}


	function dameUltimaFilaArchivo($file,$hoja)
	{
		$reader = ReaderFactory::create(Type::XLSX); 
		$reader->open($file);
		$regresa=Array();

		foreach ($reader->getSheetIterator() as $sheet) 
		{
			$sheetName = $sheet->getName();
			
			if($sheetName==$hoja)
			{
				foreach ($sheet->getRowIterator() as $row) 
			    {	
		    		foreach($row as $k => $v)
			        {	
			        	if(strtoupper(trim($v[3]))=="TOTAL DICE:")
			        		$regresa["dice"]=$v;
			        	if(strtoupper(trim($v[3]))=="TOTAL DEBE DECIR:")
			        		$regresa["debeDecir"]=$v;
			        }
			    }
			}
		}
		$reader->close();

		return $regresa;
	}


?>