<h3 class="error">{$error|replace:"Abandonar a tribo foi desativado ":"Abandonar a tribo foi desativado!"|replace:"Du bist der einzige Stammesgründer. Du kannst den Stamm nicht verlassen.":"Voc&ecirc; &eacute; o &uacute;nico fundador da tribo, n&atilde;o a pode abandonar! "|replace:"Es existiert schon eine Beziehung zu dem Stamm":"J&aacute; tem rela&ccedil;&otilde;es diplom&aacute;ticas com essa tribo! "|replace:"Stamm nicht gefunden":"Esta tribo n&atilde;o existe !"|replace:"Spieler nicht gefunden":"Este jogador n&atilde;o existe! !"|replace:"Spieler wurde bereits eingeladen":"Este jogador j&aacute; est&aacute; convidado !"|replace:"Tag schon vergeben!":"Esta TAG j&aacute; existe !"|replace:"Du bist derzeit der einzige Gründer. Du kannst dir das Rechte nicht entziehen!":"Voc&ecirc; &eacute; o &uacute;nico fundador, n&atilde;o pode fazer isso! "|replace:"Kein Stammesbild ausgewählt!":"Deve escolher o bras&atilde;o da tribo! "|replace:"Das Wappen darf maximal 300x200px groß sein!":"O bras&atilde;o tem de conter no m&aacute;ximo 300x200 pixels!  "|replace:"Du musst Gründer sein, um die Rechte und Titel anderer Gründer zu verwalten":"Voc&ecirc; n&atilde;o pode mudar o fundador! "}</h3>

<h2>Tribo {$ally.name}</h2>

		
<table width="100%" class="vis">
	<tr>
		<td {if $mode=='overview'}class="selected"{/if} width="260" align="center">
			<a href="game.php?village={$village.id}&amp;screen=ally&amp;mode=overview">Visualiza&ccedil;&atilde;o geral</a>
		</td>
		<td {if $mode=='profile'}class="selected"{/if} width="100" align="center">
			<a href="game.php?village={$village.id}&amp;screen=ally&amp;mode=profile">Perfil</a>
		</td>
		<td {if $mode=='members'}class="selected"{/if} width="100" align="center">
			<a href="game.php?village={$village.id}&amp;screen=ally&amp;mode=members">Membros</a>
		</td>
		<td {if $mode=='contracts'}class="selected"{/if} width="100" align="center">
			<a href="game.php?village={$village.id}&amp;screen=ally&amp;mode=contracts">Diplomacia</a>
		</td>
	{if $user.ally_invite==1}
		<td {if $mode=='invite'}class="selected"{/if} width="100" align="center">
			<a href="game.php?village={$village.id}&amp;screen=ally&amp;mode=invite">Convidar</a>		</td>
	{/if}
	{if $user.ally_lead == 1 OR $user.ally_found == 1}
		<td {if $mode=='intro_igm'}class="selected"{/if} width="160" align="center">
			<a href="game.php?village={$village.id}&amp;screen=ally&amp;mode=intro_igm">Bem vindo</a>
		</td>
	{/if}
	{if $user.ally_diplomacy==1}
		<td {if $mode=='properties'}class="selected"{/if} width="100" align="center">
			<a href="game.php?village={$village.id}&amp;screen=ally&amp;mode=properties">Propriedades</a>		</td>
	{/if}

	</tr>
</table>
<br />
{if $mode=='profile'}
	{include file="game_info_ally.tpl"}
{elseif $mode=='rights'}
	{include file="game_ally_in_ally_rights.tpl"}
{elseif $mode=='contracts'}
	{include file="game_ally_in_ally_contracts.tpl"}
{elseif $mode=='forum'}
	{include file="game_ally_in_ally_forum.tpl"}
{elseif $mode=='planificator'}
	{include file="game_ally_in_ally_planificator.tpl"}
{else}
	{if in_array($mode,$links)}
		{include file="game_ally_in_ally_$mode.tpl"}
	{/if}
{/if}