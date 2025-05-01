{if !empty($error)}
	<b>
	<div style="color:red;">{$error|replace:"Nicht genügend Rohstoffe vorhanden!":"N&atilde;o selecionou recursos !"|replace:"Ungültiges Ziel":"Insira as coordenadas !"}</div>
</b><br />
{/if}

<table class="vis">
<tr><th>Negustori: {$inside_dealers}/{$max_dealers}</th><th>Transport Maxim: {math equation="x * 1000" x=$inside_dealers}</th></tr>
</table>

<form name="units" action="game.php?village={$village.id}&amp;screen=market&amp;try=confirm_send" method="post">

<table>
<tr><td valign="top">

<table class="vis">
<tr>
  <th>Recursos</th>
</tr>
<tr><td><img src="graphic/holz.png" title="Madeira" alt="" /><input name="wood" type="text" value="" size="5" />&nbsp;<a href="javascript:insertNumber(document.forms[0].wood, {$max.wood})">({$max.wood})</a></td></tr>

<tr><td><img src="graphic/lehm.png" title="Argila" alt="" /><input name="stone" type="text" value="" size="5" />&nbsp;<a href="javascript:insertNumber(document.forms[0].stone, {$max.stone})">({$max.stone})</a></td></tr>

<tr><td><img src="graphic/eisen.png" title="Ferro" alt="" /><input name="iron" type="text" value="" size="5" />&nbsp;<a href="javascript:insertNumber(document.forms[0].iron, {$max.iron})">({$max.iron})</a></td></tr>

</table>

</td><td valign="top" align="center">

<table class="vis">
<tr>
  <th colspan="1">Coordenadas</th>
</tr>
<tr>
<td>
x: <input type="text" name="x" value="{$coords.x}" size="5" />
y: <input type="text" name="y" value="{$coords.y}" size="5" />
{if count($villages)>0}
	<select name="target" size="1" onchange="insertCoord(document.forms[0], this)">
		<option>-Alege Satul-</option>
		{foreach from=$villages key=id item=value}
			<option value="{$villages.$id.x}|{$villages.$id.y}">{$villages.$id.name} ({$villages.$id.x}|{$villages.$id.y}) {$villages.$id.continent}</option>
		{/foreach}
	</select>
{/if}
</td>
</tr>

</table>

<input type="submit" value="OK" style="font-size: 10pt;" />

</td></tr>
</table>

</form>


{* Ausgehende Transporte *}
{if count($own)>0 }
	<h3>Transporturile dvs.</h3>

	<table class="vis">
	<tr><th width="200">Transport catre</th><th width="80">Marfurile</th><th>Negustori</th><th width="70">Durata</th>
	<th width="100">Sosire</th><th width="70">Sosire in</th></tr>
		{foreach from=$own item=arr key=id}
			<tr>
			<td>{if $arr.type=='to'}{else}{/if}<br /><a href="game.php?village={$village.id}&amp;screen=info_village&amp;id={$arr.villageid}">{$arr.villagename}</a></td>
			
			<td>{if $arr.wood>0}<img src="graphic/holz.png" title="Holz" alt="" />{$arr.wood} {/if}{if $arr.stone>0}<img src="graphic/lehm.png" title="Lehm" alt="" />{$arr.stone} {/if}{if $arr.iron>0}<img src="graphic/eisen.png" title="Eisen" alt="" />{$arr.iron} {/if}</td>
		
			<td>{$arr.dealers}</td>
			<td>{$arr.duration}</td>
			<td>{$arr.arrival|replace:"heute um":"astazi la ora"|replace:"Uhr":""}</td>
			<td>{if $arr.arrival_in_sek<0}{$arr.arrival_in}{else}<span class="timer">{$arr.arrival_in}</span>{/if}</td>
			{if $arr.can_cancel}
				<td><a href="game.php?village={$village.id}&amp;screen=market&amp;mode=send&amp;action=cancel&amp;id={$id}&amp;h={$hkey}">Anulati</a></td>
			{/if}
			</tr>
		{/foreach}
	</table>
{/if}


{* Ankommende Transporte *}
{if count($others)>0 }
	<h3>Transportes</h3>
{/if}
{if count($others)>0}
	<table class="vis">
	<tr>
	  <th width="160">Origem</th>
	  {if $others_see_ress}<th width="80">Recursos</th>
	  {/if}<th width="100">Chegada</th>
	  <th width="70">Chegada em </th>
	</tr>
		{foreach from=$others item=arr key=id}
			<tr>
			<td><a href="game.php?village={$village.id}&amp;screen=info_village&amp;id={$arr.villageid}">{$arr.villagename}</a></td>
			{if $arr.see_ress}
				<td>{if $arr.wood>0}<img src="graphic/holz.png" title="Holz" alt="" />{$arr.wood} {/if}{if $arr.stone>0}<img src="graphic/lehm.png" title="Lehm" alt="" />{$arr.stone} {/if}{if $arr.iron>0}<img src="graphic/eisen.png" title="Eisen" alt="" />{$arr.iron} {/if}</td>
			{else}
				{if $others_see_ress}
					<td></td>
				{/if}
			{/if}
			<td>{$arr.arrival|replace:"heute um":"hoje &aacute;s "|replace:"Uhr":""}</td>
			<td>{if $arr.arrival_in_sek<0}{$arr.arrival_in}{else}<span class="timer">{$arr.arrival_in}</span>{/if}</td>
			</tr>
		{/foreach}
	</table>
{/if}