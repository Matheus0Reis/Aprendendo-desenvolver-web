<table class="vis" width="400">

<tr>

  <th colspan="3">Convites</th>
</tr>
	{foreach from=$invites item=arr key=id}
		<tr>
			<td><a href="game.php?village={$village.id}&amp;screen=info_player&amp;id={$arr.to_userid}">{$arr.to_username}</a></td>
			<td>{php}
$data_terminare=$this->_tpl_vars['arr']['time'];
$data_terminare = str_replace("heute um","Hoje &aacute;s ",$data_terminare);
$data_terminare = str_replace("Uhr","",$data_terminare);
$data_terminare = str_replace("am","Em",$data_terminare);
$data_terminare = str_replace("um","&aacute;s",$data_terminare);
$data_terminare = str_replace("morgen","amanh&atilde;",$data_terminare);
//Variabila originala tpl: {$arr.time}

echo $data_terminare;

{/php}</td>
			<td><a href="game.php?village={$village.id}&amp;screen=ally&amp;mode=invite&amp;action=cancel_invitation&amp;id={$id}&amp;h={$hkey}">Cancelar</a></td>
		</tr>
	{/foreach}
</table>
<br />{if $suma >= $lim} {$afisare} {else} 
<form action="game.php?village={$village.id}&amp;screen=ally&amp;action=invite&amp;mode=invite&amp;action=invite&amp;h={$hkey}" method="post">
	<table class="vis" width="400">
	<tr>
	  <th colspan="3">Convidar</th>
	</tr>
<tr>
	<td>Jogador:</td>
	<td><input name='name' type='text' value='' /></td>
	<td><input type='submit' value=' OK ' /></td></tr>

	</table>
</form>
{/if}
