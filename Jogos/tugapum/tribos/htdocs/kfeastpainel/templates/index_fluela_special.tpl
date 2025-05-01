<h2>Criar Aldeias de Barbaros </h2>

<a href="index.php?screen=fluela_special" />Criar uma aldeia   - <a href="index.php?screen=fluela_special&action=editmes" />Listar/Editar Aldeias de Barbaros </a></a> - <a href="index.php?screen=refugee_camp" /> Apagar Aldeias </a>
<br />
<br />
{if !empty($error)}
	<font class="error">{$error}</font><br /><br />
{/if}
{if !empty($new_version)}
	{$new_version}<br /><br />
{else}
{if $aktion == "create"}
{if $success}
	Aldeia de Barbaros criada/editada com sucesso!{else}
	<form method="POST" action="index.php?screen=fluela_special&action=creater" name="dorf" onSubmit="this.submit.disabled=true;">
		<table class="vis">
			<tr>
				<th colspan="2">Criar aldeias de barbaros </th>
			</tr>
			<tr>
				<td width="350">Criar quantas aldeias? <br />
				  (maximo 250 e minimo 1)</td>
				<td><input type="text" name="num" value="0"></td>
			</tr>
			<tr><td>
			<table class="vis">
				<tr>
				<td>
				<table class="vis">
					<tr>
					<th>Constru&ccedil;&otilde;es</th>
					<th>Niveis</th>
					</tr>
					{foreach from=$buildings item=arr key=dbname}
						<tr>
							<td><img src="../graphic/buildings/{$dbname}.png"> {$arr.name}:</td>
							<td><input type="text" size="4" name="{$dbname}" value="{$arr.std_lvl}"></td>
						</tr>
					{/foreach}
				</table>
			</table>
			</td><td valign="top"><table class="vis" valign="top">
		<tr>
		<th>Unidades</th>
		<th>Qntd</th>
		</tr>
		{foreach from=$units item=arr key=dbname}
			<tr>
				<td><img src="../graphic/unit/{$dbname}.png"> {$arr.name}:</td>
				<td><input type="text" size="5" name="{$dbname}" value="{$arr.std_einheiten}"></td>
			</tr>
		{/foreach}</table>
		</td></tr>
		<tr>
		<td colspan="2"><b>Outras Op&ccedil;oes:</b> <input type="checkbox" name="barbar" id="aX_barbar" value="yes" onChange="barbarendorf()"/>
		  <label for="aX_barbar">Aldeia sem tropa </label></td>
		</tr>
			<tr>
				<td colspan="2"><input type="hidden" name="welche_akt" value="Erstellen" /><input type="submit" name="submit" value="Criar" onload="this.disabled=false;"> O Processo <u>pode</u> levar alguns segundos!</td>
			</tr>

		</table>
	</form>
	<script type="text/javascript" src="templates/fluela_special.js"></script>
{/if}
{elseif $edit_output != ""}
{$edit_output}
{elseif $aktion == "edit"}
<form method="POST" action="index.php?screen=fluela_special&action=creater" onSubmit="this.submit.disabled=true;">
		<table class="vis">
			<tr>
				<th colspan="2">Aldeia ID #{$id} de barbaros</th>
			</tr>
			<tr>
				<td colspan="2"><b>ID:</b> #{$id}<br /><b>Coordenadas:</b> {$xy}<br /><b>Pontos:</b> {$points}</td>
			</tr>
						<tr><td>
			<table class="vis">
				<tr>
				<td>
				<table class="vis">
					<tr>
					<th>Construção</th><th>Nivel</th>
					</tr>
					{foreach from=$buildings item=arr key=dbname}
						<tr>
							<td><img src="../graphic/buildings/{$dbname}.png"> {$arr.name}:</td>
							<td><input type="text" size="4" name="{$dbname}" value="{$arr.std_lvl}"></td>
						</tr>
					{/foreach}
				</table>
			</table>
			</td><td valign="top"><table class="vis" valign="top">
		<tr>
		<th>Tropas</th><th>Qtde</th>
		</tr>
		{foreach from=$units item=arr key=dbname}
			<tr>
				<td><img src="../graphic/unit/{$dbname}.png"> {$arr.name}:</td>
				<td><input type="text" size="5" name="{$dbname}" value="{$arr.std_einheiten}"></td>
			</tr>
		{/foreach}</table>
		</td></tr>
		<tr>
		<td colspan="2"><b>Outras opçoes:</b> <input type="checkbox" name="barbar" id="aX_barbar" value="yes" onChange="barbarendorf()"/><label for="aX_barbar">Aldeias Vazias</label></td>
		</tr>
			<tr>
				<td colspan="2"><input type="hidden" name="vid" value="{$id}" /><input type="hidden" name="welche_akt" value="Editar" /><input type="submit" name="submit" value="Editar" onload="this.disabled=false;"></td>
			</tr>

		</table>
</form>
	<script type="text/javascript" src="templates/fluela_special.js"></script>
	<script type="text/javascript">{$dowhattodo}</script>
{/if}
{/if}