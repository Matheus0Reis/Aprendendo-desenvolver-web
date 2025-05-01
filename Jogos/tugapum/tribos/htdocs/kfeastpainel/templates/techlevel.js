function checken (status, anzahl)
{
	var browser = navigator.appName;
	if(browser == "Microsoft Internet Explorer")
	{
		for(var i = 1; i <= anzahl; i++)
		{
			type = status ? false : true;
			var name = "document.all."+i+".checked";
			if(status)
			{
				name = true;
			}
			else
			{
				name = false;
			}
		}
	}
	else
	{
		for(var i = 1; i <= anzahl; i++)
    	{
			if(status)
			{
    	    	document.getElementById(i).checked = true;
			}
			else
			{
				document.getElementById(i).checked = false;
			}
		}
	}
}