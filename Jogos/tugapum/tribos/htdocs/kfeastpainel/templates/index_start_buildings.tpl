<h2>Niveis iniciais da aldeia </h2>
Configure aqui, o nivel que cada constru&ccedil;&atilde;o iniciar&aacute;. <br /> 
{if !empty($error)}
	<br />
	<br /><font class="error">{$error}</font><br />
{/if}
<form method="post" action="index.php?screen=start_buildings&action=edit">
	<table class="vis">
		<tr>
			<th>Constru&ccedil;&atilde;o</th>
			<th>Nivel</th>
		</tr>
		{foreach from=$buildings item=arr key=dbname}
			<tr>
				<td><img src="../graphic/buildings/{$dbname}.png"> {$arr.name}:</td>
				<td><input type="text" size="4" name="{$dbname}" value="{$arr.stage}"></td>
			</tr>
		{/foreach}
		<tr>
			<td colspan="2" align="center"><input name="standard" type="submit" value="Niveis Padrão"> <input type="submit" value="Salvar"></td>
		</tr>
	</table>
</form>