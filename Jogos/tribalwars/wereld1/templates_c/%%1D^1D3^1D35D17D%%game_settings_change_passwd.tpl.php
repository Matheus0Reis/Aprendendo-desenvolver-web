<?php /* Smarty version 2.6.26, created on 2014-07-03 09:12:45
         compiled from game_settings_change_passwd.tpl */ ?>
<h3>Alterar a senha</h3>
<?php if ($this->_tpl_vars['changed']): ?>
	<b>Senha alterada</b><br />
<?php endif; ?>
<p>Voce pode alterar sua senha aqui. Para fazer isso, digite sua senha antiga e sua nova senha. Voce deve inserir a nova senha duas vezes por motivos de seguranca.</p>
<p>Sua nova senha aparecera <em>mudou em todos os mundos</em> e esta depois da mudanca <em>imediatamente</em> valido e nao precisa ser confirmado por e-mail</p>

<form method="post" action="game.php?village=<?php echo $this->_tpl_vars['village']['id']; ?>
&amp;screen=settings&amp;mode=change_passwd&amp;action=change_passwd&amp;h=<?php echo $this->_tpl_vars['hkey']; ?>
">
<table class="vis">
	<tr>
		<td><label for="old_passwd">Senha Antiga: </label></td>
		<td><input type="password" name="old_passwd" id="old_passwd" /></td>
	</tr>
	<tr>
		<td><label for="new_passwd">Nova Senha: </label></td>
		<td><input type="password" name="new_passwd" id="new_passwd" /></td>

	</tr>
	<tr>
		<td><label for="new_passwd_rpt">Repita Nova Senha: </label></td>
		<td><input type="password" name="new_passwd_rpt" id="new_passwd_rpt" /></td>
	</tr>
	<tr>
		<td></td>
		<td><input type="submit" value="Alterar a senha"/></td>

	</tr>
</table>
</form>