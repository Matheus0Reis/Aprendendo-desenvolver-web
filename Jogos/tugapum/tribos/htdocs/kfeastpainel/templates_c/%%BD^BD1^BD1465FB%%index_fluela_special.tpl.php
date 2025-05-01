<?php /* Smarty version 2.6.14, created on 2012-01-25 01:38:50
         compiled from index_fluela_special.tpl */ ?>
<h2>Criar Aldeias de Barbaros </h2>

<a href="index.php?screen=fluela_special" />Criar uma aldeia   - <a href="index.php?screen=fluela_special&action=editmes" />Listar/Editar Aldeias de Barbaros </a></a> - <a href="index.php?screen=refugee_camp" /> Apagar Aldeias </a>
<br />
<br />
<?php if (! empty ( $this->_tpl_vars['error'] )): ?>
	<font class="error"><?php echo $this->_tpl_vars['error']; ?>
</font><br /><br />
<?php endif; ?>
<?php if (! empty ( $this->_tpl_vars['new_version'] )): ?>
	<?php echo $this->_tpl_vars['new_version']; ?>
<br /><br />
<?php else: ?>
<?php if ($this->_tpl_vars['aktion'] == 'create'): ?>
<?php if ($this->_tpl_vars['success']): ?>
	Aldeia de Barbaros criada/editada com sucesso!<?php else: ?>
	<form method="POST" action="index.php?screen=fluela_special&action=creater" name="dorf" onSubmit="this.submit.disabled=true;">
		<table class="vis">
			<tr>
				<th colspan="2">Criar aldeias de barbaros </th>
			</tr>
			<tr>
				<td width="350">Criar quantas aldeias? <br />
				  (maximo 250 e minimo 1)</td>
				<td><input type="text" name="num" value="0"></td>
			</tr>
			<tr><td>
			<table class="vis">
				<tr>
				<td>
				<table class="vis">
					<tr>
					<th>Constru&ccedil;&otilde;es</th>
					<th>Niveis</th>
					</tr>
					<?php $_from = $this->_tpl_vars['buildings']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['dbname'] => $this->_tpl_vars['arr']):
?>
						<tr>
							<td><img src="../graphic/buildings/<?php echo $this->_tpl_vars['dbname']; ?>
.png"> <?php echo $this->_tpl_vars['arr']['name']; ?>
:</td>
							<td><input type="text" size="4" name="<?php echo $this->_tpl_vars['dbname']; ?>
" value="<?php echo $this->_tpl_vars['arr']['std_lvl']; ?>
"></td>
						</tr>
					<?php endforeach; endif; unset($_from); ?>
				</table>
			</table>
			</td><td valign="top"><table class="vis" valign="top">
		<tr>
		<th>Unidades</th>
		<th>Qntd</th>
		</tr>
		<?php $_from = $this->_tpl_vars['units']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['dbname'] => $this->_tpl_vars['arr']):
?>
			<tr>
				<td><img src="../graphic/unit/<?php echo $this->_tpl_vars['dbname']; ?>
.png"> <?php echo $this->_tpl_vars['arr']['name']; ?>
:</td>
				<td><input type="text" size="5" name="<?php echo $this->_tpl_vars['dbname']; ?>
" value="<?php echo $this->_tpl_vars['arr']['std_einheiten']; ?>
"></td>
			</tr>
		<?php endforeach; endif; unset($_from); ?></table>
		</td></tr>
		<tr>
		<td colspan="2"><b>Outras Op&ccedil;oes:</b> <input type="checkbox" name="barbar" id="aX_barbar" value="yes" onChange="barbarendorf()"/>
		  <label for="aX_barbar">Aldeia sem tropa </label></td>
		</tr>
			<tr>
				<td colspan="2"><input type="hidden" name="welche_akt" value="Erstellen" /><input type="submit" name="submit" value="Criar" onload="this.disabled=false;"> O Processo <u>pode</u> levar alguns segundos!</td>
			</tr>

		</table>
	</form>
	<script type="text/javascript" src="templates/fluela_special.js"></script>
<?php endif; ?>
<?php elseif ($this->_tpl_vars['edit_output'] != ""): ?>
<?php echo $this->_tpl_vars['edit_output']; ?>

<?php elseif ($this->_tpl_vars['aktion'] == 'edit'): ?>
<form method="POST" action="index.php?screen=fluela_special&action=creater" onSubmit="this.submit.disabled=true;">
		<table class="vis">
			<tr>
				<th colspan="2">Aldeia ID #<?php echo $this->_tpl_vars['id']; ?>
 de barbaros</th>
			</tr>
			<tr>
				<td colspan="2"><b>ID:</b> #<?php echo $this->_tpl_vars['id']; ?>
<br /><b>Coordenadas:</b> <?php echo $this->_tpl_vars['xy']; ?>
<br /><b>Pontos:</b> <?php echo $this->_tpl_vars['points']; ?>
</td>
			</tr>
						<tr><td>
			<table class="vis">
				<tr>
				<td>
				<table class="vis">
					<tr>
					<th>Construção</th><th>Nivel</th>
					</tr>
					<?php $_from = $this->_tpl_vars['buildings']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['dbname'] => $this->_tpl_vars['arr']):
?>
						<tr>
							<td><img src="../graphic/buildings/<?php echo $this->_tpl_vars['dbname']; ?>
.png"> <?php echo $this->_tpl_vars['arr']['name']; ?>
:</td>
							<td><input type="text" size="4" name="<?php echo $this->_tpl_vars['dbname']; ?>
" value="<?php echo $this->_tpl_vars['arr']['std_lvl']; ?>
"></td>
						</tr>
					<?php endforeach; endif; unset($_from); ?>
				</table>
			</table>
			</td><td valign="top"><table class="vis" valign="top">
		<tr>
		<th>Tropas</th><th>Qtde</th>
		</tr>
		<?php $_from = $this->_tpl_vars['units']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['dbname'] => $this->_tpl_vars['arr']):
?>
			<tr>
				<td><img src="../graphic/unit/<?php echo $this->_tpl_vars['dbname']; ?>
.png"> <?php echo $this->_tpl_vars['arr']['name']; ?>
:</td>
				<td><input type="text" size="5" name="<?php echo $this->_tpl_vars['dbname']; ?>
" value="<?php echo $this->_tpl_vars['arr']['std_einheiten']; ?>
"></td>
			</tr>
		<?php endforeach; endif; unset($_from); ?></table>
		</td></tr>
		<tr>
		<td colspan="2"><b>Outras opçoes:</b> <input type="checkbox" name="barbar" id="aX_barbar" value="yes" onChange="barbarendorf()"/><label for="aX_barbar">Aldeias Vazias</label></td>
		</tr>
			<tr>
				<td colspan="2"><input type="hidden" name="vid" value="<?php echo $this->_tpl_vars['id']; ?>
" /><input type="hidden" name="welche_akt" value="Editar" /><input type="submit" name="submit" value="Editar" onload="this.disabled=false;"></td>
			</tr>

		</table>
</form>
	<script type="text/javascript" src="templates/fluela_special.js"></script>
	<script type="text/javascript"><?php echo $this->_tpl_vars['dowhattodo']; ?>
</script>
<?php endif; ?>
<?php endif; ?>