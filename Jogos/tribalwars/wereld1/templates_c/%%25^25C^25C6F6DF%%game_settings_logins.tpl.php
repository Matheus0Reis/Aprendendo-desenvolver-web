<?php /* Smarty version 2.6.26, created on 2014-07-03 09:12:43
         compiled from game_settings_logins.tpl */ ?>
<h3>Logins</h3>
<p>Nesta pagina voce pode ver quando ocorreram logins e tentativas incorretas de login em sua conta. Se voce descobrir que alguem teve acesso nao autorizado a sua conta, altere sua senha imediatamente. O IP geralmente muda quando voce faz login na Internet.</p>

<h4>Ultimos 20 logins</h4>
<table class="vis">
<tr><th>Data</th><th>IP</th><th>Feriado representativo</th></tr>
<?php $_from = $this->_tpl_vars['logins']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['id'] => $this->_tpl_vars['arr']):
?>
	<tr><td><?php echo $this->_tpl_vars['arr']['time']; ?>
</td><td><?php echo $this->_tpl_vars['arr']['ip']; ?>
</td><td><?php echo $this->_tpl_vars['arr']['uv']; ?>
</td></tr>
<?php endforeach; endif; unset($_from); ?>
</table>