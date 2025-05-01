<?php
include("include.inc.php");
include("include/config.php");
$link=mysql_connect($config['db_host'],$config['db_user'],$config['db_pw']) or die("not");
mysql_select_db("lan") or die("not");

$qq1 = mysql_query("SELECT * FROM villages WHERE id = '".$_GET['villid']."'");
$f1 = mysql_fetch_assoc($qq1);

if($f1['bonus'] == 1)
	{ 
	 echo "<b>Bonus de 50% no arma&eacute;m e mercadores</b>";
	}
	elseif($f1['bonus'] == 2)
	{
	 echo "<b>Bonus de 10% no espa&ccedil;o da fazenda</b>";
	}
	elseif($f1['bonus'] == 3)
	{
	 echo "<b>Bonus de 33% no tempo de recrutamento no es&aacute;bulo</b>";
	}
	elseif($f1['bonus'] == 4)
	{
	 echo "<b>Bonus de 33% no recrutamento no quartel</b>";
	}
	elseif($f1['bonus'] == 5)
	{
	 echo "<b>Bonus de 50% no recrutamento na oficina</b>";
	}
	elseif($f1['bonus'] == 6)
	{
	 echo "<b>Bonus de 30% na produ&ccedil;&atilde;o de recursos</b>";
	}
?>