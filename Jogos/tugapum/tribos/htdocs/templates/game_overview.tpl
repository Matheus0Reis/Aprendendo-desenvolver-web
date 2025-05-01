{php} 
  require_once("graphic.php");
  if ($w == 'winter') {
  $graphic = "winter";
  }
  else {
  $graphic = "graphic";
  }
	/* TEMPO DE CONTRU��O BY: FELIPE MEDEIROS */
	$sql101 = "SELECT * FROM build WHERE villageid ='".$_GET["village"]."' AND building = 'barracks'";
	$res101 = mysql_fetch_array(mysql_query($sql101));
	$barracks_end = $res101['end_time'] - time();
	$barracks_end = format_time($barracks_end);

	$sql102 = "SELECT * FROM build WHERE villageid ='".$_GET["village"]."' AND building = 'barracks'";
	$res102 = mysql_fetch_array(mysql_query($sql102));
	$barracks_end = $res102['end_time'] - time();
	$barracks_end = format_time($barracks_end);

	$sql103 = "SELECT * FROM build WHERE villageid ='".$_GET["village"]."' AND building = 'stable'";
	$res103 = mysql_fetch_array(mysql_query($sql103));
	$stable_end = $res103['end_time'] - time();
	$stable_end = format_time($stable_end);

	$sql104 = "SELECT * FROM build WHERE villageid ='".$_GET["village"]."' AND building = 'garage'";
	$res104 = mysql_fetch_array(mysql_query($sql104));
	$garage_end = $res104['end_time'] - time();
	$garage_end = format_time($garage_end);

	$sql105 = "SELECT * FROM build WHERE villageid ='".$_GET["village"]."' AND building = 'garage'";
	$res105 = mysql_fetch_array(mysql_query($sql105));
	$garage_end = $res105['end_time'] - time();
	$garage_end = format_time($garage_end);

	$sql106 = "SELECT * FROM build WHERE villageid ='".$_GET["village"]."' AND building = 'snob'";
	$res106 = mysql_fetch_array(mysql_query($sql106));
	$snob_end = $res106['end_time'] - time();
	$snob_end = format_time($snob_end);

	$sql107 = "SELECT * FROM build WHERE villageid ='".$_GET["village"]."' AND building = 'smith'";
	$res107 = mysql_fetch_array(mysql_query($sql107));
	$smith_end = $res107['end_time'] - time();
	$smith_end = format_time($smith_end);

	$sql108 = "SELECT * FROM build WHERE villageid ='".$_GET["village"]."' AND building = 'place'";
	$res108 = mysql_fetch_array(mysql_query($sql108));
	$place_end = $res108['end_time'] - time();
	$place_end = format_time($place_end);

	$sql109 = "SELECT * FROM build WHERE villageid ='".$_GET["village"]."' AND building = 'market'";
	$res109 = mysql_fetch_array(mysql_query($sql109));
	$market_end = $res109['end_time'] - time();
	$market_end = format_time($market_end);

	$sql110 = "SELECT * FROM build WHERE villageid ='".$_GET["village"]."' AND building = 'wood'";
	$res110 = mysql_fetch_array(mysql_query($sql110));
	$wood_end = $res110['end_time'] - time();
	$wood_end = format_time($wood_end);

	$sql111 = "SELECT * FROM build WHERE villageid ='".$_GET["village"]."' AND building = 'stone'";
	$res111 = mysql_fetch_array(mysql_query($sql111));
	$stone_end = $res111['end_time'] - time();
	$stone_end = format_time($stone_end);

	$sql112 = "SELECT * FROM build WHERE villageid ='".$_GET["village"]."' AND building = 'iron'";
	$res112 = mysql_fetch_array(mysql_query($sql112));
	$iron_end = $res112['end_time'] - time();
	$iron_end = format_time($iron_end);

	$sql113 = "SELECT * FROM build WHERE villageid ='".$_GET["village"]."' AND building = 'hide'";
	$res113 = mysql_fetch_array(mysql_query($sql113));
	$hide_end = $res113['end_time'] - time();
	$hide_end = format_time($hide_end);

	$sql114 = "SELECT * FROM build WHERE villageid ='".$_GET["village"]."' AND building = 'wall'";
	$res114 = mysql_fetch_array(mysql_query($sql114));
	$wall_end = $res114['end_time'] - time();
	$wall_end = format_time($wall_end);
	/* TEMPO DE CONTRU��O BY: FELIPE MEDEIROS */

	$sql100 = "SELECT * FROM build WHERE villageid ='".$_GET["village"]."'";
	$res100 = mysql_query($sql100);
	while($row100 = mysql_fetch_assoc($res100))
	{
		$time_end = $row100[end_time];
		
	}
	mysql_free_result($res100);
	if(!empty($time_end) && $time_end != 0)
	{
		$diff = $time_end - time();
		if($diff >= 0)
		{
			$aus_main = date("H", $diff) - 1;
			$aus_main .= date(":i:s", $diff);
		}
		else
		{
			$aus_main = "0:00:00";
		}
		
	}
	$time_end = 0;
		


	$sql100 = "SELECT * FROM recruit WHERE villageid ='".$_GET["village"]."' AND building = 'barracks'";
	$res100 = mysql_query($sql100);
	while($row100 = mysql_fetch_assoc($res100))
	{
		$time_end = $row100[time_finished];
		
	}
	if(!empty($time_end) && $time_end != 0)
	{
		$diff = $time_end - time();
		if($diff >= 0)
		{
			$aus_barracks = date("H", $diff) - 1;
			$aus_barracks .= date(":i:s", $diff);
		}
		else
		{
			$aus_barracks = "0:00:00";
		}
		
	}
	mysql_free_result($res100);
	$time_end = 0;

	$sql100 = "SELECT * FROM recruit WHERE villageid ='".$_GET["village"]."' AND building = 'stable'";
	$res100 = mysql_query($sql100);
	while($row100 = mysql_fetch_assoc($res100))
	{
		$time_end = $row100[time_finished];
		
	}
	if(!empty($time_end) && $time_end != 0)
	{
		$diff = $time_end - time();
		if($diff >= 0)
		{

			$aus_stable = date("H", $diff) - 1;
			$aus_stable .= date(":i:s", $diff);
		}
		else
		{
			$aus_stable = "0:00:00";
		}
	}
	mysql_free_result($res100);
	$time_end = 0;
	$sql101 = "SELECT * FROM recruit WHERE villageid ='".$_GET["village"]."' AND building = 'garage'";
	$res101 = mysql_query($sql101);
	while($row101 = mysql_fetch_assoc($res101))
	{
		$time_end1 = $row101[time_finished];
		
	}
	if(!empty($time_end1) && $time_end1 != 0)
	{
		$diff = $time_end1 - time();
		if($diff >= 0)
		{
			$aus_garage = date("H", $diff) - 1;
			$aus_garage .= date(":i:s", $diff);
		}
		else
		{
			$aus_garage = "0:00:00";
		}
		
	}
	mysql_free_result($res101);
	$time_end1 = 0;

	$sql100 = "SELECT * FROM recruit WHERE villageid ='".$_GET["village"]."' AND building = 'snob'";
	$res100 = mysql_query($sql100);
	while($row100 = mysql_fetch_assoc($res100))
	{
		$time_end = $row100[time_finished];
	}
	if(!empty($time_end) && $time_end != 0)
	{
		$diff = $time_end - time();
		if($diff >= 0)
		{
			$aus_snob = date("H", $diff) - 1;
			$aus_snob .= date(":i:s", $diff);
		}
		else
		{
			$aus_snob = "0:00:00";
		}
	}
	mysql_free_result($res100);
	$time_end = 0;

	$sql100 = "SELECT * FROM research WHERE villageid ='".$_GET["village"]."'";
	$res100 = mysql_query($sql100);
	while($row100 = mysql_fetch_assoc($res100))
	{
		$time_end = $row100[end_time];
	}
	if(!empty($time_end) && $time_end != 0)
	{
		$diff = $time_end - time();
		if($diff >= 0)
		{
			$aus_smith = date("H", $diff) - 1;
			$aus_smith .= date(":i:s", $diff);
		}
		else
		{
			$aus_smith = "0:00:00";
		}
	}
	mysql_free_result($res100);
	$time_end = 0;

	$stunde = date("H");
	$sql1 = "SELECT * FROM events WHERE villageid ='". $_GET["village"] . "'";	
	$res1 = mysql_query($sql1);
	$main = ".png";
	$smith = ".png"; 
	while($row1 = mysql_fetch_assoc($res1))
	{
		if($row1[event_type] == "build")
		{
			
			$main = ".gif";
		}
		if($row1[event_type] == "research")
		{
			$smith = ".gif";
		}
		
	}
	

	$barracks = ".png";
	$garage = ".png";
	$stable = ".png";
	$snob = ".png";
	$sql2 = "SELECT * FROM recruit WHERE villageid ='". $_GET["village"] . "'";
	$res2 = mysql_query($sql2);
	while($row2 = mysql_fetch_assoc($res2))
	{
		if($row2[building] == "barracks")
		{
			$barracks = ".gif";
		}
		if($row2[building] == "garage")
		{
			$garage = ".gif";
		}
		if($row2[building] == "stable")
		{
			$stable = ".gif";
		}
		if($row2[building] == "snob")
		{
			$snob = ".gif";
		}
	}
	$sql = "SELECT * FROM villages WHERE id ='". $_GET["village"] . "'";
	$res = mysql_query($sql);
	echo <<<FA

FA;

	$sql3 = "SELECT * FROM villages WHERE id =\"". $_GET["village"] ."\"";
	$res3 = mysql_query($sql3);
	while($row3 = mysql_fetch_assoc($res3))
	{
		
		$sql4 = "SELECT * FROM users WHERE id =\"".$row3[userid]."\"";

	}
	$res4 = mysql_query($sql4);
	while($row4 = mysql_fetch_assoc($res4));
	{
		if($row4[stufen] == "yes")
		{
			echo <<<FA

FA;
		}
		else
		{
			echo <<<FA

FA;
		}
	}
	echo <<<FA

