<?php

	$cadena="INSERT INTO consolidadasTemporales (	revisionesTemporales_idrevisionesTemporales, nuevoFolioIdentificador, folioIdentificadorAnterior, nombreAhorrador,curp, parteSocial, cuentasAhorro, cuentasInversion, depositosGarantia, chequesNoCobrados, otrosDepositos, prestamosACargo, saldoNeto100, saldoNeto70, montoMaximoPago, calleYNumero, colonia, delegacionMunicipio, telefono, filaDocumentoOriginal,hojaDocumentoOriginal ) VALUES ( '2', '00101350', '', 'ANIMAL'S FEEDS S.A. DE C.V.', '', '0', '0', '81.29', '0', '0', '0', '0', '81.29', '56.903', '56.903', '', '', '','' ,'1365','Consolidada' )";

	echo "sin<br>";
	echo $cadena;


	echo "<br>entities<br>";
	echo str_replace("'","",$cadena);



?>