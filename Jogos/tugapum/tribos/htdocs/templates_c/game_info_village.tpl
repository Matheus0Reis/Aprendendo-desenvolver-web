{php}
$folos=$this->_tpl_vars['info_village']['id'];
$folos2=$this->_tpl_vars['user']['id'];
$sql1 = mysql_query("SELECT id, title, time, title_image FROM reports where `to_village`='$folos' AND `type`='attack' AND `receiver_userid`='$folos2' ORDER BY time DESC LIMIT 10");
$nr_public = mysql_num_rows($sql1);
while ($array = mysql_fetch_array($sql1)) {
     $id_p[] =  $array[0];
     $title_p[] = $array[1];
     $time_p[] = $array[2];
     $title_image_p[] = $array[3];
}

{/php}



<h2>Aldeia {$info_village.name}</h2>


<table ><tr><td valign="top" width="50%">

<table class="vis">
<tr><th colspan="2">{$info_village.name}</th></tr>
<tr>
  <td width="80">Coordenadas:</td>
  <td>{$info_village.x}|{$info_village.y}</td></tr>
<tr>
  <td>Pontos:</td>
  <td width="180">{$info_village.points|format_number}</td></tr>
{if empty($info_user.username)}
	<tr>
	  <td>Joador:</td>
	  <td><a href="game.php?village={$village.id}&amp;screen=info_player&amp;id=0"></a></td></tr>
{else}
	<tr>
	  <td>Jogador:</td>
	  <td><a href="game.php?village={$village.id}&amp;screen=info_player&amp;id={$info_village.userid}">{$info_user.username}</a></td></tr>
{/if}

{if empty($info_ally.short)}
	<tr>
	  <td>Tribo:</td>
	  <td><a href="game.php?village={$village.id}&amp;screen=info_ally&amp;id=0"></a></td></tr>
{else}
	<tr>
	  <td>Tribo:</td>
	  <td><a href="game.php?village={$village.id}&amp;screen=info_ally&amp;id={$info_ally.id}">{$info_ally.short}</a></td></tr>
{/if}

<tr>
  <td colspan="2"><a href="game.php?village={$village.id}&amp;screen=map&amp;x={$info_village.x}&amp;y={$info_village.y}">&raquo; Centrar mapa </a>
</tr>
<tr>
  <td colspan="2"><a href="game.php?village={$village.id}&amp;screen=place&amp;mode=command&amp;target={$info_village.id}">&raquo; Enviar tropas </a>
</tr>
{if $can_send_ress}<tr>
  <td colspan="2"><a href="game.php?village={$village.id}&amp;screen=market&amp;mode=send&amp;target={$info_village.id}">&raquo; Enviar recursos </a>
</tr>{/if}
{if $user.id==$info_village.userid}<tr>
  <td colspan="2"><a href="game.php?village={$info_village.id}&amp;screen=overview">&raquo; Visualiza&ccedil;&atilde;o geral da aldeia </a>
</tr>{/if}
</table>
</td>

</td>
</tr>
</table>
