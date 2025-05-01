<?php /* Smarty version 2.6.26, created on 2023-09-23 08:11:00
         compiled from game_market_other_offer.tpl */ ?>
<?php require_once(SMARTY_CORE_DIR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('function', 'math', 'game_market_other_offer.tpl', 5, false),)), $this); ?>
<?php if (! empty ( $this->_tpl_vars['error'] )): ?><div class="error"><?php echo $this->_tpl_vars['error']; ?>
</div><?php endif; ?>
<table class="vis">
	<tr>
		<th>Mercadores: <?php echo $this->_tpl_vars['inside_dealers']; ?>
/<?php echo $this->_tpl_vars['max_dealers']; ?>
</th>
		<th>Transporte máximo: <?php echo smarty_function_math(array('equation' => "x * 1000",'x' => $this->_tpl_vars['inside_dealers']), $this);?>
</th>
	</tr>
</table>
<h3>Buscar ofertas</h3>
<form action="game.php?village=<?php echo $this->_tpl_vars['village']['id']; ?>
&amp;screen=market&amp;mode=other_offer&amp;action=search&amp;h=<?php echo $this->_tpl_vars['hkey']; ?>
" method="post">
	<table class="vis">
		<tr>
			<td>Busco:</td>
			<td>
				<select name="res_sell">
					<option value="all" <?php if ($this->_tpl_vars['market']['market_sell'] == 'all'): ?>selected="selected"<?php endif; ?>>Todos</option>
					<option value="wood" <?php if ($this->_tpl_vars['market']['market_sell'] == 'wood'): ?>selected="selected"<?php endif; ?>>Madeira</option>
					<option value="stone" <?php if ($this->_tpl_vars['market']['market_sell'] == 'stone'): ?>selected="selected"<?php endif; ?>>Argila</option>
					<option value="iron" <?php if ($this->_tpl_vars['market']['market_sell'] == 'iron'): ?>selected="selected"<?php endif; ?>>Ferro</option>
				</select>
			</td>
			<td width="100">Rasão máxima:</td>
			<td><input name="ratio_max" value="<?php echo $this->_tpl_vars['market']['market_ratio_max']; ?>
" type="text" size="4" /> (Ex: 1.8)</td>
		</tr>
		<tr>
			<td>Ofereço:</td>
			<td><select name="res_buy">
				<option value="all" <?php if ($this->_tpl_vars['market']['market_buy'] == 'all'): ?>selected="selected"<?php endif; ?>>Todos</option>
				<option value="wood" <?php if ($this->_tpl_vars['market']['market_buy'] == 'wood'): ?>selected="selected"<?php endif; ?>>Madeira</option>
				<option value="stone" <?php if ($this->_tpl_vars['market']['market_buy'] == 'stone'): ?>selected="selected"<?php endif; ?>>Argila</option>
				<option value="iron" <?php if ($this->_tpl_vars['market']['market_buy'] == 'iron'): ?>selected="selected"<?php endif; ?>>Ferro</option>
			</select></td>
			<td colspan="2" align="center"><input type="submit" class="button" value="Buscar" /></td>
		</tr>
	</table><br />
</form>
<?php if ($this->_tpl_vars['num_pages'] > 1): ?>
<table class="vis">
	<tr>
		<td align="center">
		<?php unset($this->_sections['countpage']);
$this->_sections['countpage']['name'] = 'countpage';
$this->_sections['countpage']['start'] = (int)1;
$this->_sections['countpage']['loop'] = is_array($_loop=$this->_tpl_vars['num_pages']+1) ? count($_loop) : max(0, (int)$_loop); unset($_loop);
$this->_sections['countpage']['step'] = ((int)1) == 0 ? 1 : (int)1;
$this->_sections['countpage']['show'] = true;
$this->_sections['countpage']['max'] = $this->_sections['countpage']['loop'];
if ($this->_sections['countpage']['start'] < 0)
    $this->_sections['countpage']['start'] = max($this->_sections['countpage']['step'] > 0 ? 0 : -1, $this->_sections['countpage']['loop'] + $this->_sections['countpage']['start']);
else
    $this->_sections['countpage']['start'] = min($this->_sections['countpage']['start'], $this->_sections['countpage']['step'] > 0 ? $this->_sections['countpage']['loop'] : $this->_sections['countpage']['loop']-1);
if ($this->_sections['countpage']['show']) {
    $this->_sections['countpage']['total'] = min(ceil(($this->_sections['countpage']['step'] > 0 ? $this->_sections['countpage']['loop'] - $this->_sections['countpage']['start'] : $this->_sections['countpage']['start']+1)/abs($this->_sections['countpage']['step'])), $this->_sections['countpage']['max']);
    if ($this->_sections['countpage']['total'] == 0)
        $this->_sections['countpage']['show'] = false;
} else
    $this->_sections['countpage']['total'] = 0;
if ($this->_sections['countpage']['show']):

            for ($this->_sections['countpage']['index'] = $this->_sections['countpage']['start'], $this->_sections['countpage']['iteration'] = 1;
                 $this->_sections['countpage']['iteration'] <= $this->_sections['countpage']['total'];
                 $this->_sections['countpage']['index'] += $this->_sections['countpage']['step'], $this->_sections['countpage']['iteration']++):
