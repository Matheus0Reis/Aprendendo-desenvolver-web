<?php /* Smarty version 2.6.26, created on 2014-07-01 17:44:02
         compiled from game_ranking_ally.tpl */ ?>
<?php require_once(SMARTY_CORE_DIR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('modifier', 'format_number', 'game_ranking_ally.tpl', 12, false),)), $this); ?>
<table class="vis">
<tr>
	<th width="60">Rank</th><th width="60">Tribo</th><th width="140">Total de Pontos Melhores Jogadores</th><th width="60">Total de Pontos</th><th width="100">Membros</th><th width="100">Pontos Medio dos Jogadores</th><th width="60">Aldeias</th><th width="100">Pontos Medio das Aldeias</th>
</tr>
	<?php $_from = $this->_tpl_vars['ranks']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['id'] => $this->_tpl_vars['item']):
?>
		<tr <?php echo $this->_tpl_vars['ranks'][$this->_tpl_vars['id']]['mark']; ?>
>
			<td><?php echo $this->_tpl_vars['ranks'][$this->_tpl_vars['id']]['rank']; ?>
</td>
			<td><a href="game.php?village=<?php echo $this->_tpl_vars['village']['id']; ?>
&screen=info_ally&id=<?php echo $this->_tpl_vars['id']; ?>
"><?php echo $this->_tpl_vars['ranks'][$this->_tpl_vars['id']]['short']; ?>
</a></td>
			<td><?php echo $this->_tpl_vars['ranks'][$this->_tpl_vars['id']]['best_points']; ?>
</td>
			<td><?php echo $this->_tpl_vars['ranks'][$this->_tpl_vars['id']]['points']; ?>
</td>
			<td><?php echo $this->_tpl_vars['ranks'][$this->_tpl_vars['id']]['members']; ?>
</td>
			<td><?php echo ((is_array($_tmp=$this->_tpl_vars['ranks'][$this->_tpl_vars['id']]['cuttrought_members'])) ? $this->_run_mod_handler('format_number', true, $_tmp) : format_number($_tmp)); ?>
</td>
			<td><?php echo $this->_tpl_vars['ranks'][$this->_tpl_vars['id']]['villages']; ?>
</td>
			<td><?php echo ((is_array($_tmp=$this->_tpl_vars['ranks'][$this->_tpl_vars['id']]['cuttrought_villages'])) ? $this->_run_mod_handler('format_number', true, $_tmp) : format_number($_tmp)); ?>
</td>
		</tr>
	<?php endforeach; endif; unset($_from); ?>
</table>

<table class="vis" width="100%"><tr>
<?php if ($this->_tpl_vars['site'] != 1): ?>
	<td align="center">
	<a href="game.php?village=<?php echo $this->_tpl_vars['village']['id']; ?>
&amp;screen=ranking&amp;mode=ally&amp;site=<?php echo $this->_tpl_vars['site']-1; ?>
">&lt;&lt;&lt; Voltar</a></td>
<?php endif; ?>
<td align="center">
<a href="game.php?village=<?php echo $this->_tpl_vars['village']['id']; ?>
&amp;screen=ranking&amp;mode=ally&amp;site=<?php echo $this->_tpl_vars['site']+1; ?>
">Proximo &gt;&gt;&gt;</a></td>
</tr></table>