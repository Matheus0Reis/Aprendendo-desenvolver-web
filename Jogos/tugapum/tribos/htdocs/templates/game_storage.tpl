<table>
	<tr>
		<td>
			<img src="graphic/big_buildings/storage.png" title="Armazem" alt="" />
		</td>
		<td>
			<h2>Armazem ({$village.storage|stage|replace:"Stufe":"Nivel"})</h2>
			{$description}
		</td>
	</tr>
</table>
<br />
<table class="vis" width="357">
<tr>
		<td width="376">
			Capacidade atual:</td>
  <td>
		<b>{$store_datas.storage_size}</b></td>
</tr>
	
	{if ($store_datas.storage_size_next)==false}

	{else}

		<tr>
			<td>
				Capacidade ao nivel {$village.storage+1}:</td>
			<td>
				<b>{$store_datas.storage_size_next}</b></td>
  </tr>

    {/if}
	{php}
	$asdf = $this->_tpl_vars['village']['storage'];
        $bon = mysql_fetch_array(mysql_query("SELECT bonus FROM villages WHERE id = '".$_GET['village']."'"));
	include("include/config.php");
	if ($bon['bonus'] == '1') { $include = "bonus/max_storage_bonus.php"; } else { $include = "configs/max_storage.php"; }
	include("include/$include");
	
	{/php}
	{php} if ($arr_maxstorage[$asdf+2]) { {/php}
<tr>
			<td>
				Capacidade ao nivel {$village.storage+2}:</td>
			<td>
				<b>{php} echo $arr_maxstorage[$asdf+2]; {/php}</b></td>
  </tr>
{php}} {/php}
{php} if ($arr_maxstorage[$asdf+3]) { {/php}
<tr>
			<td>
				Capacidade ao nivel {$village.storage+3}:</td>
			<td>
				<b>{php} echo $arr_maxstorage[$asdf+3]; {/php}</b></td>
  </tr>
{php}} {/php}
{php} if ($arr_maxstorage[$asdf+4]) { {/php}
<tr>
			<td>
				Capacidade ao nivel {$village.storage+4}:</td>
			<td>
				<b>{php} echo $arr_maxstorage[$asdf+4]; {/php}</b></td>
  </tr>
{php}} {/php}
{php} if ($arr_maxstorage[$asdf+5]) { {/php}
<tr>
			<td>
				Capacidade ao nivel {$village.storage+5}:</td>
			<td>
				<b>{php} echo $arr_maxstorage[$asdf+5]; {/php}</b></td>
  </tr>
{php}} {/php}
</table>
<br />

<table class="vis">
	<tr>
		<th width="150">
			Armazem</th>
		<th>
			Duracao</th>
	</tr>
	{if $wood_sec!=0}
		<tr>
			<td width="250">
				<img src="graphic/holz.png" title="Lemn" alt="" />
				{$wood_sec_date|format_date|replace:"heute um":"ast&#259;zi la"|replace:"Uhr":""}
			</td>
			<td>
				<span class="timer">{$wood_sec|format_time}</span>
			</td>
		</tr>
	{else}
		<tr>
			<td width="250" colspan="2" class="error">
				<img src="graphic/holz.png" title="Bosque" alt="" />
				Armazem esta cheio! Nao pode colher mais recursos.
			</td>
		</tr>
	{/if}
	{if $stone_sec!=0}
		<tr>
			<td width="250">
				<img src="graphic/lehm.png" title="Argila" alt="" />
				{$stone_sec_date|format_date|replace:"Hoje as":"ast&#259;zi la"|replace:"hrs":""}
			</td>
			<td>
				<span class="timer">{$stone_sec|format_time}</span>
			</td>
		</tr>
	{else}
		<tr>
			<td width="250" colspan="2" class="error">
				<img src="graphic/lehm.png" title="Argila" alt="" />
				Armazem esta cheio! Nao pode colher mais recursos.
			</td>
		</tr>
	{/if}
	{if $iron_sec!=0}
		<tr>
			<td width="250">
				<img src="graphic/eisen.png" title="Fier" alt="" />
				{$iron_sec_date|format_date|replace:"heute um":"ast&#259;zi la"|replace:"Uhr":""}			</td>
	  <td>
				<span class="timer">{$iron_sec|format_time}</span>
			</td>
		</tr>
	{else}
		<tr>
			<td width="250" colspan="2" class="error">
				<img src="graphic/eisen.png" title="Ferro" alt="" />
				Armazem esta cheio! Nao pode colher mais recursos.
			</td>
		</tr>
	{/if}
</table>
