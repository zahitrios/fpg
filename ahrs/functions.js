function Handle_OnRowSelect(sender,args)
{
	var _row = args["Row"];
	var _res =document.getElementById("res");
	var folioIdentificador=_row.getDataItem()["folioIdentificador"];
	
	//alert(folioIdentificador);
	//cargo el cuadrodeaportaciones
	$.ajax({url: "functions.php?a=muestraSaldosAhorrador&fI="+folioIdentificador, success: function(result)
    {   
    	document.getElementById("draggable").style.display="none";
        document.getElementById("draggable").innerHTML='<img id="botonCerrar" src="../img/cerrar.png" onclick="oculta(\'draggable\');">'+result;
        document.getElementById("draggable").style.display="block";
        
    }});

	//	cargaModulo("conv/functions.php?a=formEdit&i="+idconvenio);
}


function oculta(idelemento)
{
	document.getElementById(idelemento).style.display="none";
}



$(function(){
    $( "#draggable" ).draggable();
});