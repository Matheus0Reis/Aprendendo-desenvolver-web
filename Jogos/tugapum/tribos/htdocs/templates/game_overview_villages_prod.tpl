<table class="vis">
<tr>
<th>Aldeia</th>
<th width="62">Pontos</th>
<th>Recursos</th>
<th>Armaz&eacute;m</th>
<th>Fazenda</th>
<th>Constru&ccedil;&otilde;es</th>
<th>Pesquisas</th>
<th>Recrutar</th>
</tr>

{foreach from=$villages item=id key=arr_id}
	<tr>
	
		<td>{if $villages.$arr_id.attacks!=0}<img src="graphic/command/attack.png"> {/if}<a href="game.php?village={$arr_id}&screen=overview">{$villages.$arr_id.name} ({$villages.$arr_id.x}|{$villages.$arr_id.y})</a></td>
		<td>{$villages.$arr_id.points} <b>P</b></td>
		
		<td><img src="graphic/holz.png" title="Madeira" alt="" />{if $villages.$arr_id.r_wood==$villages.$arr_id.max_storage}<span class="warn">{/if}{$villages.$arr_id.r_wood}{if $villages.$arr_id.r_wood==$villages.$arr_id.max_storage}</span>{/if} <img src="graphic/lehm.png" title="Argila" alt="" />{if $villages.$arr_id.r_stone==$villages.$arr_id.max_storage}<span class="warn">{/if}{$villages.$arr_id.r_stone}{if $villages.$arr_id.r_stone==$villages.$arr_id.max_storage}</span>{/if} <img src="graphic/eisen.png" title="Ferro" alt="" />{if $villages.$arr_id.r_iron==$villages.$arr_id.max_storage}<span class="warn">{/if}{$villages.$arr_id.r_iron}{if $villages.$arr_id.r_iron==$villages.$arr_id.max_storage}</span>{/if} </td>
		
		<td>{php} 
		$arr_id = $this->_tpl_vars['arr_id'];
		$select_bonus = mysql_fetch_array(mysql_query("SELECT bonus FROM villages WHERE id = '$arr_id'"));
		$select_bonus = $select_bonus[0];
		include("include/config.php");
		if ($select_bonus == '1')
		{
		include ("include/bonus/max_storage_bonus.php");
		$select = mysql_fetch_array(mysql_query("SELECT storage FROM villages WHERE id = '$arr_id'"));
		$select = $select[0];
		echo $arr_maxstorage[$select];
		}
		else
		{
		include ("include/configs/max_storage.php");
		$select1 = mysql_fetch_array(mysql_query("SELECT storage FROM villages WHERE id = '$arr_id'"));
		$select1 = $select1[0];
		echo $arr_maxstorage[$select1];
		}
		
		
		{/php}</td>
		<td>{$villages.$arr_id.r_bh}/{$villages.$arr_id.max_farm}</td>
		{if isset($villages.$arr_id.first_build.buildname)}
			<td><b>{$villages.$arr_id.first_build.buildname}</b></td>

		{else}
		    <td></td>
		{/if}
		{if isset($villages.$arr_id.first_tec.tecname)}
			<td><b>{$villages.$arr_id.first_tec.tecname}</b></td>

		{else}
		    <td></td>
		{/if}
		<td>{foreach from=$villages.$arr_id.recruits item=arr_rec key=id_rec}<img src="graphic/unit/{$arr_rec.dbname}.png" title="{$arr_rec.num} {$arr_rec.unit}" alt="">{/foreach}</td>
	</tr>
{/foreach}

</table>