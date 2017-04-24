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
		$sql="SELECT idahorrador,nombre,montoAl100,montoAl70,montoMaximo FROM ahorrador WHERE folioIdentificador='".$folioIdentificador."'";
		$res=mysql_query($sql);
		$fil=mysql_fetch_assoc($res);
		$idahorrador=$fil["idahorrador"];
		$nombre=$fil["nombre"];
		$montoAl100=$fil["montoAl100"];
		$montoAl70=$fil["montoAl70"];
		$montoMaximo=$fil["montoMaximo"];

		$saldoPendiente=round(dameSaldoParaMinistrarAhorrador($folioIdentificador),2);
		$saldoMinistrado=round($montoMaximo-$saldoPendiente,2);



		echo "MOSTRANDO DETALLES EN SALDOS DEL AHORRADOR <br>";
		echo "<strong>".$nombre."</strong><br>";		
		echo $folioIdentificador."<br>";
		echo "Saldo al 100%: $ ".separarMiles($montoAl100)."<br>";
		echo "Saldo al 70%: $ ".separarMiles($montoAl70)."<br>";
		echo "Monto máximo de pago: $ ".separarMiles($montoAl70)."<br><br>";

		echo "Saldo ministraddo: $ ".separarMiles($saldoMinistrado)."<br>";
		echo "Saldo pendiente para ministrar: $ ".separarMiles($saldoPendiente)."<br>";
		echo "<br><br>";

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

		echo "<br><br>";
		//BUSCO SI EL AHORRADOR HA SIDO MINISTRADO
		$sql="SELECT * FROM ahorradoresMinistrados INNER JOIN registrosMinistraciones ON idregistrosMinistraciones=registrosMinistraciones_idregistrosMinistraciones INNER JOIN ministracionesTemporales ON idministracionesTemporales=ministracionesTemporales_idministracionesTemporales WHERE ahorrador_idahorrador='".$idahorrador."'";
		$res=mysql_query($sql);
		if(mysql_num_rows($res)>0)
		{
			echo "<strong>EL AHORRADOR CUENTA CON MINISTRACIONES</strong><br><br>";
			while($fil=mysql_fetch_assoc($res))
			{
				echo "<span class='separador'></span>";
				echo "Lote de ministración: ".$fil["lote"]."<br>";
				echo "Monto ministrado: $ ".separarMiles($fil["montoMinistrado"])."<br>";
				echo "Saldo actual pendiente de ministrar: $ ".separarMiles(dameSaldoParaMinistrarAhorrador($fil["folioIdentificador"]))."<br>";
				echo "<br>";
			}
		}
		else
		{
			echo "<strong>EL AHORRADOR NO HA SIDO MINISTRADO</strong>";
		}
	}

?>