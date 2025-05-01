<?php

if (isset($_GET["run"])) {
	reload_all_village_points();
	reload_all_ally_points();
	reload_all_player_points();
	reload_ally_rangs();
	reload_player_rangs(); 
	
	$tpl->assign("notice", "done");
}
?>