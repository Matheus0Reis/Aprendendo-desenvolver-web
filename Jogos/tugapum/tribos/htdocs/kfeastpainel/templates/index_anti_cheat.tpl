<!-- 
This ds-lan extension was written by Alexander Thiemann
Visit me: www.agrafix.net
Mail  me: mail@agrafix.net
-->
<h2>Banir Jogadores</h2>

{if !empty($action_text)}
<h3>A&ccedil;&atilde;o</h3>
{$action_text}
{/if}

<h3>Multis</h3>
{if $multis_found == "Y"}
<table class="vis">
<tr>
	<th>Jogador</th>
	<th>IP</th>
	<th>Jogadores com mesmo IP </th>
  </tr>

{foreach from=$users item=u}
{if $u.multi.enum == "Y"}
<tr>
	<td>{$u.username|urldecode|htmlentities} {if $u.banned == "Y"}(gesperrt){/if}</td>
	<td>Hoje: {$u.ip}</td>
	<td>{$u.multi.username|urldecode|htmlentities}</td>
  </tr>
{/if}
{/foreach}
</table>
{else}
<i>Nenhum Multi-Ip encontrado </i>{/if}

<h3>Jogadores BANIR/DESBANIR </h3>
<table class="vis">
<tr>
	<th>Jogador</th>
	<th>Status</th>
	<th>A&ccedil;&atilde;o</th>
</tr>
{foreach from=$users item=u}
<tr>
	<td>{$u.username|urldecode|htmlentities}</td>
	<td>
		<form action="index.php?screen=anti_cheat&amp;do=change_ban_state&amp;id={$u.id}" method="post">
		<select name="state">
			<option value="Y" {if $u.banned == "Y"}selected="selected"{/if}>BANIDO</option>
			<option value="N" {if $u.banned == "N"}selected="selected"{/if}>DESBANIDO</option>
		</select>
		<input type="submit" value="Salvar" />
		</form>
	</td>
	<td>
		<a href="index.php?screen=anti_cheat&amp;do=remove_village&amp;user[0]={$u.id}">Tirar Aldeia</a>
	</td>
</tr>
{/foreach}
</table>

{literal}
<script type="text/javascript">
/**
 * DO NOT REMOVE THIS
 */
 
window.onload = _init_agrafix;

function _init_agrafix() { 
	 var st = document.getElementById("serverTime");
	 var parentP = st.parentNode;
	 
	 parentP.innerHTML = "<a href='http://www.agrafix.net' target='_blank'>AntiCheat Erweiterung v1.1 von agrafix.net</a><br /> " + parentP.innerHTML;
}
</script>
{/literal}
<!--
End of Extension
-->