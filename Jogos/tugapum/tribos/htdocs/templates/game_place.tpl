<table>
	<tr>
		<td>
			<img src="graphic/big_buildings/place.png" title="Praça central" alt="" />
		</td>
		<td>
			<h2>Pra&ccedil;a central ({php}
$data_terminaree=(is_array($_tmp=$this->_tpl_vars['village']['place'])) ? $this->_run_mod_handler('stage', true, $_tmp) : stage($_tmp);
$data_terminaree = str_replace("Stufe","Nivel",$data_terminaree);
//Variabila originala tpl: {$village.place|stage}

echo $data_terminaree;
{/php})</h2>
			{$description}
		</td>
	</tr>
</table>
<br />
{if $show_build}

	<table width="100%"><tr><td valign="top" width="100">
	<table class="vis" width="100%">
		{foreach from=$links item=f_mode key=f_name}
         {if $f_name=='Befehl'}
            {assign var='f_name' value='Comenzi'}
         {/if}
         {if $f_name=='Truppen'}
            {assign var='f_name' value='Trupe'}
         {/if}

			{if $f_mode==$mode}
				<tr>
					<td class="selected" width="120">
						<a href="game.php?village={$village.id}&amp;screen=place&amp;mode={$f_mode}">{$f_name}</a>
					</td>
				</tr>
			{else}
                <tr>
                    <td width="120">
						<a href="game.php?village={$village.id}&amp;screen=place&amp;mode={$f_mode}">{$f_name}</a>
					</td>
				</tr>
			{/if}
		{/foreach}
	</table>
	
	</td><td valign="top" width="*">
		{if in_array($mode,$allow_mods)}
			{include file="game_place_$mode.tpl" title=foo}
		{/if}
	</td></tr></table>


{/if}