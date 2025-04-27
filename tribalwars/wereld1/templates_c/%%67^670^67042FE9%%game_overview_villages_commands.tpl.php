<?php /* Smarty version 2.6.26, created on 2023-09-23 09:51:14
         compiled from game_overview_villages_commands.tpl */ ?>
<?php require_once(SMARTY_CORE_DIR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('modifier', 'format_time', 'game_overview_villages_commands.tpl', 12, false),)), $this); ?>
<table class="vis" width="100%">
	<tr>
		<th>Comando</th>
		<th>Origem</th>
		<th>Chegada em</th>
		<?php $_from = $this->_tpl_vars['cl_units']->get_array('dbname'); if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['name'] => $this->_tpl_vars['dbname']):
?><th width="30"><div align="center"><img src="<?php echo $this->_tpl_vars['config']['cdn']; ?>
/graphic/unit/<?php echo $this->_tpl_vars['dbname']; ?>
.png" title="<?php echo $this->_tpl_vars['name']; ?>
" /></div></th><?php endforeach; endif; unset($_from); ?>
	</tr>
	<?php $_from = $this->_tpl_vars['my_movements']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['array']):
?>
	<tr class="row_a">
		<td><a href="game.php?village=<?php echo $this->_tpl_vars['village']['id']; ?>
&amp;screen=info_command&amp;id=<?php echo $this->_tpl_vars['array']['id']; ?>
&amp;type=own"><?php echo $this->_tpl_vars['array']['message']; ?>
</a></td>
		<td><a href="game.php?village=<?php echo $this->_tpl_vars['village']['id']; ?>
&amp;screen=info_village&amp;id=<?php echo $this->_tpl_vars['array']['homevillageid']; ?>
"><?php echo $this->_tpl_vars['array']['homevillagename']; ?>
</a></td>
		<td><?php echo ((is_array($_tmp=$this->_tpl_vars['array']['arrival_in'])) ? $this->_run_mod_handler('format_time', true, $_tmp) : format_time($_tmp)); ?>
</td>
		<?php $_from = $this->_tpl_vars['array']['units']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['num']):
?>
			<?php if ($this->_tpl_vars['num'] == 0): ?>
		<td class="hidden">0</td>
			<?php else: ?>
		<td><?php echo $this->_tpl_vars['num']; ?>
</td>
			<?php endif; ?>
		<?php endforeach; endif; unset($_from); ?>
	</tr>
	<?php endforeach; endif; unset($_from); ?>	
</table>