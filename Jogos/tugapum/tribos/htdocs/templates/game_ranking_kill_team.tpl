<table class="vis">
	<tr>
	
	    <td {if $type==all}class="selected"{/if} width="85">
					<a href="game.php?village={$village.id}&amp;screen=ranking&amp;mode=kill_team&amp;type=all">Total</a>
              </td>

		<td {if $type==att}class="selected"{/if} width="130">
					<a href="game.php?village={$village.id}&amp;screen=ranking&amp;mode=kill_team&amp;type=att">Attack Rankings</a>
              </td>
                        
              <td {if $type==def}class="selected"{/if} width="130">
					<a href="game.php?village={$village.id}&amp;screen=ranking&amp;mode=kill_team&amp;type=def">Defense Rankings</a>
              </td>
            
	</tr>
</table>

{include file="game_ranking_kill_team_$type.tpl" title=foo}