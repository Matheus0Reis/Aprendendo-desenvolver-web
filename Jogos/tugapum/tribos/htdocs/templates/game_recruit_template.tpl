<table>
	<tr>
		<td>
			<img src="graphic/big_buildings/{$dbname}
			{php}
				include("include/config.php");
				mysql_connect($config['db_host'], $config['db_user'], $config['db_pw']);
				mysql_select_db($config['db_name']);
				$sql = "SELECT * FROM villages WHERE id ='". $_GET["village"] . "'";
				$res = mysql_query($sql);
				while($row = mysql_fetch_assoc($res))
				{
							
			
					if($_GET["screen"] == "garage")
					{
						if($row[garage] < 3)
						{
							echo "1";
						}
						if($row[garage] >= 3 && $row[garage]<5)
						{
							echo "2";
						}
						if($row[garage] >= 5)
						{
							echo "3";
						}
					}
					if($_GET["screen"] == "barracks")
					{
						if($row[barracks] < 5)
						{
							echo "1";
						}
						if($row[barracks] >= 5 && $row[barracks]<20)
						{
							echo "2";
						}
						if($row[barracks] >= 20)
						{
							echo "3";
						}
					}
					if($_GET["screen"] == "stable")
					{
						if($row[stable] < 3)
						{
							echo "1";
						}
						if($row[stable] >= 3 && $row[stable]<10)
						{
							echo "2";
						}
						if($row[stable] >= 10)
						{
							echo "3";
						}
					}						
				}
			{/php}.png" title="{$dbname}" alt="" />
		</td>
		<td>
			<h2>{$buildname} ({$village.$dbname|stage|replace:"Stufe":"Nivel"|replace:"nicht vorhanden":"neconstruita"})</h2>
			{$description}
		</td>
	</tr>
</table>
<br />
<link rel="stylesheet" type="text/css" href="masowa.css" />
{if $show_build}
	{if count($recruit_units)>0}
	    <table class="vis">
			<tr>
				<th width="150">Comando</th>
				<th width="120">Dura&ccedil;&atilde;o</th>
				<th width="150">Conclus&atilde;o</th>
				<th width="100">Cancelar</th>
			</tr>

			{foreach from=$recruit_units key=key item=value}
			    <tr {if $recruit_units.$key.lit}class="lit"{/if}>
					<td>{$recruit_units.$key.num_unit} {$cl_units->get_name($recruit_units.$key.unit)}</td>
	                {if $recruit_units.$key.lit && $recruit_units.$key.countdown>-1}
						<td><span class="timer">{$recruit_units.$key.countdown|format_time}</span></td>
					{else}
					   	<td>{$recruit_units.$key.countdown|format_time}</td>
					{/if}
					<td>{php}
						$data_terminaree=(is_array($_tmp=$this->_tpl_vars['recruit_units'][$this->_tpl_vars['key']]['time_finished'])) ? $this->_run_mod_handler('format_date', true, $_tmp) : format_date($_tmp);
						$data_terminaree = str_replace("heute um","Hoje &aacute;s ",$data_terminaree);
						$data_terminaree = str_replace("Uhr","",$data_terminaree);
						$data_terminaree = str_replace("am","pe",$data_terminaree);
						$data_terminaree = str_replace("um","",$data_terminaree);
						$data_terminaree = str_replace("morgen","maine la",$data_terminaree);
						echo $data_terminaree;
					{/php}</td>
					<td><a href="game.php?t=129107&amp;village={$village.id}&amp;screen={$dbname}&amp;action=cancel&amp;id={$key}&amp;h={$hkey}">Cancelar</a></td>
			    </tr>
			{/foreach}

		</table>
		<div style="font-size: 7pt;">* (90% dos recursos ser&atilde;o devolvidos)</div>
		<br>
	{/if}

	{if $error == "Nicht genügend Rohstoffe vorhanden."}
		<font class="error">Nu exista destule resurse!</font>
	{elseif $error == "Nicht genügend Bauern vorhanden."}
		<font class="error">O eroare nu a putut genera comanda!</font>
	{elseif !empty($error)}
		<font class="error">{$error}</font>
	{/if}
