{if !empty($error)}
         {if $error=='Es wurden keine Einheiten gewählt.'}
            {assign var='error' value='N&atilde;o foi selecionado nenhuma tropa.'}
         {/if}
         {if $error=='Nicht genügend Einheiten vorhanden.'}
            {assign var='error' value='Voc&ecirc; n&atilde;o tem unidades suficientes.'}
         {/if}
         {if $error=='Keine Koordinaten angegeben.'}
            {assign var='error' value='N&atilde;o foi inserado nenhuma coordenada.'}
         {/if}
	     <div style="color:red; font-size:large">{$error|replace:"Das Ziel steht noch unter Anfangsschutz.":"O jogador ainda tem prote&ccedil;&atilde;o "|replace:"Du darfst erst heute um ":"A prote&ccedil;&atilde;o vai expirar &aacute;s "|replace:" Uhr angreifen.":",astazi."}</div>
{/if}

<h3>Comandos</h3>

<form name="units" action="game.php?village={$village.id}&amp;screen=place&amp;try=confirm" method="post">
	<table>
		<tr>
			{assign var=counter value=0}
			{foreach from=$group_units key=group_name item=value}
				<td width="200" valign="top">
					<table class="vis" width="100%">
						{foreach from=$group_units.$group_name item=dbname}
							{* Counter um 1 erhöhren für den Tab für die Input Felder *}
							{math assign=counter equation="x + y" x=$counter y=1}
							<tr>
								<td>
									<a href="javascript:popup('popup_unit.php?unit={$dbname}', 520, 520)"><img src="graphic/unit/{$dbname}.png" title="{$cl_units->get_name($dbname)}" alt="" /></a> <input name="{$dbname}" type="text" size="5" tabindex="{$counter}" value="{$values.$dbname}" maxUnits="{$units.$dbname}" class="unitsInput" /> <a href="javascript:insertUnit(document.forms[0].{$dbname}, {$units.$dbname})">({$units.$dbname})</a>
								</td>
							</tr>
						{/foreach}

					</table>
				</td>
			{/foreach}
		</tr>
<tr> 
	<td> 
		<a id="selectAllUnits" href="javascript:selectAllUnits(true)">&raquo; Todas as tropas </a> 
	</td> 
</tr> 
	</table>
	
	<table>
		<tr>
			<td rowspan="2">
				x: <input type="text" maxlength="8" name="x" max tabindex=13 id="inputx" value="{$values.x}" size="5" onkeyup="xProcess('inputx', 'inputy')" />
				y: <input type="text" maxlength="3" name="y" tabindex=14 id="inputy" value="{$values.y}" size="5" /> 
				{php}
$userid = $this->_tpl_vars['user']['id'];
$select_query = mysql_query("SELECT * FROM `villages` WHERE `userid` = '".$userid."' ORDER BY `name` ASC");
$select_count = mysql_num_rows($select_query);
if($select_count >= 1)
    {
    $villages = array();
    while($select_get = mysql_fetch_assoc($select_query))
        {
        $select_get['name'] = entparse($select_get['name']);
        $villages[] = $select_get;
        }
    $this->assign('villages', $villages);
    }
{/php}
			{if count($villages)>=0}
	<select name="target" size="1" onchange="insertCoord(document.forms[0], this)">
		<option value="000|000">-Selecionar aldeia-</option>
		{foreach from=$villages key=id item=value}
			<option value="{$villages.$id.x}|{$villages.$id.y}">{$villages.$id.name} ({$villages.$id.x}|{$villages.$id.y}) {$villages.$id.continent}</option>
		{/foreach}
	</select>
{/if}
			</td>
			<td valign="top"></td>
			<td valign="top"></td>
			<td rowspan="2"><input class="attack" name="attack" type="submit" value="Atacar" style="font-size: 10pt;" /></td>
			<td rowspan="2"><input class="support" name="support" type="submit" value="Apoiar" style="font-size: 10pt;" /></td>
		</tr>
	</table>
</form>

<h3>Movimento de tropas </h3>
{* Eigene losgeschickte Angriffe *}
{if count($my_movements)>0}
<table class="vis">
	<tr>
		<th width="250">Tropa</th>
		<th width="160">Chegada</th>
		<th width="90">Chegada em </th>
	</tr>
	{foreach from=$my_movements item=array}
	    <tr>
	        <td>
	            <a href="game.php?village={$village.id}&amp;screen=info_command&amp;id={$array.id}&amp;type=own">
	            <img src="graphic/command/{$array.type}.png">{$array.message|replace:"Angriff auf":"Ataque a"|replace:"Rückkehr von":"Intoarcere din"|replace:"Rückzug von":"Retragere din"|replace:"Unterstützung für":"Apoio a "}
	            </a>
	        </td>
	        <td>{php}
$data_terminaree=(is_array($_tmp=$this->_tpl_vars['array']['end_time'])) ? $this->_run_mod_handler('format_date', true, $_tmp) : format_date($_tmp);
$data_terminaree = str_replace("heute um","Hoje &aacute;s ",$data_terminaree);
$data_terminaree = str_replace("Uhr","",$data_terminaree);
$data_terminaree = str_replace("am","In data de",$data_terminaree);
$data_terminaree = str_replace("um","la ora",$data_terminaree);
$data_terminaree = str_replace("morgen","Maine",$data_terminaree);
//Variabila originala tpl:{$array.end_time|format_date}

echo $data_terminaree;
{/php}</td>
	        {if $array.arrival_in<0}
	        	<td><span class="timer">0:00:00</span></td>
	        {else}
	        	<td><span class="timer">{$array.arrival_in|format_time}</span></td>
	        {/if}
	        {if $array.can_cancel}
	        	<td><a href="game.php?village={$village.id}&amp;screen=place&amp;action=cancel&amp;id={$array.id}&amp;h={$hkey}">Cancelar</a></td>
	        {/if}
	    </tr>
	{/foreach}
</table>
{/if}


{* Andere Angriffe auf das aktuelle Dorf *}
{if count($other_movements)>0}
<table class="vis">
	<tr>
		<th width="250">Tropas a chegar </th>
		<th width="160">Chegada</th>
		<th width="90">Chegada em </th>
	</tr>
	{foreach from=$other_movements item=array}
	    <tr>
	        <td>
	            <a href="game.php?village={$village.id}&amp;screen=info_command&amp;id={$array.id}&amp;type=other">
	            <img src="graphic/command/{$array.type}.png"> {$array.message|replace:"Angriff":"Ataque"|replace:"von":"a"|replace:"Unterstützung":"Apoio "}	            </a>	        </td>
	        <td>{php}
$data_terminaree=(is_array($_tmp=$this->_tpl_vars['array']['end_time'])) ? $this->_run_mod_handler('format_date', true, $_tmp) : format_date($_tmp);
$data_terminaree = str_replace("heute um","Hoje &aacute;s ",$data_terminaree);
$data_terminaree = str_replace("Uhr","",$data_terminaree);
$data_terminaree = str_replace("am","In data de",$data_terminaree);
$data_terminaree = str_replace("um","la ora",$data_terminaree);
$data_terminaree = str_replace("morgen","Maine",$data_terminaree);
//Variabila originala tpl:{$array.end_time|format_date}

echo $data_terminaree;
{/php}</td>
	        {if $array.arrival_in<0}
	        	<td><span class="timer">0:00:00</span></td>
	        {else}
	        	<td><span class="timer">{$array.arrival_in|format_time}</span></td>
	        {/if}
	    </tr>
	{/foreach}
</table>
{/if}