$this->_sections['countpage']['rownum'] = $this->_sections['countpage']['iteration'];
$this->_sections['countpage']['index_prev'] = $this->_sections['countpage']['index'] - $this->_sections['countpage']['step'];
$this->_sections['countpage']['index_next'] = $this->_sections['countpage']['index'] + $this->_sections['countpage']['step'];
$this->_sections['countpage']['first']      = ($this->_sections['countpage']['iteration'] == 1);
$this->_sections['countpage']['last']       = ($this->_sections['countpage']['iteration'] == $this->_sections['countpage']['total']);
?>
			<?php if ($this->_tpl_vars['site'] == $this->_sections['countpage']['index']): ?>
			<strong>&gt;<?php echo $this->_sections['countpage']['index']; ?>
&lt;</strong>
			<?php else: ?>
			<a href="game.php?village=<?php echo $this->_tpl_vars['village']['id']; ?>
&amp;screen=market&amp;mode=other_offer&amp;site=<?php echo $this->_sections['countpage']['index']; ?>
">[<?php echo $this->_sections['countpage']['index']; ?>
]</a>
			<?php endif; ?>
		<?php endfor; endif; ?>
		</td>
	</tr>
</table><br />
<?php endif; ?>
<table class="vis">
	<tr>
		<th>Ofereço</th>
		<th>Busco</th>
		<th>Jogador</th>
		<th>Duração</th>
		<th>Rasão</th>
		<th>Ofertas</th>
	</tr>
	<?php $_from = $this->_tpl_vars['offers']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['id'] => $this->_tpl_vars['arr']):
?>
	<tr>
		<td><?php if ($this->_tpl_vars['arr']['sell_ress'] == 'wood'): ?><img src="<?php echo $this->_tpl_vars['config']['cdn']; ?>
/graphic/icons/wood.png" title="Madeira" alt="" /><?php endif; ?><?php if ($this->_tpl_vars['arr']['sell_ress'] == 'stone'): ?><img src="<?php echo $this->_tpl_vars['config']['cdn']; ?>
/graphic/icons/stone.png" title="Argila" alt="" /><?php endif; ?><?php if ($this->_tpl_vars['arr']['sell_ress'] == 'iron'): ?><img src="<?php echo $this->_tpl_vars['config']['cdn']; ?>
/graphic/icons/iron.png" title="Ferro" alt="" /><?php endif; ?> <?php echo $this->_tpl_vars['arr']['sell']; ?>
</td>
		<td><?php if ($this->_tpl_vars['arr']['buy_ress'] == 'wood'): ?><img src="<?php echo $this->_tpl_vars['config']['cdn']; ?>
/graphic/icons/wood.png" title="Madeira" alt="" /><?php endif; ?><?php if ($this->_tpl_vars['arr']['buy_ress'] == 'stone'): ?><img src="<?php echo $this->_tpl_vars['config']['cdn']; ?>
/graphic/icons/stone.png" title="Argila" alt="" /><?php endif; ?><?php if ($this->_tpl_vars['arr']['buy_ress'] == 'iron'): ?><img src="<?php echo $this->_tpl_vars['config']['cdn']; ?>
/graphic/icons/iron.png" title="Ferro" alt="" /><?php endif; ?> <?php echo $this->_tpl_vars['arr']['buy']; ?>
</td>
		<td align="center"><a href="game.php?village=820&amp;screen=info_player&amp;id=<?php echo $this->_tpl_vars['arr']['userid']; ?>
"><?php echo $this->_tpl_vars['arr']['username']; ?>
</a></td>
		<td align="center"><?php echo $this->_tpl_vars['arr']['unit_running']; ?>
</td>
		<td align="center"><table width="40"><tr><td style="background-color:rgb(<?php echo $this->_tpl_vars['arr']['ratio_red']; ?>
, <?php echo $this->_tpl_vars['arr']['ratio_green']; ?>
, 100); color:#000000; text-align:center;"><?php echo $this->_tpl_vars['arr']['ratio_max']; ?>
</td></tr></table></td>
		<td align="center"><?php echo $this->_tpl_vars['arr']['multi']; ?>
 oferta(s)</td>
		<td align="center">
		<?php if ($this->_tpl_vars['arr']['message'] == 'not_enough_dealers'): ?>
			Mercadores insuficientes.
		<?php elseif ($this->_tpl_vars['arr']['message'] == 'not_enough_ress'): ?>
			Recursos insuficientes.
		<?php else: ?>
			<form action="game.php?village=<?php echo $this->_tpl_vars['village']['id']; ?>
&amp;screen=market&amp;mode=other_offer&amp;action=accept_multi&amp;id=<?php echo $this->_tpl_vars['id']; ?>
&amp;site=<?php echo $this->_tpl_vars['site']; ?>
&amp;h=<?php echo $this->_tpl_vars['hkey']; ?>
" method="post">
				<input type="text" name="count" size="3" value="1" onclick="javascript:this.value=''" />
				<input type="submit" class="button" value="Aceitar" size="5" />
			</form>						
		<?php endif; ?>
		</td>
	</tr>
	<?php endforeach; endif; unset($_from); ?>
</table>