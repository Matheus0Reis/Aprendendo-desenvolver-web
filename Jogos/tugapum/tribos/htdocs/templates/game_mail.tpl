<h2>Mensagens</h2>
{if $error == "Betreff muss mindestens zwei Zeichen lang sein!"}
	<div style="color:red; font-size:large">A Mensagem Deve Conter Um Assunto !</div>
{elseif $error == "Text muss mindestens drei Zeichen lang sein!"}
	<div style="color:red; font-size:large">A Mensagem Deve Conter No Minimo 3 Caracteres !</div>
{elseif $error == "Du musst mindestens einen Empfänger angeben."}
	<div style="color:red; font-size:large">A Mensagem Deve Conter Um Destinatário !</div>
{elseif $error == "Spieler nicht vorhanden"}
	<div style="color:red; font-size:large">Jogados Não Encontrado !</div>
{elseif $error == "Du kannst dich nicht selber blockieren"}
	<div style="color:red; font-size:large">Você Não Pode Se Bloquear !</div>
{elseif $error == "Absender bereits blockiert"}
	<div style="color:red; font-size:large">Jogador Já Bloqueado !</div>
{elseif !empty($error)}
	<div style="color:red; font-size:large">{$error}</div>
{/if}
<table><tr><td valign="top" width="100">
	<table class="vis" width="100%">
		{foreach from=$links item=f_mode key=f_name}
			{if $f_mode==$mode}
				<tr>
					<td class="selected" width="120">
						<a href="game.php?village={$village.id}&amp;screen=mail&amp;mode={$f_mode}">{if $f_mode==in}Entrada{/if}{if $f_mode==out}Saída{/if}{if $f_mode==arch}Arquivo{/if}{if $f_mode=="new"}Escrever Mensagem{/if}{if $f_mode==block}Bloquear Remetente{/if}</a>
					</td>
				</tr>
			{else}
                <tr>
                    <td width="120">
						<a href="game.php?village={$village.id}&amp;screen=mail&amp;mode={$f_mode}">{if $f_mode==in}Entrada{/if}{if $f_mode==out}Saída{/if}{if $f_mode==arch}Arquivo{/if}{if $f_mode=="new"}Escrever Mensagem{/if}{if $f_mode==block}Bloquear Remetente{/if}</a>
					</td>
				</tr>
			{/if}
		{/foreach}
	</table>
	
</td><td valign="top" width="*">
	{if in_array($mode,$allow_mods)}
		{include file="game_mail_$mode.tpl" title=foo}
	{/if}
</td></tr></table>
