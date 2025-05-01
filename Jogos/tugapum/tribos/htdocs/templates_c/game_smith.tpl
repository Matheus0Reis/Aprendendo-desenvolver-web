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
					if($row[smith] < 5)
					{
						echo"<img src=\"graphic/big_buildings/smith1.png\" alt=\"Schmiede\"/>";
					}
					if($row[smith] >= 5 && $row[smith]<15)
					{
						echo"<img src=\"graphic/big_buildings/smith2.png\" alt=\"Schmiede\"/>";
					}
					if($row[smith] >= 15)
					{
						echo"<img src=\"graphic/big_buildings/smith3.png\" alt=\"Schmiede\"/>";
					}
				}
			{/php}

		</td>
		<td>
			<h2><span class="fontevermelha">Ferreiro</span> <span class="cororido3">({$village.smith|stage|replace:"Stufe":"Nível"|replace:"nicht vorhanden":"não construído"})</span></h2>
<a href="alles_erforschen.php?village={$village.id}">-> Fazer Todas Pesquisas</a><br><br>			{$description}
		</td>
	</tr>
</table>
<br />
{if !empty($error)}
	<font class="error">{$error}</font>
{/if}
{if $show_build}
	{* Current research *}
	{if $is_researches}
		<table class="vis">
		<tr>
			<td width="220" class="fonte6maior">Pesquisa</td>
			<td width="100" class="fonte6maior">Duração</td>
			<td width="120" class="fonte6maior">Termino</td>
			<td rowspan="2"><a href="game.php?village={$village.id}&amp;screen=smith&amp;action=cancel&amp;h={$hkey}">Cancelar</a></td>
		</tr>
		<tr>
		    {assign var=research_unitname value=$research.research}
			<th>{$cl_techs->get_name($research.research)} (N&iacute;vel {$techs.$research_unitname+1})</th>
			{if ($research.end_time < $time)}
			    <th>{$research.reminder_time|format_time}</th>
			{else}
			    <th><span class="timer">{$research.reminder_time|format_time}</span></th>
			{/if}
			    <th>{$research.end_time|format_date|replace:"heute":"Hoje"|replace:"um":"às"|replace:"Uhr":"Hrs"}</th>
		</tr>
		</table><br />
	{/if}
	
	<table class="vis" width="100%">
		{* ALLE GRUPPEN AUSLESEN *}
		<tr>
			{foreach from=$group_techs item=item key=group_name}
				<th width="{$table_width}%" class="fonte6maior" align="center">{$group_name}</th>
			{/foreach}
		</tr>
		{* INDIVIDUAL UNITS SELECTION *}
		{section name=counter start=0 loop=$maxNum_groupTech step=1}
			{assign var=num value=$smarty.section.counter.index}
			<tr>
				{foreach from=$group_techs item=item key=group_name}
					{if !empty($group_techs.$group_name.$num)}
						{assign var=unitname value=$group_techs.$group_name.$num}
						<td>
							{$cl_techs->check_tech($group_techs.$group_name.$num,$village)}

							<table class="vis">
								<tr><td><a href="javascript:popup('popup_unit.php?unit=unit_{$group_techs.$group_name.$num}&amp;level=0', 520, 520)"><img src="graphic/unit_big/{$cl_techs->get_graphic()}" alt="" /></a></td>
									<td valign="top"><a href="javascript:popup('popup_unit.php?unit={$group_techs.$group_name.$num}&amp;level=0', 520, 520)">{$cl_techs->get_name($group_techs.$group_name.$num)}</a> <span class="fonte5">{if $techs.$unitname==0}(não pesquisado){else}( Nivel {$techs.$unitname} ){/if}</span>
										<br />
										{if $cl_techs->get_last_error()=='not_enough_ress'}
											<br /><img src="graphic/holz.png" title="Madeira" alt="" /> {$cl_techs->get_wood($unitname,$techs.$unitname+1)} <img src="graphic/lehm.png" title="Argila" alt="" /> {$cl_techs->get_stone($unitname,$techs.$unitname+1)} <img src="graphic/eisen.png" title="Ferro" alt="" /> {$cl_techs->get_iron($unitname,$techs.$unitname+1)}
											<br /><span class="inactive">Recursos disponiveis em <span class="timer_replace">{$cl_techs->get_time_wait()}</span></span><span style="display:none">Recursos disponiveis.</span>
										{elseif $cl_techs->get_last_error()=='not_fulfilled'}
											<span class="inactive">Requerimentos não atingidos.</span>
										{elseif $cl_techs->get_last_error()=='max_stage'}
											<span class="inactive">Pesquisado.</span>
										{elseif $cl_techs->get_last_error()=='not_enough_storage'}
											<br /><img src="graphic/holz.png" title="Madeira" alt="" /> {$cl_techs->get_wood($unitname,$techs.$unitname+1)} <img src="graphic/lehm.png" title="Argila" alt="" /> {$cl_techs->get_stone($unitname,$techs.$unitname+1)} <img src="graphic/eisen.png" title="Ferro" alt="" /> {$cl_techs->get_iron($unitname,$techs.$unitname+1)}
											<br /><span class="inactive">Armazem muito pequeno.</span>
										{else}
											<br /><img src="graphic/holz.png" title="Madeira" alt="" /> {$cl_techs->get_wood($unitname,$techs.$unitname+1)} <img src="graphic/lehm.png" title="Argila" alt="" /> {$cl_techs->get_stone($unitname,$techs.$unitname+1)} <img src="graphic/eisen.png" title="Ferro" alt="" /> {$cl_techs->get_iron($unitname,$techs.$unitname+1)}
											{if $is_researches}
											    <br /><span class="inactive">Pesquisa em andamento.</span> ({$cl_techs->get_time($village.smith,$unitname,$techs.$unitname+1)|format_time})
											{else}
												{if $techs.$unitname < 1}
													<br /><a href="game.php?village={$village.id}&amp;screen=smith&amp;action=research&amp;id={$unitname}&amp;h={$hkey}">&raquo; Pesquisar</a> ({$cl_techs->get_time($village.smith,$unitname,$techs.$unitname+1)|format_time})
												{else}
													<br /><a href="game.php?village={$village.id}&amp;screen=smith&amp;action=research&amp;id={$unitname}&amp;h={$hkey}">&raquo; Pesquisar nivel {$techs.$unitname+1}</a> ({$cl_techs->get_time($village.smith,$unitname,$techs.$unitname+1)|format_time})
												{/if}
											{/if}
										{/if}
									</td>
								</tr>
							</table>
						</td>
					{/if}
				{/foreach}
			</tr>
		{/section}
	</table>
{/if}