<br />
<p> {if $user.ally_diplomacy==0}
Pe Nesta p&aacute;gina as rela&ccedil;&otilde;es com outras tribos podem ser geridas. As rela&ccedil;&otilde;es <strong>n&atilde;o</strong> n&atilde;o s&atilde;o vinculativas no jogo, os membros da sua tribo podem continuar a   atacar e enviar apoio a outros jogadores independentemente do estatuto.   As aldeias das tribos que tem adicionar nesta sec&ccedil;&atilde;o ser&atilde;o coloridas no   mapa. Apenas os membros das tribos sabem as rela&ccedil;&otilde;es diplom&aacute;ticas da   sua tribo, as quais podem ser alteradas apenas pelos Diplomatas.<br>
</p>
<p>{else}Nesta p&aacute;gina as rela&ccedil;&otilde;es com outras tribos podem ser geridas. As rela&ccedil;&otilde;es <strong>n&atilde;o</strong>  s&atilde;o vinculativas no jogo, os membros da sua tribo podem continuar a   atacar e enviar apoio a outros jogadores independentemente do estatuto.   As aldeias das tribos que tem adicionar nesta sec&ccedil;&atilde;o ser&atilde;o coloridas no   mapa. Apenas os membros das tribos sabem as rela&ccedil;&otilde;es diplom&aacute;ticas da   sua tribo, as quais podem ser alteradas apenas pelos Diplomatas.<br>
</p>
{/if}
</p>
<table class="vis" width="300">
<tbody>
<tr>
<th colspan="2">Aliados</th>
</tr>
{foreach from=$contracts.partner item=partner}
<tr>
    <td><a href="game.php?village={$village.id}&screen=info_ally&id={$partner.to_ally}">{php}
$this->_tpl_vars['partner']['short']=urldecode($this->_tpl_vars['partner']['short']);
{/php}{$partner.short}</a></td>
    {if $user.ally_diplomacy==1}<td><a href="game.php?village={$village.id}&screen=ally&mode=contracts&action=cancel_contract&id={$partner.id}&hkey={$hkey}">Terminar</a></td>
    {/if}
</tr>
{/foreach}
</tbody>
</table>
<br />

<table class="vis" width="300">
<tbody>
<tr>
<th colspan="2">Pacto de n&atilde;o agress&atilde;o (PNA)</th>
</tr>
{foreach from=$contracts.nap item=partner}
<tr>
    <td><a href="game.php?village={$village.id}&screen=info_ally&id={$partner.to_ally}">{php}
$this->_tpl_vars['partner']['short']=urldecode($this->_tpl_vars['partner']['short']);
{/php}{$partner.short}</a></td>
    {if $user.ally_diplomacy==1}<td><a href="game.php?village={$village.id}&screen=ally&mode=contracts&action=cancel_contract&id={$partner.id}&hkey={$hkey}">Terminar</a></td>
    {/if}
</tr>
{/foreach}
</tbody>
</table>
<br />

<table class="vis" width="300">
<tbody>
<tr>
<th colspan="2">Inimigos</th>
</tr>
{foreach from=$contracts.enemy item=partner}
<tr>
    <td><a href="game.php?village={$village.id}&screen=info_ally&id={$partner.to_ally}">{php}
$this->_tpl_vars['partner']['short']=urldecode($this->_tpl_vars['partner']['short']);
{/php}{$partner.short}</a></td>
    {if $user.ally_diplomacy==1}<td><a href="game.php?village={$village.id}&screen=ally&mode=contracts&action=cancel_contract&id={$partner.id}&hkey={$hkey}">Terminar</a></td>
    {/if}
</tr>
{/foreach}
</tbody>
</table>


{if $user.ally_diplomacy==1}
<h3>Adicionar rela&ccedil;&atilde;o </h3>
<form method="post" action="game.php?village={$village.id}&screen=ally&mode=contracts&action=add_contract&h=835c">
<table class="vis">
<tr>
<td>
Tag da tribo:
  <input type="text" name="tag"/>
<input type="hidden" name="modificat" value="da"/>
<select name="type">
<option value="partner">Aliados</option>
<option value="nap">Pacto de não agressão (PNA)</option>
<option value="enemy">Inimigos</option>
</select>
<input type="submit" value="OK" />
</form>

</td>
<tr>
</table>
{/if}