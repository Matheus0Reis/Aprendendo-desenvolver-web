<table class="vis">
<tr><th width="60">Rang</th><th width="180">Name</th><th width="100">Stamm</th>
<th width="60">Punkte</th><th>D�rfer</th><th>Punkteschnitt Dorf</th></tr>
	{foreach from=$ranks item=item key=id}
		<tr {$ranks.$id.mark}>
			<td>{$ranks.$id.rang}</td>
			<td><a href="game.php?village={$village.id}&screen=info_player&id={$id}">{$ranks.$id.username}</a></td>
			<td><a href="game.php?village={$village.id}&screen=info_ally&id={$ranks.$id.ally}">{$ranks.$id.allyname}</a></td>
			<td>{$ranks.$id.points}</td>
			<td>{$ranks.$id.villages}</td>
			<td>{$ranks.$id.cuttrought}</td>
		</tr>
	{/foreach}
</table>

<table class="vis" width="100%"><tr>
{if $site!=1}
	<td align="center">
	<a href="game.php?village={$village.id}&amp;screen=ranking&amp;mode=player&amp;site={$site-1}">&lt;&lt;&lt; nach oben</a></td>
{/if}
<td align="center">
<a href="game.php?village={$village.id}&amp;screen=ranking&amp;mode=player&amp;site={$site+1}">nach unten &gt;&gt;&gt;</a></td>
</tr></table>