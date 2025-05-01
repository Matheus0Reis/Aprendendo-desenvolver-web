<h2>Jogador <i>{$info_user.username}</h2></i>

<table><tr><td valign="top">

<table class="vis" width="100%">
	<tr><th colspan="2">{$info_user.username}</th></tr>
	<tr>
	  <td width="110">Pontos:</td>
	  <td>{$info_user.points|format_number}</td>
	</tr>
	<tr>
	  <td>Classifica&ccedil;&atilde;o:</td>
	  <td>{$info_user.rang}<b>.</b></td></tr>
	<tr>
	  <td width="150">Oponentes derrotados: </td>
	  <td>{php} $q01 = mysql_fetch_array(mysql_query("SELECT killed_units_altogether,killed_units_altogether_rank FROM users WHERE id = '".$_GET['id']."'")); echo format_number($q01['0'], 0, '', '.')."  (<B>".$q01['1'].".</b>)";{/php}</td>
	</tr>
	{if empty($info_ally.short)}
	{else}
		<tr>
		  <td>Tribo:</td>
		  <td><a href="game.php?village={$village.id}&amp;screen=info_ally&amp;id={$info_ally.id}">{$info_ally.short}</a></td></tr>
	{/if}

		<tr>
		  <td colspan="2"><a href="game.php?village={$village.id}&amp;screen=mail&amp;mode=new&amp;player={$info_user.id}">&raquo; Escrever uma mensagem </a></td>
		</tr>
		{if $can_invite}
		{if $suma >= $lim} {$limita} {else}
			<tr>
			  <td colspan="2"><a href="javascript:ask('Vrei sa-l inviti pe {$info_user.username} in trib?', 'game.php?village={$village.id}&screen=ally&mode=invite&action=invite_id&id={$info_user.id}&h={$hkey}')">&raquo; Convidar para a tribo </a></td>
			</tr>
			{/if}
		{/if}
		
	</table>



<table class="vis" width="100%">
	<tr>
	  <th width="180">Aldeias</th>
	  <th width="80">Coordenadas</th>
	  <th>Pontos</th>
	</tr>
		{foreach from=$villages item=arr key=id}
			<tr><td><a href="game.php?village={$village.id}&amp;screen=info_village&amp;id={$id}">{$arr.name}</a></td><td><center><b>(</b>{$arr.x}|{$arr.y}<b>)</b></center></td><td><center>{$arr.points|format_number}</center></td></tr>
		{/foreach}
	</table>


</td><td align="right" valign="top" width="240">

	
<table class="vis" width="470">
	<tr>
	  <th colspan="2">Perfil</th>
	</tr>
	{if !empty($info_user.image)}
		<tr><td colspan="2" align="center"><img src="graphic/player/{$info_user.image}" alt="Imagem do perfil" /></td></tr>
	{/if}
	{if $age!=-1}
		<tr>
		  <td>Idade:</td>
		  <td>{$age}</td></tr>
	{/if}
	{if $sex!=-1}
		<tr>
		  <td>Sexo:</td>
		  <td>
{php}
$data_terminaree=$this->_tpl_vars['sex'];
$data_terminaree = str_replace("weiblich","feminino",$data_terminaree);
$data_terminaree = str_replace("männlich","masculino",$data_terminaree);
//Variabila originala tpl: {$sex}

echo $data_terminaree;
{/php}
</td></tr>
	{/if}
	{if $info_user.home!=''}
		<tr>
		  <td>Localiza&ccedil;&atilde;o:</td>
		  <td>{$info_user.home}</td></tr>
	{/if}
			
	</table>
	<br />
	{if !empty($info_user.personal_text)}
		<table class="vis" width="100%">
			<tr>
			  <th>Texto pessoal </th>
			</tr>
			<tr><td align="center">{php} echo bb_format($this->_tpl_vars['info_user']['personal_text']); {/php}</td></tr>
		</table>
	{/if}
		
</td></tr></table>
