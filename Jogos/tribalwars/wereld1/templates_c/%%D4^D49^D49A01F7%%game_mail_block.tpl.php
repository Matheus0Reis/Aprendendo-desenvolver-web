<?php /* Smarty version 2.6.26, created on 2014-11-20 13:48:27
         compiled from game_mail_block.tpl */ ?>
<h3>Bloquear remetentes</h3>
<p>Aqui você pode especificar os jogadores cujas mensagens para você serão bloqueadas.</p>
	
<form action="game.php?village=<?php echo $this->_tpl_vars['village']['id']; ?>
&amp;screen=mail&amp;mode=block&amp;action=block_name&amp;h=<?php echo $this->_tpl_vars['hkey']; ?>
" method="post">
<table class="vis"><tr>
<td>Jogador:</td>
<td><input name="tribe_name" type="text" /></td>
<td><input type="submit" value="OK" /></td>
</tr></table>
</form>

<?php if (count ( $this->_tpl_vars['blocked'] ) > 0): ?>
	<h4>Jogadores bloqueados</h4>
	<table class="vis">
	<tr><th width="200">Nome</th><th width="100">Desbloquear</th></tr>
		<?php $_from = $this->_tpl_vars['blocked']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['id'] => $this->_tpl_vars['arr']):
?>
			<tr>
			<td><a href="game.php?village=<?php echo $this->_tpl_vars['village']['id']; ?>
&amp;screen=info_player&amp;id=<?php echo $this->_tpl_vars['arr']['blocked_id']; ?>
"><?php echo $this->_tpl_vars['arr']['blocked_name']; ?>
</a></td>
			<td><a href="game.php?village=<?php echo $this->_tpl_vars['village']['id']; ?>
&amp;screen=mail&amp;mode=block&amp;action=unblock&amp;from_id=<?php echo $this->_tpl_vars['arr']['blocked_id']; ?>
&amp;h=<?php echo $this->_tpl_vars['hkey']; ?>
">Desbloquear</a></td>
			</tr>
		<?php endforeach; endif; unset($_from); ?>
	</table>
<?php endif; ?>