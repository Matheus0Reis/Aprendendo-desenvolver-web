<?php
/***************************
/ Flüchtlingslager Spezial /
/       Version 2.1        /
/    coded by netbuster    /
/**************************/
define("fluela_version","2.1");
$units = array();
foreach($cl_units->get_array('name') AS $dbname=>$name) {
    $units[$dbname]['name'] = $name;
    $units[$dbname]['std_einheiten'] = 0;
}
$buildings = array();
foreach($cl_builds->get_array('name') AS $dbname=>$name) {
    $buildings[$dbname]['name'] = $name;
    $lvl = 0;
    if($name == "Hauptgebäude" or $name == "Versammlungsplatz" or $name == "Bauernhof" or $name == "Speicher" or $name == "Versteck"){
    	$lvl = 1;
    } 
    $buildings[$dbname]['std_lvl'] = $lvl;
}
//
//
//Checke auf neue Version
if($_GET['action'] == "version"){
$check_v = @file("http://ds-lan.de/index.php?page=Thread&threadID=897");
$check_v = join("*newline*",$check_v);
preg_match_all('/ Spezial V(.*) - Tools - DS Lan Support/',$check_v,$versionen);
$version = $versionen[1][0];
$new_version = "<b>Flüchtlingslager Spezial Version:</b> ".fluela_version."<br />
<b>Flüchtlingslager Spezial Version im Internet:</b> ".$version."<br />";
if($version > fluela_version){
	$new_version .= "<font class='error'>Die Fl&uuml;chtlingslager Version ".$version." ist draußen. Check this out: <a href='http://ds-lan.de/index.php?page=Thread&postID=9441' target='_new'>DSLan Support Forum</a>!</font>";
}
else{
	$new_version .= "Deine Version ist die aktuellste!";	
}
}
//
//
//Fl&uuml;chtlingslager erstellen
//
//
if($_GET["action"] == "" or $_GET["action"] == "creater"){
	$aktion_output = "create";
//Hier der Part, an dem die Fl&uuml;chtlingslager erstellt werden
if($_POST['welche_akt'] == "Erstellen"){
	$num = $_POST["num"];
	//Checke ob richtige Anzahl an zu erstellenden Fl&uuml;chtlingslagern.
	if($num > 0 and $num < 251){
		//Erstelle dann die D&ouml;rfer ;)
		for($u=0;$u<$num;$u++){
			create_village(-1,'',"random");
			$result = $db->query("SELECT * FROM villages WHERE userid='-1' ORDER BY id DESC");
			$row = $db->Fetch($result);
			$last_id = $row["id"];
			$sql = "";
			$i = 0;
			foreach($cl_builds->get_array('name') AS $dbname=>$name){
				if($i > 0) $sql .= ",";
				$sql .= $dbname."='".$_POST[$dbname]."'";
				$i++;
			}
			
			foreach($cl_units->get_array('name') AS $dbname=>$name){
				$sql .= ",all_".$dbname."='".$_POST[$dbname]."'";
			}
			$db->query("UPDATE villages SET ".$sql." WHERE id='".$last_id."'");
			reload_village_points($last_id);
			if($_POST["barbar"] == "yes"){
				$result = $db->query("SELECT points FROM villages WHERE id='".$last_id."'");
				$new_row = $db->Fetch($result);
				$db->query("UPDATE villages SET name='Aldeia de Barbaros',all_unit_spear='".$new_row["points"]."',all_unit_sword='".$new_row["points"]."' WHERE id='".$last_id."'");
				$db->query("UPDATE unit_place SET unit_spear='".$new_row["points"]."',unit_sword='".$new_row["points"]."' WHERE villages_from_id='".$last_id."'");
			}
			else{
				$db->query("UPDATE villages SET name='Aldeia de Barbaros' WHERE id='".$last_id."'");
			}
		}
		$success = true;
	}
	else{
		$error = "Pode ser criada no maximo 250 aldeias ou no minimo 1;";
	}
}
if($_POST['welche_akt'] == "Bearbeiten"){
		//Erstelle dann die D&ouml;rfer ;)
			$result = $db->query("SELECT * FROM villages WHERE id='".$_POST['vid']."' ORDER BY id DESC");
			$row = $db->Fetch($result);
			$last_id = $row["id"];
			$sql = "";
			$i = 0;
			foreach($cl_builds->get_array('name') AS $dbname=>$name){
				if($i > 0) $sql .= ",";
				$sql .= $dbname."='".$_POST[$dbname]."'";
				$i++;
			}
			
			foreach($cl_units->get_array('name') AS $dbname=>$name){
				$sql .= ",all_".$dbname."='".$_POST[$dbname]."'";
			}
			$db->query("UPDATE villages SET ".$sql." WHERE id='".$last_id."'");
			reload_village_points($last_id);
			if($_POST["barbar"] == "yes"){
				$result = $db->query("SELECT points FROM villages WHERE id='".$last_id."'");
				$new_row = $db->Fetch($result);
				$db->query("UPDATE villages SET name='Aldeia de Barbaros',all_unit_spear='".$new_row["points"]."',all_unit_sword='".$new_row["points"]."' WHERE id='".$last_id."'");
				$db->query("UPDATE unit_place SET unit_spear='".$new_row["points"]."',unit_sword='".$new_row["points"]."' WHERE villages_from_id='".$last_id."'");
			}
			else{
				$db->query("UPDATE villages SET name='Aldeia de Barbaros' WHERE id='".$last_id."'");
			}
		  $success = true;
}
}
//
//
//Fl&uuml;chtlingslager bearbeiten
//
//
if($_GET['action'] == "editmes"){
	$output = '<table class="vis" widht="300">
			<tr>
				<th colspan="2">Aldeias de Barbaros para editar</th>
			</tr>';
	$result = $db->query("SELECT * FROM villages WHERE userid='-1' ORDER by id ASC");
	while($row = $db->Fetch($result)){
		$add ="";
		if($row['name'] == "Barbarendorf"){
			$add = "<img src='../graphic/unit/unit_axe.png'>";
		}
		$output .= "<tr><td>#".$row['id']." ".$add."</td><td>".$row['x']."|".$row['y']."</td><td><a href='index.php?screen=fluela_special&action=edit&id=".$row['id']."'>".$row['points']." Pontos</a></td></tr>";
	}
	$output .= "</table><br /><br />
	<small><img src='../graphic/unit/unit_axe.png'> * Apenas aldeias de barbaros!</small>";
}
//
//
//Fl&uuml;chtlingslager einzeln bearbeiten
//
//
if($_GET['action'] == "edit"){
	$aktion_output = "edit";
	$result = $db->query("SELECT * FROM villages WHERE id='".htmlspecialchars($_GET['id'])."'");
	$dorf = $db->Fetch($result);
	//Checke ob verlassenes dorf
	if($dorf["userid"] == "-1"){
		$tpl->assign('id',$dorf["id"]);
		$tpl->assign('xy',$dorf["x"].'|'.$dorf["y"]);
		$tpl->assign('points',$dorf["points"]);
		//Neu den Array generieren
		$buildings = array();
		foreach($cl_builds->get_array('name') AS $dbname=>$name) {
		    $buildings[$dbname]['name'] = $name;
		    $lvl = 0;
		    if($name == "Hauptgebäude" or $name == "Versammlungsplatz" or $name == "Bauernhof" or $name == "Speicher" or $name == "Versteck"){
		    	$lvl = 1;
		    } 
		    $buildings[$dbname]['std_lvl'] = $dorf[$dbname];
		}
		$units = array();
		foreach($cl_units->get_array('name') AS $dbname=>$name) {
		    $units[$dbname]['name'] = $name;
		    $units[$dbname]['std_einheiten'] = $dorf['all_'.$dbname];
		}
		
		if($dorf["name"] == "Barbarendorf")
		$dowhattodo = "document.getElementById('aX_barbar').checked = true; barbarendorf();";
	}
}
$tpl->assign('buildings',$buildings);
$tpl->assign('units',$units);
$tpl->assign('error',$error);
$tpl->assign('success',$success);
$tpl->assign('aktion',$aktion_output);
$tpl->assign('edit_output',$output);
$tpl->assign('new_version',$new_version);
$tpl->assign('dowhattodo',$dowhattodo);
?>