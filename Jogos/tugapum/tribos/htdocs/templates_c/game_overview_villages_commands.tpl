<table class="vis">
<tr>
  <th>Ataque</th>
  <th>Aldeia</th>
  <th>Chegada em </th>
		{foreach from=$cl_units->get_array("dbname") item=dbname key=name}
			<th width="30"><img src="graphic/unit/{$dbname}.png" title="{$name}" alt="" /></th>
		{/foreach}
</tr>
		{foreach from=$my_movements item=array}
	    {assign var='vid' value=$array.homevillageid}
      {assign var='vid' value=id_$vid}
	    {if isset($villages_of_group[$vid]) or $aktu_group == 0}
			<tr class="row_a">
			{else}
			<tr class="row_a" style="display: none;">
			{/if}
				<td><a href="game.php?village={$village.id}&amp;screen=info_command&amp;id={$array.id}&amp;type=own">{$array.message|replace:"Angriff auf":"Ataque a"|replace:"Unterstützung für":"Apoio a "}</a></td>
				<td><a href="game.php?village={$village.id}&amp;screen=info_village&amp;id={$array.homevillageid}">{$array.homevillagename}</a></td>
				<td><span class="timer">{$array.arrival_in|format_time}</span></td>
				{foreach from=$array.units item=num}
					{if $num==0}
						<td class="hidden">0</td>
					{else}
						<td>{$num}</td>
					{/if}
				{/foreach}
			</tr>
		{/foreach}	
</table>