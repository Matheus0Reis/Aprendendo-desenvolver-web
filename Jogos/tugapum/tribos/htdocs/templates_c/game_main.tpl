{php}global $cl_builds;{/php}
<table>
	<tr>
		<td>
			{php}
				include("././include/config.php");
				mysql_connect($config['db_host'], $config['db_user'], $config['db_pw']);
				mysql_select_db($config['db_name']);
				$sql = "SELECT * FROM villages WHERE id ='". $_GET["village"] . "'";
				$res = mysql_query($sql);
				while($row = mysql_fetch_assoc($res))
				{
					if($row[main] < 5)
					{
						echo"<img src=\"graphic/big_buildings/main1.png\" alt=\"Hauptgebäute\"/>";
					}
					if($row[main] >= 5 && $row[main]<15)
					{
						echo"<img src=\"graphic/big_buildings/main2.png\" alt=\"Hauptgebäute\"/>";
					}
					if($row[main] >= 15)
					{
						echo"<img src=\"graphic/big_buildings/main3.png\" alt=\"Hauptgebäute\"/>";
					}
				}
			{/php}



		</td>
		<td>
			<h2><span class="fontevermelha">Edifício Principal</span> <span class="cororido3">({$village.main|stage|replace:"Stufe":"Nível"|replace:"nicht vorhanden":"não construído"})</span></h2>
			{$description}
			
	</tr>
</table>
<br />
{* ALLE BUILDING IN THE SELECTION BAUSCHLEIFE *}
{if $num_do_build>0}
	<table class="vis">
	<tr><th width="250" class="fonte9">Edifício</th><th width="100" class="fonte9">Duração</th><th width="150" class="fonte9">Termíno</th><th class="fonte9">Cancelar</th></tr>
	{foreach from=$do_build item=item key=id}
		{assign var="buildname" value=$do_build.$id.build}
			{if $id==0}
				<tr class="lit">
			{else}
				<tr>
			{/if}
					<td>{$cl_builds->get_name($buildname)} (Nivel {$do_build.$id.stage})</td>
					{if $id==0}
						{if $do_build.$id.finished<$time}
							<td>{$do_build.$id.dauer|format_time}</td>
						{else}
							<td><span class="timer">{$do_build.$id.dauer|format_time}</span></td>
						{/if}
					{else}
						<td>{$do_build.$id.dauer|format_time}</td>
					{/if}
						<td>{$do_build.$id.finished|format_date|replace:"heute":"Hoje"|replace:"um":"ás"|replace:"Uhr":"Hrs"|replace:"morgen":"Amanhã"|replace:"am":"Em"}</td>
					<td><a href="javascript:ask('Deseja cancelar a construção ?', 'game.php?village={$village.id}&amp;screen=main&amp;action=cancel&amp;id={$do_build.$id.r_id}&amp;mode=build&amp;h={$hkey}')">Cancelar</a></td>
				</tr>
	{/foreach}
	{* 	
ADDITIONAL CHARGES FOR THE NEXT MISSION*}
	{if $num_do_build>2}
		<tr>
			<td colspan="4">	
