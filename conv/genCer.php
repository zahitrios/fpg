<?php

	session_start();

	include_once ("../conf/functions.php");
	include_once ("../lib/spout-master/src/Spout/Autoloader/autoload.php"); 

	use Box\Spout\Writer\WriterFactory;
	use Box\Spout\Common\Type;
	use Box\Spout\Writer\Style\StyleBuilder;
	use Box\Spout\Writer\Style\Color;

	validarSession();
	ob_start();
	$_SESSION["language_select"] = "es";
	$idusuarios=dameIdUserMd5($_SESSION["i"]); 		
	if(usuarioTieneModulo($idusuarios,5)===false)//Valido que el usuario tenga el modulo de convenios
	{
		echo "SU USUARIO NO PUEDE REALIZAR ESTA ACCION";
		die;
	}

	$idConvenio=$_REQUEST["i"];

	//fipago.org.s217829.gridserver.com/conv/genCer2.php?i=c4ca4238a0b923820dcc509a6f75849b

	$sql="SELECT * FROM convenio WHERE MD5(idconvenio)='".$idConvenio."'";
	
	$res=mysql_query($sql);
	$convenio=mysql_fetch_assoc($res);

	$sql="SELECT idbasesCertificadas FROM basesCertificadas WHERE convenio_idconvenio='".$convenio["idconvenio"]."'";
	$res=mysql_query($sql);
	$fil=mysql_fetch_assoc($res);
	$idbasesCertificadas=$fil["idbasesCertificadas"];




	$filePath="../downFiles/".$convenio["idconvenio"].".xls";

	//Creo el archivo
	$writer = WriterFactory::create(Type::XLSX); // for XLSX files
	$writer->openToFile($filePath); // write data to a file or to a PHP stream

	$firstSheet = $writer->getCurrentSheet();
	$sheet = $writer->getCurrentSheet();
	












	

	

	//Busco los registros de la consolidada
	$sql="SELECT nuevoFolioIdentificador,folioIdentificadorAnterior, nombreAhorrador, curp, parteSocial, cuentasAhorro, cuentasInversion, depositosGarantia, chequesNoCobrados, otrosDepositos, prestamosACargo, saldoNeto100, saldoNeto70, montoMaximoPago, calleYNumero, colonia, delegacionMunicipio, telefono, hojaDocumentoOriginal, filaDocumentoOriginal FROM consolidadasCertificadas WHERE basesCertificadas_idbasesCertificadas='".$idbasesCertificadas."' ORDER BY idconsolidadasCertificadas ASC";
	$res=mysql_query($sql);
	$contador=0;
	$foliosConsolidada="";
	while($fil=mysql_fetch_assoc($res))
	{			
		if($contador==0)
		{
			$sheet->setName($fil["hojaDocumentoOriginal"]);

			$filasParaAnadir=$fil["filaDocumentoOriginal"]-2;
			for($i=0;$i<$filasParaAnadir;$i++)
			{
				$fila=Array("","","");
				$writer->addRow($fila); 
			}

			//Pongo la cabecera de la consolidada
			$fila=Array("NUEVO FOLIO IDENTIFICADOR","FOLIO IDENTIFICADOR ANTERIOR","NOMBRE DEL AHORRADOR","CURP","PARTE SOCIAL","CUENTAS DE AHORRO","CUENTAS DE INVERSIÓN","DEPÓSITOS EN GARANTÍA","CHEQUES NO COBRADOS","OTROS DEPÓSITOS","PRÉSTAMOS A CARGO","SALDO NETO DE AHORRO 100 %","SALDO NETO DE AHORRO 70 %","MONTO MÁXIMO DE PAGO","CALLE Y NÚMERO","COLONIA","DELEGACIÓN O MUNICIPIO","TELÉFONO");
			$writer->addRow($fila); 
		}



		$fila="";
		//Busco el nuevo folio del ahorrador
		$sqlAho="SELECT folioIdentificador FROM  ahorrador INNER JOIN convenio_has_ahorrador ON idahorrador=ahorrador_idahorrador WHERE convenio_idconvenio='".$convenio["idconvenio"]."' AND nombre='".$fil["nombreAhorrador"]."'";
		$resAho=mysql_query($sqlAho);
		$filAho=mysql_fetch_assoc($resAho);
		$fila[]=$filAho["folioIdentificador"];
		$foliosConsolidada[]=$filAho["folioIdentificador"];

		foreach($fil as $campo => $valor)
		{
			if($campo!="nuevoFolioIdentificador" && $campo!="hojaDocumentoOriginal" && $campo!="filaDocumentoOriginal")
				$fila[]=$valor;
		}
		$writer->addRow($fila); 
		$contador++;
	}






















	//Pongo la cabecera de la analítica
	$newSheet = $writer->addNewSheetAndMakeItCurrent();
	$sheet = $writer->getCurrentSheet();

	

	//Busco los registros de la analítica
	$sql="SELECT hojaDocumentoOriginal,filaDocumentoOriginal,nuevoFolioIdentificador,folioIdentificadorAnterior,nombreAhorrador,curp,tipoDocumentoPS, folioPS, importePS, tipoDocumentoCA, folioCA, importeCA, tipoDocumentoCI, folioCI, importeCI, tipoDocumentoDG, folioDG, importeDG, tipoDocumentoCNC, folioCNC, importeCNC, tipoDocumentoOtros, folioOtros, importeOtros, tipoDocumentoPrestamos, folioPrestamos, importePrestamos,saldoNeto100,saldoNeto70,montoMaximoPago,calleYNumero,colonia,delegacionMunicipio,telefono FROM analiticasCertificadas WHERE basesCertificadas_idbasesCertificadas='".$idbasesCertificadas."' ORDER BY idanaliticasCertificadas ASC"; 
	$res=mysql_query($sql);
	$contador=0;
	$indiceFolios=0;
	while($fil=mysql_fetch_assoc($res))
	{	
		if($contador==0)
		{
			$sheet->setName($fil["hojaDocumentoOriginal"]);
			$filasParaAnadir=$fil["filaDocumentoOriginal"]-2;

			for($i=0;$i<$filasParaAnadir;$i++)
			{
				$fila=Array("","","");
				$writer->addRow($fila); 
			}

			$fila=Array("NUEVO FOLIO IDENTIFICADOR","FOLIO IDENTIFICADOR ANTERIOR","NOMBRE DEL AHORRADOR","CURP","TIPO DE DOCUMENTO PS","FOLIO PS","IMPORTE PS","TIPO DE DOCUMENTO CA","FOLIO CA","IMPORTE CA","TIPO DE DOCUMENTO CI","FOLIO CI","IMPORTE CI","TIPO DE DOCUMENTO DG","FOLIO DG","IMPORTE DG","TIPO DE DOCUMENTO CNC","FOLIO CNC","IMPORTE CNC","TIPO DE DOCUMENTO OD","FOLIO OD","IMPORTE OD","TIPO DE DOCUMENTO PC","FOLIO PC","IMPORTE PC","SALDO NETO DE AHORRO 100%","SALDO NETO DE AHORRO 70%","MONTO MÁXIMO DE PAGO 100%","CALLE","COLONIA","DELEGACIÓN O MUNICIPIO","TELÉFONO");
			$writer->addRow($fila); 

		}


		$fila="";
		if($fil["nuevoFolioIdentificador"]!="")
		{
			$fila[]=$foliosConsolidada[$indiceFolios];
			$indiceFolios++;
		}
		else
		{
			$fila[]="";
		}

		foreach($fil as $campo => $valor)
		{
			if($campo!="nuevoFolioIdentificador" && $campo!="hojaDocumentoOriginal" && $campo!="filaDocumentoOriginal")
				$fila[]=$valor;
		}
		$writer->addRow($fila); 
		$contador++;
	}























	$newSheet = $writer->addNewSheetAndMakeItCurrent();
	$sheet = $writer->getCurrentSheet();



	// //Pongo el estado, convenio y numero de sociedades
	// $nombreEstado=dameNombreEstadoConvenio($convenio["idconvenio"]);
	// $fila=Array("","","Entidad federativa: ".$nombreEstado);
	// $writer->addRow($fila); 

	// $fila=Array("","","Convenio: ".$convenio["idconvenio"]);
	// $writer->addRow($fila);

	// $fila=Array("","","Sociedad (es)/Asociación (es):");
	// $writer->addRow($fila); 

	// $sociedadesResumen=dameSociedadesConvenio($convenio["idconvenio"]);
	// foreach($sociedadesResumen as $folio => $nombreBase)
	// {
	// 	$fila=Array("","","",$nombreBase);
	// 	$writer->addRow($fila); 
	// }
	
	// $fila=Array("","","","");
	// $writer->addRow($fila); 

	// //Pongo la cabecera de la resumen
	// $fila=Array("DESCRIPCIÓN","No DE AHORRADORES","PARTE SOCIAL","CUENTA DE AHORRO","CUENTA DE INVERSIÓN","DEPÓSITOS EN GARANTÍA","CHEQUES NO COBRADOS","OTROS DEPÓSITOS","PRÉSTAMOS A CARGO","SALDO NETO DE AHORRO 100%","SALDO NETO DE AHORRO 70%","MONTO MÁXIMO DE PAGO 100%");
	// $writer->addRow($fila); 

	//Busco todos los registros de la base de resumen
	$sql="SELECT hojaDocumentoOriginal, filaDocumentoOriginal, descripcion, noAhorradores, parteSocial, cuentaAhorro, cuentaInversion, depositosGarantia, chequesNoCobrados, otrosDepositos, prestamosCargo, saldoNetoAhorro100, saldoNetoAhorro70, montoMaximoPago FROM  resumenCertificadas WHERE  basesCertificadas_idbasesCertificadas='".$idbasesCertificadas."' ORDER BY idresumenCertificadas ASC";
	$res=mysql_query($sql);
	$contador=0;
	while($fil=mysql_fetch_assoc($res))
	{	
		if($contador==0)
		{
			$sheet->setName($fil["hojaDocumentoOriginal"]);

			$filasParaAnadir=$fil["filaDocumentoOriginal"]-1;
			for($i=0;$i<$filasParaAnadir;$i++)
			{
				$fila=Array("","","");
				$writer->addRow($fila); 
			}

		}

		$fila="";
		$filAux=$fil;
		foreach($fil as $campo => $valor)
		{
			if($campo!="hojaDocumentoOriginal" && $campo!="filaDocumentoOriginal")
			{
				
				if(strrpos(strtoupper($filAux["noAhorradores"]),"MENORES")===false &&  strrpos(strtoupper($filAux["noAhorradores"]),"MAYORES")===false )
					$fila[]=$valor;

				else if($valor!="0")
				{
					$fila[]=$valor;
				}

			}
		}

		if(filaEnCeros($fila)==false)
		 	$writer->addRow($fila); 
		

		$contador++;
	}
	 


	$fila=Array("","","","");
	$writer->addRow($fila); 
	$fila=Array("","","","");
	$writer->addRow($fila); 

	$style = (new StyleBuilder())
           ->setFontSize(10)
           ->setShouldWrapText()           
           ->build();

	//Pongo la leyenda en la de resumen
	$fila=Array("EL QUE SUSCRIBE: ______________________________________________________________EN MI CARÁCTER DE RESPONSABLE ESTATAL TITULAR DEL GOBIERNO DE ESTADO LIBRE Y SOBERANO DE  _______________________________________, CON LAS FACULTADES QUE ME CONFIERE EN LA CLAUSULA___________________ DEL CONVENIO DE COORDINACIÓN SUSCRITO EL __ DE _________________ DE 20__ POR EL GOBIERNO DEL ESTADO DE ______________________________, CON NACIONAL FINANCIERA , S.N.C. COMO FIDUCIARIA DEL FIDEICOMISO QUE ADMINISTRA EL FONDO PARA EL FORTALECIMIENTO DE SOCIEDADES Y COOPERATIVAS DE AHORRO Y PRESTAMO  Y DE APOYO A SUS AHORRADORES (FIDEICOMISO). HAGO CONSTAR Y CERTIFICO QUE LAS BASE DE DATOS QUE SE ENTREGAN COMO RESULTADO DE LOS TRABAJOS DE AUDITORIA CONTABLE, QUE ESTE DOCUMENTO IMPRESO CONSTA DE ____ HOJAS UTILES, CON VALOR DE $_______ __ ( _________) Y RUBRICO EN CADA UNA DE ELLAS, ESTAS BASES DE DATOS HAN SIDO DEBIDAMENTE AUDITADAS Y VALIDADAS POR EL DESPACHO CACHON VILLASEÑOR CONSULTORES S.C EN CALIDAD DE AUDITOR EXTERNO Y CONTIENEN EL PADRON DE AHORRADORES PLENAMENTE IDENTIFICADOS Y QUE ES FUNDAMENTAL PARA LLEVAR A CABO LA DETERMINACIÓN Y LIQUIDACIÓN DEL PAGO DEL SALDO NETO DE AHORRO CORRESPONDIENTE. ANEXO DISCO COMPACTO (CD) PARA COMPLEMENTAR LOS REQUERIMIENTOS DEL FIDEICOMISO, PARA LOS EDECTOS NECESARIOS LA PRESENTE CERTIFICACIÓN SE FIRMA EL __ DE  ___________________ DE __ HAGO CONSTAR Y CERTIFICO QUE LAS BASE DE DATOS QUE SE ENTREGAN COMO RESULTADO DE LOS TRABAJOS DE AUDITORIA CONTABLE, QUE ESTE DOCUMENTO IMPRESO CONSTA DE ____ HOJAS UTILES, CON VALOR DE $_______ __ ( _________) Y RUBRICO EN CADA UNA DE ELLAS, ESTAS BASES DE DATOS HAN SIDO DEBIDAMENTE AUDITADAS Y VALIDADAS POR EL DESPACHO CACHON VILLASEÑOR CONSULTORES S.C EN CALIDAD DE AUDITOR EXTERNO Y CONTIENEN EL PADRON DE AHORRADORES PLENAMENTE IDENTIFICADOS Y QUE ES FUNDAMENTAL PARA LLEVAR A CABO LA DETERMINACIÓN Y LIQUIDACIÓN DEL PAGO DEL SALDO NETO DE AHORRO CORRESPONDIENTE. ANEXO DISCO COMPACTO (CD) PARA COMPLEMENTAR LOS REQUERIMIENTOS DEL FIDEICOMISO, PARA LOS EDECTOS NECESARIOS LA PRESENTE CERTIFICACIÓN SE FIRMA EL __ DE  ___________________ DE __");




	$writer->addRowWithStyle($fila,$style); 




	 $writer->close();









	
    $finfo = finfo_open(FILEINFO_MIME_TYPE);
    header('Content-Type: ' . finfo_file($finfo, $filePath));
    finfo_close($finfo);
    
    header('Content-Disposition: attachment; filename='.basename($filePath));
    
    header('Expires: 0');
    header('Cache-Control: must-revalidate');
    header('Pragma: public');

    header('Content-Length: ' . filesize($filePath));

    ob_clean();
    flush();
    readfile($filePath);
    exit;
?>