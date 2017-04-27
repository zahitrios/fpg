var handler;

function Handle_OnRowClick(sender,args)
{
	var _row = args["Row"];
	var _event = args["Event"];
	var idcontenedoresTemporales=_row.getDataItem()["idcontenedoresTemporales"];
	

	location.href='./?a=muestraResumenReporte&idcontenedoresTemporales='+idcontenedoresTemporales;

}




$(function() { //shorthand document.ready function
    $('#formulario').on('submit', function(e) { //use on if jQuery 1.7+
        e.preventDefault();  
        document.getElementById("cargando").style.display="block";
        this.submit();
    });
});