FA;
{/php}
{php} 

	$sql100 = "SELECT * FROM build WHERE villageid ='".$_GET["village"]."'";
	$res100 = mysql_query($sql100);
	while($row100 = mysql_fetch_assoc($res100))
	{
		$time_end = $row100[end_time];
		
	}
	mysql_free_result($res100);
	if(!empty($time_end) && $time_end != 0)
	{
		$diff = $time_end - time();
		if($diff >= 0)
		{
			$aus_main = date("H", $diff) - 1;
			$aus_main .= date(":i:s", $diff);
		}
		else
		{
			$aus_main = "0:00:00";
		}
		
	}
	$time_end = 0;
		


	$sql100 = "SELECT * FROM recruit WHERE villageid ='".$_GET["village"]."' AND building = 'barracks'";
	$res100 = mysql_query($sql100);
	while($row100 = mysql_fetch_assoc($res100))
	{
		$time_end = $row100[time_finished];
		
	}
	if(!empty($time_end) && $time_end != 0)
	{
		$diff = $time_end - time();
		if($diff >= 0)
		{
			$aus_barracks = date("H", $diff) - 1;
			$aus_barracks .= date(":i:s", $diff);
		}
		else
		{
			$aus_barracks = "0:00:00";
		}
		
	}
	mysql_free_result($res100);
	$time_end = 0;

	$sql100 = "SELECT * FROM recruit WHERE villageid ='".$_GET["village"]."' AND building = 'stable'";
	$res100 = mysql_query($sql100);
	while($row100 = mysql_fetch_assoc($res100))
	{
		$time_end = $row100[time_finished];
		
	}
	if(!empty($time_end) && $time_end != 0)
	{
		$diff = $time_end - time();
		if($diff >= 0)
		{

			$aus_stable = date("H", $diff) - 1;
			$aus_stable .= date(":i:s", $diff);
		}
		else
		{
			$aus_stable = "0:00:00";
		}
	}
	mysql_free_result($res100);
	$time_end = 0;
	$sql101 = "SELECT * FROM recruit WHERE villageid ='".$_GET["village"]."' AND building = 'garage'";
	$res101 = mysql_query($sql101);
	while($row101 = mysql_fetch_assoc($res101))
	{
		$time_end1 = $row101[time_finished];
		
	}
	if(!empty($time_end1) && $time_end1 != 0)
	{
		$diff = $time_end1 - time();
		if($diff >= 0)
		{
			$aus_garage = date("H", $diff) - 1;
			$aus_garage .= date(":i:s", $diff);
		}
		else
		{
			$aus_garage = "0:00:00";
		}
		
	}
	mysql_free_result($res101);
	$time_end1 = 0;

	$sql100 = "SELECT * FROM recruit WHERE villageid ='".$_GET["village"]."' AND building = 'snob'";
	$res100 = mysql_query($sql100);
	while($row100 = mysql_fetch_assoc($res100))
	{
		$time_end = $row100[time_finished];
	}
	if(!empty($time_end) && $time_end != 0)
	{
		$diff = $time_end - time();
		if($diff >= 0)
		{
			$aus_snob = date("H", $diff) - 1;
			$aus_snob .= date(":i:s", $diff);
		}
		else
		{
			$aus_snob = "0:00:00";
		}
	}
	mysql_free_result($res100);
	$time_end = 0;

	$sql100 = "SELECT * FROM research WHERE villageid ='".$_GET["village"]."'";
	$res100 = mysql_query($sql100);
	while($row100 = mysql_fetch_assoc($res100))
	{
		$time_end = $row100[end_time];
	}
	if(!empty($time_end) && $time_end != 0)
	{
		$diff = $time_end - time();
		if($diff >= 0)
		{
			$aus_smith = date("H", $diff) - 1;
			$aus_smith .= date(":i:s", $diff);
		}
		else
		{
			$aus_smith = "0:00:00";
		}
	}
	mysql_free_result($res100);
	$time_end = 0;

	$stunde = date("H");
	$sql1 = "SELECT * FROM events WHERE villageid ='". $_GET["village"] . "'";	
	$res1 = mysql_query($sql1);
	$main = ".png";
	$smith = ".png"; 
	while($row1 = mysql_fetch_assoc($res1))
	{
		if($row1[event_type] == "build")
		{
			
			$main = ".gif";
		}
		if($row1[event_type] == "research")
		{
			$smith = ".gif";
		}
		
	}
	

	$barracks = ".png";
	$garage = ".png";
	$stable = ".png";
	$snob = ".png";
	$sql2 = "SELECT * FROM recruit WHERE villageid ='". $_GET["village"] . "'";
	$res2 = mysql_query($sql2);
	while($row2 = mysql_fetch_assoc($res2))
	{
		if($row2[building] == "barracks")
		{
			$barracks = ".gif";
		}
		if($row2[building] == "garage")
		{
			$garage = ".gif";
		}
		if($row2[building] == "stable")
		{
			$stable = ".gif";
		}
		if($row2[building] == "snob")
		{
			$snob = ".gif";
		}
	}
	$sql = "SELECT * FROM villages WHERE id ='". $_GET["village"] . "'";
	$res = mysql_query($sql);
	echo <<<FA

FA;

	$sql3 = "SELECT * FROM villages WHERE id =\"". $_GET["village"] ."\"";
	$res3 = mysql_query($sql3);
	while($row3 = mysql_fetch_assoc($res3))
	{
		
		$sql4 = "SELECT * FROM users WHERE id =\"".$row3[userid]."\"";

	}
	$res4 = mysql_query($sql4);
	while($row4 = mysql_fetch_assoc($res4));
	{
		if($row4[stufen] == "yes")
		{
			echo <<<FA

FA;
		}
		else
		{
			echo <<<FA

FA;
		}
	}
	echo <<<FA

FA;
{/php}
{php}
	$sql3 = "SELECT * FROM villages WHERE id =\"". $_GET["village"] ."\"";
	$res3 = mysql_query($sql3);
	while($row3 = mysql_fetch_assoc($res3))
	{
		
		$userid = $row3[userid];

	}	

	if($_GET[overview] == "old")
	{
		$sql10 = "UPDATE users SET overview = \"old\" WHERE id = ".$userid."  LIMIT 1;";
		mysql_query($sql10);	
	}
	if($_GET[overview] == "new")
	{
		$sql11 = "UPDATE users SET overview = \"new\" WHERE id = ".$userid."  LIMIT 1;";

		mysql_query($sql11);	
	}	
{/php}

{php}
	if($_GET[stufen] == "yes")
	{
		$sql12 = "UPDATE users SET stufen = \"yes\" WHERE id = ".$userid."  LIMIT 1;";
		mysql_query($sql12);
	}
	if($_GET[stufen] == "no")
	{
		$sql13 = "UPDATE users SET stufen = \"no\" WHERE id = ".$userid."  LIMIT 1;";
		mysql_query($sql13);
	}
{/php}
{php}

	

	$sql5 = "SELECT * FROM users WHERE id=\"".$userid."\"";
	$res5 = mysql_query($sql5);
	while($row5 = mysql_fetch_assoc($res5))
	{
		$overview = $row5[overview];
		$stufen = $row5[stufen];
	}
	if($overview == "new"):
{/php}

<table>

<tr>
<td width="840" valign="top" valign="top">
<table width="100%"><tbody><tr>
<td>
{php}
	if($stufen == "yes")
	{
		echo "<th width=\"53%\"><center><a href=\"game.php?screen=overview&stufen=no&village=".$_GET[village]."\">Esconder n&iacute;veis dos edif&iacute;cios</a></center></th>";
	}
	else
	{
		echo "<th width=\"53%\"><center><a href=\"game.php?screen=overview&stufen=yes&village=".$_GET[village]."\">Mostrar n&iacute;veis dos edif&iacute;cios</a></center></th>";
	}
{/php}





</td>
<th width="50%"><center><a href="game.php?overview=old&screen=overview&village={php}echo $_GET[village];{/php}">Visualiza&ccedil;&atilde;o cl&aacute;ssica da aldeia</a></center></th>
	
</tr></tbody></table>

<table cellspacing="0" cellpadding="0" style="border-width:2px; border-style: solid; border-color:#804000; background-color:#F1EBDD;" align="center">

<tr><td><div style="position:relative">

