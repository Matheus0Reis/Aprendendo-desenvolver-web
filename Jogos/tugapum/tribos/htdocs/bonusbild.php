<?php
include("include.inc.php");
include("include/config.php");
$link=mysql_connect($config['db_host'],$config['db_user'],$config['db_pw']) or die("not");
mysql_select_db("lan") or die("not");

$qq1 = mysql_query("SELECT * FROM villages WHERE id = '".$_GET['villid']."'");
$f1 = mysql_fetch_assoc($qq1);

	if($f1['bonus'] == 1)
	{ 
	 echo "<img src='graphic/bonus/storage.png'>";
	}
	elseif($f1['bonus'] == 2)
	{
	 echo "<img src='graphic/bonus/farm.png'>";
	}
	elseif($f1['bonus'] == 3)
	{
	 echo "<img src='graphic/bonus/stable.png'>";
	}
	elseif($f1['bonus'] == 4)
	{
	 echo "<img src='graphic/bonus/barracks.png'>";
	}
	elseif($f1['bonus'] == 5)
	{
	 echo "<img src='graphic/bonus/garage.png'>";
	}
	elseif($f1['bonus'] == 6)
	{
	 echo "<img src='graphic/bonus/all.png'>";
	}
?>