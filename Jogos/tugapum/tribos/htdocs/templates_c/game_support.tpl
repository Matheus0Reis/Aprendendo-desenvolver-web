<table width="100%" border="0">
  <tr>
    <td>{literal}
  <style type="text/css">
 #bb_color_picker { position:absolute;z-index:100;border:2px solid #804000; background-color:#efe6c9; top:0px; left:0px;} #bb_color_picker_tones {padding:4px; border-bottom:2px solid #804000; height:86px;} #bb_color_picker_colors {padding:4px; border-bottom:2px solid #804000; height:18px; white-space:nowrap;} #bb_color_picker_colors div { float:left; border-top:1px solid black; border-left:1px solid black; width:16px; height:16px; cursor:pointer} #bb_color_picker_tones div { float:left; border-top:1px solid black; border-left:1px solid black; width:16px; height:16px; cursor:pointer} #bb_color_picker_50,#bb_color_picker_51,#bb_color_picker_52,#bb_color_picker_53,#bb_color_picker_54,#bb_color_picker_55 {border-bottom:1px solid black;} #bb_color_picker_55,#bb_color_picker_45,#bb_color_picker_35,#bb_color_picker_25,#bb_color_picker_15,#bb_color_picker_05 {border-right:1px solid black;} #bb_color_picker_c0,#bb_color_picker_c1,#bb_color_picker_c2,#bb_color_picker_c3,#bb_color_picker_c4,#bb_color_picker_c5 {border-bottom:1px solid black;} #bb_color_picker_c5 {border-right:1px solid black;} #bb_color_picker_preview {margin:2px;border:1px solid black; height:16px; width:104px;background:#f7eed3;text-align:center} #bb_color_picker_tx {width:64px} #bb_color_picker_ok {}
 
  #bb_sizes { position:absolute;z-index:100; border: 2px solid #804000; background-color:#efe6c9; top: 0px; left: 0px;} #bb_sizes td { padding:2px; }
    <script type="text/javascript" src="http://br35.tribalwars.com.br/merged/game.js"></script> 
  </style>
  {/literal}
  <h1 align="center">Suporte</h1>

<table class="vis" border="0">
  <tr>
    <td><a href="game.php?village={$village.id}&amp;screen=support&amp;mode=tickets">Tickets</a></td>
  </tr>
</table>