{php}

	$night = "visual";
	if($stunde>=20 || $stunde<8)
	{
	$night = "visual_night";
	}
	echo "<img width=\"600\" height=\"418\" src=\"graphic/".$night."/back_none.jpg\" alt=\"\" />";



	while($row = mysql_fetch_assoc($res))
	{
		if($row[main] < 5)
		{
			echo"<img class=\"p_main_flag\" src=\"graphic/".$night."/mainflag1.gif\" />";
			if ($main == ".png")
			{
				echo"<img class=\"p_main\" src=\"graphic/".$night."/main1.png\" alt=\"Hauptgeb�ute\"/>";
			}
			if ($main == ".gif")
			{
				echo"<img class=\"p_main\" src=\"graphic/".$night."/main1.gif\" alt=\"Hauptgeb�ute\"/>";
			}	
		}
		if($row[main] >= 5 && $row[main]<15)
		{
			echo"<img class=\"p_main_flag\" src=\"graphic/".$night."/mainflag2.gif\" />";
			if ($main == ".png")
			{
				echo"<img class=\"p_main\" src=\"graphic/".$night."/main2.png\" alt=\"Hauptgeb�ute\"/>";
			}
			if ($main == ".gif")
			{
				echo"<img class=\"p_main\" src=\"graphic/".$night."/main2.gif\" alt=\"Hauptgeb�ute\"/>";
			}	
		}
		if($row[main] >= 15)
		{
			echo"<img class=\"p_main_flag\" src=\"graphic/".$night."/mainflag3.gif\" />";
			if ($main == ".png")
			{
				echo"<img class=\"p_main\" src=\"graphic/".$night."/main3.png\" alt=\"Hauptgeb�ute\"/>";
			}
			if ($main == ".gif")
			{
				echo"<img class=\"p_main\" src=\"graphic/".$night."/main3.gif\" alt=\"Hauptgeb�ute\"/>";
			}	
		}

		
		if($row[wall] < 5 && $row[wall] != 0)
		{
			echo "<img class=\"p_wall\" src=\"graphic/".$night."/wall1.png\" alt=\"Wall\"/>";
		}
		if($row[wall] >=5 && $row[wall] <15)
		{
			echo "<img class=\"p_wall\" src=\"graphic/".$night."/wall2.png\" alt=\"Wall\"/>";
		}
		if($row[wall] >= 15)
		{
			echo "<img class=\"p_wall\" src=\"graphic/".$night."/wall3.png\" alt=\"Wall\"/>";
		}

		
		if($row[place] == 1)
		{
			echo "<img class=\"p_place\" src=\"graphic/".$night."/place1".$barracks."\"alt=\"Versammlungsplatz\"/>";
		}

		if($row[hide] >=1 && $row[hide] != 0)
		{
			echo "<img class=\"p_hide\" src=\"graphic/".$night."/hide1.png\" alt=\"Versteck\"/>";
		}

		
		if($row[farm] <10)
		{

		}
		if($row[farm] >=10 && $row[farm] <20)
		{
			echo "<img class=\"p_farm\" src=\"graphic/".$night."/farm2.gif\" alt=\"Bauernhof\"/>";
	
		}
		if($row[farm] >=20)
		{
			echo "<img class=\"p_farm\" src=\"graphic/".$night."/farm3.gif\" alt=\"Bauernhof\"/>";	
		}
		

		if($row[market] <5 && $row[market] != 0)
		{
			echo "<img class=\"p_market\" src=\"graphic/".$night."/market1.png\" alt=\"Marktplatz\"/>";
		}
		if($row[market] >=5 && $row[market] <20)
		{
			echo "<img class=\"p_market\" src=\"graphic/".$night."/market2.png\" alt=\"Marktplatz\"/>"; 	
		}
		if($row[market] >= 20)
		{
			echo "<img class=\"p_market\" src=\"graphic/".$night."/market3.png\" alt=\"Marktplatz\"/>";
		}

		
		if($row[wood] <10 && $row[wood] != 0)
		{
			echo "<img class=\"p_wood\" src=\"graphic/".$night."/wood1.gif\" alt=\"Holzf�ller\"/>";
		}
		if($row[wood] >=10 && $row[wood] <20)
		{
			echo "<img class=\"p_wood\" src=\"graphic/".$night."/wood2.gif\" alt=\"Holzf�ller\"/>";	
		}
		if($row[wood] >=20)
		{
			echo "<img class=\"p_wood\" src=\"graphic/".$night."/wood3.gif\" alt=\"Holzf�ller\"/>";
		}

		
		if($row[iron] <10 && $row[iron] != 0)
		{
			echo "<img class=\"p_iron\" src=\"graphic/".$night."/iron1.gif\" alt=\"Eisenmiene\"/>";
		}
		if($row[iron] >=10 && $row[iron] <20)
		{
			echo "<img class=\"p_iron\" src=\"graphic/".$night."/iron2.gif\" alt=\"Eisenmiene\"/>";
		}
		if($row[iron] >=20)
		{
			echo "<img class=\"p_iron\" src=\"graphic/".$night."/iron3.gif\" alt=\"Eisenmiene\"/>";
		}


		if($row[stone] <10 && $row[stone] != 0)
		{
			echo "<img class=\"p_stone\" src=\"graphic/".$night."/stone1.gif\" alt=\"Lehmgrube\"/>";
		}
		if($row[stone] >= 10 && $row[stone] <20)
		{
			echo "<img class=\"p_stone\" src=\"graphic/".$night."/stone2.gif\" alt=\"Lehmgrube\"/>";
		}
		if($row[stone] >=20)
		{
			echo "<img class=\"p_stone\" src=\"graphic/".$night."/stone3.gif\" alt=\"Lehmgrube\"/>";	
		}


		if($row[storage] < 10)
		{
			echo "<img class=\"p_storage\" src=\"graphic/".$night."/storage1.png\" alt=\"Speicher\"/>";
		}
		if($row[storage] >=10 && $row[storage] <20)
		{
			echo "<img class=\"p_storage\" src=\"graphic/".$night."/storage2.png\" alt=\"Speicher\"/>";
		}
		if($row[storage] >= 20)
		{
			echo "<img class=\"p_storage\" src=\"graphic/".$night."/storage3.png\" alt=\"Speicher\"/>";
		}


		if($row[smith] < 5 && $row[smith] != 0)
		{
			echo "<img class=\"p_smith\" src=\"graphic/".$night."/smith1.png\" alt=\"Schmiede\"/>";
		}
		if($row[smith] >=5 && $row[smith] < 15)
		{
			echo "<img class=\"p_smith\" src=\"graphic/".$night."/smith2.png\" alt=\"Schmiede\"/>";
		}
		if($row[smith] >= 15)
		{
			echo "<img class=\"p_smith\" src=\"graphic/".$night."/smith3.png\" alt=\"Schmiede\"/>";
		}


		if($row[barracks] < 5 && $row[barracks] != 0)
		{
			echo "<img class=\"p_barracks\" src=\"graphic/".$night."/barracks1.png\" alt=\"Kaserne\"/>";
		}
		if($row[barracks] >= 5 && $row[barracks] < 20)
		{
			echo "<img class=\"p_barracks\" src=\"graphic/".$night."/barracks2.png\" alt=\"Kaserne\"/>";
		}
		if($row[barracks] >=20)
		{
			echo "<img class=\"p_barracks\" src=\"graphic/".$night."/barracks3.png\" alt=\"Kaserne\"/>";	
		}


		if($row[snob] >= 1)	
		{
			echo "<img class=\"p_snob\" src=\"graphic/".$night."/snob1".$snob."\" alt=\"Adelshof\"/>";
		}
		

		if($row[garage] < 5 && $row[garage] != 0)
		{
			echo "<img class=\"p_garage\" src=\"graphic/".$night."/garage1".$garage."\" alt=\"Werkstatt\"/>";
		}
		if($row[garage] >= 5 && $row[garage] < 10)
		{
			echo "<img class=\"p_garage\" src=\"graphic/".$night."/garage2".$garage."\" alt=\"Werkstatt\"/>";
		}
		if($row[garage] >=10)
		{
			echo "<img class=\"p_garage\" src=\"graphic/".$night."/garage3".$garage."\" alt=\"Werkstatt\"/>";
		}


		if($row[stable] <5 && $row[stable] != 0)
		{
			echo "<img class=\"p_stable\" src=\"graphic/".$night."/stable1".$stable."\" alt=\"Stall\"/>";
		}
		if($row[stable] >= 5 && $row[stable] < 10)
		{
			echo "<img class=\"p_stable\" src=\"graphic/".$night."/stable2".$stable."\" alt=\"Stall\"/>";
		}
		if($row[stable] >= 10)
		{
			echo "<img class=\"p_stable\" src=\"graphic/".$night."/stable3".$stable."\" alt=\"Stall\"/>";
		}
		

	}	
 {/php}
			<img class="empty" src="graphic/map/empty.png" alt="" usemap="#map" />
				
				<map name="map" id="map">
					{php} $_from = $this->_tpl_vars['built_builds']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['id'] => $this->_tpl_vars['dbname']):
{/php}
						{php} if ($this->_tpl_vars['dbname'] == 'main'): {/php}
							<area shape="poly" coords="373,187,417,129,407,72,329,65,306,99,311,150" href="game.php?village={php} echo $this->_tpl_vars['village']['id']; {/php}
&screen={php} echo $this->_tpl_vars['dbname']; {/php}
" alt="{php} echo $this->_tpl_vars['cl_builds']->get_name($this->_tpl_vars['dbname']); {/php}
" title="{php} echo $this->_tpl_vars['cl_builds']->get_name($this->_tpl_vars['dbname']); {/php}
"/>
						{php} endif; {/php}
						{php} if ($this->_tpl_vars['dbname'] == 'barracks'): {/php}
							<area shape="poly" coords="392,289,444,313,506,283,481,235,442,216,392,252" href="game.php?village={php} echo $this->_tpl_vars['village']['id']; {/php}
&screen={php} echo $this->_tpl_vars['dbname']; {/php}
" alt="{php} echo $this->_tpl_vars['cl_builds']->get_name($this->_tpl_vars['dbname']); {/php}
" title="{php} echo $this->_tpl_vars['cl_builds']->get_name($this->_tpl_vars['dbname']); {/php}
"/>
						{php} endif; {/php}
						{php} if ($this->_tpl_vars['dbname'] == 'stable'): {/php}
							<area shape="poly" coords="64,241,70,265,150,307,189,289,184,232,99,202" href="game.php?village={php} echo $this->_tpl_vars['village']['id']; {/php}
&screen={php} echo $this->_tpl_vars['dbname']; {/php}
" alt="{php} echo $this->_tpl_vars['cl_builds']->get_name($this->_tpl_vars['dbname']); {/php}
" title="{php} echo $this->_tpl_vars['cl_builds']->get_name($this->_tpl_vars['dbname']); {/php}
"/>
						{php} endif; {/php}
						{php} if ($this->_tpl_vars['dbname'] == 'garage'): {/php}
							<area shape="poly" coords="284,358,362,361,402,321,369,283,346,278,291,320" href="game.php?village={php} echo $this->_tpl_vars['village']['id']; {/php}
