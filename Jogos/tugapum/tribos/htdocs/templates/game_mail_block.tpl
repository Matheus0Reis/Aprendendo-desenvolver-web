<h3>Bloquear Remetente </h3>
<p>Digite o nome de quem vc quer bloquear, esse nao poder&aacute; mais te enviar mensagens .</p>
	
<form action="game.php?village={$village.id}&amp;screen=mail&amp;mode=block&amp;action=block_name&amp;h={$hkey}" method="post">
<table class="vis"><tr>
<td>Jogador:</td>
<td><input name="tribe_name" type="text" /></td>
<td><input type="submit" value="OK" /></td>
</tr></table>
</form>

{if count($blocked)>0}
	<h4>Jogadores Bloqueados</h4>
	<table class="vis">
	<tr><th width="200">Nome</th><th width="100">Desbloquear</th></tr>
		{foreach from=$blocked item=arr key=id}
			<tr>
			<td><a href="game.php?village={$village.id}&amp;screen=info_player&amp;id={$arr.blocked_id}">{$arr.blocked_name}</a></td>
			<td><a href="game.php?village={$village.id}&amp;screen=mail&amp;mode=block&amp;action=unblock&amp;from_id={$arr.blocked_id}&amp;h={$hkey}">desbloquear</a></td>
			</tr>
		{/foreach}
	</table>
{/if}