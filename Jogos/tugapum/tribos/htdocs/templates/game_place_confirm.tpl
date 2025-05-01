{php}
include("include/config.php");

$iduser = $this->_tpl_vars['user']['id'];
$id_sat = $this->_tpl_vars['village']['id'];
$nume_player=urlencode($this->_tpl_vars['info_user']['username']);
$id_player = $this->_tpl_vars['info_village']['userid'];
$test = mysql_query("SELECT id,noob_protection,villages FROM users WHERE id = '".$id_player."'");
$test = mysql_fetch_array($test);
$test1 = $test[0];
$test = $test[1];
$type = $this->_tpl_vars['type'];

$timp = time();
if ($timp < $test && $type == 'attack') { header("Location:game.php?village=$id_sat&screen=place&error=Jucatorul $nume_player are protectie de incepator"); } else {
 $error = ''; 


$internet_share = mysql_num_rows(mysql_query("SELECT * FROM share_internet WHERE id_to = '$test1' AND id_from = '$iduser'"));
if ($internet_share == '1' && $type == 'support'){
header("Location:game.php?village=$id_sat&screen=place&error=N&atilde;o pode apoiar jogadores que compartilhem a conex&atilde;o h&aacute; internet ");

} else { $error =''; } }
if ($error == '')
{



{/php}
{if $type=="attack"}
	<h2>Ataque</h2>
{else}
	<h2>Apoio</h2>
{/if}

<form action="game.php?village={$village.id}&amp;screen=place&amp;action=command&amp;h={$hkey}" method="post" onSubmit="this.submit.disabled=true;">
	<input type="hidden" name="{$type}" value="true">
	<input type="hidden" name="x" value="{$values.x}">
	<input type="hidden" name="y" value="{$values.y}">
	
	<table class="vis" width="300">
		<tr>
		  <th colspan="2">Comando</th>
		</tr>
		<tr>
		  <td>Aldeia:</td>
		  <td><a href="game.php?village={$village.id}&amp;screen=info_village&amp;id={$info_village.id}">{$info_village.name} ({$values.x}|{$values.y}) K{$info_village.continent}</a></td></tr>
		<tr>
		  <td>Jogador:</td>
		  <td><a href="game.php?village={$village.id}&amp;screen=info_player&amp;id={$info_village.userid}">{$info_user.username}</a></td></tr>
		<tr>
		  <td>Dura&ccedil;&atilde;o:</td>
		  <td>{$unit_runtime|format_time}</td></tr>
		<tr>
		  <td>Chegada:</td>
		  <td>{php}
$data_terminaree=(is_array($_tmp=$this->_tpl_vars['arrival'])) ? $this->_run_mod_handler('format_date', true, $_tmp) : format_date($_tmp);
$data_terminaree = str_replace("heute um","Hoje &aacute;s ",$data_terminaree);
$data_terminaree = str_replace("Uhr","",$data_terminaree);
$data_terminaree = str_replace("am","In data de",$data_terminaree);
$data_terminaree = str_replace("um","la ora",$data_terminaree);
$data_terminaree = str_replace("morgen","Maine",$data_terminaree);
//Variabila originala tpl:{$arrival|format_date}

echo $data_terminaree;
{/php}</td>
		</tr>
	</table>
	<br>
	<table class="vis">
		<tr>
		
		    {foreach from=$cl_units->get_array("dbname") item=dbname key=name}
			
				<th width="50"><img src="graphic/unit/{$dbname}.png" title="{$name}" alt="" /></th>
			{/foreach}
		</tr>
		<tr>
		    {foreach from=$cl_units->get_array("dbname") item=dbname key=name}
				{if $send_units.$dbname>0}
				
				    <td>{$send_units.$dbname}</td>
				{else}
					<td class="hidden">0</td>
				{/if}
			{/foreach}
		</tr>
	</table>
	<br />
    {foreach from=$cl_units->get_array("dbname") item=dbname key=name}
        <input type="hidden" name="{$dbname}" value="{$send_units.$dbname}">
	{/foreach}
	{* Falls auch Catapultae ausgewählt wurde *}
	{if $send_units.unit_catapult>0 && $type!='support'}
	    <table class="vis">
	        <tr>
	            <th>Catapulta:</th>
	            <td>
                    <select name="building" size="1">
                        {foreach from=$cl_builds->get_array("dbname") item=dbname key=id}
                            {if !in_array("catapult_protection", $cl_builds->get_specials($dbname))}
                        		<option label="{$cl_builds->get_name($dbname)}" value="{$dbname}">{$cl_builds->get_name($dbname)}</option>
							{/if}
						{/foreach}
                    </select>
				</td>
	        </tr>
	    </table>
	{/if}
	<br />
	<input name="submit" type="submit" onload="this.disabled=false;" value="OK" style="font-size: 10pt;">
</form>
{php} } else { {/php} <h3> Sa produs o erroare,va rugam sa anuntati administratoru serverului </h3> {php}}{/php}
