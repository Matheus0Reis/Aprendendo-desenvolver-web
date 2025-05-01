<h3>Jogadores
  <br />

</h3>
<table class="vis" style=border:1px solid" border="1">
 <tr>
  <th>Conta</th>
  <th>ID</th>
  <th>Rank</th>
  <th>Pontos</th>
  <th>Aldeias</th>
 </tr>
{foreach from=$userInfo item=user}
<td><a href="index.php?screen=users&action=edit&name={$user.username}&id={$user.id}">{$user.username}</a>
</td>
<td>
&nbsp;{$user.id}
</td>
<td>
&nbsp;&nbsp;{$user.rang}
</td>
<td>
&nbsp;&nbsp;{$user.points}
</td>
<td>
&nbsp;&nbsp;{$user.villages}
</td>
</tr>
<tr>
{/foreach}
</table>
<p align="right">&nbsp;</p>
