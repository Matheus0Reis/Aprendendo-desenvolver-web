<table>
	<tr>
		<td>
			<img src="graphic/big_buildings/{$dbname}.png" title="{$buildname}" alt="" />
		</td>
		<td>
			<h2><span class="fontevermelha">{$buildname}</span> <span class="cororido3">({$village.$dbname|stage|replace:"Stufe":"Nível"|replace:"nicht vorhanden":"não construído"})</span></h2>
			{$description}
		</td>
	</tr>
</table>
<br />
{if $show_build}
	{if count($recruit_units)>0}
	    <table class="vis">
			<tr>
				<th width="150" class="fonte6maior">Recrutamento</th>
				<th width="120" class="fonte6maior">Duração</th>
				<th width="150" class="fonte6maior">Termino</th>
				<th width="100" class="fonte6maior">Cancelar *</th>
			</tr>

			{foreach from=$recruit_units key=key item=value}
			    <tr {if $recruit_units.$key.lit}class="lit"{/if}>
					<td>{$recruit_units.$key.num_unit} {$cl_units->get_name($recruit_units.$key.unit)}</td>
	                {if $recruit_units.$key.lit && $recruit_units.$key.countdown>-1}
						<td><span class="timer">{$recruit_units.$key.countdown|format_time}</span></td>
					{else}
					   	<td>{$recruit_units.$key.countdown|format_time}</td>
					{/if}
					<td>{$recruit_units.$key.time_finished|format_date|replace:"heute":"Hoje"|replace:"um":"às"|replace:"Uhr":"Hrs"}</td>
					<td><a href="game.php?t=129107&amp;village={$village.id}&amp;screen={$dbname}&amp;action=cancel&amp;id={$key}&amp;h={$hkey}">Cancelar</a></td>
			    </tr>
			{/foreach}

		</table>
		<div style="font-size: 7pt;">* (90% serão devolvidos em caso de cancelamento.)</div>
		<br>
	{/if}

	{if !empty($error)}
		<font class="error">{$error}</font>
	{/if}
	<form action="game.php?village={$village.id}&amp;screen={$dbname}&amp;action=train&amp;h={$hkey}" method="post" onsubmit="this.submit.disabled=true;">
		<table class="vis">
			<tr>
				<th width="150" class="fonte6maior">Unidade</th>
				<th colspan="4" class="fonte6maior" width="120">Requerimentos</th>
				<th width="130" class="fonte6maior">Duração (hh:mm:ss)</th>
				<th class="fonte6maior">Na aldeia / Total</th>
				<th class="fonte6maior">Recrutar</th>
			</tr>

			{foreach from=$units key=unit_dbname item=name}
				<tr>
					<td><a href="javascript:popup('popup_unit.php?unit={$unit_dbname}', 520, 520)"> <img src="graphic/unit/{$unit_dbname}.png" alt="" /> {$name}</a>{if $name=="Nobre"}<div class="fuck_menu">(Conquistador)</div>{/if}</td>
					<td><img src="graphic/holz.png" title="Madeira" alt="" /> {$cl_units->get_woodprice($unit_dbname)}</td>
					<td><img src="graphic/lehm.png" title="Argila" alt="" /> {$cl_units->get_stoneprice($unit_dbname)}</td>
					<td><img src="graphic/eisen.png" title="Ferro" alt="" /> {$cl_units->get_ironprice($unit_dbname)}</td>
					<td><img src="graphic/face.png" title="População" alt="" /> {$cl_units->get_bhprice($unit_dbname)}</td>
					<td>{$cl_units->get_time($village.$dbname,$unit_dbname)|format_time}</td>
					<td>{$units_in_village.$unit_dbname}/{$units_all.$unit_dbname}</td>

					{$cl_units->check_needed($unit_dbname,$village)}
					{if $cl_units->last_error==not_tec}
					    <td class="inactive">Unidade não pesquisada</td>
					{elseif $cl_units->last_error==not_needed}
					    <td class="inactive">Requerimentos nao atingidos.</td>ã
					{elseif $cl_units->last_error==build_ah}
					    <td class="inactive">Academia não pode prover mais unidades.</td>
					{elseif $cl_units->last_error==not_enough_ress}
					    <td class="inactive">Não ha recursos disponiveis</td>
					{elseif $cl_units->last_error==not_enough_bh}
					    <td class="inactive">A fazenda não pode mais prover unidades</td>
					{else}
						<td><a href="game.php?h={$hkey}&amp;action=train_snob&amp;screen=snob&amp;village={$village.id}">Recrutar Unidade</a></td>
					{/if}
				</tr>
			{/foreach}


		</table>
		<br />
		{if $ag_style==0}
			<h4 class="aniver">Quantidade de nobres que você ainda pode gerar para esta aldeia</h4>
			<table class="vis">
			<tr><td>Nivel da academia:</td><td>{$village.snob}</td></tr>
			<tr><td>- Aldeias dominasdas por esta aldeia:</td><td>{$village.control_villages}</td></tr>
			<tr><td>- Nobres existentes nessa aldeia:</td><td>{$village.recruited_snobs}</td></tr>
			<tr><th>Ainda podem ser produzidos:</th><th>{$village.snob-$village.control_villages-$village.recruited_snobs}</th></tr>
			</table>
		{elseif $ag_style==1}
			<h4 class="fonte6">Quantidade de nobres que você ainda pode gerar</h4>
			<table class="vis">
			<tr><td class="cororido2">Soma das academias:</td><td class="cororido">{$village.snob_info.stage_snobs}</td></tr>
			<tr><td class="cororido2">- Nobres prontos:</td><td class="cororido">{$village.snob_info.all_snobs}</td></tr>
			<tr><td class="cororido2">- Nobres em produção:</td><td class="cororido">{$village.snob_info.ags_in_prod}</td></tr>
			<tr><td class="cororido2">- Número de aldeias conquistadas:</td><td class="cororido">{$village.snob_info.control_villages}</td></tr>
			<tr><th class="fonte6maior">Ainda podem ser produzidos:</th><th class="cororido2">{$village.snob_info.can_prod}</th></tr>
			</table>
		{/if}
{/if}

{* Beherschte villages *}
{if count($snobed_villages)>0}
	<br /><br />
	<table class="vis" width="300">
		<tr>
			<th class="aniver">Aldeias Conquistadas</th>
		</tr>
		{foreach from=$snobed_villages key=id item=villagename}
			<tr>
				<td>
					<a href="game.php?village={$village.id}&amp;screen=info_village&amp;id={$id}">{$villagename}</a>
				</td>
			</tr>
		{/foreach}
	</table>
{/if}