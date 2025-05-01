<h3 class="menus">Oponentes Derrotados </h3>

<table class="vis">
	<tr>
			{if $type=='att'}
				<td class="selected" width="100">
					<a href="game.php?village={$village.id}&amp;screen=ranking&amp;mode=kill_player&amp;type=att">Como atacante</a>
				</td>
			{else}
				<td width="100">
					<a href="game.php?village={$village.id}&amp;screen=ranking&amp;mode=kill_player&amp;type=att">Como atacante</a>
				</td>
			{/if}
			{if $type=='def'}
				<td class="selected" width="100">
					<a href="game.php?village={$village.id}&amp;screen=ranking&amp;mode=kill_player&amp;type=def">Como defensor</a>
				</td>
			{else}
				<td width="100">
					<a href="game.php?village={$village.id}&amp;screen=ranking&amp;mode=kill_player&amp;type=def">Como defensor</a>
				</td>
			{/if}
			{if $type=='all'}
				<td class="selected" width="100">
					<a href="game.php?village={$village.id}&amp;screen=ranking&amp;mode=kill_player&amp;type=all">Total</a>
				</td>
			{else}
				<td width="130">
					<a href="game.php?village={$village.id}&amp;screen=ranking&amp;mode=kill_player&amp;type=all">Total</a>
				</td>
			{/if}
	</tr>
</table>

{if in_array($type,$allow_mods_kill)}
	{include file="game_ranking_kill_player_$type.tpl" title=foo}
{/if}