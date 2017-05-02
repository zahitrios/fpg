<?php

	include_once ("conf/functions.php");
	validarSession();

	
	
	$sql[]="TRUNCATE convenio_has_ahorrador";
	$sql[]="TRUNCATE ahorrador";
	
	
	$sql[]="TRUNCATE capacitacion";
	$sql[]="TRUNCATE ahorrador_has_documentosIdentidad";
	$sql[]="TRUNCATE documentosIdentidad";
	$sql[]="TRUNCATE ahorradorParteSocial";
	$sql[]="TRUNCATE ahorradorCuentasAhorro";
	$sql[]="TRUNCATE ahorradorCuentasInversion";
	$sql[]="TRUNCATE ahorradorOtrosDepositos";
	$sql[]="TRUNCATE ahorradorDepositosGarantia";
	$sql[]="TRUNCATE ahorradorChequesNoCobrados";
	$sql[]="TRUNCATE ahorradorPrestamosCargo";

	$sql[]="TRUNCATE historicoAhorrador";
	$sql[]="TRUNCATE historicoAhorradorParteSocial";
	$sql[]="TRUNCATE historicoAhorradorOtrosDepositos";
	$sql[]="TRUNCATE historicoAhorradorChequesNoCobrados";
	$sql[]="TRUNCATE historicoAhorradorCuentasInversion";
	$sql[]="TRUNCATE historicoAhorradorCuentasAhorro";
	$sql[]="TRUNCATE historicoAhorradorPrestamosCargo";
	$sql[]="TRUNCATE historicoAhorradorDepositosGarantia";



	$sql[]="UPDATE convenio SET statusConvenio_idstatusConvenio=1";


	foreach($sql as $k => $v)
	{
		if(mysql_query($v))
			echo "done!<br>";
		else
		{
			echo "error: <br>".$v."<br>".mysql_error()."<br>";
		}
	}


?>