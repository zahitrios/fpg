var handler;

function Handle_OnRowClick(sender,args)
{
	var _row = args["Row"];
	var _event = args["Event"];
	var idministracionesTemporales=_row.getDataItem()["idministracionesTemporales"];
	

	location.href='./?a=muestraResumenReporte&idministracionesTemporales='+idministracionesTemporales;

}


function cancelaMinistracion(md5)
{
	var idministracionesTemporalesMd5=md5;

	$.ajax({url: "functions.php?a=cancelaMinistracion&i="+idministracionesTemporalesMd5, success: function(result)
    {   
        alert(result);        
    }});
    cargaModulo('mins');
}



$(function() { //shorthand document.ready function
    $('#formulario').on('submit', function(e) { //use on if jQuery 1.7+
        e.preventDefault();  
        document.getElementById("cargando").style.display="block";
        this.submit();
    });
});


