<?php /* Smarty version 2.6.14, created on 2012-01-25 01:39:51
         compiled from index_debugger.tpl */ ?>
<h2>Debugador de Ataques </h2>
Comando utilizado para debugar ataques fantasma. <br />
<br />
	
<?php if ($this->_tpl_vars['done'] == 'attacks'): ?>
	Ataques recalculados <?php elseif ($this->_tpl_vars['done'] == 'reload_events'): ?>
	Dados Recalculados <?php else: ?>
	<a href="index.php?screen=debugger&action=attacks">RE-CALCULAR ATAQUES </a><br />

<?php endif; ?>