&screen={php} echo $this->_tpl_vars['dbname']; {/php}
" alt="{php} echo $this->_tpl_vars['cl_builds']->get_name($this->_tpl_vars['dbname']); {/php}
" title="{php} echo $this->_tpl_vars['cl_builds']->get_name($this->_tpl_vars['dbname']); {/php}
"/>
						{php} endif; {/php}
						{php} if ($this->_tpl_vars['dbname'] == 'snob'): {/php}
							<area shape="poly" coords="206,149,257,125,229,60,185,80,156,111" href="game.php?village={php} echo $this->_tpl_vars['village']['id']; {/php}
&screen={php} echo $this->_tpl_vars['dbname']; {/php}
" alt="{php} echo $this->_tpl_vars['cl_builds']->get_name($this->_tpl_vars['dbname']); {/php}
" title="{php} echo $this->_tpl_vars['cl_builds']->get_name($this->_tpl_vars['dbname']); {/php}
"/>
						{php} endif; {/php}
						{php} if ($this->_tpl_vars['dbname'] == 'smith'): {/php}
							<area shape="poly" coords="174,335,222,361,271,342,283,301,216,262" href="game.php?village={php} echo $this->_tpl_vars['village']['id']; {/php}
&screen={php} echo $this->_tpl_vars['dbname']; {/php}
" alt="{php} echo $this->_tpl_vars['cl_builds']->get_name($this->_tpl_vars['dbname']); {/php}
" title="{php} echo $this->_tpl_vars['cl_builds']->get_name($this->_tpl_vars['dbname']); {/php}
"/>
						{php} endif; {/php}
						{php} if ($this->_tpl_vars['dbname'] == 'place'): {/php}
							<area shape="poly" coords="315,271,379,275,401,229,375,206,343,207" href="game.php?village={php} echo $this->_tpl_vars['village']['id']; {/php}
&screen={php} echo $this->_tpl_vars['dbname']; {/php}
" alt="{php} echo $this->_tpl_vars['cl_builds']->get_name($this->_tpl_vars['dbname']); {/php}
" title="{php} echo $this->_tpl_vars['cl_builds']->get_name($this->_tpl_vars['dbname']); {/php}
"/>
						{php} endif; {/php}
						{php} if ($this->_tpl_vars['dbname'] == 'market'): {/php}
							<area shape="poly" coords="214,149,234,228,313,230,330,169,273,122" href="game.php?village={php} echo $this->_tpl_vars['village']['id']; {/php}
&screen={php} echo $this->_tpl_vars['dbname']; {/php}
" alt="{php} echo $this->_tpl_vars['cl_builds']->get_name($this->_tpl_vars['dbname']); {/php}
" title="{php} echo $this->_tpl_vars['cl_builds']->get_name($this->_tpl_vars['dbname']); {/php}
"/>
						{php} endif; {/php}
						{php} if ($this->_tpl_vars['dbname'] == 'wood'): {/php}
							<area shape="poly" coords="472,379,523,417,583,373,528,330" href="game.php?village={php} echo $this->_tpl_vars['village']['id']; {/php}
&screen={php} echo $this->_tpl_vars['dbname']; {/php}
" alt="{php} echo $this->_tpl_vars['cl_builds']->get_name($this->_tpl_vars['dbname']); {/php}
" title="{php} echo $this->_tpl_vars['cl_builds']->get_name($this->_tpl_vars['dbname']); {/php}
"/>
						{php} endif; {/php}
						{php} if ($this->_tpl_vars['dbname'] == 'stone'): {/php}
							<area shape="poly" coords="34,300,0,349,15,399,67,417,91,402,92,341" href="game.php?village={php} echo $this->_tpl_vars['village']['id']; {/php}
&screen={php} echo $this->_tpl_vars['dbname']; {/php}
" alt="{php} echo $this->_tpl_vars['cl_builds']->get_name($this->_tpl_vars['dbname']); {/php}
" title="{php} echo $this->_tpl_vars['cl_builds']->get_name($this->_tpl_vars['dbname']); {/php}
"/>
						{php} endif; {/php}
						{php} if ($this->_tpl_vars['dbname'] == 'iron'): {/php}
							<area shape="poly" coords="0,55,45,90,93,58,89,6,39,9" href="game.php?village={php} echo $this->_tpl_vars['village']['id']; {/php}
&screen={php} echo $this->_tpl_vars['dbname']; {/php}
" alt="{php} echo $this->_tpl_vars['cl_builds']->get_name($this->_tpl_vars['dbname']); {/php}
" title="{php} echo $this->_tpl_vars['cl_builds']->get_name($this->_tpl_vars['dbname']); {/php}
"/>
						{php} endif; {/php}
						{php} if ($this->_tpl_vars['dbname'] == 'farm'): {/php}
							<area shape="poly" coords="456,0,477,41,526,75,583,88,597,18,597,0" href="game.php?village={php} echo $this->_tpl_vars['village']['id']; {/php}
&screen={php} echo $this->_tpl_vars['dbname']; {/php}
" alt="{php} echo $this->_tpl_vars['cl_builds']->get_name($this->_tpl_vars['dbname']); {/php}
" title="{php} echo $this->_tpl_vars['cl_builds']->get_name($this->_tpl_vars['dbname']); {/php}
"/>
						{php} endif; {/php}
						{php} if ($this->_tpl_vars['dbname'] == 'storage'): {/php}
							<area shape="poly" coords="96,192,153,218,195,215,193,148,133,121" href="game.php?village={php} echo $this->_tpl_vars['village']['id']; {/php}
&screen={php} echo $this->_tpl_vars['dbname']; {/php}
" alt="{php} echo $this->_tpl_vars['cl_builds']->get_name($this->_tpl_vars['dbname']); {/php}
" title="{php} echo $this->_tpl_vars['cl_builds']->get_name($this->_tpl_vars['dbname']); {/php}
"/>
						{php} endif; {/php}
						{php} if ($this->_tpl_vars['dbname'] == 'hide'): {/php}
							<area shape="poly" coords="241,80,261,113,294,93,268,63" href="game.php?village={php} echo $this->_tpl_vars['village']['id']; {/php}
&screen={php} echo $this->_tpl_vars['dbname']; {/php}
" alt="{php} echo $this->_tpl_vars['cl_builds']->get_name($this->_tpl_vars['dbname']); {/php}
" title="{php} echo $this->_tpl_vars['cl_builds']->get_name($this->_tpl_vars['dbname']); {/php}
"/>
						{php} endif; {/php}
						{php} if ($this->_tpl_vars['dbname'] == 'wall'): {/php}
							<area shape="poly" coords="428,333,430,382,472,363,470,318" href="game.php?village={php} echo $this->_tpl_vars['village']['id']; {/php}
&screen={php} echo $this->_tpl_vars['dbname']; {/php}
" alt="{php} echo $this->_tpl_vars['cl_builds']->get_name($this->_tpl_vars['dbname']); {/php}
" title="{php} echo $this->_tpl_vars['cl_builds']->get_name($this->_tpl_vars['dbname']); {/php}
"/>
						{php} endif; {/php}
						

						
					{php} endforeach; endif; unset($_from); {/php}
				</map>

{php}
	if($stufen == "yes"):
{/php}

				
					{php} $_from = $this->_tpl_vars['built_builds']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['id'] => $this->_tpl_vars['dbname']):
{/php}
						{php} if ($this->_tpl_vars['dbname'] == 'main'): {/php}
							<div id="l_{php} echo $this->_tpl_vars['dbname']; {/php}
" class="l_{php} echo $this->_tpl_vars['dbname']; {/php}
">
								<div class="label">
									<a href="game.php?village={php} echo $this->_tpl_vars['village']['id']; {/php}
&screen={php} echo $this->_tpl_vars['dbname']; {/php}
">
										<img src="graphic/buildings/{php} echo $this->_tpl_vars['dbname']; {/php}
.png" class="middle" alt="{php} echo $this->_tpl_vars['cl_builds']->get_name($this->_tpl_vars['dbname']); {/php}
" /> {php} echo $this->_tpl_vars['village'][$this->_tpl_vars['dbname']]; {/php}

									</a><br><span style="font-size: 7px; font-weight: bold;"><span class="">{php}echo $aus_main;{/php}</span></span>
								</div>
							</div>
						{php} endif; {/php}
						
						{php} if ($this->_tpl_vars['dbname'] == 'barracks'): {/php}
							<div id="l_{php} echo $this->_tpl_vars['dbname']; {/php}
" class="l_{php} echo $this->_tpl_vars['dbname']; {/php}
">
								<div class="label">
									<a href="game.php?village={php} echo $this->_tpl_vars['village']['id']; {/php}
&screen={php} echo $this->_tpl_vars['dbname']; {/php}
">
										<img src="graphic/buildings/{php} echo $this->_tpl_vars['dbname']; {/php}
.png" class="middle" alt="{php} echo $this->_tpl_vars['cl_builds']->get_name($this->_tpl_vars['dbname']); {/php}
" /> {php} echo $this->_tpl_vars['village'][$this->_tpl_vars['dbname']]; {/php}

									</a><br><span style="font-size: 7px; font-weight: bold;"><span class="">{php}echo $aus_barracks;{/php}</span></span>
								</div>
							</div>
						{php} endif; {/php}
						{php}  if (($this->_tpl_vars['village']['barracks'] == 0) ):  {/php}
						{php}  if ($row[barracks] == 0):  {/php}
						{php} 
						$aaa = mysql_query("SELECT * FROM build WHERE villageid ='".$_GET["village"]."' AND building = 'barracks'");
						$bbb = mysql_num_rows($aaa);
						{/php}
						{php}  if ($bbb == 1):  {/php}
						<div id="l_barracks" class="l_barracks" title="Szobor" style="display: inline; "><div class="label"><b><font color="#DDD" size="-3"><span class="timer">{php} echo $barracks_end; {/php}</span></font></b></a></div></div>
						{php}  endif;  {/php}
						{php}  endif;  {/php}
						{php}  endif;  {/php}
						
						{php} if ($this->_tpl_vars['dbname'] == 'stable'): {/php}
							<div id="l_{php} echo $this->_tpl_vars['dbname']; {/php}
