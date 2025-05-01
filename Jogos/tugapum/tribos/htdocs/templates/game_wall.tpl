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
					if($row[wall] < 5)
					{
						echo"<img src=\"graphic/big_buildings/wall1.png\" alt=\"Wall\"/>";
					}
					if($row[wall] >= 5 && $row[wall]<15)
					{
						echo"<img src=\"graphic/big_buildings/wall2.png\" alt=\"Wall\"/>";
					}
					if($row[wall] >= 15)
					{
						echo"<img src=\"graphic/big_buildings/wall3.png\" alt=\"Wall\"/>";
					}
				}
			{/php}

		</td>
		<td>
			<h2>
				<span class="fontevermelha">Muralha</span> <span class="cororido3">({$village.wall|stage|replace:"Stufe":"Nível"|replace:"nicht vorhanden":"não construído"})</span>
			</h2>
			{$description}
		</td>
	</tr>
</table>
<br />
<table class="vis">
	<tr>
		<td width="200">
			Atual
		</td>
		<td width="200">
			<strong>{$wall_datas.Basic_defense}</strong>
			Defesa basica
		</td>
		<td width="200">
			<strong>{$wall_datas.wall_bonus}%</strong>
			Bonus de defesa
		</td>
	</tr>

	{if $wall_datas.basic_defense_next}

	{else}

		<tr>
			<td>
				No (Nivel {$village.wall+1})
			</td>
			<td>
				<strong>{$wall_datas.Basic_defense_next}</strong>
				Defesa basica
			</td>
			<td>
				<strong>{$wall_datas.wall_bonus_next}%</strong>
				Bonus de defesa
			</td>
		</tr>

    {/if}
    
</table>
