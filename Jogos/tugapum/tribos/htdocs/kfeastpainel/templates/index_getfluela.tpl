<table border="0" width="100%">
	<tr>
		<td>
		<p align="center"><font size="7">DSLan </font><font size="5">Automatic 
		Fl�las</font></td>
	</tr>
	<tr>
		<td>
		<p align="center">Mit diesem Tool k�nnen sie Automatisch 
		Fl�chtlingslager erstellen... Das n�tzt ihnen wenn sie nicht immer 
		Selber gehen wollen!<p align="center">{if 
		!isset($smarty.get.action)}Starten sie das Tool
		<a href="http://localhost/admin/index.php?screen=getfluela&action=start">
		hier</a>{/if}<p align="center"><b>{if $smarty.get.action == 
		"start"}Automatic Fl�las gestartet... Er Kontrolliert alle 20 Sekunden 
		ob Fl�chtlichslager zu erstellen sind<meta http-equiv='refresh' content='20; URL=index.php?screen=getfluela&action=start'>{/if}</b><p align="center">&nbsp;<p align="center">
		Die Anzahl Fl�chtlingslager kann in "htdocs/afluelaconfig.php" ge�ndert 
		werden!</td>
	</tr>
</table>
<p align="center">Tool: &copy 2009 by
<a href="http://dslan.gfx-dose.de/user-1492.html">milos</a></p>