<h2>Pagina Inicial e Anúncios</h2>

{if !empty($error)}
	<font class="error">{$error}</font><br /><br />
{/if}

<form method="POST" action="index.php?screen=startpage&action=add" onSubmit="this.submit.disabled=true;">
	<table class="vis" width="450">
		<tr>
			<th colspan="2">Anúncios Postados</th>
		</tr>
		<tr>
			<td width="50">Texto:</td>
			<td><textarea cols="45" rows="3" name="text"></textarea></td>
		</tr>
		<tr>
			<td>Link:</td>
			<td><input type="text" name="link" size="70"></td>
		</tr>
		<tr>
			<td>Grafico:</td>
			<td>
				<table cellspacing="0">
					<tr>
						<td>
							<input type="radio" name="graphic" value="global">
						</td>
						<td width="50">
							<img src="../graphic/minibutton/global.png">
						</td>
						
						<td width="20">
							<input type="radio" name="graphic" value="lan">
						</td>
						<td width="50">
							<img src="../graphic/minibutton/lan.png">
						</td>
					</tr>
				</table>
			</td>	
		</tr>
		<tr>
			<td align="right" colspan="2"><input type="submit" name="submit" value="Anúnciar"></td>
		</tr>
	</table>
</form>
<br />
<table class="vis" width="450">
	<tr>
		<th colspan="2">Anúncios Postados</th>
	</tr>
	{foreach from=$announcement item=item key=f_id}
		<tr>
			<td><img src="../graphic/minibutton/{$announcement.$f_id.graphic}.png"></td>
			<td width="100%">
				{$announcement.$f_id.text}<br />
				<table width="100%" cellpadding="0" cellspacing="0">
					<tr>
						{if !empty($announcement.$f_id.link)}
							<td align="left" style="font-size: xx-small;"><a href="{$announcement.$f_id.link}">&raquo; Link</a></td>
						{/if}
						<td align="right" style="font-size: xx-small;">{$announcement.$f_id.time}</td>
					</tr>
				</table>
			</td>
			<td><a href="index.php?screen=startpage&action=drop&id={$announcement.$f_id.id}">Apagar</td>
		</tr>
	{/foreach}
</table>
<br /><br />
<form method="POST" action="index.php?screen=startpage&action=locked_login">
<table class="vis">
	<tr>
		<th colspan="2">Bloquear Acesso</th>
	</tr>
	<tr>
	  <td>
<input type="radio" name="login_locked" value="yes" {if $login.login_locked=='yes'}checked{/if}>Bloqueado
<br>
<input type="radio" name="login_locked" value="no" {if $login.login_locked=='no'}checked{/if}>Debloqueado
<br>
<input type="radio" name="login_locked" value="reset" {if $login.login_locked=='reset'}checked{/if}>Resetar
</td>
	</tr>
	<tr>
		<td align="center" colspan="2"><input type="submit" value="OK"></td>
	</tr>
</table>
</form>