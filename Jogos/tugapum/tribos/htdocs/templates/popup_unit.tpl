<?xml version="1.0"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>{$cl_units->get_name($unit)}</title>
<link rel="stylesheet" type="text/css" href="stamm.css" />
<script src="script.js?1176997364" type="text/javascript"></script>
</head>

<body >
<table class="main" width="100%" align="center"><tr><td>
<table><tr><td><img src="graphic/unit_big/{$cl_units->get_graphicName($unit)}.png" alt="{$cl_units->get_name($unit)}" /></td>
<td>
<h2>{$cl_units->get_name($unit)}</h2>
<p>{$cl_units->get_description($unit)}</p>
</td></tr></table>

<table style="border: 1px solid #DED3B9;" class="vis"><tr>
  <th width="150">Custos</th>
  <th>Popula&ccedil;&atilde;o</th>
  <th>Velocidade</th>
</tr>

<tr class="center"><td><img src="graphic/holz.png" title="Holz" alt="" />{$cl_units->get_woodprice($unit)} <img src="graphic/lehm.png" title="Lemn alt="" />{$cl_units->get_stoneprice($unit)} <img src="graphic/eisen.png" title="Eisen" alt="" />{$cl_units->get_ironprice($unit)} </td>
<td><img src="graphic/face.png" title="Populatie" alt="" /> {$cl_units->get_bhprice($unit)}</td>
<td>{$cl_units->get_booty($unit)}</td></tr>
</table>
<br />

<table style="border: 1px solid #DED3B9;" class="vis">
<tr>
  <td>Ataque</td>
  <td><img src="graphic/unit/att.png" alt="" /> {$cl_units->get_att($unit,1)}</td></tr>
<tr>
  <td>Defesa geral</td>
  <td><img src="graphic/unit/def.png" alt="" /> {$cl_units->get_def($unit,1)}</td></tr>
<tr>
  <td>Defesa cavalaria</td>
  <td><img src="graphic/unit/def_cav.png" alt="" /> {$cl_units->get_defCav($unit,1)}</td></tr>
<tr>
  <td>Defesa arqueiros </td>
  <td><img src="graphic/unit/def_archer.png" alt="" /> {$cl_units->get_defArcher($unit,1)}</td></tr>
</table>
<br />

	
<table class="vis"><tr>
  <th colspan="{$cl_units->get_countNeeded($unit)}">Requisitos para pesquisa </th>
</tr>
<tr>
		{if count($cl_units->get_needed($unit))>0}
			{foreach from=$cl_units->get_needed($unit) key=n_unit item=n_stage}
			<td><a href="popup_building.php?building={$n_unit}">{$cl_builds->get_name($n_unit)}</a> (Nivelul {$n_stage})</td>
			{/foreach}
		{else}
			<td>A unidade n&atilde;o pesquisa de requisitos para ser constru&iacute;da </td>
		{/if}
</tr>
</table><br />


</td></tr></table>
<script type="text/javascript">setImageTitles();</script>
</body>
</html>