{php}
$vill = ($this->_tpl_vars['village']['id']); 
$nome = $this->_tpl_vars['user']['id'];
$nomes = $this->_tpl_vars['user']['username'];

 if ($_GET['mode'] == "new") { {/php}

{php}
$ass = ($_POST['ass']);
$txt = ($_POST['text']);
$tipo = ($_POST['tipo']);
$code = ($_POST['palavra']);
$data = date("d/m/Y - h:i:s");
if ($_GET['action'] == "send") 
{
    
   session_start();
   if ($code == $_SESSION["palavra"])
   {
   }else{ $error = "O C&oacute;digo de segurança est&aacute; incorreto";}
   if (strlen($ass) <= 3)
   {
   $error = "O assunto n&atilde;o deve ter menos de 3 car&aacute;cteres!";
   }
   elseif (strlen($txt) <= 3)
   {
   $error = "O texto n&atilde;o deve ter menos de 3 car&aacute;cteres!";
   }
   
if (!$error)
   {
   $sql = "INSERT INTO `suporte` (`id`, `jog`, `ass`, `txt`, `data`, `tipo`, `username`, `newadm`) VALUES (NULL,'".$nome."', '".$ass."', '".$txt."', '".$data."', '".$tipo."', '".$nomes."', '1');";
   mysql_query($sql) or die (mysql_error());
   
   header("Location: game.php?village=$vill&screen=support&mode=tickets");
   
   } 
   
echo "<strong>$error</strong>";
   
}

{/php}
<form name="header" action="game.php?village={$village.id}&screen=support&mode=new&action=send" method="post">
 <table class="vis" width="100%">
   <tr>
   <th colspan="2"><div align="center"><strong>Novo ticket </strong></div></th>
  </tr>
  <tr>
   <td><strong>Assunto:</strong></td>
   <td><input type="text" name="ass" size="50" /></td>
  </tr>
  <tr>
   <td><strong>Tipo: </strong></td>
   <td><select name="tipo">
   <option value="1">Outros</option>
   <option value="2" selected="selected">Bugs e Erros</option>
   <option value="3">Infra&ccedil;&atilde;o de Regras</option>
   <option value="4">Premium</option>
   </select></td>
  </tr>
<tr class="bbcodes" style="">
				<td colspan="2"><div id="bb_bar" style="text-align:left; overflow:visible; ">
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
																											
																			<a id="bb_button_image" title="Imagem" href="#" onclick="BBCodes.insert('[img]', '[/img]');return false;">
													<span style="display:inline-block; zoom:1; *display:inline; background:url(graphic/bbcodes/bbcodes.png?1) no-repeat -180px 0px; padding-left: 0px; padding-bottom:0px; margin-right: 2px; margin-bottom:3px; width: 20px; height: 20px">&nbsp;</span>
												</a>
									

				<table id="bb_sizes" style="clear: both; white-space: nowrap; top: 257px; left: 411px; display: none; ">
					<tbody><tr>
						<td>
						<a href="#" onclick="BBCodes.insert('[size=6]', '[/size]');$('#bb_sizes').slideToggle(); return false;">&raquo; Muito pequeno</a><br />
							<a href="#" onclick="BBCodes.insert('[size=7]', '[/size]');$('#bb_sizes').slideToggle(); return false;">&raquo; Pequeno</a><br />
							<a href="#" onclick="BBCodes.insert('[size=9]', '[/size]');$('#bb_sizes').slideToggle(); return false;">&raquo; Normal</a><br />
							<a href="#" onclick="BBCodes.insert('[size=12]', '[/size]');$('#bb_sizes').slideToggle(); return false;">&raquo; Grande</a><br />
							<a href="#" onclick="BBCodes.insert('[size=20]', '[/size]');$('#bb_sizes').slideToggle(); return false;">&raquo; Muito Grande</a><br />
						</td>
					</tr>
				</tbody></table>

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

					{literal}
					<script type="text/javascript"> 
					$(document).ready(function(){
						BBCodes.init({target : '#message'});
					});
				</script> 
				{/literal}			
				
				

				</div></td>
	</tr>
  <tr>
   <td colspan="3"><textarea  id="message" name="text" cols="70" rows="20"></textarea></td>
  </tr>
  <tr>
   <td><strong>Voc&ecirc; &eacute; humano? </strong></td>
    <td><input name="palavra" type="text" value="" size="25"/>
    <br />
	<br />
	<img alt="verification image" src="captcha.php?l=200&a=50&tf=20&ql=8"/></td>
  </tr>
  <tr>
   <td><input type="submit" name="send" value="Enviar"> </td>
   <td align="right"><a onclick="javascript:popup_scroll('help.php?mode=bb', 700, 400); return false;" href="help.php?mode=bb" target="_blank"></a></td>
  </tr>
 </table>
</form>
{php} } if ($_GET['mode'] == "tickets") { {/php}
<table width="100%" border="0" class="vis">
  <tr>
    <th colspan="4"><div align="center"><strong>Os seus tickets </strong></div></th>
  </tr>
  <tr>
    <th><div align="center">Assunto</div></th>
    <th><div align="center">Data</div></th>
    <th><div align="center">Jogador</div></th>
    <th><div align="center">Situa&ccedil;&atilde;o</div></th>
  </tr>
  {php}
  $recados = mysql_query ("SELECT * FROM suporte WHERE jog = '$nome' ORDER BY id DESC") OR die (mysql_error());  
 
$pagina = $_GET['pagina']; 
 
$lpp = 10;
 
$total = mysql_num_rows ($recados); 
 
$paginas = ceil($total / $lpp); 
 
if(!isset($pagina)) { $pagina = 0; }
 
$inicio = $pagina * $lpp; 
 
$sql = mysql_query("SELECT * FROM suporte WHERE jog = '$nome' ORDER BY id DESC LIMIT $inicio,$lpp") OR die (mysql_error()); 
 
while($exe = mysql_fetch_array($sql))
 
{ 
  {/php}
  <tr>
    <td>{php}
	   if ($exe["new"] == "0")
   {
   if ($exe["situ"] == "0")
   {
   echo "<img src=\"graphic/forum/thread_read.png\"  alt=\"Lido\" /> ";
   }
   if ($exe["situ"] == "1")
   {
   echo "<img src=\"graphic/forum/thread_closed.png\"  alt=\"lido\" /> ";
   }
   }
   if ($exe["new"] == "1")
   {
   if ($exe["situ"] == "0")
   {
   echo "<img src=\"graphic/forum/thread_unread.png\"  alt=\"Novo\" /> ";
   }
   if ($exe["situ"] == "1")
   {
   echo "<img src=\"graphic/forum/thread_close.png\"  alt=\"Novo\" /> ";
   }
   }
	{/php}<a href="game.php?village={php}echo $vill;{/php}&screen=support&ticket={php} echo "$exe[id]"; {/php}">{php} echo "$exe[ass]"; {/php}</a></td>
    <td><div align="center">{php}$datas = explode('-',$exe[data]); echo "$datas[0]"; {/php}</div></td>
    <td><div align="center"><a href="game.php?village={$village.id}&amp;screen=info_player&amp;id={php} echo "$exe[jog]"; {/php}">{php} echo "$exe[username]"; {/php}</a></div></td>
    <td><div align="center">{php}   if ($exe[situ] == 0 ){ {/php}
	     <img src="graphic/suporte/veri.png" alt="Em verificacao" title="Em verificacao">
	    {php} } if ($exe[situ] == 1 ){ {/php}
		 <img src="graphic/suporte/reso.png" alt="Resolvido" title="Resolvido"> 
		{php} } if ($exe[situ] == 2 ){ {/php}
		 <img src="graphic/suporte/closed.png" alt="Fechado" title="Fechado">
		{php} } {/php}</div></td>
  </tr>
 
  {php} }
  

 
 
echo "<div align=\"center\" class=\"bg_td\"><span class=\"txt_m\"><strong>";

 

 
 
 
if($pagina > 0) 
 
{
 
 
 
$menos = $pagina - 1;
 
$url = "game.php?village=$vill&screen=support&mode=tickets&pagina=$menos";
 
echo "<a href=$url>Anterior</a>";
 
}
 
 
 
for ($i=1; $i<$paginas;$i++) 
 
{
 
$url = "game.php?village=$vill&screen=support&mode=tickets&pagina=$i";
 
if ($total<=$lpp){
 
echo "";
 
}
 
else
 
{
 
echo " | <a href=$url>$i</a>";
 
}
 
}
 
 
 
 
 
if($pagina < ($paginas - 1)) 
 
{
 
  $mais = $pagina + 1;
 
  $url = "game.php?village=$vill&screen=support&mode=tickets&pagina=$mais";
 
  echo "  | <a href=$url>Pr&oacute;xima </a>";
 
}
 echo "</strong></span></div>";
 
 }
 {/php}
