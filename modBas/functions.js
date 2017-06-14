function Handle_OnRowClick(sender,args)
{
	var _row = args["Row"];
	var _event = args["Event"];
	var idmodificaciones=_row.getDataItem()["idmodificaciones"];
	//alert (idrevisionesTemporales);

	location.href='./?a=muestraResumenReporte&idmodificaciones='+idmodificaciones+'&readOnly=1';

}

function Handle_OnCellClick(sender,args)
{
	var _cell = args["Cell"];
	var _event = args["Event"];

	console.log(_cell.getData());

	//console.log(_cell)
	
}

function depurarRevisiones()
{
	location.href='./?a=purify';
}


function eliminaError(iderroresRevisiones)
{
	location.href='./?a=eliminaError&id='+iderroresRevisiones;	
}






$(function() { //shorthand document.ready function
    $('#formulario').on('submit', function(e) { //use on if jQuery 1.7+
        e.preventDefault();  
        document.getElementById("cargando").style.display="block";
        this.submit();
    });
});

