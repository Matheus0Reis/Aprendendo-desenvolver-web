{php}
mysql_select_db("login");
$username = $this->_tpl_vars['user']['username'];
$select_pass = mysql_fetch_array(mysql_query("SELECT password FROM users WHERE username = '$username'"));
$select_pass = $select_pass[0];
$old_password = md5($_POST['old_password']);
$new_password = md5($_POST['new_password']);
$new_password_ = $_POST['new_password'];
$new_password_rpt = md5($_POST['new_password_repeat']);
if ($_GET['action'] == 'change_passwd')
{
if ($old_password == $select_pass){
if (strlen(trim($new_password_)) > 4){
if ($new_password == $new_password_rpt) {
} else { $error = "As senhas n&atilde;o coincidem!"; }
} else { $error = "A senha tem de conter pelo menos 4 car&aacute;teres! "; }
} else { $error = "A senha antiga est&aacute; incorreta! "; } 
if (!$error) { 
mysql_query("UPDATE users SET password = '$new_password' WHERE username = '$username'");
$succes = "Senha modificada com sucesso!";
}
}

{/php}
<h3>Alterar senha </h3>

<p> Aqui pode alterar a sua palavra-chave. Forne&ccedil;a a sua palavra-chave antiga, assim como uma nova palavra-chave. Por motivos de seguran&ccedil;a precisa de inserir duas vezes a nova palavra-chave. </p>

<div class='error'>{php} echo $error; {/php}</div> 
<span style="color: green;"><b>{php} echo $succes; {/php}</b></span>
<form method="post" action="game.php?village={$village.id}&amp;screen=settings&amp;mode=change_passwd&amp;action=change_passwd&amp;h={$hkey}">
<table class="vis">
	<tr>
		<td><label for="old_passwd">Senha antiga  : </label></td>
		<td><input type="password" name="old_password" id="old_passwd" /></td>
	</tr>
	<tr>
		<td><label for="new_passwd">Nova senha : </label></td>
		<td><input type="password" name="new_password" id="new_passwd" /></td>

	</tr>
	<tr>
		<td><label for="new_passwd_rpt">Repetir: </label></td>
		<td><input type="password" name="new_password_repeat" id="new_passwd_rpt" /></td>
	</tr>
	<tr>
		<td></td>
		<td><input type="submit" value="Alterar senha"/></td>

	</tr>
</table>
</form>