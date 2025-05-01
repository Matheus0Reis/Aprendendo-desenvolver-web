<?php /* Smarty version 2.6.26, created on 2014-07-03 09:12:42
         compiled from game_settings_vacation.tpl */ ?>
<h3>substituicao de ferias</h3>
<p>Aqui voce pode pedir a alguem para gerenciar sua conta enquanto estiver de ferias. Este jogador pode entao fazer login na sua conta. O representante de ferias podera contratar outra pessoa como representante de ferias apos 48 horas. Voce nao pode acessar sua conta enquanto o modo ferias estiver ativo. No entanto, voce pode encerrar a substituicao de ferias a qualquer momento.</p>

<p>Nenhuma atividade ludica podera ocorrer entre a conta de ferias e a conta de substituicao de ferias ate 24 horas apos o termino da substituicao de ferias. Em particular, sao:</p>
<ul>
<li>Entregas de materia-prima</li>
<li>Pilhagem mutua</li>

<li>Ataques coordenados de ambas as contas</li>
<li>Envie tropas de apoio</li>
</ul>
<?php if (empty ( $this->_tpl_vars['user']['vacation_name'] )): ?>
	<form action="game.php?village=<?php echo $this->_tpl_vars['village']['id']; ?>
&amp;screen=settings&amp;mode=vacation&amp;action=sitter_offer&amp;h=<?php echo $this->_tpl_vars['hkey']; ?>
" method="post">
		<table class="vis">
		<tr>
			<th>Representante</th>
			<td><input name="sitter" type="text" /> <input type="submit" value="OK" /></td>
	
		</tr>
	    </table>
	</form>
<?php else: ?>
	<?php if ($this->_tpl_vars['sid']->is_vacation()): ?>
		<p>
		<a href="javascript:ask('Urlaubsvertretung wirklich beenden? Du hast dann sofort keinen Zugriff mehr auf diesen Account', 'game.php?village=<?php echo $this->_tpl_vars['village']['id']; ?>
&amp;screen=settings&amp;mode=vacation&amp;action=end_vacation&amp;h=<?php echo $this->_tpl_vars['hkey']; ?>
')">Fim da cobertura de ferias</a>
		</p>
	<?php else: ?>
		<table class="vis">
		<tr>
			<td>Solicitar para:</td>
			<td><a href="game.php?village=<?php echo $this->_tpl_vars['village']['id']; ?>
&amp;screen=info_player&amp;id=<?php echo $this->_tpl_vars['user']['vacation_id']; ?>
"><?php echo $this->_tpl_vars['user']['vacation_name']; ?>
</a></td>
			<td><a href="game.php?village=<?php echo $this->_tpl_vars['village']['id']; ?>
&amp;screen=settings&amp;mode=vacation&amp;action=sitter_offer_cancel&amp;h=<?php echo $this->_tpl_vars['hkey']; ?>
">&raquo; Solicitacao de retirada</a></td>
		</tr>
		</table>
	<?php endif; ?>
<?php endif; ?>

<?php if (count ( $this->_tpl_vars['vacation_accept'] ) > 0 && ! $this->_tpl_vars['sid']->is_vacation()): ?>
	<h3>Próprios substitutos de férias</h3>
	<p>Os jogadores para os quais você está atuando como substituto de férias são exibidos aqui:</p>
	<table class="vis">
	<tr><th width="200">Jogador</th></tr>
	<?php $_from = $this->_tpl_vars['vacation_accept']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['id'] => $this->_tpl_vars['arr']):
?>
		<tr><td><a href="game.php?village=<?php echo $this->_tpl_vars['village']['id']; ?>
&amp;screen=info_player&amp;id=<?php echo $this->_tpl_vars['id']; ?>
"><?php echo $this->_tpl_vars['arr']['username']; ?>
</a></td>
		<td><a href="login_uv.php?id=<?php echo $this->_tpl_vars['id']; ?>
" target="_blank">&raquo; Conecte-se</a></td>	</tr>
	<?php endforeach; endif; unset($_from); ?>
	</table>
<?php endif; ?>

<?php if (count ( $this->_tpl_vars['vacation'] ) > 0 && ! $this->_tpl_vars['sid']->is_vacation()): ?>
	<h3>Solicitacoes de</h3>
	<p>Os jogadores que lhe pediram substituição de férias são exibidos aqui.</p>
	<table class="vis">
	<tr><th>Jogador</th><th colspan="2">Acao</th></tr>
	<?php $_from = $this->_tpl_vars['vacation']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['id'] => $this->_tpl_vars['arr']):
?>
		<tr>
		<td width="200"><a href="game.php?village=<?php echo $this->_tpl_vars['village']['id']; ?>
&amp;screen=info_player&amp;id=<?php echo $this->_tpl_vars['id']; ?>
"><?php echo $this->_tpl_vars['arr']['username']; ?>
</a></td>
		<td width="100"><a href="game.php?village=<?php echo $this->_tpl_vars['village']['id']; ?>
&amp;screen=settings&amp;mode=vacation&amp;action=sitter_accept&amp;player_id=<?php echo $this->_tpl_vars['id']; ?>
&amp;h=<?php echo $this->_tpl_vars['hkey']; ?>
">Aceitar</a></td>
		<td width="100"><a href="javascript:ask('Urlaubsvertretungs wirklich ablehnen?', 'game.php?village=<?php echo $this->_tpl_vars['village']['id']; ?>
&amp;screen=settings&amp;mode=vacation&amp;action=sitter_reject&amp;player_id=<?php echo $this->_tpl_vars['id']; ?>
&amp;h=<?php echo $this->_tpl_vars['hkey']; ?>
')">Recusar</a></td>
		</tr>
	<?php endforeach; endif; unset($_from); ?>
<?php endif; ?>