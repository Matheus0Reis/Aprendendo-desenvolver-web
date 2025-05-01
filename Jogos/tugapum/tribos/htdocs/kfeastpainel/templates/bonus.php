<h1>Aldeias Bonus</h1>
<br>{$status}
<table border="1" width="100%" style="border-collapse: collapse" bordercolor="#000000" bgcolor="#F8F4E8">
	<tr>
		<td width="20%"><b>ID</b></td>
		<td width="20%"><b>Jogador</b></td>
		<td width="20%"><b>Aldeias</b></td>
		<td width="20%"><b>Bonus</b></td>
		<td width="20%"><b>Ação</b></td>
	</tr>
	{foreach from=$villages item=vill}
	<tr>
		<td>{$vill.id}</td>
		<td>{php}echo get_playername($this->_tpl_vars["vill"]["userid"]){/php}</td>
		<td>{$vill.name|replace:"+":" "}</td>
		<td>{if $vill.bonus > "0"}Bonus{else}Não é Bonus{/if}</td>
		<td>{if $vill.bonus > "0"}<a href="?screen=bonus&delete={$vill.id}">Retirar Bonus</a>{else}<a href="?screen=bonus&add={$vill.id}">Conceder Bonus</a>{/if}</td>
	</tr>
	{/foreach}
</table>
<br>
<br>

<h3>Adicionar Aldeias Bonus</h3>

<form action="?screen=bonus&action=newvillages#status" method="post">
Quantidade:<br>
<input type="text" name="anzahl" size="3" maxlength="6">
<br><br>

Bonus:<br>
<select name="bonus">
	<option value="0">Aleatório</option>
	<option value="1">Bonus de 50% no espaço do armazém</option>
	<option value="2">Bonus de 10% no espaço da fazenda</option>
	<option value="3">Bonus de 33% no tempo de produção do estábulo</option>
	<option value="4">Bonus de 33% no tempo de produção da Oficina</option>
	<option value="5">Bonus de 50% no tempo de produção do Quartel</option>
	<option value="6">Bonus de 30% na produção de recursos</option>
</select>
<br><br>

<input type="submit" value="Adicionar">
</form><br>

<a name="status"></a>
{$error}<br>
