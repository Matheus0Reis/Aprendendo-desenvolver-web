<table class="vis">
<tr> 
  <th width="60" class="cororido">Classificação</th> 
  <th width="180" class="cororido">Nome</th> 
  <th width="100" class="cororido">Tribo</th> 
  <th width="60" class="cororido">Pontos</th> 
  <th class="cororido">Aldeias</th> 
  <th class="cororido">Pontos medios por Aldeia </th> 
</tr> 
	{foreach from=$ranks item=item key=id}
		<tr {$ranks.$id.mark}>
			<td class="cororido2">{$ranks.$id.rang}</td>
			<td><a href="game.php?village={$village.id}&screen=info_player&id={$id}" class="cororida2">{$ranks.$id.username}</a></td>
			<td><a href="game.php?village={$village.id}&screen=info_ally&id={$ranks.$id.ally}">{$ranks.$id.allyname}</a></td>
			<td class="cororido2">{$ranks.$id.points}</td>
			<td class="cororido">{$ranks.$id.villages}</td>
			<td class="cororido">{$ranks.$id.cuttrought}</td>
		</tr>
	{/foreach}
</table>

<table class="vis" width="100%"> 
{if $site!=1}
	<td align="center">
	<a href="game.php?village={$village.id}&amp;screen=ranking&amp;mode=player&amp;site={$site-1}">&lt;&lt;&lt; Anterior</a></td>
{/if}
<td align="center">
<a href="game.php?village={$village.id}&amp;screen=ranking&amp;mode=player&amp;site={$site+1}">Proximo &gt;&gt;&gt;</a></td>
</tr></table>

<table class="vis" width="100%"><tr> 
<td> 
<center><b> 
<a href="game.php?village={$village.id}&amp;screen=ranking&amp;mode=player&amp;site=1">1</a> &nbsp;
<a href="game.php?village={$village.id}&amp;screen=ranking&amp;mode=player&amp;site=2">2</a> &nbsp;
<a href="game.php?village={$village.id}&amp;screen=ranking&amp;mode=player&amp;site=3">3</a> &nbsp;
<a href="game.php?village={$village.id}&amp;screen=ranking&amp;mode=player&amp;site=4">4</a> &nbsp;
<a href="game.php?village={$village.id}&amp;screen=ranking&amp;mode=player&amp;site=5">5</a> &nbsp;
<a href="game.php?village={$village.id}&amp;screen=ranking&amp;mode=player&amp;site=6">6</a> &nbsp;
<a href="game.php?village={$village.id}&amp;screen=ranking&amp;mode=player&amp;site=7">7</a> &nbsp;
<a href="game.php?village={$village.id}&amp;screen=ranking&amp;mode=player&amp;site=8">8</a> &nbsp;
<a href="game.php?village={$village.id}&amp;screen=ranking&amp;mode=player&amp;site=9">9</a> &nbsp;
<a href="game.php?village={$village.id}&amp;screen=ranking&amp;mode=player&amp;site=10">10</a>&nbsp;
</center></b></td></tr></table>