{php}
	if ($_GET['activate'] == 'winter_graphic'){
		mysql_query("UPDATE users SET winter = 'winter'");
	}elseif ($_GET['dezactivate'] == 'winter_graphic'){
		mysql_query("UPDATE users SET winter =''");
	}
{/php}
<table class="vis" width="600"><tr>
	<th>Utilitate</th><th width="200">Actiune</th>
</tr>
<tr>
	<td>Grafica de iarna</td><td><a href="index.php?screen=other&activate=winter_graphic">Activeaza</a>|<a href="index.php?screen=other&dezactivate=winter_graphic">Dezactiveaza</a></td>
</tr>
</table>