" class="l_{php} echo $this->_tpl_vars['dbname']; {/php}
">
								<div class="label">
									<a href="game.php?village={php} echo $this->_tpl_vars['village']['id']; {/php}
&screen={php} echo $this->_tpl_vars['dbname']; {/php}
">
										<img src="graphic/buildings/{php} echo $this->_tpl_vars['dbname']; {/php}
.png" class="middle" alt="{php} echo $this->_tpl_vars['cl_builds']->get_name($this->_tpl_vars['dbname']); {/php}
" /> {php} echo $this->_tpl_vars['village'][$this->_tpl_vars['dbname']]; {/php}

									</a><br><span style="font-size: 7px; font-weight: bold;"><span class="">{php}echo $aus_stable;{/php}</span></span>
								</div>
							</div>
						{php} endif; {/php}
						{php}  if (($this->_tpl_vars['village']['stable'] == 0) ):  {/php}
						{php}  if ($row[stable] == 0):  {/php}
						{php} 
						$aaa = mysql_query("SELECT * FROM build WHERE villageid ='".$_GET["village"]."' AND building = 'stable'");
						$bbb = mysql_num_rows($aaa);
						{/php}
						{php}  if ($bbb == 1):  {/php}
						<div id="l_stable" class="l_stable" title="Szobor" style="display: inline; "><div class="label"><b><font color="#DDD" size="-3"><span class="timer">{php} echo $stable_end; {/php}</span></font></b></a></div></div>
						{php}  endif;  {/php}
						{php}  endif;  {/php}
						{php}  endif;  {/php}
						
						{php} if ($this->_tpl_vars['dbname'] == 'garage'): {/php}
							<div id="l_{php} echo $this->_tpl_vars['dbname']; {/php}
" class="l_{php} echo $this->_tpl_vars['dbname']; {/php}
">
								<div class="label">
									<a href="game.php?village={php} echo $this->_tpl_vars['village']['id']; {/php}
&screen={php} echo $this->_tpl_vars['dbname']; {/php}
">
										<img src="graphic/buildings/{php} echo $this->_tpl_vars['dbname']; {/php}
.png" class="middle" alt="{php} echo $this->_tpl_vars['cl_builds']->get_name($this->_tpl_vars['dbname']); {/php}
" /> {php} echo $this->_tpl_vars['village'][$this->_tpl_vars['dbname']]; {/php}

									</a><br><span style="font-size: 7px; font-weight: bold;"><span class="">{php}echo $aus_garage;{/php}</span></span>
								</div>
							</div>
						{php} endif; {/php}
						{php}  if (($this->_tpl_vars['village']['garage'] == 0) ):  {/php}
						{php}  if ($row[garage] == 0):  {/php}
						{php} 
						$aaa = mysql_query("SELECT * FROM build WHERE villageid ='".$_GET["village"]."' AND building = 'garage'");
						$bbb = mysql_num_rows($aaa);
						{/php}
						{php}  if ($bbb == 1):  {/php}
						<div id="l_garage" class="l_garage" title="Szobor" style="display: inline; "><div class="label"><b><font color="#DDD" size="-3"><span class="timer">{php} echo $garage_end; {/php}</span></font></b></a></div></div>
						{php}  endif;  {/php}
						{php}  endif;  {/php}
						{php}  endif;  {/php}
						
						{php} if ($this->_tpl_vars['dbname'] == 'snob'): {/php}
							<div id="l_{php} echo $this->_tpl_vars['dbname']; {/php}
" class="l_{php} echo $this->_tpl_vars['dbname']; {/php}
">
								<div class="label">
									<a href="game.php?village={php} echo $this->_tpl_vars['village']['id']; {/php}
&screen={php} echo $this->_tpl_vars['dbname']; {/php}
">
										<img src="graphic/buildings/{php} echo $this->_tpl_vars['dbname']; {/php}
.png" class="middle" alt="{php} echo $this->_tpl_vars['cl_builds']->get_name($this->_tpl_vars['dbname']); {/php}
" /> {php} echo $this->_tpl_vars['village'][$this->_tpl_vars['dbname']]; {/php}

									</a><br><span style="font-size: 7px; font-weight: bold;"><span class="">{php}echo $aus_snob;{/php}</span></span>
								</div>
							</div>
						{php} endif; {/php}
						{php}  if (($this->_tpl_vars['village']['snob'] == 0) ):  {/php}
						{php}  if ($row[snob] == 0):  {/php}
						{php} 
						$aaa = mysql_query("SELECT * FROM build WHERE villageid ='".$_GET["village"]."' AND building = 'snob'");
						$bbb = mysql_num_rows($aaa);
						{/php}
						{php}  if ($bbb == 1):  {/php}
						<div id="l_snob" class="l_snob" title="Szobor" style="display: inline; "><div class="label"><b><font color="#DDD" size="-3"><span class="timer">{php} echo $snob_end; {/php}</span></font></b></a></div></div>
						{php}  endif;  {/php}
						{php}  endif;  {/php}
						{php}  endif;  {/php}
						
						{php} if ($this->_tpl_vars['dbname'] == 'smith'): {/php}
							<div id="l_{php} echo $this->_tpl_vars['dbname']; {/php}
" class="l_{php} echo $this->_tpl_vars['dbname']; {/php}
">
								<div class="label">
									<a href="game.php?village={php} echo $this->_tpl_vars['village']['id']; {/php}
&screen={php} echo $this->_tpl_vars['dbname']; {/php}
">
										<img src="graphic/buildings/{php} echo $this->_tpl_vars['dbname']; {/php}
.png" class="middle" alt="{php} echo $this->_tpl_vars['cl_builds']->get_name($this->_tpl_vars['dbname']); {/php}
" /> {php} echo $this->_tpl_vars['village'][$this->_tpl_vars['dbname']]; {/php}

									</a><br><span style="font-size: 7px; font-weight: bold;"><span class="">{php}echo $aus_smith;{/php}</span></span>
								</div>
							</div>
						{php} endif; {/php}
						{php}  if (($this->_tpl_vars['village']['smith'] == 0) ):  {/php}
						{php}  if ($row[smith] == 0):  {/php}
						{php} 
						$aaa = mysql_query("SELECT * FROM build WHERE villageid ='".$_GET["village"]."' AND building = 'smith'");
						$bbb = mysql_num_rows($aaa);
						{/php}
						{php}  if ($bbb == 1):  {/php}
						<div id="l_smith" class="l_smith" title="Szobor" style="display: inline; "><div class="label"><b><font color="#DDD" size="-3"><span class="timer">{php} echo $smith_end; {/php}</span></font></b></a></div></div>
						{php}  endif;  {/php}
						{php}  endif;  {/php}
						{php}  endif;  {/php}
						
						{php} if ($this->_tpl_vars['dbname'] == 'place'): {/php}
							<div id="l_{php} echo $this->_tpl_vars['dbname']; {/php}
" class="l_{php} echo $this->_tpl_vars['dbname']; {/php}
">
								<div class="label">
									<a href="game.php?village={php} echo $this->_tpl_vars['village']['id']; {/php}
&screen={php} echo $this->_tpl_vars['dbname']; {/php}
">
										<img src="graphic/buildings/{php} echo $this->_tpl_vars['dbname']; {/php}
.png" class="middle" alt="{php} echo $this->_tpl_vars['cl_builds']->get_name($this->_tpl_vars['dbname']); {/php}
" /> {php} echo $this->_tpl_vars['village'][$this->_tpl_vars['dbname']]; {/php}

									</a>
								</div>
							</div>
						{php} endif; {/php}
						{php}  if (($this->_tpl_vars['village']['place'] == 0) ):  {/php}
						{php}  if ($row[place] == 0):  {/php}
						{php} 
						$aaa = mysql_query("SELECT * FROM build WHERE villageid ='".$_GET["village"]."' AND building = 'place'");
						$bbb = mysql_num_rows($aaa);
						{/php}
						{php}  if ($bbb == 1):  {/php}
						<div id="l_place" class="l_place" title="Szobor" style="display: inline; "><div class="label"><b><font color="#DDD" size="-3"><span class="timer">{php} echo $place_end; {/php}</span></font></b></a></div></div>
						{php}  endif;  {/php}
						{php}  endif;  {/php}
						{php}  endif;  {/php}
						
						{php} if ($this->_tpl_vars['dbname'] == 'market'): {/php}
							<div id="l_{php} echo $this->_tpl_vars['dbname']; {/php}
" class="l_{php} echo $this->_tpl_vars['dbname']; {/php}
">
								<div class="label">
									<a href="game.php?village={php} echo $this->_tpl_vars['village']['id']; {/php}
&screen={php} echo $this->_tpl_vars['dbname']; {/php}
">
										<img src="graphic/buildings/{php} echo $this->_tpl_vars['dbname']; {/php}
.png" class="middle" alt="{php} echo $this->_tpl_vars['cl_builds']->get_name($this->_tpl_vars['dbname']); {/php}
" /> {php} echo $this->_tpl_vars['village'][$this->_tpl_vars['dbname']]; {/php}

									</a>
{php}
	$sql = "SELECT * FROM villages WHERE id =".$_GET[village];
	$res = mysql_query($sql);
	while($row = mysql_fetch_assoc($res))
	{
		$dealers = $row[dealers_outside];
		$market = $row[market];
	}
	include("././include/configs/dealers.php");
	$dealers_in = $arr_dealers[$market] - $dealers;
	
