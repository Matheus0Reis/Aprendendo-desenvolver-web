{if empty($view)}
	<form action="game.php?village={$village.id}&amp;screen=mail&amp;mode=out&amp;action=del_arch&amp;h={$hkey}" method="post">
	
	<table class="vis">
	{if $num_pages>1}
		<tr>
			<td align="center" colspan="3">
				{section name=countpage start=1 loop=$num_pages+1 step=1}
					{if $site==$smarty.section.countpage.index}
						<strong> &gt;{$smarty.section.countpage.index}&lt; </strong>
					{else}
						<a href="game.php?village={$village.id}&amp;screen=mail&amp;mode=out&amp;site={$smarty.section.countpage.index}"> [{$smarty.section.countpage.index}] </a>
					{/if}
				{/section}
			</td>
		</tr>
	{/if}
	<tr><th>Betreff</th><th width="160">Empf�nger</th><th width="140">Gesendet</th></tr>
	
		{foreach from=$mails item=arr key=id}
			<tr>
				<td><input name="id_{$id}" type="checkbox" /><a href="game.php?village={$village.id}&amp;screen=mail&amp;mode=out&amp;view={$id}">{$arr.subject}</a></td>
				<td><a href="game.php?village={$village.id}&amp;screen=info_player&amp;id={$arr.to_id}">{$arr.to_username}</a>{if $arr.is_read==0} (nicht gelesen){/if}</td>
				<td>{$arr.time}</td>
			</tr>
		{/foreach}
		{if count($mails)>0}
			<tr><th><input name="all" type="checkbox" onclick="selectAll(this.form, this.checked)">alle ausw�hlen</th><th colspan="2"></th></tr>
		{/if}
	</table>
	
		<table align="left"><tr>
		<td><input type="submit" value="L�schen" name="del" /></td>
		<td><input type="submit" value="Archivieren" name="arch" /></td>
		</tr></table>
	
	</form>
{else}
	{if empty($error)}
		<table align="center" class="vis"><tr>
		<td align="center" width="120"><a href="game.php?village={$village.id}&amp;screen=mail&amp;mode=new&amp;reply={$mail.id}&amp;type=out">Antworten</a></td>
		<td align="center" width="25%"><a href="game.php?village={$village.id}&amp;screen=mail&amp;mode=new&amp;reply={$mail.id}&amp;type=out&amp;forward=true">Weiterleiten</a></td>
		<td align="center" width="25%"><a href="game.php?village={$village.id}&amp;screen=mail&amp;action=arch&amp;id={$mail.id}&amp;mode=out&amp;h={$hkey}">Archivieren</a></td>
		<td align="center" width="25%"><a href="game.php?village={$village.id}&amp;screen=mail&amp;action=del&amp;id={$mail.id}&amp;mode=out&amp;h={$hkey}">L�schen</a></td>
		</tr>
		</table>
		
		<table class="vis" width="100%">
		<tr><th width="140">Betreff</th><th width="300">{$mail.subject}</th></tr>
		<tr><td>Absender</td><td><a href="game.php?village={$village.id}&amp;screen=info_player&amp;id={$mail.from_id}">{$mail.from_username}</a></td></tr>
		<tr><td>Empf�nger</td><td><a href="game.php?village={$village.id}&amp;screen=info_player&amp;id={$mail.to_id}">{$mail.to_username}</a></td></tr>
		<tr><td>Gesendet</td><td>{$mail.time}</td></tr>
		</table>
		
		<table class="vis" width="100%">
		<tr><td colspan="2" valign="top" height="160" style="background-color: white; border: solid 1px black;">
		{$mail.text}
		</td></tr>
		</table>
		
		<table align="center" class="vis"><tr>
		<td align="center" width="120"><a href="game.php?village={$village.id}&amp;screen=mail&amp;mode=new&amp;reply={$mail.id}&amp;type=out">Antworten</a></td>
		<td align="center" width="25%"><a href="game.php?village={$village.id}&amp;screen=mail&amp;mode=new&amp;reply={$mail.id}&amp;type=out&amp;forward=true">Weiterleiten</a></td>
		<td align="center" width="25%"><a href="game.php?village={$village.id}&amp;screen=mail&amp;action=arch&amp;id={$mail.id}&amp;mode=out&amp;h={$hkey}">Archivieren</a></td>
		<td align="center" width="25%"><a href="game.php?village={$village.id}&amp;screen=mail&amp;action=del&amp;id={$mail.id}&amp;mode=out&amp;h={$hkey}">L�schen</a></td>
		</tr>
		</table><br />
		
		<table width="100%" align="center" class="vis"><tr>
		<td align="center"><a href="game.php?village={$village.id}&amp;screen=mail&amp;mode=block&amp;action=block_id&amp;id={$mail.to_id}&amp;h={$hkey}">Empf�nger blockieren</a></td>
		</tr>
		</table><br />
	{/if}
{/if}