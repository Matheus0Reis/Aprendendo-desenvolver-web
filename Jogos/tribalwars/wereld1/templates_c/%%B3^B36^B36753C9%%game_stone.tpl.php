<?php /* Smarty version 2.6.26, created on 2023-09-23 12:18:17
         compiled from game_stone.tpl */ ?>
<?php require_once(SMARTY_CORE_DIR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('modifier', 'stage', 'game_stone.tpl', 8, false),)), $this); ?>
<table>
	<tr>
		<td>
			<img src="<?php echo $this->_tpl_vars['config']['cdn']; ?>
/graphic/big_buildings/stone1.png" title="Lehmgrube" alt="" />
		</td>
		<td>
			<h2>
				Poço de Argila (<?php echo ((is_array($_tmp=$this->_tpl_vars['village']['stone'])) ? $this->_run_mod_handler('stage', true, $_tmp) : stage($_tmp)); ?>
)
			</h2>
			<?php echo $this->_tpl_vars['description']; ?>

		</td>
	</tr>
</table>
<br />
	<table class="vis">
		<tr>
			<td width="200">
				<img src="<?php echo $this->_tpl_vars['config']['cdn']; ?>
/graphic/lehm.png" title="Lehm" alt="" />
				Produção atual
			</td>
			<td>
				<b><?php echo $this->_tpl_vars['stone_datas']['stone_production']; ?>
 </b>
				Unidades por minuto
			</td>
		</tr>

		<?php if (( $this->_tpl_vars['stone_datas']['stone_production_next'] ) == false): ?>

		<?php else: ?>

			<tr>
				<td>
					<img src="<?php echo $this->_tpl_vars['config']['cdn']; ?>
/graphic/lehm.png" title="Lehm" alt="" />
				produção em (<?php echo ((is_array($_tmp=$this->_tpl_vars['village']['stone']+1)) ? $this->_run_mod_handler('stage', true, $_tmp) : stage($_tmp)); ?>
)
			</td>
			<td>
				<b><?php echo $this->_tpl_vars['stone_datas']['stone_production_next']; ?>
</b>
				Unidades por minuto
			</td>
		</tr>
    <?php endif; ?>

</table>