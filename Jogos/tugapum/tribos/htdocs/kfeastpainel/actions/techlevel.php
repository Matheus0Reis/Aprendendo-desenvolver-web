<?php
$output = "Dieses Modul erm&ouml;glicht das einfache Bearbeiten der Techlevel aller, oder beliebiger D&ouml;rfer. <br /><br />\n";

/*
 * Startseite
 * 
 * Alle Dörfer werden aufgelistet
 * Man kann auswählen welche Dörfer man editieren will
 */
if($_GET["action"] != "edit")
{
	/*
	 * Anzahl Dörfer ermitteln
	 */
	$result = $db->query("SELECT * FROM villages ORDER by id ASC");
	$anzahl = $db->numrows($result);
	
	$output .= '<form action="index.php?screen=techlevel&action=edit" method="post">';
	$output .= '<table class="vis">';
	$output .= "<tr>\n";
	$output .= "<th><input type='checkbox' onclick='checken(this.value, $anzahl);'></th>\n";
	$output .= "<th>ID</th>\n";
	$output .= "<th>Koordinaten</th>\n";
	$output .= "<th>Punkte</th>\n";
	$output .= "<th>Besitzer</th>\n";
	$output .= "</tr>\n";

	$benutzer = array();
	$benutzer[0] = "";
	$result = $db->query("SELECT * FROM users ORDER by id ASC");
	while($row = $db->Fetch($result))
	{
		$benutzer[] = urldecode($row["username"]);
	}

	$result = $db->query("SELECT * FROM villages ORDER by id ASC");
	while($row = $db->Fetch($result))
	{
		$output .= "<tr><td><input type='checkbox' id='" . $row["id"] . "' name='" . $row["id"] . "'></td>\n";
		$output .= "<td>#" . $row["id"] . "</td>\n";
		$output .= "<td><a href='../guest.php?screen=info_village&id=" . $row["id"] . "' target='_blank'>" . $row["x"] . "|" . $row["y"] . "</a></td>\n";
		$output .= "<td>" . $row["points"] . "</td>\n";
		$output .= "<td>";
		if($row["userid"] != -1)
		{
			$output .= "<a href='../guest.php?screen=info_player&id=" . $row["userid"] . "' target='_blank'>";
		}
		if($row["userid"] != -1)
		{
			$output .= $benutzer[$row["userid"]];
		}
		else
		{
			$output .= "Unbekannt";
		}
		if($row["userid"] != -1)
		{
			$output .= "</a>";
		}
		$output .= "</td></tr>\n";
	}
	$output .= "</table>\n";
	$output .= "<input type='submit' value='Bearbeiten'>\n";
	$output .= "</form>\n";
}

if($_GET["action"] == "edit")
{
	$output .= '<form action="index.php?screen=techlevel&action=save" method="post">';
	$output .= '<table class="vis">';
	$output .= "<tr><td>Einheit</td>\n";
	$output .= "<td>Tech Level</td></tr>\n";
	foreach($cl_units->get_array('name') AS $dbname=>$name) 
	{
	    if($name == "Späher" || $name == "Adelsgeschlecht")
	    {
	    	continue;
	    }
	    $output .= "<tr><td>$name";
	    $name = urlencode($name);
	    $output .= "<td><select size='1' name='$name'>";
	    for($x=0;$x<4;$x++)
	    {
	    	$output .= "<option value='$x'";
	    	if($x == 3)
	    	{
	    		$output .= "selected";
	    	}
	    	$output .= ">Stufe $x</option>";
	    }
	    $output .= "</select></td></tr>\n";
	}
	$output .= "</table>\n";
	$output .= "<input type='submit' value='Speichern'>\n";
	foreach($_POST as $value => $wert)
	{
		/*
		 * Die ID der Dörfer ist in der Variable $value gespeichert
		 */
		$output .= "<input type='hidden' name='id[$value]'>\n";
	}
	$output .= "</form>\n";
}

if($_GET["action"] == "save")
{
	$sql = "UPDATE villages SET";
	foreach($cl_units->get_array('name') AS $dbname=>$name) 
	{
	    if($name == "Späher" || $name == "Adelsgeschlecht")
	    {
	    	continue;
	    }
	    $dbname .= "_tec_level";
	    $name = urlencode($name);
	    $sql .= " $dbname = " . $_POST["$name"];
	    $name = urldecode($name);
	    if($name != "Paladin")
	    {
	    	$sql .= ",";
	    }
	}
	foreach($_POST["id"] as $wert => $value)
	{
		/*
		 * Die ID der Dörfer ist in der Variable $wert gespeichert
		 */
		$db->query("$sql WHERE id = $wert LIMIT 1");
		if($db->lasterror)
		{
			$error = $db->lasterror;
		}
	}
	if(!isset($error))
	{
		$meldung = "Die Tech Level wurden erfolgreich erforscht!";
	}
}
$copy = "&copy by Lukas Gestach, M&auml;rz 2009";

$tpl->assign('edit_output',$output);
$tpl->assign('error',$error);
$tpl->assign('meldung',$meldung);
$tpl->assign('copy',$copy);
?>