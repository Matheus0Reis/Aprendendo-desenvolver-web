<?php /* Smarty version 2.6.26, created on 2014-07-01 18:23:08
         compiled from game_settings_profile.tpl */ ?>
<form action="game.php?village=<?php echo $this->_tpl_vars['village']['id']; ?>
&amp;screen=settings&amp;action=change_profile&amp;h=<?php echo $this->_tpl_vars['hkey']; ?>
" enctype="multipart/form-data" method="post">
	<table class="vis">
		<tr>
			<th colspan="2">
				Caracteristicas
			</th>
		</tr>
        <tr>
			<td>
				Data de Nascimento:
			</td>
			<td>
				<input name="day" type="text" size="2" maxlength="2" value="<?php echo $this->_tpl_vars['profile']['b_day']; ?>
" />
                    <select name="month">
						<option label="Janeiro" value="1" <?php if ($this->_tpl_vars['profile']['b_month'] == 1): ?>selected<?php endif; ?>>Janeiro</option>
						<option label="Fevereiro" value="2" <?php if ($this->_tpl_vars['profile']['b_month'] == 2): ?>selected<?php endif; ?>>Fevereiro</option>
						<option label="Marco" value="3" <?php if ($this->_tpl_vars['profile']['b_month'] == 3): ?>selected<?php endif; ?>>Marco</option>
						<option label="Abril" value="4" <?php if ($this->_tpl_vars['profile']['b_month'] == 4): ?>selected<?php endif; ?>>Abril</option>
						<option label="Maio" value="5" <?php if ($this->_tpl_vars['profile']['b_month'] == 5): ?>selected<?php endif; ?>>Maio</option>
						<option label="Junho" value="6" <?php if ($this->_tpl_vars['profile']['b_month'] == 6): ?>selected<?php endif; ?>>Junho</option>
						<option label="Julho" value="7" <?php if ($this->_tpl_vars['profile']['b_month'] == 7): ?>selected<?php endif; ?>>Julho</option>
						<option label="Agosto" value="8" <?php if ($this->_tpl_vars['profile']['b_month'] == 8): ?>selected<?php endif; ?>>Agosto</option>
						<option label="Setembro" value="9" <?php if ($this->_tpl_vars['profile']['b_month'] == 9): ?>selected<?php endif; ?>>Setembro</option>
						<option label="Outrubro" value="10" <?php if ($this->_tpl_vars['profile']['b_month'] == 10): ?>selected<?php endif; ?>>Outrubro</option>
						<option label="Novembro" value="11" <?php if ($this->_tpl_vars['profile']['b_month'] == 11): ?>selected<?php endif; ?>>Novembro</option>
						<option label="Dezembro" value="12" <?php if ($this->_tpl_vars['profile']['b_month'] == 12): ?>selected<?php endif; ?>>Dezembro</option>
					</select>
				<input name="year" type="text" size="4" maxlength="4" value="<?php echo $this->_tpl_vars['profile']['b_year']; ?>
" />
			</td>
		</tr>
        <tr>
			<td>
				Genero:
			</td>
			<td>
			    <label>
					<input type="radio" name="sex" value="f" <?php if ($this->_tpl_vars['profile']['sex'] == 'f'): ?>checked="checked"<?php endif; ?> />
						Feminino
				</label>
				<label>
					<input type="radio" name="sex" value="m" <?php if ($this->_tpl_vars['profile']['sex'] == 'm'): ?>checked="checked"<?php endif; ?> />
						Masculino
				</label>
				<label>
					<input type="radio" name="sex" value="x" <?php if ($this->_tpl_vars['profile']['sex'] == 'x'): ?>checked="checked"<?php endif; ?> />
						Outros
				</label>
			</td>
		</tr>
		<tr>
			<td>
				Telefone com DDD:
			</td>
			<td>
				<input name="home" type="text" size="24" maxlength="32" value="<?php echo $this->_tpl_vars['profile']['home']; ?>
" />
			</td>
		</tr>
		<tr>
			<td>
				Brasao pessoal:
			</td>
			<td>
			    <?php if (! empty ( $this->_tpl_vars['user']['image'] )): ?>
					<img src="graphic/player/<?php echo $this->_tpl_vars['user']['image']; ?>
" alt="Wappen" />
					<br />
					<input name="del_image" type="checkbox" />
					Excluir brasao
					<br />
				<?php endif; ?>
	           	<input name="image" type="file" size="40" accept="image/*" maxlength="1048576" />
				<br />
				<span style="font-size: xx-small">max. 240x180, max. 120kByte, (jpg, jpeg, png, gif)</span>
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="submit" value="OK" />
			</td>
		</tr>
	</table>
	<br />
</form>

<form action="game.php?village=<?php echo $this->_tpl_vars['village']['id']; ?>
&amp;screen=settings&amp;action=change_text&amp;h=<?php echo $this->_tpl_vars['hkey']; ?>
" method="post">
	<table class="vis">
		<tr>
			<th colspan="2">
				Texto Pessoal:
			</th>
		</tr>
		<tr>
			<td colspan="2">
				<textarea name="personal_text" cols="50" rows="10"><?php echo $this->_tpl_vars['profile']['personal_text']; ?>
</textarea>
			</td>
		</tr>
		<tr>
			<td>
				<input type="submit" name="send" value="OK" />
			</td>
			<td align="right">

			</td>
		</tr>
	</table>
</form>