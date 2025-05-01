<table class="vis">
	<tr>
		<th>Aldeia</th>
		<th></th>
		
		{foreach from=$unit item=name key=dbname}
			<th width="35"><img src="graphic/unit/{$dbname}.png" title="{$name}" alt="" /></th>
		{/foreach}
	
		<th>Comandos</th>
	</tr>
	
	{foreach from=$villages item=id key=arr_id}
		<tr>
			<td rowspan="3" valign="top">
				<a href="game.php?village={$arr_id}&screen=overview">{$villages.$arr_id.name} ({$villages.$arr_id.x}|{$villages.$arr_id.y})</a>
			</td>
			<td>As suas tropas</td>
			
			{foreach from=$unit item=name key=dbname}
				{if $own_units.$arr_id.$dbname==0}
						<td class="hidden">{$own_units.$arr_id.$dbname}</td>
				{else}
						<td>{$own_units.$arr_id.$dbname}</td>
				{/if}
			{/foreach}
			
			<td><a href="game.php?village={$village.id}&amp;screen=place&amp;">Pra&ccedil;a central</a></td>
		</tr>
		<tr class="units_there">
			<td>Total</td>
			
			{foreach from=$unit item=name key=dbname}
				{if $all_units.$arr_id.$dbname==0}
						<td class="hidden">{$all_units.$arr_id.$dbname}</td>
				{else}
						<td>{$all_units.$arr_id.$dbname}</td>
				{/if}
			{/foreach}
		
			<td rowspan="2"><a href="game.php?village={$village.id}&amp;screen=place&amp;mode=units">Detalhes</a></td>
		</tr>
		<tr class="units_away">
			<td>Tropas fora </td>
			
			{foreach from=$unit item=name key=dbname}
				{if $villages.$arr_id.outward.$dbname==0}
						<td class="hidden">{$villages.$arr_id.outward.$dbname}</td>
				{else}
						<td>{$villages.$arr_id.outward.$dbname}</td>
				{/if}
			{/foreach}
			
		</tr>
	{/foreach}
	
</table>
