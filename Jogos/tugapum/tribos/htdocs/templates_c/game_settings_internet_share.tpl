{php}
$username = urlencode($_POST['username']);
$iduser = $this->_tpl_vars['user']['id'];
$select_username = mysql_num_rows(mysql_query("SELECT * FROM users WHERE username = '$username'"));
$time = time();
$time_del = time()+60*60*24;
if ($_GET['do'] == 'add_shared'){
$select_id_share = mysql_fetch_array(mysql_query("SELECT id FROM users WHERE username = '$username'"));
$select_id_share = $select_id_share[0];

if (!$_POST['username']){$error = "Introduza o nome de um jogador "; } else {
if($select_username == '1'){
if($select_id_share == $iduser){
$error = "Voc&ecirc; n&atilde;o se pode auto-compartilhar.";
}
else{
$select_sql1 = mysql_num_rows(mysql_query("SELECT * FROM share_internet WHERE id_from = '$iduser' AND id_to = '$select_id_share'"));
if ($select_sql1 == '1'){ $error = "Jogador ".$_POST[username]."  este deja la impartirea legaturii de internet!"; } else { }
} }else { $error = "O jogador n&atilde;o existe! "; } }

if (!$error){
$sql1 = "INSERT INTO `share_internet` (`id_from`, `id_to`, `username_to`, `delete_time`, `time`) VALUES ('".$iduser."','".$select_id_share."','".$username."','".$time_del."','".$time."')";
mysql_query($sql1);
}}
if ($_GET['do'] == 'delete'){
$id = $_GET['id'];
$select_deltime = mysql_fetch_array(mysql_query("SELECT delete_time FROM share_internet WHERE id_to = '$id' AND id_from = '$iduser'"));
$select_deltime = $select_deltime[0];
if ($select_deltime > $time){
$error_del = 'Ap&oacute;s 24horas voc&ecirc; poder&aacute; excluir!';
 }else {
mysql_query("DELETE FROM share_internet WHERE id_to = '$id' AND id_from = '$iduser'");
}
}

{/php}
<h3>Partilhar conex&atilde;o de internet </h3> 
<p>Quando partilhar por mais de 3 dias a sua liga&ccedil;&atilde;o &agrave; internet com   outros jogadores dever&aacute; declarar aqui. O envio de recursos e apoio n&atilde;o   ser&aacute; mais poss&iacute;vel. Apenas ap&oacute;s 3 dias da adi&ccedil;&atilde;o eles poder&atilde;o ser   novamente removidos.</p> 
<p>M&uacute;ltiplas contas que partilhem regularmente da mesma liga&ccedil;&atilde;o &agrave;   internet (conscientemente) sem qualquer notifica&ccedil;&atilde;o (adi&ccedil;&atilde;o do nome de   utilizador na &aacute;rea reservada para partilha de liga&ccedil;&atilde;o) poder&atilde;o ser   bloqueadas por nossos administradores a qualquer momento.</p>
<p>Cada jogador numa liga&ccedil;&atilde;o &agrave; internet deve fornecer todas as contas por ele conhecidas. <br />
  <strong>Exemplo</strong>: Se 3 jogadores compartilham da mesma liga&ccedil;&atilde;o &agrave; internet ent&atilde;o <strong>cada jogador</strong> deve fornecer o nome dos outros 2 jogadores.</p> 
<div class="error">{php} echo $error_del; {/php}</div>
<table class="vis">
<tr>
  <th>Jogador</th>
  <th>Listado desde </th>
  <th>Apagar</th>
</tr>
{php}
$times = time();
$sql3 = "SELECT * FROM share_internet WHERE id_from = '$iduser'";
	   $exec_sql2 = mysql_query($sql3) or die(mysql_error()); 
	   while ($array1 = mysql_fetch_array($exec_sql2)) {
		 $id = $array1['id'];
$username_to = $array1['username_to'];
$id_to = $array1['id_to'];
$time = $array1['time'];
$selectdeltime = mysql_fetch_array(mysql_query("SELECT delete_time FROM share_internet WHERE id = '$id'"));
$selectdeltime = $selectdeltime[0];

{/php}
<tr><td><center><a href="game.php?village={$village.id}&screen=info_player&id={php} echo $id_to; {/php}">{php}
echo urldecode($username_to);
{/php}</a></center></td><td>{php} echo date("H:i d.m.Y",$time); {/php}</td>
<td><center>{php} if ($selectdeltime > $times){ echo 'Pode apagar em: <b>'.date("d.m.Y", $selectdeltime).' </b>&aacute;s <b>'.date("H:i", $selectdeltime).'</b>'; } else { {/php}</center><a href="game.php?village={$village.id}&screen=settings&mode=internet_share&do=delete&id={php} echo $id_to; {/php}">Apagar</a>
</tr>
{php}}
		  
	   }



{/php}

<br>
<div class="error">{php} echo $error; {/php}</div>
<form action="game.php?village={$village.id}&amp;screen=settings&amp;mode=internet_share&amp;do=add_shared" method="post"> 
<tr>
  <td>
Adicionar jogador:</td>
  <td> <input type="text" name="username" /> <input type="submit" value="Adicionar" /></td></tr> 
</form>
</table>