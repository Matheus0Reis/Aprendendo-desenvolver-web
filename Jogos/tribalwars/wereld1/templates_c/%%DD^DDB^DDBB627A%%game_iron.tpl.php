<?php /* Smarty version 2.6.26, created on 2023-09-23 12:18:06
         compiled from game_iron.tpl */ ?>
<?php require_once(SMARTY_CORE_DIR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('modifier', 'stage', 'game_iron.tpl', 7, false),)), $this); ?>
<table>
	<tr>
    	<td>
			<img src="<?php echo $this->_tpl_vars['config']['cdn']; ?>
/graphic/big_buildings/iron1.png" title="Lehmgrube" alt="" />
		</td>   
		<td>
			<h2>Mina de Ferro (<?php echo ((is_array($_tmp=$this->_tpl_vars['village']['iron'])) ? $this->_run_mod_handler('stage', true, $_tmp) : stage($_tmp)); ?>
)</h2>
       	    <?php echo $this->_tpl_vars['description']; ?>

		</td>
	</tr>
</table>
<table class="vis" width="50%" style="border:1px solid #804000; margin-left:5px;">
	<tr>
		<th width="200"><img src="<?php echo $this->_tpl_vars['config']['cdn']; ?>
/graphic/icons/iron.png" title="Ferro" alt="" /> Produção atual</th>
		<td><b><?php echo $this->_tpl_vars['iron_datas']['iron_production']; ?>
 </b> Unidades por minuto</td>
	</tr>
	<?php if ($this->_tpl_vars['iron_datas']['iron_production_next'] != false): ?>
	<tr>
		<th><img src="<?php echo $this->_tpl_vars['config']['cdn']; ?>
/graphic/icons/iron.png" title="Ferro" alt="" /> Produção no (<?php echo ((is_array($_tmp=$this->_tpl_vars['village']['iron']+1)) ? $this->_run_mod_handler('stage', true, $_tmp) : stage($_tmp)); ?>
)</th>
		<td><b><?php echo $this->_tpl_vars['iron_datas']['iron_production_next']; ?>
</b> Unidades por minuto</td>
	</tr>
    <?php endif; ?>
</table>