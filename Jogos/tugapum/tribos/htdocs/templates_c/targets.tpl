<?xml version="1.0"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Warriors</title>
<LINK rel="shortcut icon" href="../graphic/icon.ico" type="image/x-icon">
<meta http-equiv="content-type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="stamm.css" />
<link rel="stylesheet" type="text/css" href="fonte.css" />
<style type="text/css">
{literal}
body {background-color:rgb(241, 237, 225);}
{/literal}
</style>
<script src="script.js?1159978916" type="text/javascript"></script>
<script src="menu.js?1148466057" type="text/javascript"></script>
</head>
<h3 align="center" class="menus2">Suas Aldeias</h3>
<table class="vis">
<tbody>
<tr>
<td class="selected">
<a href="javascript:popup_scroll('targets.php?village={$village}', 520, 520);" target="_self">Suas aldeias</a>
</td>
</tr>
</tbody>
{foreach from=$villages item=village}
<tr>
<td>
<a href="javascript:selectTarget({$village.x}, {$village.y});">{$village.name}</a></td>
<td><img src="graphic/holz.png">{$village.r_wood}&nbsp;<img src="graphic/lehm.png">{$village.r_stone}&nbsp;<img src="graphic/eisen.png">{$village.r_iron}</td>
<td><img src="graphic/face.png">{$village.r_bh}</td>
<td><a href="javascript:selectTarget({$village.x}, {$village.y});">{$village.x}|{$village.y}</a></td>
</tr>
{/foreach}
</table>
{$userid}
<div align="center"><br><br>
<a href="javascript:window.close();">Fechar P�gina</a>
</div>
</body>
</html>