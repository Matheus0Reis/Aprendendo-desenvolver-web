<?php /* Smarty version 2.6.14, created on 2012-01-25 01:38:50
         compiled from index_mail.tpl */ ?>
<h2>SISTEMA DE NOTICIAS</h2>
Utilize esse sistema para enviar noticias com o SYSTEM, não utilize para SPAM. Comandos são logados.

<?php if (! empty ( $this->_tpl_vars['error'] )): ?>
	<br /><br /><font class="error"><?php echo $this->_tpl_vars['error']; ?>
</font><br /><br />
<?php endif; ?>

<?php if ($this->_tpl_vars['is_send']): ?>
<br />
<br  />
	Mensagem Enviada!
<?php else: ?>
	<form method="post" action="index.php?screen=mail&amp;action=send" onSubmit="this.submit.disabled=true;">
		<table class="vis">
			<tr>
				<td>Titulo:</td><td><input type="text" name="subject" size="70" value="<?php echo $this->_tpl_vars['subject']; ?>
"></td>
			</tr>
			<tr>
				<td colspan="2"><textarea rows="20" cols="80" name="text"><?php echo $this->_tpl_vars['text']; ?>
</textarea></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" name="submit" value="Enviar"></td>
			</tr>
		</table>
	</form>
<?php endif; ?>