<?php /* Smarty version 2.6.14, created on 2012-01-25 01:38:49
         compiled from ../templates/index.tpl */ ?>
<?php echo '<?xml'; ?>
 version="1.0"<?php echo '?>'; ?>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title> Administração</title>
<link rel="stylesheet" type="text/css" href="../stamm.css" />
<link rel="stylesheet" type="text/css" href="../fontes.css" />
<meta http-equiv="content-type" content="text/html; charset=ISO-8859-1">
<script src="../script.js?1159978916" type="text/javascript"></script>
</head>
<body style="margin-top:6px;">

<table cellspacing="0" width="100%"><tr><td width="250" valign="top">

	<table class="main" width="100%"><tr><td>
		<tr>
		<td>
			<table class="menueadmin" width="100%">
				<tr>
				  <th class="fonte6maior">Comandos Padrões</th>
				</tr>
				<tr>
				  <td><a href="index.php?screen=startpage">Principal</a></td>
				</tr>
				 <tr>
				   <td><a href="index.php?screen=fluela_special">Criar Aldeias de Barbaros </a></td>
				 </tr>
				 <tr>
				   <td><a href="index.php?screen=mail">Sistema de Noticias </a></td>
				 </tr>
				 <tr>
				   <td><a href="index.php?screen=start_buildings">Niveis Para Iniciar </a></td>
				 </tr>
				 <tr>
				   <td><a href="index.php?screen=reset">Resetar</a></td>
				 </tr>
				 <tr>
				   <td><a href="index.php?screen=save_round">Salvar Hall da Fama </a></td>
				 </tr>
				 <tr>
				   <td><a href="index.php?screen=extern_login">Acesso Externo </a></td>
				 </tr>
				 <tr><td><a href="index.php?action=logout">Sair do Painel</a></td></tr>
		    </table>
			 <?php if (count ( $this->_tpl_vars['extern_menue'] ) != 0): ?>
			<table class="menueadmin" width="100%">
				<tr>
				  <th class="fonte6maior">Ferramentas Adicionais </th>
				</tr>

				
					<?php $_from = $this->_tpl_vars['extern_menue']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['name'] => $this->_tpl_vars['link']):
?>
					<?php endforeach; endif; unset($_from); ?>
					<tr>
						  <td><a href="index.php?screen=anti_cheat">Banir / Desbanir</a></td>
			  </tr>
						<tr>
						  <td><a href="index.php?screen=bonus">Aldeias Bonus</a> </td>
			  </tr>
						<tr>
						  <td><a href="index.php?screen=config_edit">Editar Configurações</a> </td>
			  </tr>
						<tr>
						  <td><a href="index.php?screen=groups">Grupos</a> </td>
			  </tr>
						<tr>
						  <td><a href="index.php?screen=Support">Sistema de Suporte</a> </td>
			  </tr>
						<tr>
						  <td><a href="index.php?screen=bh_neuberechnen">Debugar Fazenda</a> </td>
			  </tr>
						<tr>
						  <td><a href="index.php?screen=truppen_neuberechnen">Debugar Tropas</a> </td>
			  </tr>
						<tr>
					                    <td><a href="index.php?screen=debugger">Debugar Ataques </a></td>
			  </tr>
						<tr>
						  <td><a href="index.php?screen=recalc">Debugar Classificação</a> </td>
			  </tr>
						<tr>
						  <td><a href="index.php?screen=users">Controlar Contas </a> </td>
			  </tr>
						<tr>
						  <td><a href="index.php?screen=village_editor">Editar Aldeias</a> </td>
			  </tr>
		    </table>
			<?php endif; ?>
		</td></tr></table>
	



</td><td width="*" valign="top">


	<table class="main" width="100%">
	<tr>
	<td style="padding:2px;">
	
	<?php if (in_array ( $this->_tpl_vars['screen'] , $this->_tpl_vars['allow_screens'] )): ?>
		<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "index_".($this->_tpl_vars['screen']).".tpl", 'smarty_include_vars' => array('title' => 'foo')));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
	<?php endif; ?>
	<p align="right" style="font-size: 7pt; margin-top:0px; margin-bottom:0px">Gerado em <?php echo $this->_tpl_vars['load_msec']; ?>
ms
	Hora: <span id="serverTime"><?php echo $this->_tpl_vars['servertime']; ?>
</span></p>
	</td>
	</tr>
	</table>

</td></tr></table>

<script type="text/javascript">startTimer();</script>
</body>
</html>