function barbarendorf(){
	if(document.getElementById('aX_barbar').checked){
		var alles = document.getElementsByTagName("input");
		for(var i=0;i<alles.length;i++){
			if(alles[i].size == 5){
				alles[i].disabled = true;
			}
		}
	}
	else{
		var alles = document.getElementsByTagName("input");
		for(var i=0;i<alles.length;i++){
			if(alles[i].size == 5){
				alles[i].disabled = false;
			}
		}
	}
}
