{if empty($view)}
	<form action="game.php?village={$village.id}&amp;screen=mail&amp;mode=in&amp;action=del_arch&amp;h={$hkey}" method="post">
	
	<table class="vis">
	{if $num_pages>1}
		<tr>
			<td align="center" colspan="3">
				{section name=countpage start=1 loop=$num_pages+1 step=1}
					{if $site==$smarty.section.countpage.index}
						<strong> &gt;{$smarty.section.countpage.index}&lt; </strong>
					{else}
						<a href="game.php?village={$village.id}&amp;screen=mail&amp;mode=in&amp;site={$smarty.section.countpage.index}"> [{$smarty.section.countpage.index}] </a>
					{/if}
				{/section}
			</td>
		</tr>
	{/if}
	<tr><th>Assunto</th><th width="160">Remetente</th><th width="140">Recebido em</th></tr>
	
		{foreach from=$mails item=arr key=id}
			<tr>
				<td><input name="id_{$id}" type="checkbox" /><a href="game.php?village={$village.id}&amp;screen=mail&amp;mode=in&amp;view={$id}">{$arr.subject|replace:"Re:":""|replace:"Willkommen bei":"Bem Vindo � tribo"}</a>{if $arr.is_read==0} <span class="fonte5">(novo)</span>{/if}{if $arr.is_answered==1} <span class="fuck_menu"> (respondido)</span>{/if}{if $arr.is_read!=0 and $arr.is_answered==0} <span class="fuck_menu">(lido)</span>{/if}</td>
				<td>{if $arr.from_id==-1}{$arr.from_username|replace:"System":"AddictGames"|replace:"Stamm":"Tribo"}{else}<a href="game.php?village={$village.id}&amp;screen=info_player&amp;id={$arr.from_id}">{$arr.from_username}</a>{/if}</td>
				<td>{$arr.time}</td>
			</tr>
		{/foreach}
		{if count($mails)>0}
			<tr><th><input name="all" type="checkbox" onclick="selectAll(this.form, this.checked)">selecionar todas</th><th colspan="2"></th></tr>
		{/if}
	</table>
	
		<table align="left"><tr>
		<td><input type="submit" value="Apagar" name="del" /></td>
		<td><input type="submit" value="Arquivar" name="arch" /></td>
		</tr></table>
	
	</form>
{else}
	{if empty($error)}
		<table align="center" class="vis"><tr>
		<td align="center" width="120">{if $mail.from_id==-1}Responder{else}<a href="game.php?village={$village.id}&amp;screen=mail&amp;mode=new&amp;reply={$mail.id}">Responder</a>{/if}</td>
		<td align="center" width="25%"><a href="game.php?village={$village.id}&amp;screen=mail&amp;mode=new&amp;reply={$mail.id}&amp;forward=true">Encaminhar</a></td>
		<td align="center" width="25%"><a href="game.php?village={$village.id}&amp;screen=mail&amp;mode=arch">Arquivo</a></td>
		<td align="center" width="25%"><a href="game.php?village={$village.id}&amp;screen=mail&amp;action=del&amp;id={$mail.id}&amp;mode=arch&amp;h={$hkey}">Apagar</a></td>
		</tr>
		</table>
		
		<table class="vis" width="100%">
		<tr><th width="140">Assunto</th><th width="300">{$mail.subject|replace:"Re:":""|replace:"Willkommen bei":"Bem Vindo � tribo"}</th></tr>
		<tr><td>De:</td><td>{if $mail.from_id==-1}{$mail.from_username|replace:"System":"SpeeDGameS"|replace:"Stamm":"Tribo"}{else}<a href="game.php?village={$village.id}&amp;screen=info_player&amp;id={$mail.from_id}">{$mail.from_username}</a>{/if}</td></tr>
		<tr><td>Para</td><td><a href="game.php?village={$village.id}&amp;screen=info_player&amp;id={$mail.to_id}">{$mail.to_username}</a></td></tr>
		<tr><td>Recebido em</td><td>{$mail.time}</td></tr>
		</table>
		
		<table class="vis" width="100%">
		<tr><td colspan="2" valign="top" height="160" style="background-color: white; border: solid 1px black;">
		{php} echo bb_format($this->_tpl_vars['mail']['text']); {/php}
		</td></tr>
		</table>
		
		<table align="center" class="vis"><tr>
		<td align="center" width="120">{if $mail.from_id==-1}Responder{else}<a href="game.php?village={$village.id}&amp;screen=mail&amp;mode=new&amp;reply={$mail.id}">Responder</a>{/if}</td>
		<td align="center" width="25%"><a href="game.php?village={$village.id}&amp;screen=mail&amp;mode=new&amp;reply={$mail.id}&amp;forward=true">Encaminhar</a></td>
		<td align="center" width="25%"><a href="game.php?village={$village.id}&amp;screen=mail&amp;mode=arch">Arquivo</a></td>
		<td align="center" width="25%"><a href="game.php?village={$village.id}&amp;screen=mail&amp;action=del&amp;id={$mail.id}&amp;mode=arch&amp;h={$hkey}">Apagar</a></td>
		</tr>
		</table><br />
		
		<table width="100%" align="center" class="vis"><tr>
		<td align="center">{if $mail.from_id==-1}Impossivel Bloquear{else}<a href="game.php?village={$village.id}&amp;screen=mail&amp;mode=block&amp;action=block_id&amp;id={$mail.from_id}&amp;h={$hkey}">Bloquear Remetente</a>{/if}</td>
		</tr>
		</table><br />
	{/if}
{/if}