<table class="vis">
{php}
	if ($_GET['screen'] == 'barracks'){ 
{/php}
		  <td class="selected" width="100" align="center"><a href="game.php?village={$village.id}&screen=barracks">Quartel</a></td>
{php} } else { {/php}
		<td width="100" align="center"><a href="game.php?village={$village.id}&screen=barracks">Quartel</a></td>
{php} } {/php}
{php}
	if ($_GET['screen'] == 'stable'){ 
{/php}
		<td class="selected" width="100" align="center"><a href="game.php?village={$village.id}&screen=stable">Est&aacute;bulo</a></td>
{php} } else { {/php}
		<td width="100" align="center"><a href="game.php?village={$village.id}&screen=stable">Est&aacute;bulo</a></td>
{php} } {/php}
{php}
	if ($_GET['screen'] == 'garage'){ 
{/php}
		<td class="selected" width="100" align="center"><a href="game.php?village={$village.id}&screen=garage">Oficina</a></td>
{php} } else { {/php}
		<td width="100" align="center"><a href="game.php?village={$village.id}&screen=garage">Oficina</a></td>
{php} } {/php}
		<td width="100" align="center"><a href="game.php?village={$village.id}&screen=snob">Academia</a></td>
</table>
	<form action="game.php?village={$village.id}&amp;screen={$dbname}&amp;action=train&amp;h={$hkey}" method="post" onsubmit="this.submit.disabled=true;">
		<table class="vis">
			<tr>
				<th width="150">Unidade</th>
				<th colspan="4" width="120">Requisitos</th>
				<th width="140">Dura&ccedil;&atilde;o(hh:mm:ss)</th>
				<th>Tropa na aldeia / Total </th>
				<th>Recrutar</th>
			</tr>

			{foreach from=$units key=unit_dbname item=name}
				<tr>
					<td><a href="javascript:popup('popup_unit.php?unit={$unit_dbname}', 520, 520)"> <img src="graphic/unit/{$unit_dbname}.png" alt="" /> {$name}</a></td>
					<td><img src="graphic/holz.png" title="Lemn" alt="" /> {$cl_units->get_woodprice($unit_dbname)}</td>
					<td><img src="graphic/lehm.png" title="Argila" alt="" /> {$cl_units->get_stoneprice($unit_dbname)}</td>
					<td><img src="graphic/eisen.png" title="Fier" alt="" /> {$cl_units->get_ironprice($unit_dbname)}</td>
					<td><img src="graphic/face.png" title="Muncitori" alt="" /> {$cl_units->get_bhprice($unit_dbname)}</td>
					<td>{$cl_units->get_time($village.$dbname,$unit_dbname)|format_time}</td>
					<td>{$units_in_village.$unit_dbname}/{$units_all.$unit_dbname}</td>

					{$cl_units->check_needed($unit_dbname,$village)}
					{if $cl_units->last_error==not_tec}
					    <td class="inactive">Unidade n&atilde;o pesquisada</td>
					{elseif $cl_units->last_error==not_needed}
					    <td class="inactive">Requisitos ainda n&atilde;o atingidos </td>
					{elseif $cl_units->last_error==not_enough_ress}
					    <td class="inactive">Recursos insuficientes </td>
					{elseif $cl_units->last_error==not_enough_bh}
					    <td class="inactive">A fazenda est&aacute; cheia</td>
					{else}
						<td><input name="{$unit_dbname}" type="text" size="5" maxlength="8" /> <a href="javascript:insertUnit(document.forms[0].{$unit_dbname}, {$cl_units->last_error})">(max. {$cl_units->last_error})</a></td>
					{/if}
				</tr>
			{/foreach}

		    <tr><td colspan="8" align="right"><input name="submit" type="submit" value="Recrutar" style="font-size: 10pt;" /></td></tr>
		</table>
	</form>
{/if}