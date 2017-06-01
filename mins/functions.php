<?php
	session_start();
	include_once ("../conf/functions.php");
	validarSession();
	ob_start();

	$_SESSION["language_select"] = "es";

	$idusuarios=dameIdUserMd5($_SESSION["i"]);
	if(usuarioTieneModulo($idusuarios,16)===false)//Valido que el usuario tenga el modulo de ministraciones
	{
		echo "SU USUARIO NO PUEDE REALIZAR ESTA ACCION";
		die;
	}

	$a=$_REQUEST["a"];

	switch($a)
	{
		case 'cancelaMinistracion':
			cancelaMinistracion();
		break;
	}


	function cancelaMinistracion()
	{
		global $_REQUEST;

		$idministracionesTemporalesMd5=$_REQUEST["i"];

		//TRAIGO LA MINISTRACION
		$sql="SELECT * FROM ministracionesTemporales WHERE MD5(idministracionesTemporales)='".$idministracionesTemporalesMd5."'";
		$res=mysql_query($sql);
		if(mysql_num_rows($res)==1)
		{
			$fil=mysql_fetch_assoc($res);
			$statusMinistracion=$fil["statusMinistracion_idstatusMinistracion"];

			if($statusMinistracion==1)//SOLO SI ESTA EN REVISIÓN PUEDE SER CANCELADA
			{
				$sql2="UPDATE ministracionesTemporales SET statusMinistracion_idstatusMinistracion=5 WHERE MD5(idministracionesTemporales)='".$idministracionesTemporalesMd5."'";
				$res2=mysql_query($sql2);
				if($res)
					echo "La ministración ha sido cancelada";
				else
					echo "Ocurrió un error al cancelar la ministración";
			}
			else
				echo "La ministración seleccionada no puede ser cancelada";
		}
		else
		{
			echo "La ministración seleccionada no puede ser cancelada";
		}



	}



?>	