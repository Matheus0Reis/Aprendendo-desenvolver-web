<table class="vis">
	<tr>
{*if $smarty.get.mode == 'groups'}
  {assign var='mode' value='Grupos'}
{/if*}
{foreach from=$links item=f_mode key=f_name}
{if $f_name=='Kombiniert'}
            {assign var='f_name' value='Combinado'}
         {/if}
         {if $f_name=='Produktion'}
            {assign var='f_name' value='Produção'}
         {/if}
         {if $f_name=='Truppen'}
            {assign var='f_name' value='Tropa'}
         {/if}
         {if $f_name=='Befehle'}
            {assign var='f_name' value='Comandos'}
         {/if}
         {if $f_name=='Eintreffend'}
            {assign var='f_name' value='Chegando'}
         {/if}
	{if $f_mode==$mode}
		<td class="selected" width="100"><a href="game.php?village={$village.id}&screen=overview_villages&mode={$f_mode}">{$f_name}</a></td>
	{else}
		<td width="100"><a href="game.php?village={$village.id}&screen=overview_villages&mode={$f_mode}">{$f_name}</a></td>	
	{/if}
{/foreach}
{*if $smarty.get.mode == 'groups'}
  <td class="selected" width="100"><a href="game.php?village={$village.id}&screen=overview_villages&mode=groups">Grupos</a></td>
{else}
  <td width="100"><a href="game.php?village={$village.id}&screen=overview_villages&mode=groups">Grupos</a></td>
{/if*}
	</tr>
</table>
<br />
{include file="game_overview_villages_$mode.tpl"}