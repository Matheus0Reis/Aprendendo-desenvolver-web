function showinfo(v,u,ox,oy){
	$("#info").css("visibility","visible");
	$("#info").load('villages_info.php?v='+v+'&u='+u+'&ox='+ox+'&oy='+oy);	
}
function hideinfo(x){
	$("#info").css("visibility","hidden");
};
function toggle_settings(u){
	$("#map_settings").load('map_settings.php?u='+u);	
	if ($('#map_settings').css('display') === 'none') {
    	$('#map_settings').show('slow');
	}else{
		$('#map_settings').hide('slow');
	}
}
$('#popup_toggle').click(function() {
	if ($('#map_settings').css('display') === 'none') {
    $('#map_settings').show('slow');
}else{
	$('#map_settings').hide('slow');
}
});
function check(u,name,value){
	$.ajax({
  		url: "map_settings_update.php?u="+u+"&name="+name+"&value="+value,
	});
}
function addcheck(u,name){
	if ($("#"+name).is(":checked")){
		check(u,name,1);
	}else{      
		check(u,name,0);
	}
}
function expandCollapse() {
    for (var i=0; i<expandCollapse.arguments.length; i++) {
        var element = document.getElementById(expandCollapse.arguments[i]);
        element.style.display = (element.style.display == "none") ? "block" : "none";
    }
}