</table>
<br />
{php}
$sup = mysql_query("SELECT * FROM suporte WHERE jog = '$nome'");
while($view = mysql_fetch_array($sup)) {

  if ($_GET['ticket'] == "$view[id]") { {/php}
  {php}
mysql_query("UPDATE suporte SET new = '0' WHERE `id` = '$view[id]'") or die (mysql_error());
{/php}
 
 <table width="100%" border="0" class="vis">
 <tr>
    <th colspan="2"><div align="center"><strong>{php} echo "$view[ass]"; {/php}</strong></div></th>
  </tr>
  <tr>
    <td width="22%"><strong>Tipo:</strong></td>
    <td width="78%">{php}   if ($view[tipo] <= 1 ){ {/php}
	    <strong>Outros</strong>
	    {php} } if ($view[tipo] == 2 ){ {/php}
		 <strong>Bugs e erros</strong>
		{php} } if ($view[tipo] == 3 ){ {/php}
		<strong>Infra&ccedil;&atilde;o de regras </strong>
		{php} } if ($view[tipo] == 4 ){ {/php}
		<strong>Premium</strong>
		{php} } if ($view[tipo] > 5 ){ {/php}
		<strong>Outros</strong>
		{php} } {/php}</td>
  </tr>
  <tr>
    <td><strong>Data:</strong></td>
    <td><strong>{php}$datas = explode('-',$view[data]); echo "$datas[0]"; {/php}</strong></td>
  </tr>
  <tr>
    <td><strong>Situa&ccedil;&atilde;o:</strong></td>
    <td>{php}   if ($view[situ] == 0 ){ {/php}
	     <img src="graphic/suporte/veri.png" alt="Em verificacao" title="Em verificacao"> Em verificacao!
	    {php} } if ($view[situ] == 1 ){ {/php}
		 <img src="graphic/suporte/reso.png" alt="Resolvido" title="Resolvido"> Resolvido!
		{php} } if ($view[situ] == 2 ){ {/php}
		 <img src="graphic/suporte/closed.png" alt="Fechado" title="Fechado"> Fechado!
		{php} } {/php}</td>
  </tr>
</table>
<br />
<br />
<div class="post"> 
				<div class="igmline"> 
					<span  class="author">{php}if ($view["jog"] == "-1"){}
					elseif ($view["jog"] >= "1") {{/php}<a href="game.php?village={$village.id}&amp;screen=info_player&amp;id={php} echo "$view[jog]"; {/php}">{php}}{/php}{php} echo "$view[username]"; {/php}</a></span> 
					 <span class="right date">{php} echo "$view[data]"; {/php}</span>				</div> 
				<div class="text">{php} echo nl2br(bb_format($view['txt'])); {/php} 
</div> 
</div>
{php}
$respostas = mysql_query("SELECT * FROM suporte_post_re WHERE `postid` = '$view[id]' ORDER BY id ASC");
while($exibir = mysql_fetch_array($respostas)){
$text_d = $exibir[jogador];
  $text_d = str_replace("+"," ",$text_d);
{/php}
<div class="post"> 
				<div class="igmline"> 
					<span  class="author">{php}if ($exibir["jogid"] == "-1"){}
					elseif ($exibir["jogid"] >= "1") {{/php}<a href="game.php?village={$village.id}&amp;screen=info_player&amp;id={php} echo "$exibir[jogid]"; {/php}">{php}}{/php}{php} echo "$text_d"; {/php}</a></span> 
					 <span class="right date">{php} echo "$exibir[time]"; {/php}</span>				</div> 
				<div class="text">{php} echo nl2br(bb_format($exibir['text'])); {/php} 
</div> 
</div>
{php}}{/php}
<br />
<br />
{php} if ($view["situ"] == "0") { {/php}


 {php}
 $msgs = ($_POST['text']);
 $code = ($_POST['palavra']);
 $data = date("d/m/Y - h:i:s");



if ($_GET['action'] == 'postar')
    {
	session_start();
   if ($code == $_SESSION["palavra"])
   {
   }else{ $error = "C&oacute;digo de segurança incorreto";}
	if (strlen($_POST[text]) < 6)
    {
     $error = "A mensagem deve ter no m&iacute;nimo 6 car&aacute;cteres!";
    }
	
if (!$error)
    {	
	
$resposta = "INSERT INTO suporte_post_re (`jogador`,`jogid`,`text`,`time`,`postid`) VALUES ('".$nomes."','".$nome."','".$msgs."','".$data."','".$view[id]."')";
mysql_query($resposta) or die (mysql_error());
  header ("Location: game.php?village=$vill&screen=support&ticket=$view[id]");
	}
		
}
echo "<strong>$error</strong>";
 {/php}
<table class="vis" width="100%" border="0">
	<tr id="answer_row1"> 
	<form method="post" action="game.php?village={php}echo $vill;{/php}&screen=support&ticket={php} echo "$view[id]"; {/php}&action=postar">
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
																										
																			<a id="bb_button_image" title="Imagem" href="#" onclick="BBCodes.insert('[img]', '[/img]');return false;">
													<span style="display:inline-block; zoom:1; *display:inline; background:url(graphic/bbcodes/bbcodes.png?1) no-repeat -180px 0px; padding-left: 0px; padding-bottom:0px; margin-right: 2px; margin-bottom:3px; width: 20px; height: 20px">&nbsp;</span>
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
 
				
				{literal}<script type="text/javascript"> 
					$(document).ready(function(){
						BBCodes.init({target : '#message'});
					});
				</script> {/literal}				</div>  
			<div style="clear: both;"> 
				<textarea id="message" name="text" cols="55" rows="5"></textarea> 
			</div>
			<a href="javascript:resizeIGMField('bigger');">&raquo; Aumentar o tamanho do campo</a><br />
			<a href="javascript:resizeIGMField('smaller');">&raquo; Diminuir o tamanho do campo</a></td>
	
	<tr id="answer_row2"> 
				<td> 
                    <input name="palavra" type="text" value="" size="25" style="float:left;"/>
       <div align="right"><img alt="verification image" src="captcha.php?l=125&a=35&tf=16&ql=6"/></div></td> 
		<td> 
		  <div align="right">
		    <input type="submit" name="answer" value="Responder" /> 
		    
		    <script type="text/javascript"> 
		//<![CDATA[
				$('#answer_row1, #answer_row2').css('display', 'none');
				//]]>
		        </script>
          </div></td></tr>
  </form>
</table>

{php} } {/php}

  {php} if ($view["situ"] == "1")
  {
  echo "<div align=\"center\"><strong><i>Este ticket está fechado!</i></strong></div>";
  }
  {/php}

{literal}
  <script type="text/javascript"> 
//<![CDATA[
 
function answer_show() {
	$('#answer_row1').css('display','');
	$('#answer_row2').css('display', '');
	$('#action_row').css('display', 'none');
}
 
//]]>
</script> 
  {/literal}


{php} } } {/php}
<br />
<div align="right"><a href="game.php?village={php}echo $vill;{/php}&screen=support&mode=new"><img src="graphic/suporte/new_ticket.png"  alt="Novo Ticket" /></a></div>
</td>
  </tr>
</table>

