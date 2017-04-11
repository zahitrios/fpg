<?php

	session_start();

	include_once ("../conf/functions.php");
	include_once ("../lib/spout-master/src/Spout/Autoloader/autoload.php"); 

	use Box\Spout\Writer\WriterFactory;
	use Box\Spout\Common\Type;

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
	$sheet->setName('Consolidada');
	

	//Pongo la cabecera de la consolidada

	$fila=Array("NUEVO FOLIO IDENTIFICADOR","FOLIO IDENTIFICADOR ANTERIOR","NOMBRE DEL AHORRADOR","CURP","PARTE SOCIAL","CUENTAS DE AHORRO","CUENTAS DE INVERSIÓN","DEPÓSITOS EN GARANTÍA","CHEQUES NO COBRADOS","OTROS DEPÓSITOS","PRÉSTAMOS A CARGO","SALDO NETO DE AHORRO 100 %","SALDO NETO DE AHORRO 70 %","MONTO MÁXIMO DE PAGO","CALLE Y NÚMERO","COLONIA","DELEGACIÓN O MUNICIPIO","TELÉFONO");
	$writer->addRow($fila); // add a row at a time


	//Busco los registros de la consolidada
	$sql="SELECT nuevoFolioIdentificador,folioIdentificadorAnterior, nombreAhorrador, curp, parteSocial, cuentasAhorro, cuentasInversion, depositosGarantia, chequesNoCobrados, otrosDepositos, prestamosACargo, saldoNeto100, saldoNeto70, montoMaximoPago, calleYNumero, colonia, delegacionMunicipio, telefono FROM consolidadasCertificadas WHERE basesCertificadas_idbasesCertificadas='".$idbasesCertificadas."'";
	$res=mysql_query($sql);
	while($fil=mysql_fetch_assoc($res))
	{	
		$fila="";

		//Busco el nuevo folio del ahorrador
		$sqlAho="SELECT folioIdentificador FROM  ahorrador INNER JOIN convenio_has_ahorrador ON idahorrador=ahorrador_idahorrador WHERE convenio_idconvenio='".$convenio["idconvenio"]."' AND nombre='".$fil["nombreAhorrador"]."'";
		$resAho=mysql_query($sqlAho);
		$filAho=mysql_fetch_assoc($resAho);
		$fila[]=$filAho["folioIdentificador"];

		foreach($fil as $campo => $valor)
		{
			if($campo!="nuevoFolioIdentificador")
				$fila[]=$valor;
		}
		$writer->addRow($fila); // add a row at a time
	}


	




	//$newSheet = $writer->addNewSheetAndMakeItCurrent();


	$writer->close();







	 //Get file type and set it as Content Type
    $finfo = finfo_open(FILEINFO_MIME_TYPE);
    header('Content-Type: ' . finfo_file($finfo, $filePath));
    finfo_close($finfo);

    //Use Content-Disposition: attachment to specify the filename
    header('Content-Disposition: attachment; filename='.basename($filePath));

    //No cache
    header('Expires: 0');
    header('Cache-Control: must-revalidate');
    header('Pragma: public');

    //Define file size
    header('Content-Length: ' . filesize($filePath));

    ob_clean();
    flush();
    readfile($filePath);
    exit;





	
?>