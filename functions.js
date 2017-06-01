//var ruta="/~fipago/";
var ruta="/~dev/";

function cargaModulo(modulo)
{

	if(modulo=="logout")
	{
		location.href=ruta+'?a=lg';
	}

	else if(modulo=="home")
	{
		location.href=ruta+'home.php';
	}

	else
	{
		location.href=ruta+modulo;
	}
}

function muestraOculta(id)
{
	if(document.getElementById(id).style.display=="block")
		document.getElementById(id).style.display="none";
	else
		document.getElementById(id).style.display="block";
}


function convertirCuadroAimagen(div)
{
	var node = document.getElementById(div);
  	domtoimage.toJpeg(node, { quality: 1 }).then(function (dataUrl) 
  	{
        var link = document.createElement('a');
        link.download = 'cuadroDeAportaciones.jpeg';
        link.href = dataUrl;
        link.click();
    }).catch(function (error) {
        console.error('oops, something went wrong!', error);
    });

}