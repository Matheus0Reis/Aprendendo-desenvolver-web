<table><tr><td valign="top">

<table class="vis" width="412">
<tr>
  <th colspan="2">Propriedades</th>
</tr>
<tr>
  <td width="148">Nome da tribo:</td>
  <td width="220">{$info.name}</td>
</tr>
<tr>
  <td>TAG da tribo :</td>
  <td>{$info.short}</td></tr>
<tr>
  <td>Membros:</td>
  <td>{$info.members}</td></tr>
  <tr>
  <td width="250">Pontos dos 40 melhores jogadores:</td>
  <td width="220">{$info.best_points|format_number}</td>
</tr>
<tr>
  <td>Total de pontos :</td>
  <td>{$info.points|format_number}</td></tr>
<tr>
  <td>M&eacute;dia de pontos:</td>
  <td>{$info.cutthroungt|format_number}</td></tr>
<tr>
  <td>Classifica&ccedil;&atilde;o:</td>
  <td>{$info.rank}</td></tr>
{if !empty($ally.irc)}
 {/if}

<tr>
  <td colspan="2" align="center"><a href="game.php?village={$village.id}&amp;screen=info_member&amp;id={$info.id}">Membros</a></td>
</tr>
</table>
</td><td valign="top">

<table class="vis" width="300">
{if !empty($info.image)}
<tr>
  <th>Bras&atilde;o da tribo </th>
</tr>

	<tr><td align="center"><img src="./graphic/ally/{$info.image}"></td></tr>
{/if}
<tr>
  <th>Descri&ccedil;&atilde;o</th>
</tr>
<tr>
  <td align="center">{php} $ce2 = Array("wurde von"," gegründet","Wendet euch bei Fragen an","Dieser Text kann von den Diplomaten des Stammes geändert werden."); $cu_ce2 = Array("foi criada por ",".","Qualquer d&uacute;vida contate ","<em>Este texto pode ser modificado pelos Diplomatas da tribo</em>"); echo bb_format(str_replace($ce2,$cu_ce2,$this->_tpl_vars['info']['description'])); {/php} </td>
</tr>
</table>

</td></tr></table>