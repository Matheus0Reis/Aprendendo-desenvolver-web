<?php /* Smarty version 2.6.26, created on 2023-09-23 08:10:58
         compiled from game_market_own_offer.tpl */ ?>
<?php require_once(SMARTY_CORE_DIR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('function', 'math', 'game_market_own_offer.tpl', 5, false),array('modifier', 'replace', 'game_market_own_offer.tpl', 66, false),)), $this); ?>
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
<h3>Criar oferta</h3>
<form action="game.php?village=<?php echo $this->_tpl_vars['village']['id']; ?>
&amp;screen=market&amp;mode=own_offer&amp;action=new_offer&amp;h=<?php echo $this->_tpl_vars['hkey']; ?>
" method="post">
	<table class="vis">
		<tr>
			<td width="150">Ofereço:</td>
			<td align="center"><input name="sell" type="text" size="7" value="" /></td>
			<td align="center">
				<table cellspacing="0" cellpadding="0">
					<tr>
						<td><input id="res_sell_wood" name="res_sell" type="radio" value="wood" /></td>
						<td width="30"><label for="res_sell_wood"><img src="<?php echo $this->_tpl_vars['config']['cdn']; ?>
/graphic/icons/wood.png" title="Madeira" alt="" /></label></td>
						<td><input id="res_sell_stone" name="res_sell" type="radio" value="stone" /></td>
						<td width="30"><label for="res_sell_stone"><img src="<?php echo $this->_tpl_vars['config']['cdn']; ?>
/graphic/icons/stone.png" title="Argila" alt="" /></label></td>
						<td><input id="res_sell_iron" name="res_sell" type="radio" value="iron" /></td>
						<td width="30"><label for="res_sell_iron"><img src="<?php echo $this->_tpl_vars['config']['cdn']; ?>
/graphic/icons/iron.png" title="Ferro" alt="" /></label></td>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td>Busco:</td>
			<td align="center"><input name="buy" type="text" size="7" value="" /></td>
			<td align="center">
				<table cellspacing="0" cellpadding="0">
					<tr>
						<td><input id="res_buy_wood" name="res_buy" type="radio" value="wood" /></td>
						<td width="30"><label for="res_buy_wood"><img src="<?php echo $this->_tpl_vars['config']['cdn']; ?>
/graphic/icons/wood.png" title="Madeira" alt="" /></label></td>
						<td><input id="res_buy_stone" name="res_buy" type="radio" value="stone" /></td>
						<td width="30"><label for="res_buy_stone"><img src="<?php echo $this->_tpl_vars['config']['cdn']; ?>
/graphic/icons/stone.png" title="Argila" alt="" /></label></td>
						<td><input id="res_buy_iron" name="res_buy" type="radio" value="iron" /></td>
						<td width="30"><label for="res_buy_iron"><img src="<?php echo $this->_tpl_vars['config']['cdn']; ?>
/graphic/icons/iron.png" title="Ferro" alt="" /></label></td>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td>Quantidade de ofertas:</td>
			<td align="center"><input name="multi" type="text" size="7" value="1" /></td>
			<td>oferta(s)</td>
		</tr>
		<tr><th colspan="3"><span style="float:right;"><input type="submit" value="Criar" class="button" /></span></th></tr>
	</table>
</form>
<?php if (count ( $this->_tpl_vars['offers'] ) > 0): ?>
<h3>Suas ofertas</h3>
<form action="game.php?village=<?php echo $this->_tpl_vars['village']['id']; ?>
&amp;screen=market&amp;mode=own_offer&amp;action=modify_offers&amp;h=<?php echo $this->_tpl_vars['hkey']; ?>
" method="post">
	<table class="vis">
		<tr>
			<th>Ofereço</th>
			<th>Busco</th>
			<th>Ofertas</th>
			<th>Adicionado em</th>
		</tr>
		<?php $_from = $this->_tpl_vars['offers']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['id'] => $this->_tpl_vars['arr']):
?>
		<tr>
			<td><input name="id_<?php echo $this->_tpl_vars['id']; ?>
" type="checkbox" /><?php if ($this->_tpl_vars['arr']['sell_ress'] == 'wood'): ?><img src="<?php echo $this->_tpl_vars['config']['cdn']; ?>
/graphic/icons/wood.png" title="Madeira" alt="" /><?php endif; ?><?php if ($this->_tpl_vars['arr']['sell_ress'] == 'stone'): ?><img src="<?php echo $this->_tpl_vars['config']['cdn']; ?>
/graphic/icons/stone.png" title="Argila" alt="" /><?php endif; ?><?php if ($this->_tpl_vars['arr']['sell_ress'] == 'iron'): ?><img src="<?php echo $this->_tpl_vars['config']['cdn']; ?>
/graphic/icons/iron.png" title="Ferro" alt="" /><?php endif; ?> <?php echo $this->_tpl_vars['arr']['sell']; ?>
</td>
			<td><?php if ($this->_tpl_vars['arr']['buy_ress'] == 'wood'): ?><img src="<?php echo $this->_tpl_vars['config']['cdn']; ?>
/graphic/icons/wood.png" title="Madeira" alt="" /><?php endif; ?><?php if ($this->_tpl_vars['arr']['buy_ress'] == 'stone'): ?><img src="<?php echo $this->_tpl_vars['config']['cdn']; ?>
/graphic/icons/stone.png" title="Argila" alt="" /><?php endif; ?><?php if ($this->_tpl_vars['arr']['buy_ress'] == 'iron'): ?><img src="<?php echo $this->_tpl_vars['config']['cdn']; ?>
/graphic/icons/iron.png" title="Ferro" alt="" /><?php endif; ?> <?php echo $this->_tpl_vars['arr']['buy']; ?>
</td>
			<td align="center"><?php echo $this->_tpl_vars['arr']['multi']; ?>
</td>	
			<td align="center"><?php echo ((is_array($_tmp=((is_array($_tmp=((is_array($_tmp=((is_array($_tmp=((is_array($_tmp=$this->_tpl_vars['arr']['time'])) ? $this->_run_mod_handler('replace', true, $_tmp, 'heute um', "hoje &agrave;s") : smarty_modifier_replace($_tmp, 'heute um', "hoje &agrave;s")))) ? $this->_run_mod_handler('replace', true, $_tmp, 'Uhr', "") : smarty_modifier_replace($_tmp, 'Uhr', "")))) ? $this->_run_mod_handler('replace', true, $_tmp, 'am', 'em') : smarty_modifier_replace($_tmp, 'am', 'em')))) ? $this->_run_mod_handler('replace', true, $_tmp, 'um', "&agrave;s") : smarty_modifier_replace($_tmp, 'um', "&agrave;s")))) ? $this->_run_mod_handler('replace', true, $_tmp, 'morgen', "amanh&atilde;") : smarty_modifier_replace($_tmp, 'morgen', "amanh&atilde;")); ?>
</td>
		</tr>
		<?php endforeach; endif; unset($_from); ?>
		<tr><th colspan="4"><input name="all" type="checkbox" onclick="selectAll(this.form, this.checked)" /> Selecionar todos</th></tr>
	</table><br />
	<center>
		<input type="submit" value="Apagar" class="button" name="delete" />
		<input type="text" size="2" name="mod_count" value="1" style="text-align:center;" />
		<input type="submit" value="Adicionar oferta" class="button green" name="increase" />
		<input type="submit" value="Reduzir oferta" class="button red" name="decrease" />
	</center>
</form>
<?php endif; ?>