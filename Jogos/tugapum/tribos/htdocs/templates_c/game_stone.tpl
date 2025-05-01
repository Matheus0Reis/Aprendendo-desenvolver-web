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
					if($row[stone] < 10)
					{
						echo"<img src=\"graphic/big_buildings/stone1.png\" alt=\"Lehmgrube\"/>";
					}
					if($row[stone] >= 10 && $row[stone]<20)
					{
						echo"<img src=\"graphic/big_buildings/stone2.png\" alt=\"Lehmgrube\"/>";
					}
					if($row[stone] >= 20)
					{
						echo"<img src=\"graphic/big_buildings/stone3.png\" alt=\"Lehmgrube\"/>";
					}
				}
			{/php}

		</td>
		<td>
			<h2>
				<span class="fontevermelha">Poço de Argila</span> <span class="cororido3">({$village.stone|stage|replace:"Stufe":"Nível"|replace:"nicht vorhanden":"não construído"})</span>
			</h2>
			{$description}
		</td>
	</tr>
</table>
<br />
	<table class="vis">
		<tr>
			<td width="200">
				<img src="graphic/lehm.png" title="Argila" alt="" />
				Producao atual
			</td>
			<td>
				<b>{$stone_datas.stone_production} </b>
				Unidades por minuto
			</td>
		</tr>

		{if ($stone_datas.stone_production_next)==false}

		{else}

			<tr>
				<td>
					<img src="graphic/lehm.png" title="Argila" alt="" />
				Producao no (Nivel {$village.stone+1})
			</td>
			<td>
				<b>{$stone_datas.stone_production_next}</b>
				Unidades por minuto
			</td>
		</tr>
    {/if}

</table>
