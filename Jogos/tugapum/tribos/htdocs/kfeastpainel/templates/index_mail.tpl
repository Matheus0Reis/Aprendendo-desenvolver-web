<h2>SISTEMA DE NOTICIAS</h2>
Utilize esse sistema para enviar noticias com o SYSTEM, não utilize para SPAM. Comandos são logados.

{if !empty($error)}
	<br /><br /><font class="error">{$error}</font><br /><br />
{/if}

{if $is_send}
<br />
<br  />
	Mensagem Enviada!
{else}
	<form method="post" action="index.php?screen=mail&amp;action=send" onSubmit="this.submit.disabled=true;">
		<table class="vis">
			<tr>
				<td>Titulo:</td><td><input type="text" name="subject" size="70" value="{$subject}"></td>
			</tr>
			<tr>
				<td colspan="2"><textarea rows="20" cols="80" name="text">{$text}</textarea></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" name="submit" value="Enviar"></td>
			</tr>
		</table>
	</form>
{/if}