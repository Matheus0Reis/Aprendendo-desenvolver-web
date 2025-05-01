<?xml version="1.0"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>{$cl_builds->get_name($building)}</title>
<link rel="stylesheet" type="text/css" href="stamm.css" />
<script src="script.js?1176997364" type="text/javascript"></script>
</head>
<body>
<table class="main" width="100%" align="center"><tr><td>
<h2>{$cl_builds->get_name($building)}</h2>
<p>{$cl_builds->get_description_bydbname($building)}</p>

<p>Nivelul maxim: <b>{$cl_builds->get_maxstage($building)}</b></p>

{if count($cl_builds->get_needed_by_dbname($building))>0}
	<table class="vis"><tr>
	  <th colspan="3">Requisitos</th>
	</tr>
		<tr>
			{foreach from=$cl_builds->get_needed_by_dbname($building) key=n_building item=n_stage}
				<td><a href="popup_building.php?building={$n_building}">{$cl_builds->get_name($n_building)}</a> (Nivel {$n_stage})</td>
			{/foreach}
		</tr>
	</table>
{/if}

<table class="vis">
<tr>
<th>Nivel</th>
<th width="220">Recursos necess&aacute;rios </th>
<th width="110">Fazenda necess&aacute;ria </th>
{if $cl_builds->get_name($building) == 'Ferma'}<th>Fazenda</th>
{/if}</tr>
{section name=foo start=1 loop=$cl_builds->get_maxstage($building)+1 step=1}
<tr>
	<td>{$smarty.section.foo.index}</td>
	<td><img src="graphic/holz.png" title="Lemn" alt="" />{$cl_builds->get_wood($building,$smarty.section.foo.index)} <img src="graphic/lehm.png" title="Lehm" alt="" />{$cl_builds->get_stone($building,$smarty.section.foo.index)} <img src="graphic/eisen.png" title="Eisen" alt="" />{$cl_builds->get_iron($building,$smarty.section.foo.index)} </td>
	<td><img src="graphic/face.png" title="Ferme" alt="" />{$cl_builds->get_bh($building,$smarty.section.foo.index)} / {$cl_builds->get_bh_total()}</td>{if $cl_builds->get_name($building) == 'Ferma'}<td>{php} include ("include/configs/farm_limits.php"); $test = $this->_tpl_vars['smarty']['section']['foo']['index'];
 echo $test;	
	echo $arr_farm['1'];{/php}</td>{/if}
	
</tr>
{/section}
</table>

</td></tr></table>
<script type="text/javascript">setImageTitles();</script>
</body>
</html>