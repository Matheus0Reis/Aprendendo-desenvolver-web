<?php
include("include.inc.php");
include("include/config.php");
$link=mysql_connect($config['db_host'],$config['db_user'],$config['db_pw']) or die("not");
mysql_select_db($config['db_name']) or die("not");

$qq1 = mysql_query("SELECT * FROM villages WHERE id = '".$_GET['villid']."'");
$f1 = mysql_fetch_assoc($qq1);

if($f1['bonus'] == 1)
	{ 
	 echo "<b>50% mais capacidade de armazenamento e comerciantes</b>";
	}
	elseif($f1['bonus'] == 2)
	{
	 echo "<b>10% mais população</b>";
	}
	elseif($f1['bonus'] == 3)
	{
	 echo "<b>33% produção mais rápida no estábulo</b>";
	}
	elseif($f1['bonus'] == 4)
	{
	 echo "<b>33% produção mais rápida no quartel</b>";
	}
	elseif($f1['bonus'] == 5)
	{
	 echo "<b>50% produção mais rápida na oficina</b>";
	}
	elseif($f1['bonus'] == 6)
	{
	 echo "<b>30% aumento da produção de matérias-primas</b>";
	}
?>