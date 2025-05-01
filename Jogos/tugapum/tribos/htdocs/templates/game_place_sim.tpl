{* Simulator *}
{if isset($simulate) && $simulate}
	<table class="vis">
		<tr>
			<td colspan="2"></td>
			{foreach from=$cl_units->get_array("dbname") item=dbname key=name}
				<th width="35"><img src="graphic/unit/{$dbname}.png" title="{$name}" alt="" /></th>
			{/foreach}
		</tr>
		<tr>
			<td rowspan="2">Atacante</td>
			<td>Tropa:</td>
			{foreach from=$simulate_values.att item=num key=unitname}
				{if $num=="0"}
					<td class="hidden">0</td>
				{else}
					<td>{$num}</td>
				{/if}
			{/foreach}
		</tr>
		<tr>
			<td>Perdas:</td>
			{foreach from=$simulate_values.att_lose item=num key=unitname}
				{if $num=="0"}
					<td class="hidden">0</td>
				{else}
					<td>{$num}</td>
				{/if}
			{/foreach}
		</tr>
		<tr>
			<td style="display:none"></td>
		</tr>
		<tr>
			<td rowspan="2">Defensor</td>
			<td>Tropa:</td>
			{foreach from=$simulate_values.def item=num key=unitname}
				{if $num=="0"}
					<td class="hidden">0</td>
				{else}
					<td>{$num}</td>
				{/if}
			{/foreach}
		</tr>
		<tr>
			<td>Perdas:</td>
			{foreach from=$simulate_values.def_lose item=num key=unitname}
				{if $num=="0"}
					<td class="hidden">0</td>
				{else}
					<td>{$num}</td>
				{/if}
			{/foreach}
		</tr>
	</table>
	<table>
	{if $simulate_values.others.def_wall!=$simulate_values.others.new_wall}
		<tr>
		  <th>Dano dos arietes:</th>
		  <td>Muralha demolida do n&iacute;vel   <b>{$simulate_values.others.def_wall} </b>ao n&iacute;vel <b>{$simulate_values.others.new_wall}</b></td>
		</tr>
	{/if}
	
	{if $simulate_values.others.def_building!=$simulate_values.others.new_building}
		<tr>
		  <th>Dano das catapultas:</th>
		  <td>Edif&iacute;cio demolido do n&iacute;vel <b>{$simulate_values.others.def_building}</b> ao n&iacute;vel <b>{$simulate_values.others.new_building}</b></td>
		</tr>
	{/if}
	</table>
{/if}

<form action="game.php?village={$village.id}&amp;screen=place&amp;mode=sim" method="post" name="units">
	<input name="simulate" type="hidden" />
	<table width="399" class="vis">
<tr>
			<th width="256"></th>
		<th width="62" colspan="1">Atacante</th>
	    <th colspan="2">Defensor</th>
	  </tr>
		<tr>
		  <td colspan="3">Tropa</td>

		</tr>
		{foreach from=$cl_units->get_array("dbname") item=dbname key=name}
			<tr>
				<td><a href="javascript:popup('popup_unit.php?unit={$dbname}, 520, 520)"><img src="graphic/unit/{$dbname}.png" title="" alt="" /> {$name}</a></td>
				<td><input type="text" name="att_{$dbname}" size="5" value="{$values.att.$dbname}" /></td>
			  <td><input type="text" name="def_{$dbname}" size="5" value="{$values.def.$dbname}" /></td>
			</tr>
		{/foreach}
		<tr>
			<td>Muralha</td>
			<td colspan="1"></td>
		  <td width="65" colspan="2"><input type="text" name="def_wall" value="{$values.def_wall}" size="5" /></td>
	  </tr>
		<tr>
			<td>N&iacute;vel do alvo das catapultas </td>
			<td colspan="1"></td><td colspan="2"><input type="text" name="def_building" value="{$values.def_building}" size="5" /></td>
		</tr>
		{if $moral_activ}
			<tr>
				<td>Moral</td>
				<td colspan="4"><input type="text" name="moral" value="{$values.moral}" size="5" id="moral" />%</td>
			</tr>
		{/if}
		<tr>
			<td>Sorte (entre -25% e +25%)</td>
			<td colspan="4"><input type="text" name="luck" value="{$values.luck}" size="5" />%</td>
		</tr>
  </table>
  <input type="submit" value="Calcular" />
</form>