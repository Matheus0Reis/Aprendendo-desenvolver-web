<head>
<title>TribalSpeeD - O Jogo Da Era Medieval!</title>
</head>
<body bgcolor="#DED3B9" >
<div align="center">
<table class="main" width="800" bgcolor="#F0E8D0" border="2" 

bordercolor="#804000" style="border-collapse: collapse"><tr><td>
<h2><font face="Arial">Sistema de Suporte - TribalSpeeD</font></h2><table width="100%"><tr><td 

valign="top" width="120">
<table class="vis">&nbsp;</table></td><td valign="top" align="left">

<p><font face="Arial" color="#FF0000">{$status}</font></p>
<p><font face="Arial" color="#FF0000">{if $smarty.get.send == "message"}{if 
$sstep == "0"}Danke 

{$nick}, ihre Nachricht wurde gesendent! Der Adminstrator wird dir im Ingame 

eine Antwort schreiben!</font></p>
	<table border="1" width="100%" bgcolor="#FFFFFF" style="border-

collapse: collapse" bordercolor="#000000">
		<tr>
			<td>{$smarty.post.grund}</td>
		</tr>
		<tr>
			<td>{$smarty.post.nick}</td>
		</tr>
		<tr>
			<td>{$smarty.post.message}</td>
		</tr>
	</table>
<p><font color="#FF0000" face="Arial">{/if}{/if}</font></p>
<form action="support.php?send=message" method="post"><font 

face="Arial">Tipo de Suporte:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<select size="1" name="grund">
<option selected value="- Selecione -">- Selecione -</option>
<option value="Infração de Regras">Infração de Regras</option>
<option value="Insultos/Suspeiras">Insultos/Suspeiras</option>
<option value="BUG">BUG</option>
<option value="Sugestões/Criticas">Sugestões/Criticas</option>
<option value="Outros">Outros</option>
</select></font>
<p><font face="Arial">Usuário: <input type="text" name="nick" size="24"></font></p>
<p><font face="Arial">E-mail:&nbsp;&nbsp;&nbsp;<input type="text" name="email" size="24"></font></p>
<p><font face="Arial">Mensagem:<br>
<textarea rows="19" name="message" cols="53"></textarea></font></p>
<p><font face="Arial"><input type="submit" value="Enviar" name="B1"></font></p>
</form>
</td></tr></form></table>
</td></tr></table>
</div></body>