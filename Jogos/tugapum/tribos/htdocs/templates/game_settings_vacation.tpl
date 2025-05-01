<h3>M&oacute;do de f&eacute;rias </h3>
<p>Aqui pode pedir a um jogador se ele pode o substituir temporariamente. Tal jogador poder&aacute; aceder &agrave; sua conta e jogar por si. Durante este per&iacute;odo n&atilde;o conseguir&aacute; aceder &agrave; sua conta normalmente. Para tal ter&aacute; que cancelar substitui&ccedil;&atilde;o tempor&aacute;ria.</p> 


<p>At&eacute; 24 horas ap&oacute;s o fim do modo de substitui&ccedil;&atilde;o tempor&aacute;ria n&atilde;o s&atilde;o permitidas ac&ccedil;&otilde;es de jogo entre a conta substitu&iacute;da e a substituidora. Em especial:</p>
<ul>
  <li>Transportes de recursos</li>
  <li>Saque m&uacute;tuo</li>
  <li>Ataques coordenados por ambas as contas</li>
  <li>Envio de tropas de apoio</li>
</ul>
{if empty($user.vacation_name)}
	<form action="game.php?village={$village.id}&amp;screen=settings&amp;mode=vacation&amp;action=sitter_offer&amp;h={$hkey}" method="post">
		<table class="vis">
		<tr>
			<th>Jogador</th>
			<td><input name="sitter" type="text" /> <input type="submit" value="OK" /></td>
	
		</tr>
	    </table>
	</form>
{else}
	{if $sid->is_vacation()}
	{php}
	$id=$this->_tpl_vars['user']['id'];
	$hkey=$this->_tpl_vars['hkey'];
	if ($_GET['action'] == 'end_vacation')
		{
			$h = $_GET['h'];
			mysql_query("DELETE FROM sessions WHERE hkey = '$h'");
			header("Location: index.php");
		}
	{/php}
		<p>
		<a href="javascript:ask('Dupa ce veti renunta,veti fi delogat de pe cont! Sigur doriti?', 'game.php?village={$village.id}&amp;screen=settings&amp;mode=vacation&amp;action=end_vacation&amp;h={$hkey}')">Voltar h&aacute; conta</a>		</p>
	{else}
		<table class="vis">
		<tr>
			<td>Pedidos:</td>
			<td><a href="game.php?village={$village.id}&amp;screen=info_player&amp;id={$user.vacation_id}">{$user.vacation_name}</a></td>
			<td><a href="game.php?village={$village.id}&amp;screen=settings&amp;mode=vacation&amp;action=sitter_offer_cancel&amp;h={$hkey}">&raquo; Cancelar</a></td>
		</tr>
		</table>
	{/if}
{/if}

{if count($vacation_accept)>0 && !$sid->is_vacation()}
	<h3>Contas</h3>
	<table class="vis">
	<tr>
	  <th width="200">Jogador</th>
	</tr>
	{foreach from=$vacation_accept item=arr key=id}
		<tr><td><a href="game.php?village={$village.id}&amp;screen=info_player&amp;id={$id}">{$arr.username}</a></td>
		<td><a href="login_uv.php?id={$id}" target="_blank">&raquo; entrar na conta </a></td>	
		</tr>
	{/foreach}
	</table>
{/if}

{if count($vacation)>0 && !$sid->is_vacation()}
	<h3>Convites</h3>
	<p>Convites para ficar modo de f&eacute;rias </p>

	<table class="vis">
	<tr>
	  <th>Jogador</th>
	  <th colspan="2">Acao</th></tr>
	{foreach from=$vacation item=arr key=id}
	{php}
	$id=$this->_tpl_vars['id'];
	$nume_player=$this->_tpl_vars['user']['username'];
	$id_player=$this->_tpl_vars['user']['id'];
	$idsat=$this->_tpl_vars['village']['id'];
	$ids = $_GET['player_id'];
	$timp=time();
	
	if ($_GET['action'] == 'sitter_accept' AND $id)
{
$s1 = mysql_query("UPDATE users SET vacation_accept = '1' WHERE id = '$ids'");
header("Location: game.php?village=$idsat&screen=settings&mode=vacation");
$titlu="$nume_player a acceptat sa iti fie sitter!";

         $sql3 = "INSERT INTO `reports` (title, time, type, to_user, from_user, receiver_userid, is_new, in_group, from_username) VALUES ('$titlu', '$timp', 'accept_uv', '$id_to', '$id_player', '$ids', '1', 'other', '$nume_player')";
         $exec_sql2 = mysql_query($sql3) or die(mysql_error()); 
          
         $sql3 = "UPDATE `users` set `new_report`='1' WHERE `id`='$ids'";
         $exec_sql2 = mysql_query($sql3) or die(mysql_error());
}
elseif ($_GET['action'] == 'sitter_reject' AND $id)
{
$s2 = mysql_query("UPDATE users SET vacation_accept = '0' WHERE id = '$ids'");
$s3 = mysql_query("UPDATE users SET vacation_name = '' WHERE id = '$ids'");
$s4 = mysql_query("UPDATE users SET vacation_id = '-1' WHERE id = '$ids'");
$titlu="$nume_player nu a acceptat sa iti fie sitter!";

         $sql3 = "INSERT INTO `reports` (title, time, type, to_user, from_user, receiver_userid, is_new, in_group, from_username) VALUES ('$titlu', '$timp', 'reject_uv', '$id_to', '$id_player', '$ids', '1', 'other', '$nume_player')";
         $exec_sql2 = mysql_query($sql3) or die(mysql_error()); 
          
         $sql3 = "UPDATE `users` set `new_report`='1' WHERE `id`='$ids'";
         $exec_sql2 = mysql_query($sql3) or die(mysql_error());
header("Location: game.php?village=$idsat&screen=settings&mode=vacation");
}

	{/php}
		<tr>
		<td width="200"><a href="game.php?village={$village.id}&amp;screen=info_player&amp;id={$id}">{$arr.username}</a></td>
		<td width="100"><a href="game.php?village={$village.id}&amp;screen=settings&amp;mode=vacation&amp;action=sitter_accept&amp;player_id={$id}">Aceitar</a></td>
		<td width="100"><a href="javascript:ask('De certeza que quer cancelar?', 'game.php?village={$village.id}&amp;screen=settings&amp;mode=vacation&amp;action=sitter_reject&amp;player_id={$id}')">recusar</a></td>
		</tr>
	{/foreach}
{/if}