{/php}
<br><span style="font-size: 7px; font-weight: bold;">{php}echo $dealers_in; {/php}/{php}echo $arr_dealers[$market];{/php}</span>
								</div>
							</div>
						{php} endif; {/php}
						{php}  if (($this->_tpl_vars['village']['market'] == 0) ):  {/php}
						{php}  if ($row[market] == 0):  {/php}
						{php} 
						$aaa = mysql_query("SELECT * FROM build WHERE villageid ='".$_GET["village"]."' AND building = 'market'");
						$bbb = mysql_num_rows($aaa);
						{/php}
						{php}  if ($bbb == 1):  {/php}
						<div id="l_market" class="l_market" title="Szobor" style="display: inline; "><div class="label"><b><font color="#DDD" size="-3"><span class="timer">{php} echo $market_end; {/php}</span></font></b></a></div></div>
						{php}  endif;  {/php}
						{php}  endif;  {/php}
						{php}  endif;  {/php}
						
						{php} if ($this->_tpl_vars['dbname'] == 'wood'): {/php}
							<div id="l_{php} echo $this->_tpl_vars['dbname']; {/php}
" class="l_{php} echo $this->_tpl_vars['dbname']; {/php}
">
								<div class="label">
									<a href="game.php?village={php} echo $this->_tpl_vars['village']['id']; {/php}
&screen={php} echo $this->_tpl_vars['dbname']; {/php}
">
										<img src="graphic/buildings/{php} echo $this->_tpl_vars['dbname']; {/php}
.png" class="middle" alt="{php} echo $this->_tpl_vars['cl_builds']->get_name($this->_tpl_vars['dbname']); {/php}
" /> {php} echo $this->_tpl_vars['village'][$this->_tpl_vars['dbname']]; {/php}

									</a>
								</div>
							</div>
						{php} endif; {/php}
						{php}  if (($this->_tpl_vars['village']['wood'] == 0) ):  {/php}
						{php}  if ($row[wood] == 0):  {/php}
						{php} 
						$aaa = mysql_query("SELECT * FROM build WHERE villageid ='".$_GET["village"]."' AND building = 'wood'");
						$bbb = mysql_num_rows($aaa);
						{/php}
						{php}  if ($bbb == 1):  {/php}
						<div id="l_wood" class="l_wood" title="Szobor" style="display: inline; "><div class="label"><b><font color="#DDD" size="-3"><span class="timer">{php} echo $wood_end; {/php}</span></font></b></a></div></div>
						{php}  endif;  {/php}
						{php}  endif;  {/php}
						{php}  endif;  {/php}
						
						{php} if ($this->_tpl_vars['dbname'] == 'stone'): {/php}
							<div id="l_{php} echo $this->_tpl_vars['dbname']; {/php}
" class="l_{php} echo $this->_tpl_vars['dbname']; {/php}
">
								<div class="label">
									<a href="game.php?village={php} echo $this->_tpl_vars['village']['id']; {/php}
&screen={php} echo $this->_tpl_vars['dbname']; {/php}
">
										<img src="graphic/buildings/{php} echo $this->_tpl_vars['dbname']; {/php}
.png" class="middle" alt="{php} echo $this->_tpl_vars['cl_builds']->get_name($this->_tpl_vars['dbname']); {/php}
" /> {php} echo $this->_tpl_vars['village'][$this->_tpl_vars['dbname']]; {/php}

									</a>
								</div>
							</div>
						{php} endif; {/php}
						{php}  if (($this->_tpl_vars['village']['stone'] == 0) ):  {/php}
						{php}  if ($row[stone] == 0):  {/php}
						{php} 
						$aaa = mysql_query("SELECT * FROM build WHERE villageid ='".$_GET["village"]."' AND building = 'stone'");
						$bbb = mysql_num_rows($aaa);
						{/php}
						{php}  if ($bbb == 1):  {/php}
						<div id="l_stone" class="l_stone" title="Szobor" style="display: inline; "><div class="label"><b><font color="#DDD" size="-3"><span class="timer">{php} echo $stone_end; {/php}</span></font></b></a></div></div>
						{php}  endif;  {/php}
						{php}  endif;  {/php}
						{php}  endif;  {/php}
						
						{php} if ($this->_tpl_vars['dbname'] == 'iron'): {/php}
							<div id="l_{php} echo $this->_tpl_vars['dbname']; {/php}
" class="l_{php} echo $this->_tpl_vars['dbname']; {/php}
">
								<div class="label">
									<a href="game.php?village={php} echo $this->_tpl_vars['village']['id']; {/php}
&screen={php} echo $this->_tpl_vars['dbname']; {/php}
">
										<img src="graphic/buildings/{php} echo $this->_tpl_vars['dbname']; {/php}
.png" class="middle" alt="{php} echo $this->_tpl_vars['cl_builds']->get_name($this->_tpl_vars['dbname']); {/php}
" /> {php} echo $this->_tpl_vars['village'][$this->_tpl_vars['dbname']]; {/php}

									</a>
								</div>
							</div>
						{php} endif; {/php}
						{php}  if (($this->_tpl_vars['village']['iron'] == 0) ):  {/php}
						{php}  if ($row[iron] == 0):  {/php}
						{php} 
						$aaa = mysql_query("SELECT * FROM build WHERE villageid ='".$_GET["village"]."' AND building = 'iron'");
						$bbb = mysql_num_rows($aaa);
						{/php}
						{php}  if ($bbb == 1):  {/php}
						<div id="l_iron" class="l_iron" title="Szobor" style="display: inline; "><div class="label"><b><font color="#DDD" size="-3"><span class="timer">{php} echo $iron_end; {/php}</span></font></b></a></div></div>
						{php}  endif;  {/php}
						{php}  endif;  {/php}
						{php}  endif;  {/php}
						
						{php} if ($this->_tpl_vars['dbname'] == 'farm'): {/php}
							<div id="l_{php} echo $this->_tpl_vars['dbname']; {/php}
" class="l_{php} echo $this->_tpl_vars['dbname']; {/php}
">
								<div class="label">
									<a href="game.php?village={php} echo $this->_tpl_vars['village']['id']; {/php}
&screen={php} echo $this->_tpl_vars['dbname']; {/php}
">
										<img src="graphic/buildings/{php} echo $this->_tpl_vars['dbname']; {/php}
.png" class="middle" alt="{php} echo $this->_tpl_vars['cl_builds']->get_name($this->_tpl_vars['dbname']); {/php}
" /> {php} echo $this->_tpl_vars['village'][$this->_tpl_vars['dbname']]; {/php}

									</a>
								</div>
							</div>
						{php} endif; {/php}
						
						{php} if ($this->_tpl_vars['dbname'] == 'storage'): {/php}
							<div id="l_{php} echo $this->_tpl_vars['dbname']; {/php}
" class="l_{php} echo $this->_tpl_vars['dbname']; {/php}
">
								<div class="label">
									<a href="game.php?village={php} echo $this->_tpl_vars['village']['id']; {/php}
&screen={php} echo $this->_tpl_vars['dbname']; {/php}
">
										<img src="graphic/buildings/{php} echo $this->_tpl_vars['dbname']; {/php}
.png" class="middle" alt="{php} echo $this->_tpl_vars['cl_builds']->get_name($this->_tpl_vars['dbname']); {/php}
" /> {php} echo $this->_tpl_vars['village'][$this->_tpl_vars['dbname']]; {/php}

									</a><br>

								</div>
							</div>
						{php} endif; {/php}
						
						{php} if ($this->_tpl_vars['dbname'] == 'hide'): {/php}
							<div id="l_{php} echo $this->_tpl_vars['dbname']; {/php}
" class="l_{php} echo $this->_tpl_vars['dbname']; {/php}
">
								<div class="label">
									<a href="game.php?village={php} echo $this->_tpl_vars['village']['id']; {/php}
&screen={php} echo $this->_tpl_vars['dbname']; {/php}
">
										<img src="graphic/buildings/{php} echo $this->_tpl_vars['dbname']; {/php}
.png" class="middle" alt="{php} echo $this->_tpl_vars['cl_builds']->get_name($this->_tpl_vars['dbname']); {/php}
" /> {php} echo $this->_tpl_vars['village'][$this->_tpl_vars['dbname']]; {/php}

									</a>
								</div>
							</div>
						{php} endif; {/php}
						{php}  if (($this->_tpl_vars['village']['hide'] == 0) ):  {/php}
						{php}  if ($row[hide] == 0):  {/php}
						{php} 
						$aaa = mysql_query("SELECT * FROM build WHERE villageid ='".$_GET["village"]."' AND building = 'hide'");
						$bbb = mysql_num_rows($aaa);
						{/php}
						{php}  if ($bbb == 1):  {/php}
						<div id="l_hide" class="l_hide" title="Szobor" style="display: inline; "><div class="label"><b><font color="#DDD" size="-3"><span class="timer">{php} echo $hide_end; {/php}</span></font></b></a></div></div>
						{php}  endif;  {/php}
						{php}  endif;  {/php}
						{php}  endif;  {/php}
						
						{php} if ($this->_tpl_vars['dbname'] == 'wall'): {/php}
							<div id="l_{php} echo $this->_tpl_vars['dbname']; {/php}
" class="l_{php} echo $this->_tpl_vars['dbname']; {/php}
">
								<div class="label">
									<a href="game.php?village={php} echo $this->_tpl_vars['village']['id']; {/php}
&screen={php} echo $this->_tpl_vars['dbname']; {/php}
">
										<img src="graphic/buildings/{php} echo $this->_tpl_vars['dbname']; {/php}
