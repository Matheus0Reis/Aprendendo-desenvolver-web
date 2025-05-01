<table>
	<tr>
		<td>
		{php}
	include("././include/config.php");
	$sql = "SELECT * FROM villages WHERE id ='". $_GET["village"] . "'";
	mysql_connect($config['db_host'], $config['db_user'], $config['db_pw']);
	$res = mysql_query($sql);	
	while($row = mysql_fetch_assoc($res))
	{
		if($row[iron] < 10)
		{
			echo"<img src=\"graphic/big_buildings/iron1.png\" alt=\"Eisenmiene\"/>";	
		}
		if($row[iron] >=10 && $row[iron] <20)
		{
			echo"<img src=\"graphic/big_buildings/iron2.png\" alt=\"Eisenmiene\"/>";
		}
		if($row[iron] >=20)
		{
			echo"<img src=\"graphic/big_buildings/iron3.png\" alt=\"Eisenmiene\"/>";
		}		
				
	}	
{/php}   

		</td>
		<td>
			<h2>
				<span class="fontevermelha">Mina de Ferro</span> <span class="cororido3">({$village.iron|stage|replace:"Stufe":"Nível"|replace:"nicht vorhanden":"não construído"})</span>
			</h2>
            {$description}
		</td>
	</tr>
</table>
<br />
<table class="vis">
	<tr>
		<td width="200">
			<img src="graphic/eisen.png" title="Ferro" alt="" /> Producao atual
		</td>
		<td>
			<b>{$iron_datas.iron_production} </b>Unidades por minuto
		</td>
	</tr>

	{if ($iron_datas.iron_production_next)==false}

	{else}
		<tr>
	 		<td>
		 		<img src="graphic/eisen.png" title="Ferro" alt="" />
				 Producao no (Nivel {$village.iron+1})
			</td>
			<td>
				<b>{$iron_datas.iron_production_next}</b> Unidades por minuto
			</td>
		</tr>
    {/if}
</table>