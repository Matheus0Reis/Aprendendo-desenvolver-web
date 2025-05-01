<?php /* Smarty version 2.6.14, created on 2012-02-06 23:09:52
         compiled from index_Support.tpl */ ?>
<?php echo '
<style type="text/css">
<!--
#contentContainer table table table { border-spacing: 2px; border-collapse: separate; } #contentContainer table table table td, #contentContainer table table table th { padding: 2px 3px; }
.content-border td:first-child table td { padding: 0 2px; padding-bottom: 5px; } 
.style2 {color: #820000}

 table.vis { border-collapse:separate;} table.vis td { background: #f4e4bc; } table.vis td.selected { background: #ffe0a2; } table.vis td.selected a { color: #803000; } table.vis td.no_bg { background: transparent; } table.vis td.align_right { text-align:right; } table.vis tr.nowrap td { white-space: nowrap; } table.vis tr.units_home td { background: #f6ebca; } table.vis tr.units_there td { background: #fbf4dd; } table.vis tr.units_away td { background: #f7eed3; } table.vis tr.units_moving td { background: #fbf4dd; } table.vis tr.row_a td, table.vis tbody.row_a td { background: #f0e2be; } table.vis tr.row_b td, table.vis tbody.row_b td { background: #fff5da; } table.vis tr.subheader td { background: #e5d7b2; } table.vis tr.edit_player_colors td{ background: none;} table.vis tr td img {vertical-align: middle;}

 th { font-size: 9pt; text-align: left; font-weight: bold; background-color: #c1a264 !important; background-image: url(/graphic/screen/tableheader_bg3.png); background-repeat: repeat-x; } div.outerBorder {  position: relative; z-index: 0; } div.innerBorder { background: #85550d; position: absolute; left: 1px; right: 1px; top: 1px; bottom: 1px; z-index: 0; } div.innerBG { background: transparent url(/graphic/index/main_bg.jpg) scroll left top repeat; position: absolute; left: 1px; right: 1px; top: 1px; bottom: 1px; z-index: 1; } div.outerBorder table, div.outerBorder form { position: relative; z-index: 2; }
 
 
-->
</style>
'; ?>


<h1><strong>Admin </h1>
<br />
<p>Aqui voc&ecirc; pode ver a lista de todos pedidos de suporte. Clique no assunto de um ticket para visualizar mais detalhes.</p>
<br />
<table class="vis" width="338" class="vis">
	<tr>
		
				<td width="102">
					<a href="index.php?screen=Support&mode=allticket">Todos Tickets</a>				</td>

			
				<td width="102">
					<a href="index.php?screen=Support&mode=newticket">Novos Tickets</a>				</td>
				<td width="118">
					<a href="index.php?screen=Support&mode=blockticket">Tickets Fechados</a>				</td>

  </tr>
</table>
<br />
<?php 
$mode = $_GET['mode'];
$vill = ($this->_tpl_vars['village']['id']);
 ?>



<?php if ($_GET['mode'] == "allticket"){ ?>
<div class="outerBorder"> 
	<div class="innerBorder"><div class="innerBG"> </div></div>
<table class="vis" width="100%" border="0">
  <tr>
    <th colspan="4"><div align="center">Todos Tickets Postados</div></th>
  </tr>
  <tr>
    <th>Assunto</th>
    <th>Jogador</th>
    <th>Data</th>
    <th>Situa&ccedil;&atilde;o</th>
  </tr>
 <?php 
 $tabela = mysql_query("SELECT * FROM suporte ORDER BY id DESC");
while($mostrar = mysql_fetch_array($tabela)){
  echo "<tr>";
    echo " <td>";
   if ($mostrar["newadm"] == "0")
   {
   if ($mostrar["situ"] == "0")
   {
   echo "<img src=\"graphic/forum/thread_read.png\"  alt=\"Lido\" /> ";
   }
   if ($mostrar["situ"] == "1")
   {
   echo "<img src=\"graphic/forum/thread_closed.png\"  alt=\"lido\" /> ";
   }
   }
   if ($mostrar["newadm"] == "1")
   {
   if ($mostrar["situ"] == "0")
   {
   echo "<img src=\"graphic/forum/thread_unread.png\"  alt=\"Novo\" /> ";
   }
   if ($mostrar["situ"] == "1")
   {
   echo "<img src=\"graphic/forum/thread_close.png\"  alt=\"Novo\" /> ";
   }
   }

  echo "<a href=\"index.php?screen=Support&post=$mostrar[id]\">$mostrar[ass]</a>";
   echo "</td>
    ";
$text_f = $mostrar[username];
  $text_f = str_replace("+"," ",$text_f);
  
   echo " <td><a href=\"game.php?village=$vill&amp;screen=info_player&amp;id=$mostrar[jog]\">$text_f</td>";
	
   echo " <td>$mostrar[data]</td>
   ";
  if ($mostrar[situ] == "0")
  {
   echo "<td><img src=\"graphic/user_offline.gif\"  alt=\"Em verificação\" /> Em verifica&ccedil;&atilde;o</td>
   ";
   }
     if ($mostrar[situ] == "1")
  {
   echo "<td width=\"27%\"><img src=\"graphic/user_online.gif\"  alt=\"Em verificação\" /> Fechado(Resolvido)</td>
   ";
   }

   echo "</tr>";

  }
   ?>
</table></div>
<?php  }  ?>



<?php if ($_GET['mode'] == "newticket"){ ?>
<div class="outerBorder"> 
	<div class="innerBorder"><div class="innerBG"> </div></div>
<table class="vis" width="100%" border="0">
  <tr>
    <th colspan="4"><div align="center">Novos Tikets Postados</div></th>
  </tr>
  <tr>
    <th>Assunto</th>
    <th>Jogador</th>
    <th>Data</th>
    <th>Situa&ccedil;&atilde;o</th>
  </tr>
  <?php 
$tabela = mysql_query("SELECT * FROM suporte WHERE `newadm` = '1' ORDER BY id DESC");
while($mostrar = mysql_fetch_array($tabela)){
  echo "<tr>";
    echo " <td>";
   if ($mostrar["newadm"] == "0")
   {
   if ($mostrar["situ"] == "0")
   {
   echo "<img src=\"graphic/forum/thread_read.png\"  alt=\"Lido\" /> ";
   }
   if ($mostrar["situ"] == "1")
   {
   echo "<img src=\"graphic/forum/thread_closed.png\"  alt=\"lido\" /> ";
   }
   }
   if ($mostrar["newadm"] == "1")
   {
   if ($mostrar["situ"] == "0")
   {
   echo "<img src=\"graphic/forum/thread_unread.png\"  alt=\"Novo\" /> ";
   }
   if ($mostrar["situ"] == "1")
   {
   echo "<img src=\"graphic/forum/thread_close.png\"  alt=\"Novo\" /> ";
   }
   }

  echo "<a href=\"index.php?screen=Support&post=$mostrar[id]\">$mostrar[ass]</a>";
   echo "</td>";
$text_f = $mostrar[username];
  $text_f = str_replace("+"," ",$text_f);
  
   echo " <td><a href=\"game.php?village=$vill&amp;screen=info_player&amp;id=$mostrar[jog]\">$text_f</td>";
	
   echo " <td>$mostrar[data]</td>";
  if ($mostrar[situ] == "0")
  {
   echo "<td><img src=\"graphic/user_offline.gif\"  alt=\"Em verificação\" /> Em verifica&ccedil;&atilde;o</td>
   ";
   }
     if ($mostrar[situ] == "1")
  {
   echo "<td width=\"27%\"><img src=\"../graphic/user_online.gif\"  alt=\"Em verificação\" /> Fechado(Resolvido)</td>
   ";
   }

   echo "</tr>";

  }
   ?>
</table></div>

<?php  }  ?>


<?php if ($_GET['mode'] == "blockticket"){ ?>
<div class="outerBorder"> 
	<div class="innerBorder"><div class="innerBG"> </div></div>
<table class="vis" width="100%" border="0">
  <tr>
    <th colspan="4"> <div align="center">Tikets Fechado(Resolvidos) </div></th>
  </tr>
  <tr>
    <th>Assunto</th>
    <th>Jogador</th>
    <th>Data</th>
    <th>Situa&ccedil;&atilde;o</th>
  </tr>
 <?php 
$tabela = mysql_query("SELECT * FROM suporte WHERE `situ` = '1' ORDER BY id DESC");
while($mostrar = mysql_fetch_array($tabela)){
  echo "<tr>";
    echo " <td>";
   if ($mostrar["newadm"] == "0")
   {
   if ($mostrar["situ"] == "0")
   {
   echo "<img src=\"graphic/forum/thread_read.png\"  alt=\"Lido\" /> ";
   }
   if ($mostrar["situ"] == "1")
   {
   echo "<img src=\"graphic/forum/thread_closed.png\"  alt=\"lido\" /> ";
   }
   }
   if ($mostrar["newadm"] == "1")
   {
   if ($mostrar["situ"] == "0")
   {
   echo "<img src=\"graphic/forum/thread_unread.png\"  alt=\"Novo\" /> ";
   }
   if ($mostrar["situ"] == "1")
   {
   echo "<img src=\"graphic/forum/thread_close.png\"  alt=\"Novo\" /> ";
   }
   }

  echo "<a href=\"index.php?screen=Support&post=$mostrar[id]\">$mostrar[ass]</a>";
   echo "</td>";
$text_f = $mostrar[username];
  $text_f = str_replace("+"," ",$text_f);
  
   echo " <td><a href=\"game.php?village=$vill&amp;screen=info_player&amp;id=$mostrar[jog]\">$text_f</td>";
	
   echo " <td>$mostrar[data]</td>";
  if ($mostrar[situ] == "0")
  {
   echo "<td><img src=\"graphic/user_offline.gif\"  alt=\"Em verificação\" /> Em verifica&ccedil;&atilde;o</td>
   ";
   }
     if ($mostrar[situ] == "1")
  {
   echo "<td width=\"27%\"><img src=\"graphic/user_online.gif\"  alt=\"Em verificação\" /> Fechado(Resolvido)</td>
   ";
   }

   echo "</tr>";

  }
   ?>
</table></div>


<?php  }  ?>



<?php 
$userids = $this->_tpl_vars['user']['id'];
$tabela = mysql_query("SELECT * FROM suporte");
while($mostrar = mysql_fetch_array($tabela)){
if ($_GET['post'] == "$mostrar[id]"){ ?>
<?php 
mysql_query("UPDATE suporte SET newadm = '0' WHERE `id` = '$mostrar[id]'") or die (mysql_error());
 ?>
<?php 

$nome = "Equipa Tribos AddictGames";
$horas = date("d/m/Y - h:i:s");


$msgs = ($_POST['text']);
$situ = ($_POST['situ']);




if ($_GET['action'] == 'postar')
    {
	 
	if (strlen($_POST[text]) < 6)
    {
     $error = "A Menssagem deve ter no minimo 6 caracteres!";
    }
	
if (!$error)
    {	
	
$resposta = "INSERT INTO suporte_post_re (`jogador`,`text`,`time`,`postid`) VALUES ('".$nome."','".$msgs."','".$horas."','".$mostrar[id]."')";
mysql_query($resposta) or die (mysql_error());


mysql_query("UPDATE suporte SET situ = '".$_POST['situ']."' WHERE `id` = '$mostrar[id]'") or die (mysql_error());

mysql_query("UPDATE suporte SET new = '1' WHERE `id` = '$mostrar[id]'") or die (mysql_error());

	}
		
}


 ?>
<table class="vis" width="100%" border="0">
  <tr>
  <th colspan="2"><div align="center"><?php  echo "$mostrar[assunto]";  ?></div></td>  </tr>
  <tr>
    <td width="26%">Tipo :</td>
    <td width="57%"><?php  if ($mostrar["tipo"] == "0")
	{
	echo "Bugs E Erros";
	}
	
	if ($mostrar["tipo"] == "1")
	{
	echo "Infra&ccedil;&atilde;o de Regras";
	}
	
	if ($mostrar["tipo"] == "2")
	{
	echo "Conta Premium";
	}
	
	if ($mostrar["tipo"] >= "3")
	{
	echo "Outros";
	}		
	 ?>	</td>
  </tr>
  <tr>
    <td width="26%">Data :</td>
    <td><?php  echo "$mostrar[time]";  ?></td>
  </tr>
  <tr>
    <td width="26%">Situa&ccedil;&atilde;o :</td>
	<?php 
	$text_f = $mostrar[username];
  $text_f = str_replace("+"," ",$text_f);
      if ($mostrar[situ] == "0")
  {
   echo "<td><img src=\"graphic/user_offline.gif\"  alt=\"Em verificação\" /> Em verifica&ccedil;&atilde;o</td>
   ";
   }
     if ($mostrar[situ] == "1")
  {
   echo "<td width=17%><img src=\"graphic/user_online.gif\"  alt=\"Em verificação\" /> Fechado(Resolvido)</td>
   ";
   }
    ?>
  </tr>
</table>
<?php 
$respostas = mysql_query("SELECT * FROM suporte_post_re WHERE `postid` = '$mostrar[id]' ORDER BY id DESC");
while($exibir = mysql_fetch_array($respostas)){
$text_d = $exibir[jogador];
  $text_d = str_replace("+"," ",$text_d);
 ?>
<br />
<div id="reservation_settings" class="post"> 
				<div class="igmline"> 
					<span  class="author"><?php if ($exibir["jogid"] == "-1"){}
					elseif ($exibir["jogid"] >= "1") { ?><a href="game.php?village=<?php echo $this->_tpl_vars['village']['id']; ?>
&amp;screen=info_player&amp;id=<?php  echo "$exibir[jogid]";  ?>"><?php }   echo "$text_d";  ?></a></span> 
					 <span class="right date"><?php  echo "$exibir[time]";  ?></span>				</div> 
				<div class="text"><?php  echo nl2br(bb_format($exibir['text']));  ?> 
</div> 
</div>
<?php } ?>
<br />
<div class="post"> 
				<div class="igmline"> 
					<span  class="author"><?php if ($mostrar["jog"] == "-1"){}
					elseif ($mostrar["jog"] >= "1") { ?><a href="game.php?village=<?php echo $this->_tpl_vars['village']['id']; ?>
&amp;screen=info_player&amp;id=<?php  echo "$mostrar[jog]";  ?>"><?php }   echo "$text_f";  ?></a></span> 
					 <span class="right date"><?php  echo "$mostrar[data]";  ?></span>				</div> 
				<div class="text"><?php  echo nl2br(bb_format($mostrar['txt']));  ?> 
</div> 
</div>
<br />
<table class="vis" width="100%" border="0">
<form method="post" action="index.php?screen=Support&post=<?php  echo "$mostrar[id]"; ?>&action=postar">
 <tr>
 <tr>
<td><strong>Definir:</strong></td>
<td>
  <input name="situ" type="checkbox" value="0" />
  Em Verifica&ccedil;&atilde;o  <br />
  <input name="situ" type="checkbox" value="1" />Resolvido
</td>
</tr>
 <tr>
<td colspan="2"> 
																
				<div id="bb_bar" style="text-align:left; overflow:visible; "> 
		<a id="bb_button_bold" title="Negrito" href="#" onclick="BBCodes.insert('[b]', '[/b]');return false;">
													<span style="display:inline-block; zoom:1; *display:inline; background:url(graphic/bbcodes/bbcodes.png?1) no-repeat 0px 0px; padding-left: 0px; padding-bottom:0px; margin-right: 2px; margin-bottom:3px; width: 20px; height: 20px">&nbsp;</span>
				  </a>
																			<a id="bb_button_italic" title="Itálico" href="#" onclick="BBCodes.insert('[i]', '[/i]');return false;">
													<span style="display:inline-block; zoom:1; *display:inline; background:url(graphic/bbcodes/bbcodes.png?1) no-repeat -20px 0px; padding-left: 0px; padding-bottom:0px; margin-right: 2px; margin-bottom:3px; width: 20px; height: 20px">&nbsp;</span>
												</a>
																			<a id="bb_button_underline" title="Sublinhado" href="#" onclick="BBCodes.insert('[u]', '[/u]');return false;">
													<span style="display:inline-block; zoom:1; *display:inline; background:url(graphic/bbcodes/bbcodes.png?1) no-repeat -40px 0px; padding-left: 0px; padding-bottom:0px; margin-right: 2px; margin-bottom:3px; width: 20px; height: 20px">&nbsp;</span>
												</a>
																			<a id="bb_button_strikethrough" title="Riscado" href="#" onclick="BBCodes.insert('[s]', '[/s]');return false;">
													<span style="display:inline-block; zoom:1; *display:inline; background:url(graphic/bbcodes/bbcodes.png?1) no-repeat -60px 0px; padding-left: 0px; padding-bottom:0px; margin-right: 2px; margin-bottom:3px; width: 20px; height: 20px">&nbsp;</span>
												</a>
																			<a id="bb_button_quote" title="Citar" href="#" onclick="BBCodes.insert('[quote=Author]', '[/quote]');return false;">
													<span style="display:inline-block; zoom:1; *display:inline; background:url(graphic/bbcodes/bbcodes.png?1) no-repeat -140px 0px; padding-left: 0px; padding-bottom:0px; margin-right: 2px; margin-bottom:3px; width: 20px; height: 20px">&nbsp;</span>
												</a>
																			<a id="bb_button_url" title="Endereço" href="#" onclick="BBCodes.insert('[url]', '[/url]');return false;">
													<span style="display:inline-block; zoom:1; *display:inline; background:url(graphic/bbcodes/bbcodes.png?1) no-repeat -160px 0px; padding-left: 0px; padding-bottom:0px; margin-right: 2px; margin-bottom:3px; width: 20px; height: 20px">&nbsp;</span>
												</a>
																												<a id="bb_button_spoiler" title="Spoiler" href="#" onclick="BBCodes.insert('[spoiler]', '[/spoiler]');return false;">
													<span style="display:inline-block; zoom:1; *display:inline; background:url(graphic/bbcodes/bbcodes.png?1) no-repeat -260px 0px; padding-left: 0px; padding-bottom:0px; margin-right: 2px; margin-bottom:3px; width: 20px; height: 20px">&nbsp;</span>
												</a>
																												<a id="bb_button_player" title="Jogador" href="#" onclick="BBCodes.insert('[player]', '[/player]');return false;">
													<span style="display:inline-block; zoom:1; *display:inline; background:url(graphic/bbcodes/bbcodes.png?1) no-repeat -80px 0px; padding-left: 0px; padding-bottom:0px; margin-right: 2px; margin-bottom:3px; width: 20px; height: 20px">&nbsp;</span>
												</a>
																			<a id="bb_button_tribe" title="Tribo" href="#" onclick="BBCodes.insert('[ally]', '[/ally]');return false;">
													<span style="display:inline-block; zoom:1; *display:inline; background:url(graphic/bbcodes/bbcodes.png?1) no-repeat -100px 0px; padding-left: 0px; padding-bottom:0px; margin-right: 2px; margin-bottom:3px; width: 20px; height: 20px">&nbsp;</span>
												</a>
																												<a id="bb_button_coord" title="Coordenada" href="#" onclick="BBCodes.insert('[village]', '[/village]');return false;">
													<span style="display:inline-block; zoom:1; *display:inline; background:url(graphic/bbcodes/bbcodes.png?1) no-repeat -120px 0px; padding-left: 0px; padding-bottom:0px; margin-right: 2px; margin-bottom:3px; width: 20px; height: 20px">&nbsp;</span>
												</a>
																											
																			<a id="bb_button_size" title="Tamanho da fonte" href="#" onclick="$('#bb_sizes').slideToggle(); BBCodes.placePopups(); return false;">
													<span style="display:inline-block; zoom:1; *display:inline; background:url(graphic/bbcodes/bbcodes.png?1) no-repeat -220px 0px; padding-left: 0px; padding-bottom:0px; margin-right: 2px; margin-bottom:3px; width: 20px; height: 20px">&nbsp;</span>
												</a>
																			<a id="bb_button_image" title="Imagem" href="#" onclick="BBCodes.insert('[img]', '[/img]');return false;">
													<span style="display:inline-block; zoom:1; *display:inline; background:url(graphic/bbcodes/bbcodes.png?1) no-repeat -180px 0px; padding-left: 0px; padding-bottom:0px; margin-right: 2px; margin-bottom:3px; width: 20px; height: 20px">&nbsp;</span>
												</a>
																			<a id="bb_button_color" title="Cor" href="#" onclick="BBCodes.colorPickerToggle(); BBCodes.placePopups(); return false">
													<span style="display:inline-block; zoom:1; *display:inline; background:url(graphic/bbcodes/bbcodes.png?1) no-repeat -200px 0px; padding-left: 0px; padding-bottom:0px; margin-right: 2px; margin-bottom:3px; width: 20px; height: 20px">&nbsp;</span>
												</a>
									
 
				<table id="bb_sizes" style="display: none; clear:both; white-space:nowrap;"> 
					<tr> 
						<td> 
							<a href="#" onclick="BBCodes.insert('[size=6]', '[/size]');$('#bb_sizes').slideToggle(); return false;">&raquo; Muito pequeno</a><br /> 
							<a href="#" onclick="BBCodes.insert('[size=7]', '[/size]');$('#bb_sizes').slideToggle(); return false;">&raquo; Pequeno</a><br /> 
							<a href="#" onclick="BBCodes.insert('[size=9]', '[/size]');$('#bb_sizes').slideToggle(); return false;">&raquo; Normal</a><br /> 
							<a href="#" onclick="BBCodes.insert('[size=12]', '[/size]');$('#bb_sizes').slideToggle(); return false;">&raquo; Grande</a><br /> 
							<a href="#" onclick="BBCodes.insert('[size=20]', '[/size]');$('#bb_sizes').slideToggle(); return false;">&raquo; Muito Grande</a><br />						</td> 
					</tr> 
				</table> 
 
				<div id="bb_color_picker" style="display: none; clear:both;"> 
					<div id="bb_color_picker_colors"> 
						<div id="bb_color_picker_c0" style="background:#f00"></div> 
						<div id="bb_color_picker_c1" style="background:#ff0"></div> 
						<div id="bb_color_picker_c2" style="background:#0f0"></div> 
						<div id="bb_color_picker_c3" style="background:#0ff"></div> 
						<div id="bb_color_picker_c4" style="background:#00f"></div> 
						<div id="bb_color_picker_c5" style="background:#f0f"></div> 
						<br /> 
					</div> 
					<div id="bb_color_picker_tones"> 
						<div id="bb_color_picker_10"></div><div id="bb_color_picker_11"></div><div id="bb_color_picker_12"></div><div id="bb_color_picker_13"></div><div id="bb_color_picker_14"></div><div id="bb_color_picker_15"></div><br clear="all" /> 
						<div id="bb_color_picker_20"></div><div id="bb_color_picker_21"></div><div id="bb_color_picker_22"></div><div id="bb_color_picker_23"></div><div id="bb_color_picker_24"></div><div id="bb_color_picker_25"></div><br clear="all" /> 
						<div id="bb_color_picker_30"></div><div id="bb_color_picker_31"></div><div id="bb_color_picker_32"></div><div id="bb_color_picker_33"></div><div id="bb_color_picker_34"></div><div id="bb_color_picker_35"></div><br clear="all" /> 
						<div id="bb_color_picker_40"></div><div id="bb_color_picker_41"></div><div id="bb_color_picker_42"></div><div id="bb_color_picker_43"></div><div id="bb_color_picker_44"></div><div id="bb_color_picker_45"></div><br clear="all" /> 
						<div id="bb_color_picker_50"></div><div id="bb_color_picker_51"></div><div id="bb_color_picker_52"></div><div id="bb_color_picker_53"></div><div id="bb_color_picker_54"></div><div id="bb_color_picker_55"></div><br clear="all" /> 
					</div> 
					<div id="bb_color_picker_preview">Texto</div> 
					<input type="text" id="bb_color_picker_tx" /><input type="button" value="OK" id="bb_color_picker_ok" onclick="BBCodes.colorPickerToggle(true);return false;"/> 
				</div> 
 
				
				<?php echo '<script type="text/javascript"> 
					$(document).ready(function(){
						BBCodes.init({target : \'#message\'});
					});
				</script> '; ?>
				</div>  
 
			<div style="clear: both;"> 
				<textarea id="message" name="text" cols="55" rows="5"></textarea> 
			</div>	</td> 
  </tr> 
	<tr id="answer_row2"> 
				<td> 
			<a href="javascript:resizeIGMField('bigger');">&raquo; Aumentar tamanho do campo</a><br /><a href="javascript:resizeIGMField('smaller');">&raquo; Diminuir tamanho do campo</a>		</td> 
		<td> 
	  <input type="submit" value="Postar Novo Ticket" />	  </td></tr>
  </form>
</table>

  
  <?php echo '
  <script type="text/javascript"> 
//<![CDATA[
 
function answer_show() {
	$(\'#answer_row1\').css(\'display\',\'\');
	$(\'#answer_row2\').css(\'display\', \'\');
	$(\'#action_row\').css(\'display\', \'none\');
}
 
//]]>
</script> 
  '; ?>

  <?php  } } ?>