.png" class="middle" alt="{php} echo $this->_tpl_vars['cl_builds']->get_name($this->_tpl_vars['dbname']); {/php}
" /> {php} echo $this->_tpl_vars['village'][$this->_tpl_vars['dbname']]; {/php}

									</a>
								</div>
							</div>
						{php} endif; {/php}
						{php}  if (($this->_tpl_vars['village']['wall'] == 0) ):  {/php}
						{php}  if ($row[wall] == 0):  {/php}
						{php} 
						$aaa = mysql_query("SELECT * FROM build WHERE villageid ='".$_GET["village"]."' AND building = 'wall'");
						$bbb = mysql_num_rows($aaa);
						{/php}
						{php}  if ($bbb == 1):  {/php}
						<div id="l_wall" class="l_wall" title="Szobor" style="display: inline; "><div class="label"><b><font color="#DDD" size="-3"><span class="timer">{php} echo $wall_end; {/php}</span></font></b></a></div></div>
						{php}  endif;  {/php}
						{php}  endif;  {/php}
						{php}  endif;  {/php}
					
					{php} endforeach; endif; unset($_from); {/php}{php} endif{/php}
				  

</div>
				<script type="text/javascript">overviewShowLevel();</script>
				</td></tr></table>			
		</td>
		<td valign="top">
			<table class="vis" width="250">
				<tr><th colspan="2">Produ&ccedil;&atilde;o por minuto</th></tr>
				<tr class="nowrap"><td width="90"><img src="graphic/holz.png" title="Madeira" alt="" /> Madeira</td><td><strong>{php} echo format_number($this->_tpl_vars['wood_prod_overview']); {/php}
</strong>  {php} if ($this->_tpl_vars['speed'] > 10): {/php}unidades{php} else: {/php}Hora{php} endif; {/php}</td></tr>
				<tr class="nowrap"><td><img src="graphic/lehm.png" title="Argila" alt="" /> Argila</td><td><strong>{php} echo format_number($this->_tpl_vars['stone_prod_overview']); {/php}
</strong>  {php} if ($this->_tpl_vars['speed'] > 10): {/php}unidades{php} else: {/php}Hora{php} endif; {/php}</td></tr>
				<tr class="nowrap"><td><img src="graphic/eisen.png" title="Ferro" alt="" /> Ferro</td><td><strong>{php} echo format_number($this->_tpl_vars['iron_prod_overview']); {/php}
</strong>  {php} if ($this->_tpl_vars['speed'] > 10): {/php}unidades{php} else: {/php}Hora{php} endif; {/php}</td></tr>
			</table>
			<br />
				<table class="vis" width="100%">
				<tr><th class="fonte9">Tropa</th><th class="fonte9">Unidades</th></tr>
				 {php} $_from = $this->_tpl_vars['in_village_units']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['dbname'] => $this->_tpl_vars['num']):
{/php}
                	<tr><td><strong class="cororido2"><img src="graphic/unit/{php} echo $this->_tpl_vars['dbname']; {/php}
.png">{php} echo $this->_tpl_vars['cl_units']->get_name($this->_tpl_vars['dbname']); {/php}</strong></strong><strong class="meu"><td><strong class="meu">{php} echo $this->_tpl_vars['num']; {/php} unidades</td>

</td></tr>
                {php} endforeach; endif; unset($_from); {/php}
				
			</table>
			<br />
			{php} if ($this->_tpl_vars['village']['agreement'] != '100'): {/php}
				<table class="vis" width="100%">
				<tr><th>Lealdade:</th><th>{php} echo $this->_tpl_vars['village']['agreement']; {/php}
</th></tr>
				</table>
				<br />
			{php} endif; {/php}
			  {literal}
			  <script>
			  function popup_scroll(url, width, height) {
        	wnd = window.open(url, "popup", "width="+width + ",height="+height + ",left=150,top=100,resizable=yes,scrollbars=yes");
        	wnd.focus();
        }
			  </script>
			  {/literal}
			
						
						{php} if (count ( $this->_tpl_vars['other_movements'] ) > 0): {/php}
			<table class="vis">
				<tr>
					<th width="250">Tropas em chegada</th>
					<th width="160">Chegada</th>
					<th width="80">Chegada em</th>
				</tr>
				{php} $_from = $this->_tpl_vars['other_movements']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['array']):
{/php}
				    <tr>
				        <td>
				            <a href="game.php?village={php} echo $this->_tpl_vars['village']['id']; {/php}
&amp;screen=info_command&amp;id={php} echo $this->_tpl_vars['array']['id']; {/php}
&amp;type=other">
				            <img src="graphic/command/{php} echo $this->_tpl_vars['array']['type']; {/php}
.png"> {php} echo $this->_tpl_vars['array']['message']; {/php}

				            </a>
				        </td>
				        <td>{php}
$data_terminaree=(is_array($_tmp=$this->_tpl_vars['array']['end_time'])) ? $this->_run_mod_handler('format_date', true, $_tmp) : format_date($_tmp);
$data_terminaree = str_replace("heute um","hoje &agrave;s",$data_terminaree);
$data_terminaree = str_replace("Uhr","Hrs",$data_terminaree);
$data_terminaree = str_replace("am","em",$data_terminaree);
$data_terminaree = str_replace("um","&agrave;s",$data_terminaree);
$data_terminaree = str_replace("morgen","amanh&atilde;",$data_terminaree);
//Variabila originala tpl:{$array.end_time|format_date}

echo $data_terminaree;
{/php}
</td>
				        {php} if ($this->_tpl_vars['array']['arrival_in'] < 0): {/php}
				        	<td>{php} echo ((is_array($_tmp=$this->_tpl_vars['array']['arrival_in'])) ? $this->_run_mod_handler('format_time', true, $_tmp) : format_time($_tmp)); {/php}
</td>
				        {php} else: {/php}
				        	<td><span class="timer">{php} echo ((is_array($_tmp=$this->_tpl_vars['array']['arrival_in'])) ? $this->_run_mod_handler('format_time', true, $_tmp) : format_time($_tmp)); {/php}
</span></td>
				        {php} endif; {/php}
				    </tr>
				{php} endforeach; endif; unset($_from); {/php}
			</table>
			{php} endif; {/php}
						{php} if (count ( $this->_tpl_vars['my_movements'] ) > 0): {/php}
			<table class="vis">
				<tr>
					<th width="250">Meus comandos</th>
					<th width="160">Chegada</th>
					<th width="80">Chegada em</th>
				</tr>
				{php} $_from = $this->_tpl_vars['my_movements']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['array']):

{/php}
				    <tr>
				        <td>
      <a href="game.php?village={php}  echo $this->_tpl_vars['village']['id']; {/php}
&amp;screen=info_command&amp;id={php} echo $this->_tpl_vars['array']['id']; {/php}
&amp;type=own">
				            <img src="graphic/command/{php} echo $this->_tpl_vars['array']['type']; {/php}
.png"> {php}$data_terminaree=$this->_tpl_vars['array']['message']; 
$data_terminaree = str_replace("Angriff auf","Ataque &agrave;",$data_terminaree);
$data_terminaree = str_replace("Unterstützung für","Apoio &agrave;",$data_terminaree);
$data_terminaree = str_replace("Rückzug von","Retirada de",$data_terminaree);
$data_terminaree = str_replace("Rückkehr von","Retorno de",$data_terminaree);
//Variabila originala tpl: $this->_tpl_vars['array']['message']
echo $data_terminaree;
{/php}

				            </a>
				        </td>
				        <td>{php}
$data_terminaree=(is_array($_tmp=$this->_tpl_vars['array']['end_time'])) ? $this->_run_mod_handler('format_date', true, $_tmp) : format_date($_tmp);
$data_terminaree = str_replace("heute um","hoje &agrave;s",$data_terminaree);
$data_terminaree = str_replace("Uhr","Hrs",$data_terminaree);
$data_terminaree = str_replace("am","em",$data_terminaree);
$data_terminaree = str_replace("um","&agrave;s",$data_terminaree);
$data_terminaree = str_replace("morgen","amanh&atilde;",$data_terminaree);
//Variabila originala tpl:{$array.end_time|format_date}

echo $data_terminaree;
{/php}
</td>
				        {php} if ($this->_tpl_vars['array']['arrival_in'] < 0): {/php}
				        	<td>{php} echo ((is_array($_tmp=$this->_tpl_vars['array']['arrival_in'])) ? $this->_run_mod_handler('format_time', true, $_tmp) : format_time($_tmp)); {/php}
</td>
				        {php} else: {/php}
				        	<td><span class="timer">{php} echo ((is_array($_tmp=$this->_tpl_vars['array']['arrival_in'])) ? $this->_run_mod_handler('format_time', true, $_tmp) : format_time($_tmp)); {/php}
</span></td>
				        {php} endif; {/php}
				        {php} if ($this->_tpl_vars['array']['can_cancel']): {/php}
				        	<td><a href="game.php?village={php} echo $this->_tpl_vars['village']['id']; {/php}
&amp;screen=place&amp;action=cancel&amp;id={php} echo $this->_tpl_vars['array']['id']; {/php}
&amp;h={php} echo $this->_tpl_vars['hkey']; {/php}
">cancelar</a></td>
				        {php} endif; {/php}
				    </tr>
				{php} endforeach; endif; unset($_from); {/php}
			</table>
<br />
			{php} endif; {/php}
		</td>
	</tr>
