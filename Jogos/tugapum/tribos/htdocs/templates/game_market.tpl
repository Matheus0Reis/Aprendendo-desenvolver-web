<table>
	<tr>
		<td>
			<img src="graphic/big_buildings/market.png" title="Mercado" alt="" />
		</td>
		<td>
			<h2>Mercado (Nivel {$village.market})</h2>
		  {$description}
		</td>
	</tr>
</table>
<br />
{if $show_build}
	<table width="100%"><tr><td valign="top" width="100">
	<table class="vis" width="110%">
		{foreach from=$links item=f_mode key=f_name}
			{if $f_mode==$mode}
				<tr>
					<td class="selected" width="120">
						<a href="game.php?village={$village.id}&amp;screen=market&amp;mode={$f_mode}">{$f_name|replace:"Rohstoffe verschicken":"Enviar recursos"|replace:"Eigene Angebote":"Suas ofertas "|replace:"Fremde Angebote":"Outras ofertas "|replace:"Händlerstatus":"Estat&iacute;sticas"}</a>					</td>
				</tr>
			{else}
                <tr>
                    <td width="120">
						<a href="game.php?village={$village.id}&amp;screen=market&amp;mode={$f_mode}">{$f_name|replace:"Rohstoffe verschicken":"Enviar recursos "|replace:"Eigene Angebote":"Suas ofertas "|replace:"Fremde Angebote":"Outras ofertas "|replace:"Händlerstatus":"Estat&iacute;sticas"}</a>
					</td>
				</tr>
			{/if}
		{/foreach}
	</table>
	
	</td><td valign="top" width="*">
		{if in_array($mode,$allow_mods)}
			{include file="game_market_$mode.tpl" title=foo}
		{/if}
	</td></tr></table>
{/if}