<?php /* Smarty version 2.6.26, created on 2023-09-23 12:17:29
         compiled from game_hide.tpl */ ?>
<?php require_once(SMARTY_CORE_DIR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('modifier', 'stage', 'game_hide.tpl', 7, false),)), $this); ?>
<table>
	<tr>
   		<td>
			<img src="<?php echo $this->_tpl_vars['config']['cdn']; ?>
/graphic/big_buildings/hide1.png" title="Speicher" alt="" />
		</td>
		<td>
			<h2>Esconderijo (<?php echo ((is_array($_tmp=$this->_tpl_vars['village']['hide'])) ? $this->_run_mod_handler('stage', true, $_tmp) : stage($_tmp)); ?>
)</h2>
			<?php echo $this->_tpl_vars['description']; ?>

		</td>
	</tr>
</table>
<table class="vis" style="border:1px solid #804000; margin-left:5px;" width="500">
	<tr>
		<th width="250">Armazémento atual:</th>
		<td><b><?php echo $this->_tpl_vars['hide_datas']['max_hide']; ?>
</b> Unidades de cada recurso</td>
	</tr>
	<?php if ($this->_tpl_vars['hide_datas']['max_hide_next'] != false): ?>
	<tr>
		<th>Armazémento no (<?php echo ((is_array($_tmp=$this->_tpl_vars['village']['hide']+1)) ? $this->_run_mod_handler('stage', true, $_tmp) : stage($_tmp)); ?>
)</th>
		<td><b><?php echo $this->_tpl_vars['hide_datas']['max_hide_next']; ?>
</b> Unidades de cada recurso</td>
	</tr>
	<?php endif; ?>
	<tr>
		<th>Recursos que podem ser saqueados:</th>
		<td align="center">
			<img src="<?php echo $this->_tpl_vars['config']['cdn']; ?>
/graphic/icons/wood.png" title="Madeira" alt="" /><?php echo $this->_tpl_vars['village']['r_wood']-$this->_tpl_vars['hide_datas']['max_hide']; ?>
 |
			<img src="<?php echo $this->_tpl_vars['config']['cdn']; ?>
/graphic/icons/stone.png" title="Argila" alt="" /><?php echo $this->_tpl_vars['village']['r_stone']-$this->_tpl_vars['hide_datas']['max_hide']; ?>
 |
			<img src="<?php echo $this->_tpl_vars['config']['cdn']; ?>
/graphic/icons/iron.png" title="Ferro" alt="" /><?php echo $this->_tpl_vars['village']['r_iron']-$this->_tpl_vars['hide_datas']['max_hide']; ?>

		</td>
	</tr>
	<tr><th colspan="2"><div align="center">Ofertas no mercado podem ser saqueadas.</div></th></tr>
</table>