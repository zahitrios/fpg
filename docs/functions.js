function Handle_OnConfirmInsert(sender,args)
{
	var _row = args["TableView"];
	
	str = JSON.stringify(_row);
	str = JSON.stringify(_row, null, 4); // (Optional) beautiful indented output.

	console.log(str); // Logs output to dev tools console.
}