</table>
{php} endif; {/php}
{php}
	if($overview == "old"):
{/php}
{php} require_once(SMARTY_CORE_DIR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('modifier', 'format_date', 'game_overview.tpl', 53, false),array('modifier', 'format_time', 'game_overview.tpl', 55, false),)), $this); {/php}
<h2>Aldeia {php} echo $this->_tpl_vars['village']['name']; {/php}
</h2>
<table>
	<tr>
		<td width="100%" valign="top">
			<table class="vis" width="100%" style="border: 1px solid rgb(128, 64, 0);">
				<tr>
					<th colspan="2">Edif&iacute;cios</th>
				</tr>
				{php} $_from = $this->_tpl_vars['built_builds']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['id'] => $this->_tpl_vars['dbname']):
{/php}
					<tr>
						<td><a href="game.php?village={php} echo $this->_tpl_vars['village']['id']; {/php}&screen={php} echo $this->_tpl_vars['dbname']; {/php}"><img src="graphic/buildings/{php} echo $this->_tpl_vars['dbname']; {/php}.png"> {php} echo $this->_tpl_vars['cl_builds']->get_name($this->_tpl_vars['dbname']); {/php}
</a> (N&iacute;vel {php} echo $this->_tpl_vars['village'][$this->_tpl_vars['dbname']]; {/php}
)</td><td align="center">
{php} if ($this->_tpl_vars['dbname'] == "market"){
	$sql = "SELECT * FROM villages WHERE id =".$_GET[village];
	$res = mysql_query($sql);
	while($row = mysql_fetch_assoc($res)){
		$dealers = $row[dealers_outside];
		$market = $row[market];
	}
	include("include/configs/dealers.php");
	$dealers_in = $arr_dealers[$market] - $dealers;


echo "<strong>Mercadores: ".$dealers_in."/".$arr_dealers[$market]."</strong>";
} 

{/php}</td>
					</tr>
				{php} endforeach; endif; unset($_from); {/php}
			</table>
<br><a href="game.php?overview=new&screen=overview&village={php}echo $_GET[village];{/php}">Visualiza&ccedil;&atilde;o gr&aacute;fica da aldeia</a>
		</td>
				<td valign="top">
			<table class="vis" width="250">
				<tr><th colspan="2">Produ&ccedil;&atilde;o por minuto</th></tr>
				<tr class="nowrap"><td width="90"><img src="graphic/holz.png" title="Madeira" alt="" /> Madeira</td><td><strong>{php} echo format_number($this->_tpl_vars['wood_prod_overview']); {/php}
</strong>  {php} if ($this->_tpl_vars['speed'] > 10): {/php}unidades{php} else: {/php}Hora{php} endif; {/php}</td></tr>
				<tr class="nowrap"><td><img src="graphic/lehm.png" title="Argila" alt="" /> Argila</td><td><strong>{php} echo format_number($this->_tpl_vars['stone_prod_overview']); {/php}
</strong> {php} if ($this->_tpl_vars['speed'] > 10): {/php}unidades{php} else: {/php}Hora{php} endif; {/php}</td></tr>
				<tr class="nowrap"><td><img src="graphic/eisen.png" title="Ferro" alt="" /> Ferro</td><td><strong>{php} echo format_number($this->_tpl_vars['iron_prod_overview']); {/php}
</strong>  {php} if ($this->_tpl_vars['speed'] > 10): {/php}unidades{php} else: {/php}Hora{php} endif; {/php}</td></tr>
			</table>
			<br />
			<table class="vis" width="100%">
				<tr><th class="fonte9">Tropa</th><th class="fonte9">Unidades</th></tr>
				 {php} $_from = $this->_tpl_vars['in_village_units']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['dbname'] => $this->_tpl_vars['num']):
{/php}
                	<tr><td><strong class="cororido2"><img src="graphic/unit/{php} echo $this->_tpl_vars['dbname']; {/php}
.png">{php} echo $this->_tpl_vars['cl_units']->get_name($this->_tpl_vars['dbname']); {/php}</strong></strong><strong class="meu"><td><strong class="meu">{php} echo $this->_tpl_vars['num']; {/php} unidades</td>

</td></tr>
                {php} endforeach; endif; unset($_from); {/php}
				
			</table>
			<br />
			{php} if ($this->_tpl_vars['village']['agreement'] != '100'): {/php}
				<table class="vis" width="100%">
				<tr><th>Lealdade:</th><th>{php} echo $this->_tpl_vars['village']['agreement']; {/php}
</th></tr>
				</table>
				<br />
			{php} endif; {/php}
			  {literal}
			  <script>
			  function popup_scroll(url, width, height) {
        	wnd = window.open(url, "popup", "width="+width + ",height="+height + ",left=150,top=100,resizable=yes,scrollbars=yes");
        	wnd.focus();
        }
			  </script>
			  {/literal}
			
						
						{php} if (count ( $this->_tpl_vars['other_movements'] ) > 0): {/php}
			<table class="vis">
				<tr>
					<th width="250">Tropas em chegada</th>
					<th width="160">Chegada</th>
					<th width="80">Chegada em</th>
				</tr>
				{php} $_from = $this->_tpl_vars['other_movements']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['array']):
{/php}
				    <tr>
				        <td>
				            <a href="game.php?village={php} echo $this->_tpl_vars['village']['id']; {/php}
&amp;screen=info_command&amp;id={php} echo $this->_tpl_vars['array']['id']; {/php}
&amp;type=other">
				            <img src="graphic/command/{php} echo $this->_tpl_vars['array']['type']; {/php}
.png"> {php} echo $this->_tpl_vars['array']['message']; {/php}

				            </a>
				        </td>
				        <td>{php}
$data_terminaree=(is_array($_tmp=$this->_tpl_vars['array']['end_time'])) ? $this->_run_mod_handler('format_date', true, $_tmp) : format_date($_tmp);
$data_terminaree = str_replace("heute um","hoje &agrave;s",$data_terminaree);
$data_terminaree = str_replace("Uhr","Hrs",$data_terminaree);
$data_terminaree = str_replace("am","em",$data_terminaree);
$data_terminaree = str_replace("um","&agrave;s",$data_terminaree);
$data_terminaree = str_replace("morgen","amanh&atilde;",$data_terminaree);
//Variabila originala tpl:{$array.end_time|format_date}

echo $data_terminaree;
{/php}
</td>
				        {php} if ($this->_tpl_vars['array']['arrival_in'] < 0): {/php}
				        	<td>{php} echo ((is_array($_tmp=$this->_tpl_vars['array']['arrival_in'])) ? $this->_run_mod_handler('format_time', true, $_tmp) : format_time($_tmp)); {/php}
</td>
				        {php} else: {/php}
				        	<td><span class="timer">{php} echo ((is_array($_tmp=$this->_tpl_vars['array']['arrival_in'])) ? $this->_run_mod_handler('format_time', true, $_tmp) : format_time($_tmp)); {/php}
</span></td>
				        {php} endif; {/php}
				    </tr>
				{php} endforeach; endif; unset($_from); {/php}
			</table>
			{php} endif; {/php}
						{php} if (count ( $this->_tpl_vars['my_movements'] ) > 0): {/php}
			<table class="vis">
				<tr>
					<th width="250">Meus comandos</th>
					<th width="160">Chegada</th>
					<th width="80">Chegada em</th>
				</tr>
				{php} $_from = $this->_tpl_vars['my_movements']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['array']):

{/php}
				    <tr>
				        <td>
      <a href="game.php?village={php}  echo $this->_tpl_vars['village']['id']; {/php}
&amp;screen=info_command&amp;id={php} echo $this->_tpl_vars['array']['id']; {/php}
&amp;type=own">
				            <img src="graphic/command/{php} echo $this->_tpl_vars['array']['type']; {/php}
.png"> {php}$data_terminaree=$this->_tpl_vars['array']['message']; 
$data_terminaree = str_replace("Angriff auf","Ataque &agrave;",$data_terminaree);
$data_terminaree = str_replace("Unterstützung für","Apoio &agrave;",$data_terminaree);
$data_terminaree = str_replace("Rückzug von","Retirada de",$data_terminaree);
$data_terminaree = str_replace("Rückkehr von","Retorno de",$data_terminaree);
//Variabila originala tpl: $this->_tpl_vars['array']['message']
echo $data_terminaree;
{/php}

				            </a>
				        </td>
				        <td>{php}
$data_terminaree=(is_array($_tmp=$this->_tpl_vars['array']['end_time'])) ? $this->_run_mod_handler('format_date', true, $_tmp) : format_date($_tmp);
$data_terminaree = str_replace("heute um","hoje &agrave;s",$data_terminaree);
$data_terminaree = str_replace("Uhr","Hrs",$data_terminaree);
$data_terminaree = str_replace("am","em",$data_terminaree);
$data_terminaree = str_replace("um","&agrave;s",$data_terminaree);
$data_terminaree = str_replace("morgen","amanh&atilde;",$data_terminaree);
//Variabila originala tpl:{$array.end_time|format_date}

echo $data_terminaree;
{/php}
</td>
				        {php} if ($this->_tpl_vars['array']['arrival_in'] < 0): {/php}
				        	<td>{php} echo ((is_array($_tmp=$this->_tpl_vars['array']['arrival_in'])) ? $this->_run_mod_handler('format_time', true, $_tmp) : format_time($_tmp)); {/php}
</td>
				        {php} else: {/php}
				        	<td><span class="timer">{php} echo ((is_array($_tmp=$this->_tpl_vars['array']['arrival_in'])) ? $this->_run_mod_handler('format_time', true, $_tmp) : format_time($_tmp)); {/php}
</span></td>
				        {php} endif; {/php}
				        {php} if ($this->_tpl_vars['array']['can_cancel']): {/php}
				        	<td><a href="game.php?village={php} echo $this->_tpl_vars['village']['id']; {/php}
&amp;screen=place&amp;action=cancel&amp;id={php} echo $this->_tpl_vars['array']['id']; {/php}
&amp;h={php} echo $this->_tpl_vars['hkey']; {/php}
">cancelar</a></td>
				        {php} endif; {/php}
				    </tr>
				{php} endforeach; endif; unset($_from); {/php}
			</table>
<br />
			{php} endif; {/php}
		</td>
	</tr>
</table>
{php} endif; {/php}