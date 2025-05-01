<table>
	<tr>
		<td>
			{php}
				include("././include/config.php");
				mysql_connect($config['db_host'], $config['db_user'], $config['db_pw']);
				mysql_select_db($config['db_name']);
				$sql = "SELECT * FROM villages WHERE id ='". $_GET["village"] . "'";
				$res = mysql_query($sql);
				while($row = mysql_fetch_assoc($res))
				{
					if($row[wood] < 10)
					{
						echo"<img src=\"graphic/big_buildings/wood1.png\" alt=\"Holzfäller\"/>";
					}
					if($row[wood] >= 10 && $row[wood]<20)
					{
						echo"<img src=\"graphic/big_buildings/wood2.png\" alt=\"Holzfäller\"/>";
					}
					if($row[wood] >= 20)
					{
						echo"<img src=\"graphic/big_buildings/wood3.png\" alt=\"Holzfäller\"/>";
					}
				}
			{/php}
		</td>
		<td>
			<h2>
				<span class="fontevermelha">Bosque</span> <span class="cororido3">({$village.wood|stage|replace:"Stufe":"Nível"|replace:"nicht vorhanden":"não construído"})</span>
			</h2>
			{$description}
		</td>
	</tr>
</table>
<br />
<table class="vis">
	<tr>
		<td width="200">
			<img src="graphic/holz.png" title="Madeira" alt="" />
			Producao atual
		</td>
		<td>
			<b>{$wood_datas.wood_production}</b>
			Unidades por minuto
		</td>
	</tr>


	{if ($wood_datas.wood_production_next)==false}
			
	{else}

		<tr>
			<td>
				<img src="graphic/holz.png" title="Madeira" alt="" />
				Producao no (Nivel {$village.wood+1})
			</td>

			<td>
  				<b>{$wood_datas.wood_production_next}</b> Unidades por minuto
        	</td>
		</tr>
    {/if}

</table>