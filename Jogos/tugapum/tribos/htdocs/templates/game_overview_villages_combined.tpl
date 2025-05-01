<table class="vis">
<tr>
	<th>Aldeia</th>
	<th><img src="graphic/overview/main.png" title="Edificio Principal" alt="" /></th>
	<th><img src="graphic/overview/barracks.png" title="Quartel" alt="" /></th>
	<th><img src="graphic/overview/stable.png" title="Estabulo" alt="" /></th>
	<th><img src="graphic/overview/garage.png" title="Oficina" alt="" /></th>
	<th><img src="graphic/overview/smith.png" title="Ferreiro" alt="" /></th>
	<th><img src="graphic/overview/farm.png" title="Fazenda" alt="" /></th>
	
	{foreach from=$unit item=name key=dbname}
		<th width="35"><img src="graphic/unit/{$dbname}.png" title="{$name}" alt="" /></th>
	{/foreach}
	
	<th><img src="graphic/overview/trader.png" title="Mercadores" alt="" /></th>

</tr>

{foreach from=$villages item=arr key=arr_id}
	<tr>
		<td><a href="game.php?village={$arr_id}&screen=overview">{$villages.$arr_id.name} ({$villages.$arr_id.x}|{$villages.$arr_id.y})</a></td>

		{if isset($villages.$arr_id.first_build.buildname)}
			<td><a href="game.php?village={$arr_id}&amp;screen=main"><img src="graphic/overview/prod_running.png" title="{$villages.$arr_id.first_build.buildname}: {$villages.$arr_id.first_build.end_time}" alt="" /></a></td>
		{else}
		    <td><a href="game.php?village={$arr_id}&amp;screen=main"><img src="graphic/overview/prod_avail.png" title="Sem construções" alt="" /></a></td>
		{/if}
		
		{if $villages.$arr_id.barracks==0}
        	<td><a href="game.php?village={$arr_id}&amp;screen=barracks"><img src="graphic/overview/prod_impossible.png" title="Sem construções" alt="" /></a></td>
		{elseif !empty($villages.$arr_id.barracks_prod.unit)}
			<td><a href="game.php?village={$arr_id}&amp;screen=barracks"><img src="graphic/overview/prod_running.png" title="{$villages.$arr_id.barracks_prod.unit}: {$villages.$arr_id.barracks_prod.time}" alt="" /></a></td>
		{else}
        	<td><a href="game.php?village={$arr_id}&amp;screen=barracks"><img src="graphic/overview/prod_avail.png" title="Sem construções" alt="" /></a></td>
		{/if}
		
		{if $villages.$arr_id.stable==0}
        	<td><a href="game.php?village={$arr_id}&amp;screen=stable"><img src="graphic/overview/prod_impossible.png" title="" alt="" /></a></td>
		{elseif !empty($villages.$arr_id.stable_prod.unit)}
			<td><a href="game.php?village={$arr_id}&amp;screen=stable"><img src="graphic/overview/prod_running.png" title="{$villages.$arr_id.stable_prod.unit}: {$villages.$arr_id.stable_prod.time}" alt="" /></a></td>
		{else}
		    <td><a href="game.php?village={$arr_id}&amp;screen=stable"><img src="graphic/overview/prod_avail.png" title="Sem construções" alt="" /></a></td>
		{/if}

		{if $villages.$arr_id.garage==0}
			<td><a href="game.php?village={$arr_id}&amp;screen=garage"><img src="graphic/overview/prod_impossible.png" title="" alt="" /></a></td>
		{elseif !empty($villages.$arr_id.garage_prod.unit)}
			<td><a href="game.php?village={$arr_id}&amp;screen=garage"><img src="graphic/overview/prod_running.png" title="{$villages.$arr_id.garage_prod.unit}: {$villages.$arr_id.garage_prod.time}" alt="" /></a></td>
		{else}
			<td><a href="game.php?village={$arr_id}&amp;screen=garage"><img src="graphic/overview/prod_avail.png" title="Sem construções" alt="" /></a></td>
		{/if}
		
		{if $villages.$arr_id.smith==0}
			<td><a href="game.php?village={$arr_id}&amp;screen=smith"><img src="graphic/dots/yellow.png" title="" alt="" /></a></td>
		{elseif !empty($villages.$arr_id.first_tec.tecname)}
			<td><a href="game.php?village={$arr_id}&amp;screen=smith"><img src="graphic/overview/prod_running.png" title="{$villages.$arr_id.first_tec.tecname}: {$villages.$arr_id.first_tec.end_time}" alt="" /></a></td>
		{else}
			<td><a href="game.php?village={$arr_id}&amp;screen=smith"><img src="graphic/overview/prod_avail.png" title="Sem construções" alt="" /></a></td>
		{/if}

		<td><a href="game.php?village={$arr_id}&amp;screen=farm">{$villages.$arr_id.max_farm-$villages.$arr_id.r_bh} ({$villages.$arr_id.farm})</a></td>
		
		{foreach from=$unit item=name key=dbname}
			{if $villages.$arr_id.$dbname==0}
					<td class="hidden">{$villages.$arr_id.$dbname}</td>
			{else}
					<td>{$villages.$arr_id.$dbname}</td>
			{/if}
		{/foreach}
		
		<td><a href="game.php?village={$arr_id}&amp;screen=market">{$villages.$arr_id.dealers.in_village}/{$villages.$arr_id.dealers.max_dealers}</a></td>


	
	</tr>
{/foreach}

</table>
<br />
<form action="game.php?village={$smarty.get.village}&amp;screen=overview_villages&amp;mode={$smarty.get.mode}&amp;action=change_page_size" method="post">
  <table class="vis">
    <tr>
      <th colspan="2"><p>Aldeias por p&aacute;gina:</p>
      </th>
      <td><input name="page_size" size="3" value="{$villages_per_page}" type="text" /></td>
      <td><input value="OK" type="submit" /></td>
    </tr>
  </table>
</form>