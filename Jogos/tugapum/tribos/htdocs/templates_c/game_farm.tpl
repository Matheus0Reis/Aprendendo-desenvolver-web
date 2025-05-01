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
					if($row[farm] < 10)
					{
						echo"<img src=\"graphic/big_buildings/farm1.png\" alt=\"Bauernhof\"/>";
					}
					if($row[farm] >= 10 && $row[farm]<20)
					{
						echo"<img src=\"graphic/big_buildings/farm2.png\" alt=\"Bauernhof\"/>";
					}
					if($row[farm] >= 20)
					{
						echo"<img src=\"graphic/big_buildings/farm3.png\" alt=\"Bauernhof\"/>";
					}
				}
			{/php}
			
		</td>
		<td>
			<h2><span class="fontevermelha">Fazenda</span> <span class="cororido3">({$village.farm|stage|replace:"Stufe":"Nível"|replace:"nicht vorhanden":"não construído"})</span></h2>
				{$description}
			</td>
		</tr>
	</table>
	<br />
	<table class="vis">
		<tr>
			<td>
				<img src="graphic/face.png" title="Populacao" alt="" />
				População Maxima
			</td>
			<td>
				<b>{$farm_datas.farm_size}</b>
			</td>
		</tr>

		{if ($farm_datas.farm_size_next)==false}

		{else}

			<tr>
				<td>
					<img src="graphic/face.png" title="Populacao" alt="" />
					População Maxima no (Nivel {$village.farm+1})
				</td>
				<td>
					<strong>{$farm_datas.farm_size_next}</strong>
				</td>
			</tr>
    	{/if}

</table>