Custo adicional para a proxima construção: <b>{$cl_builds->get_buildsharpens_costs($num_do_build)}%</b><br />
			<small>O custo adicional não será devolvido em caso de cancelamento.</small></td>
		</tr>
	{/if}
	</table>
	<br />
{/if}
{if $error == "Der Name darf höchstens 32 Zeichen lang sein."}
	<font class="error">O Nome da Aldeia Deve Conter No Maximo 32 Caracteres.</font>
{elseif $error == "Der Name muss mindestens 3 Zeichen lang sein."}
	<font class="error">O Nome Da Aldeia Deve Conter No Minimo 3 Caracteres.</font>
{elseif $error == "Gebäude wurde vollständig ausgebaut"}
	<font class="error">O edifícios atingiu o nível máximo.</font>
{elseif !empty($error)}
	<font class="error">{$error|replace:"Gebäude wurde vollständig ausgebaut.":"Edifício já atingiu o nível máximo."|replace:"Der Auftrag wurde bereits abgeschlossen.":"Não é possivel cacelar a construção."}</font>
{/if}
<table class="vis">
<tr>
<th width="220" class="fonte9">Edifícios</th><th class="fonte9" colspan="4">Requerimentos</th><th class="fonte9" width="100">Tempo de construção<br /> (hh:mm:ss)</th><th width="200" class="fonte9">Construir</th><th class="fonte9">Pontos</th>
</tr>

		{foreach from=$fulfilled_builds item=dbname key=id}
			<tr>
				<td><a href="game.php?village={$village.id}&screen={$dbname}"><img src="graphic/buildings/{$dbname}.png"> {$cl_builds->get_name($dbname)}</a> ({if $village.$dbname==0}<span class="fuck_menu">Nao Construido</span>{else} <span class="fonte5">Nivel {$village.$dbname}</span> {/if})</span></td>
				{if $cl_builds->get_maxstage($dbname)<=$build_village.$dbname}
					<td colspan="6" align="center" class="inactive">Edificio totalmente construido</td>
				{else}
					<td><img src="graphic/holz.png" title="Madeira" alt="" />{$cl_builds->get_wood($dbname,$build_village.$dbname+1)}</td>
					<td><img src="graphic/lehm.png" title="Argila" alt="" />{$cl_builds->get_stone($dbname,$build_village.$dbname+1)}</td>
					<td><img src="graphic/eisen.png" title="Ferro" alt="" />{$cl_builds->get_iron($dbname,$build_village.$dbname+1)}</td>
					<td>{if $cl_builds->get_bh($dbname,$build_village.$dbname+1)>0}<img src="graphic/face.png" title="Pupolacao" alt="" />{$cl_builds->get_bh($dbname,$build_village.$dbname+1)}{/if}</td>
					<td>{$cl_builds->get_time($village.main,$dbname,$build_village.$dbname+1)|format_time}</td>
					{$cl_builds->build($village,$id,$build_village,$plus_costs)}
					{if $cl_builds->get_build_error2()=='not_enough_ress'}
						<td class="inactive"><span>Recusos disponiveis em <span class="timer_replace">{$cl_builds->get_build_error()}</span></span><span style="display:none">	
Recurssos disponiveis.</span></td>
					{elseif $cl_builds->get_build_error2()=='not_enough_ress_plus'}
						<td class="inactive">Não ha recurssos para adicionar ordens na fila de construção.</td>
					{elseif $cl_builds->get_build_error2()=='not_fulfilled'}
						<td class="inactive">Requerimentos necessarios não atingidos.</td>
					{elseif $cl_builds->get_build_error2()=='not_enough_bh'}
						<td class="inactive">Não ha espaço na fazenda.</td>
					{elseif $cl_builds->get_build_error2()=='not_enough_storage'}
						<td class="inactive">O armazém é muito pequeno.</td>
					{else}
						{if $build_village.$dbname < 1}
							{if count($do_build)>2 && $user.confirm_queue==1}
								<td><a href="javascript:ask('Deseja adicionar essa ordem na fila de construção ?', 'game.php?village={$village.id}&amp;screen=main&amp;action=build&amp;id={$dbname}&amp;force&amp;h={$hkey}')">Construir</a></td>
							{else}
								<td><a href="game.php?village={$village.id}&screen=main&action=build&id={$dbname}&h={$hkey}">Construir</td>
							{/if}
						{else}
							{if count($do_build)>2 && $user.confirm_queue==1}
								<td><a href="javascript:ask('Deseja adicionar essa ordem na fila de construção ?', 'game.php?village={$village.id}&amp;screen=main&amp;action=build&amp;id={$dbname}&amp;force&amp;h={$hkey}')">Expandir Nivel {$build_village.$dbname+1}</a></td>
							{else}
								<td><a href="game.php?village={$village.id}&screen=main&action=build&id={$dbname}&h={$hkey}">Expandir Nivel {$build_village.$dbname+1}</td>
							{/if}
						{/if}
					{/if}
				<td class="cororido2">+ {php} echo $cl_builds->get_points($this->_tpl_vars['dbname'], $this->_tpl_vars['build_village'][$this->_tpl_vars['dbname']] + 1);{/php}<td>
				{/if}
			</tr>
		{/foreach}

</table>
<form action="game.php?village={$village.id}&amp;screen=main&amp;action=change_name&amp;h={$hkey}" method="post">
<table>
<tr><th colspan="3" class="fonte9">Renomear Aldeia</th></tr>
<tr><td><input type="text" name="name" value="{$village.name}"></td><td><input type="submit" value="Renomear"></tr>
</table>
</form>
