<h2>SALVAR p/ HALL DA FAMA </h2>
Esse comando e utilizado para salvar o ranking antes do reset. N&atilde;o utilize sem autoriza&ccedil;&atilde;o. <br />
<br />

{if !empty($error)}
	<br /><br /><font class="error">{$error}</font><br /><br />
{/if}

{if $is_send}
	Hall da Fama salvo!
{else}
	<form method="post" action="index.php?screen=save_round&amp;action=send" onSubmit="this.submit.disabled=true;">
		<table class="vis">
			<tr>
				<td>Nome  </td>
				<td><input type="text" name="name" size="70" value="{$name}"></td>
			</tr>
			<tr>
				<td>Vencedor</td>
				<td><input type="text" name="start" size="70" value="{$start}"></td>
			</tr>
			<tr>
				<td>Fim:</td>
				<td><input type="text" name="end" size="70" value="{$end}"></td>
			</tr>
			<tr>
				<td>Tribo vencedora </td>
				<td><input type="text" name="description" size="70" value="{$description}"></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" name="submit" value="Salvar"></td>
			</tr>
		</table>
	</form>
{/if}