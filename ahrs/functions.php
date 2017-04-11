<?php
	session_start();
	include_once ("../conf/functions.php");
	validarSession();
	ob_start();

	$_SESSION["language_select"] = "es";

	$idusuarios=dameIdUserMd5($_SESSION["i"]);
	if(usuarioTieneModulo($idusuarios,12)===false)//Valido que el usuario tenga el modulo de ahorradores
	{
		echo "SU USUARIO NO PUEDE REALIZAR ESTA ACCION";
		die;
	}

	$a=$_REQUEST["a"];

	switch($a)
	{
		case 'muestraSaldosAhorrador':
			muestraSaldosAhorrador();
		break;
	}


	function muestraSaldosAhorrador()
	{
		global $_REQUEST;

		$folioIdentificador=$_REQUEST["fI"];

		// BUSCO EL ID DEL AHORRADOR //
		$sql="SELECT idahorrador,nombre FROM ahorrador WHERE folioIdentificador='".$folioIdentificador."'";
		$res=mysql_query($sql);
		$fil=mysql_fetch_assoc($res);
		$idahorrador=$fil["idahorrador"];
		$nombre=$fil["nombre"];

		echo "MOSTRANDO DETALLES EN SALDOS DEL AHORRADOR <br><strong>".$nombre."</strong><br>".$folioIdentificador."<br><br>";

		

		// BUSCO LOS DETALLES DEL AHORRADOR //
		$tablas=Array('ahorradorParteSocial','ahorradorCuentasAhorro','ahorradorCuentasInversion','ahorradorOtrosDepositos','ahorradorDepositosGarantia','ahorradorChequesNoCobrados','ahorradorPrestamosCargo');
		$leyendas=Array('Parte Social','Cuentas de Ahorro','Cuentas de Inversión','Otros Depósitos','Depósitos en Garantía','Cheques no cobrados','Préstamos a cargo');
		
		foreach($tablas as $indice => $tabla)
		{
			$sql="SELECT * FROM ".$tabla." WHERE ahorrador_idahorrador='".$idahorrador."'";
			
			$res=mysql_query($sql);
			if(mysql_num_rows($res)>0)
			{
				echo $leyendas[$indice];
				echo "<ul>";
					while($fil=mysql_fetch_assoc($res))
					{
						echo "<li>Tipo de documento: <strong>".$fil["tipoDocumento"]."</strong> - Folio: <strong>".$fil["folio"]."</strong> - Importe: <strong>$ ".separarMiles($fil["importe"])."</strong></li>";
					}
				echo "</ul>";
			}
		}
	}

?>