<table class="vis">
<tr> 
	<th width="60" class="cororido">Classificação</th> 
	<th width="60" class="cororido">Nome</th> 
	<th width="120" class="cororido">Pontos dos melhores 40 jogadores </th> 
	<th width="60" class="cororido">Total de pontos </th> 
	<th width="100" class="cororido">Membros</th> 
	<th width="100" class="cororido">Media de pontos por jogador </th> 
	<th width="60" class="cororido">Aldeias</th> 
	<th width="100" class="cororido">Media de pontos por aldeia </th> 
</tr> 
	{foreach from=$ranks item=item key=id}
		<tr {$ranks.$id.mark}>
			<td class="cororido2">{$ranks.$id.rank}</td>
			<td><a href="game.php?village={$village.id}&screen=info_ally&id={$id}">{$ranks.$id.short}</a></td>
			<td class="cororido2">{$ranks.$id.best_points}</td>
			<td class="cororido">{$ranks.$id.points}</td>
			<td class="cororido2">{$ranks.$id.members}</td>
			<td class="cororido2">{$ranks.$id.cuttrought_members|format_number}</td>
			<td class="cororido">{$ranks.$id.villages}</td>
			<td class="cororido">{$ranks.$id.cuttrought_villages|format_number}</td>
		</tr>
	{/foreach}
</table>

<table class="vis" width="100%"> 
{if $site!=1}
	<td align="center">
	<a href="game.php?village={$village.id}&amp;screen=ranking&amp;mode=ally&amp;site={$site-1}">&lt;&lt;&lt; Anterior</a></td>
{/if}
<td align="center">
<a href="game.php?village={$village.id}&amp;screen=ranking&amp;mode=ally&amp;site={$site+1}">Proximo &gt;&gt;&gt;</a></td>
</tr></table>

<table class="vis" width="100%"><tr> 
<td> 
<center><b> 
<a href="game.php?village={$village.id}&amp;screen=ranking&amp;mode=ally&amp;site=1">1</a> &nbsp;
<a href="game.php?village={$village.id}&amp;screen=ranking&amp;mode=ally&amp;site=2">2</a> &nbsp;
<a href="game.php?village={$village.id}&amp;screen=ranking&amp;mode=ally&amp;site=3">3</a> &nbsp;
<a href="game.php?village={$village.id}&amp;screen=ranking&amp;mode=ally&amp;site=4">4</a> &nbsp;
<a href="game.php?village={$village.id}&amp;screen=ranking&amp;mode=ally&amp;site=5">5</a> &nbsp;
<a href="game.php?village={$village.id}&amp;screen=ranking&amp;mode=ally&amp;site=6">6</a> &nbsp;
<a href="game.php?village={$village.id}&amp;screen=ranking&amp;mode=ally&amp;site=7">7</a> &nbsp;
<a href="game.php?village={$village.id}&amp;screen=ranking&amp;mode=ally&amp;site=8">8</a> &nbsp;
<a href="game.php?village={$village.id}&amp;screen=ranking&amp;mode=ally&amp;site=9">9</a> &nbsp;
<a href="game.php?village={$village.id}&amp;screen=ranking&amp;mode=ally&amp;site=10">10</a>&nbsp;
</center></b></td></tr></table>