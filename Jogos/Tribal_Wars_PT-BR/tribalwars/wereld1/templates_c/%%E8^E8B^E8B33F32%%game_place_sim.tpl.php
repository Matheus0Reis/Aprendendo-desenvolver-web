<?php /* Smarty version 2.6.26, created on 2014-11-20 08:55:52
         compiled from game_place_sim.tpl */ ?>
<?php if (isset ( $this->_tpl_vars['simulate'] ) && $this->_tpl_vars['simulate']): ?>
	<table class="vis">
		<tr>
			<td colspan="2"></td>
			<?php $_from = $this->_tpl_vars['cl_units']->get_array('dbname'); if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['name'] => $this->_tpl_vars['dbname']):
?>
				<th width="35"><img src="<?php echo $this->_tpl_vars['config']['cdn']; ?>
/graphic/unit/<?php echo $this->_tpl_vars['dbname']; ?>
.png" title="<?php echo $this->_tpl_vars['name']; ?>
" alt="" /></th>
			<?php endforeach; endif; unset($_from); ?>
		</tr>
		<tr>
			<td rowspan="2">Atacante</td>
			<td>Unidades:</td>
			<?php $_from = $this->_tpl_vars['simulate_values']['att']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['unitname'] => $this->_tpl_vars['num']):
?>
				<?php if ($this->_tpl_vars['num'] == '0'): ?>
					<td class="hidden">0</td>
				<?php else: ?>
					<td><?php echo $this->_tpl_vars['num']; ?>
</td>
				<?php endif; ?>
			<?php endforeach; endif; unset($_from); ?>
		</tr>
		<tr>
			<td>Perdas:</td>
			<?php $_from = $this->_tpl_vars['simulate_values']['att_lose']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['unitname'] => $this->_tpl_vars['num']):
?>
				<?php if ($this->_tpl_vars['num'] == '0'): ?>
					<td class="hidden">0</td>
				<?php else: ?>
					<td><?php echo $this->_tpl_vars['num']; ?>
</td>
				<?php endif; ?>
			<?php endforeach; endif; unset($_from); ?>
		</tr>
		<tr>
			<td style="display:none"></td>
		</tr>
		<tr>
			<td rowspan="2">Defensor</td>
			<td>Unidades:</td>
			<?php $_from = $this->_tpl_vars['simulate_values']['def']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['unitname'] => $this->_tpl_vars['num']):
?>
				<?php if ($this->_tpl_vars['num'] == '0'): ?>
					<td class="hidden">0</td>
				<?php else: ?>
					<td><?php echo $this->_tpl_vars['num']; ?>
</td>
				<?php endif; ?>
			<?php endforeach; endif; unset($_from); ?>
		</tr>
		<tr>
			<td>Perdas:</td>
			<?php $_from = $this->_tpl_vars['simulate_values']['def_lose']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['unitname'] => $this->_tpl_vars['num']):
?>
				<?php if ($this->_tpl_vars['num'] == '0'): ?>
					<td class="hidden">0</td>
				<?php else: ?>
					<td><?php echo $this->_tpl_vars['num']; ?>
</td>
				<?php endif; ?>
			<?php endforeach; endif; unset($_from); ?>
		</tr>
	</table>
	<table>
	<?php if ($this->_tpl_vars['simulate_values']['others']['def_wall'] != $this->_tpl_vars['simulate_values']['others']['new_wall']): ?>
		<tr><th>Danos causados por arietes:</th><td>Parede danificada por Level <b><?php echo $this->_tpl_vars['simulate_values']['others']['def_wall']; ?>
</b> no Level <b><?php echo $this->_tpl_vars['simulate_values']['others']['new_wall']; ?>
</b></td></tr>
	<?php endif; ?>
	
	<?php if ($this->_tpl_vars['simulate_values']['others']['def_building'] != $this->_tpl_vars['simulate_values']['others']['new_building']): ?>
		<tr><th>Danos causados pelo fogo da catapulta:</th><td>Edificios danificados por Level <b><?php echo $this->_tpl_vars['simulate_values']['others']['def_building']; ?>
</b> no Level <b><?php echo $this->_tpl_vars['simulate_values']['others']['new_building']; ?>
</b></td></tr>
	<?php endif; ?>
	</table>
<?php endif; ?>

<form action="game.php?village=<?php echo $this->_tpl_vars['village']['id']; ?>
&amp;screen=place&amp;mode=sim" method="post" name="units">
	<input name="simulate" type="hidden" />
	<table class="vis">
		<tr>
			<th>Tropas</th>
			<th colspan="2">Atacante</th>
			<th colspan="2">Defensor</th>
		</tr>
		<tr>
			<td>Tipo</td>
			<td>Unidades</td>
			<td>Tecnologia</td>
			<td>Unidades</td>
			<td>Tecnologia</td>
		</tr>
		<?php $_from = $this->_tpl_vars['cl_units']->get_array('dbname'); if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['name'] => $this->_tpl_vars['dbname']):
?>
			<tr>
				<td><a href="javascript:popup('popup_unit.php?unit=<?php echo $this->_tpl_vars['dbname']; ?>
, 520, 520)"><img src="<?php echo $this->_tpl_vars['config']['cdn']; ?>
/graphic/unit/<?php echo $this->_tpl_vars['dbname']; ?>
.png" title="" alt="" /> <?php echo $this->_tpl_vars['name']; ?>
</a></td>
				<td><input type="text" name="att_<?php echo $this->_tpl_vars['dbname']; ?>
" size="5" value="<?php echo $this->_tpl_vars['values']['att'][$this->_tpl_vars['dbname']]; ?>
" /></td>
				<td><input type="text" name="att_tech_<?php echo $this->_tpl_vars['dbname']; ?>
" size="5" value="<?php echo $this->_tpl_vars['values']['att_tech'][$this->_tpl_vars['dbname']]; ?>
" /></td>
				<td><input type="text" name="def_<?php echo $this->_tpl_vars['dbname']; ?>
" size="5" value="<?php echo $this->_tpl_vars['values']['def'][$this->_tpl_vars['dbname']]; ?>
" /></td>
				<td><input type="text" name="def_tech_<?php echo $this->_tpl_vars['dbname']; ?>
" size="5" value="<?php echo $this->_tpl_vars['values']['def_tech'][$this->_tpl_vars['dbname']]; ?>
" /></td>
			</tr>
		<?php endforeach; endif; unset($_from); ?>
		<tr>
			<td>Parede</td>
			<td colspan="2"></td>
			<td colspan="2"><input type="text" name="def_wall" value="<?php echo $this->_tpl_vars['values']['def_wall']; ?>
" size="5" /></td>
		</tr>
		<tr>
			<td>Level de construcao do alvo da catapulta</td>
			<td colspan="2"></td><td colspan="2"><input type="text" name="def_building" value="<?php echo $this->_tpl_vars['values']['def_building']; ?>
" size="5" /></td>
		</tr>
		<?php if ($this->_tpl_vars['moral_activ']): ?>
			<tr>
				<td>Moral</td>
				<td colspan="4"><input type="text" name="moral" value="<?php echo $this->_tpl_vars['values']['moral']; ?>
" size="5" id="moral" />%</td>
			</tr>
		<?php endif; ?>
		<tr>
			<td>Felicidade (De -25% a +25%)</td>
			<td colspan="4"><input type="text" name="luck" value="<?php echo $this->_tpl_vars['values']['luck']; ?>
" size="5" />%</td>
		</tr>
	</table>
	<input type="submit" value="Calcular" />
</form>