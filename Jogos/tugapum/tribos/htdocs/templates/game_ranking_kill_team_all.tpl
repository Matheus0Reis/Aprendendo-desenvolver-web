<table class="vis">
<tr>
	<th width="60">Rank</th>
	<th width="160">Name</th>
	<th width="130">Score</th>
</tr>
	{foreach from=$ranks item=item key=id}
		{if $ranks.$id.rang != 0}
		<tr {$ranks.$id.mark}>
			<td>{$ranks.$id.rang}</td>
			<td><a href="game.php?village={$village.id}&screen=info_player&id={$id}">{$ranks.$id.username}</a></td>
			<td>{$ranks.$id.killed_units}</td>
		</tr>
		{/if}
	{/foreach}
</table>

<table class="vis" width="100%"><tr>
{if $site!=1}
	<td align="center">
	<a href="game.php?village={$village.id}&amp;screen=ranking&amp;mode=kill_player&amp;type={$type}&amp;site={$site-1}">&lt;&lt;&lt; Up</a></td>
{/if}
<td align="center">
<a href="game.php?village={$village.id}&amp;screen=ranking&amp;mode=kill_player&amp;type={$type}&amp;site={$site+1}">Down &gt;&gt;&gt;</a></td>
</tr></table>