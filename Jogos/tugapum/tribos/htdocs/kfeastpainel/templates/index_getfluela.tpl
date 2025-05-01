<table border="0" width="100%">
	<tr>
		<td>
		<p align="center"><font size="7">DSLan </font><font size="5">Automatic 
		Flülas</font></td>
	</tr>
	<tr>
		<td>
		<p align="center">Mit diesem Tool können sie Automatisch 
		Flüchtlingslager erstellen... Das nützt ihnen wenn sie nicht immer 
		Selber gehen wollen!<p align="center">{if 
		!isset($smarty.get.action)}Starten sie das Tool
		<a href="http://localhost/admin/index.php?screen=getfluela&action=start">
		hier</a>{/if}<p align="center"><b>{if $smarty.get.action == 
		"start"}Automatic Flülas gestartet... Er Kontrolliert alle 20 Sekunden 
		ob Flüchtlichslager zu erstellen sind<meta http-equiv='refresh' content='20; URL=index.php?screen=getfluela&action=start'>{/if}</b><p align="center">&nbsp;<p align="center">
		Die Anzahl Flüchtlingslager kann in "htdocs/afluelaconfig.php" geändert 
		werden!</td>
	</tr>
</table>
<p align="center">Tool: &copy 2009 by
<a href="http://dslan.gfx-dose.de/user-1492.html">milos</a></p>