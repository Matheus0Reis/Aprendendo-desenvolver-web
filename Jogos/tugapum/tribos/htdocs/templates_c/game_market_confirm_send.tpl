{php}
$userid_to = $this->_tpl_vars['confirm']['to_userid'];
$userid_from = $this->_tpl_vars['user']['id'];
$select = mysql_num_rows(mysql_query("SELECT * FROM share_internet WHERE id_from = '$userid_from' AND id_to = '$userid_to'"));
$village = $_GET['village'];
if ($select == '1'){
header("Location: game.php?village=$village&screen=market&mode=send&error=N&atilde;o pode enviar recursos a quem compartilha a conex&atilde;o de internet! ");
} else {
{/php}
<h2>Transportar recursos </h2>

<form action="game.php?village={$village.id}&amp;screen=market&amp;action=send&amp;h={$hkey}" method="post">

<table class="vis" width="350">
<tr>
  <th colspan="2">Transportar</th>
</tr>
<tr>
  <td>Aldeia:</td>
  <td><a href="game.php?village={$village.id}&amp;screen=info_village&amp;id={$confirm.to_villageid}">{$confirm.to_villagename} ({$confirm.to_x}|{$confirm.to_y})</a></td></tr>
<tr>
  <td>Jogador:</td>
  <td><a href="game.php?village={$village.id}&amp;screen=info_player&amp;id={$confirm.to_userid}">{$confirm.to_username}</a></td></tr>
<tr>
  <td width="150">Recursos:</td>
  <td width="200">{if $confirm.wood>0}<img src="graphic/holz.png" title="Madaeira" alt="" />{$confirm.wood} {/if}{if $confirm.stone>0}<img src="graphic/lehm.png" title="Argila" alt="" />{$confirm.stone} {/if}{if $confirm.iron>0}<img src="graphic/eisen.png" title="Ferro" alt="" />{$confirm.iron} {/if}</td></tr>
<tr>
  <td>Mercadores:</td>
  <td>{$confirm.dealers}</td></tr>
<tr>
  <td>Dura&ccedil;&atilde;o:</td>
  <td>{$confirm.dealer_running}</td></tr>
<tr>
  <td>Chegada:</td>
  <td>{$confirm.time_to|replace:"hoje as ":"astazi la ora"|replace:"horas":""}
</td>
</tr>
<tr>
  <td>Retorno:</td>
  <td>{$confirm.time_back|replace:"hoje as ":"astazi la ora"|replace:"horas":""}</td>
</tr>
</table><br />

<input type="submit" value="&raquo; OK &laquo;" style="font-size:10pt" />

<input type="hidden" name="target_id" value="{$confirm.to_villageid}" />
<input type="hidden" name="wood" value="{$confirm.wood}" />
<input type="hidden" name="stone" value="{$confirm.stone}" />
<input type="hidden" name="iron" value="{$confirm.iron}" />

</form>{php}}{/php}