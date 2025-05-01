<form action="game.php?village={$village.id}&amp;screen=ally&amp;mode=members&amp;action=mod&amp;h={$hkey}" method="post">
<table class="vis">
<tr>
  <th width="280">Jogador</th>
  <th width="40">Classifica&ccedil;&atilde;o</th>
  <th width="80">Pontos</th>
  <th width="40">Aldeias</th>
  {if $user.ally_lead==1 || $user.ally_found==1}
	  <th><img src="graphic/ally_rights/found.png" alt="Intemeietor" title="Duque" /></th>
	  <th><img src="graphic/ally_rights/lead.png" alt="Conducere" title="Barão" /></th>
	  <th><img src="graphic/ally_rights/invite.png" alt="Invitatii" title="Convidar" /></th>
	  <th><img src="graphic/ally_rights/diplomacy.png" alt="Diplomatie" title="Diplomatica" /></th>
	  <th><img src="graphic/ally_rights/mass_mail.png" alt="Circulare" title="Circular" /></th>
	  <th>Modo de f&eacute;rias </th>
  {/if}
</tr>

    {foreach from=$members item=arr key=id}
		<tr {if $id==$user.id}class="lit"{/if}>
			<td>
				{if $user.ally_lead==1 || $user.ally_found==1}<input type="radio" name="player_id" value="{$id}" />	{foreach from=$arr.icons item=graphic}<img src="graphic/stat/{$graphic}.png" title="" alt="" /> {/foreach}{/if}<a href="game.php?village={$village.id}&amp;screen=info_player&amp;id={$id}">{$arr.username}</a>{if !empty($arr.ally_titel)}({$arr.ally_titel}){/if}
			</td>
			<td>{$arr.rank}</td>
			<td>{$arr.points}</td>
			<td>{$arr.villages}</td>
			{if $user.ally_lead==1 || $user.ally_found==1}
				<td>{if $arr.ally_found==1}<img src="graphic/dots/green.png" alt="Da" />{else}<img src="graphic/dots/grey.png" alt="Nu" />{/if}</td>
				<td>{if $arr.ally_lead==1}<img src="graphic/dots/green.png" alt="Da" />{else}<img src="graphic/dots/grey.png" alt="Nu" />{/if}</td>
				<td>{if $arr.ally_invite==1}<img src="graphic/dots/green.png" alt="Da" />{else}<img src="graphic/dots/grey.png" alt="Nu" />{/if}</td>
				<td>{if $arr.ally_diplomacy==1}<img src="graphic/dots/green.png" alt="Da" />{else}<img src="graphic/dots/grey.png" alt="Nu" />{/if}</td>
				<td>{if $arr.ally_mass_mail==1}<img src="graphic/dots/green.png" alt="Da" />{else}<img src="graphic/dots/grey.png" alt="Nu" />{/if}</td>
				<td>{if !empty($arr.vacation_id)}<a href="game.php?village={$village.id}&amp;screen=info_player&amp;id={$arr.vacation_id}">{$arr.vacation_name|urldecode}</a>{/if}</td>
			{/if}
		</tr>
 {/foreach}

</table>
{if $user.ally_lead==1 || $user.ally_found==1}
	<select name="action"><option label="Selecionar ação" value="">Selecionar ação</option>
	<option label="Dar permissões e títulos" value="rights">Permissões e títulos</option>
	<option label="Expulsar" value="kick">Expulsar</option>
	</select>
	<input type="submit" value="OK" />
{/if}
</form>

{if $user.ally_lead==1 || $user.ally_found==1}
	<br />

	<table class="vis">
	<tr><th>Status</th></tr>
	<tr><td><img src="graphic/stat/green.png" alt="" /> Ativo</td></tr>
	<tr><td><img src="graphic/stat/yellow.png" alt="" /> Inativo a 2 dias</td></tr>
	<tr><td><img src="graphic/stat/red.png" alt="" /> Inativo a 1 semana</td></tr>
	<tr><td><img src="graphic/stat/birthday.png" alt="" /> Aniversário</td></tr>
	<tr><td><img src="graphic/stat/banned.png" alt="" /> Banido</td></tr>
	</table>
{/if}