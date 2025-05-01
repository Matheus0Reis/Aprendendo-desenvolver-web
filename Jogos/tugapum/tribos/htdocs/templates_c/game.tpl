{php}
$nume_player=urldecode($this->_tpl_vars['user']['username']);
$nume_sat=$this->_tpl_vars['village']['name'];
if(preg_match('/s Dorf/', $nume_sat)) {
   $this->_tpl_vars['village']['name']="Aldeia de $nume_player";
   $nume_sat=$this->_tpl_vars['village']['name'];
	$id_sat=$this->_tpl_vars['village']['id'];
   mysql_query("UPDATE `villages` set `name`='$nume_sat' where `id`='$id_sat'");
}
{/php}
{php}$this->_tpl_vars['allow_screens'][]="friends";{/php}
{php}$this->_tpl_vars['allow_screens'][]="support";{/php}

<?xml version="1.0"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head> 
<title>{$village.name} ({$village.x}|{$village.y}) - Tribos AddictGames</title>
<link rel="stylesheet" type="text/css" href="stamm.css" /> 
<script src="script.js" type="text/javascript"></script> 
<script src="mootools.js" type="text/javascript"></script> 
<link href="../fonte.css" rel="stylesheet" type="text/css" />
</head>
<body style="margin-top:6px;"> 
<div class="top_background">

{if $user.dyn_menu==1}

	<table class="navi-border" style="margin: 11px auto auto; width: {$user.window_width}px; border-collapse: collapse; text-align: left;">
  <tbody>
  <tr>
  <td>
  <table class="menu nowrap" width="{$user.window_width}">
  <tbody>
	<tr id="menu_row">
	<td><a href="game.php?village={$village.id}&amp;screen=&amp;action=logout&amp;h={$hkey}" target="_top">Sair</a></td>
	<td><a href="game.php?village={$village.id}&amp;screen=support&mode=tickets">Suporte</a></td>
	<td><a href="game.php?village={$village.id}&amp;screen=settings">Configurações</a><br /><table cellspacing="0" width="120"><tr><td><a href="game.php?village={$village.id}&amp;screen=settings&amp;mode=profile">Perfil</a></td></tr><tr><td><a href="game.php?village={$village.id}&amp;screen=settings&amp;mode=vacation">Modo de Férias</a></td></tr><tr><td><a href="game.php?village={$village.id}&amp;screen=settings&amp;mode=logins">Ultimos Logins</a></td></tr><tr><td><a href="game.php?village={$village.id}&amp;screen=settings&amp;mode=change_passwd">Trocar Senha</a></td></tr></table></td>
	<td><a href="game.php?village={$village.id}&amp;screen=ranking">Classificação</a> <b>({$user.rang}.|{$user.points|format_number} P)</b> <br /><table cellspacing="0" width="120"><tr><td><a href="game.php?village={$village.id}&amp;screen=ranking&amp;mode=ally">Tribos</a></td></tr><tr><td><a href="game.php?village={$village.id}&amp;screen=ranking&amp;mode=player">Jogadores</a></td></tr><tr><td><a href="game.php?village={$village.id}&amp;screen=ranking&amp;mode=kill_player">Oponentes Derrotados</a></td></tr></table>
	<td><a href="game.php?village={$village.id}&amp;screen=ally">Tribo</a>{if $user.ally!=-1}<br /><table cellspacing="0" width="120"><tr><td><a href="game.php?village={$village.id}&amp;screen=ally&amp;mode=overview">Visualização geral</a></td></tr><tr><td><a href="game.php?village={$village.id}&amp;screen=ally&amp;mode=profile">Perfil</a></td></tr><tr><td><a href="game.php?village={$village.id}&amp;screen=ally&amp;mode=members">Membros</a></td></tr>{if $user.ally_invite==1}<tr><td><a href="game.php?village={$village.id}&amp;screen=ally&amp;mode=invite">Convites</a></td></tr>{/if}{if $user.ally_diplomacy==1}<tr><td><a href="game.php?village={$village.id}&amp;screen=ally&amp;mode=properties">Propriedades</a></td></tr>{/if}</table>{/if}</td>
	<td><a href="game.php?village={$village.id}&amp;screen=report">{if $user.new_report==1}<img src="graphic/new_report.png" title="Novo Relatório" alt="" />{/if} Relatórios</a><br /><table cellspacing="0" width="120"><tr><td><a href="game.php?village={$village.id}&amp;screen=report&amp;mode=all">Todos os Relatórios</a></td></tr><tr><td><a href="game.php?village={$village.id}&amp;screen=report&amp;mode=attack">Ataque</a></td></tr><tr><td><a href="game.php?village={$village.id}&amp;screen=report&amp;mode=defense">Defesa</a></td></tr><tr><td><a href="game.php?village={$village.id}&amp;screen=report&amp;mode=support">Apoio</a></td></tr><tr><td><a href="game.php?village={$village.id}&amp;screen=report&amp;mode=trade">Mercado</a></td></tr><tr><td><a href="game.php?village={$village.id}&amp;screen=report&amp;mode=other">Outros</a></td></tr></table></td>
	<td><a href="game.php?village={$village.id}&amp;screen=mail">{if $user.new_mail==1}<img src="graphic/new_mail.png" title="Nova Mensagem" alt="" /> {/if} Mensagens</a><br /><table cellspacing="0" width="120"><tr><td><a href="game.php?village={$village.id}&amp;screen=mail&amp;mode=in">Entrada</a></td></tr><tr><td><a href="game.php?village={$village.id}&amp;screen=mail&amp;mode=out">Saída</a></td></tr><tr><td><a href="game.php?village={$village.id}&amp;screen=mail&amp;mode=arch">Arquivo</a></td></tr><tr><td><a href="game.php?village={$village.id}&amp;screen=mail&amp;mode=new">Escrever Mensagem</a></td></tr><tr><td><a href="game.php?village={$village.id}&amp;screen=mail&amp;mode=block">Bloquear Remetente</a></td></tr></table></td>
	<td><a href="game.php?village={$village.id}&amp;screen=memo">Notas</a></td>
	<td><a href="game.php?village={$village.id}&amp;screen=friends">Amigos</a></td>
	</tr>
	</tr>
  </tbody>
  </table>
  </td>
  </tr>
  </tbody>
  </table>
   <center><script type="text/javascript" src="http://www.sponsorads.de/script.php?s=202383"></script></center>
{if $user.show_toolbar==1}
		<table id="quickbar" class="menu nowrap" align="center">
		<tr>
			<td><a href="game.php?village={$village.id}&amp;screen=main" ><img src="graphic/buildings/main.png" alt="" />Edif&iacute;cio principal</a></td>
			<td><a href="game.php?village={$village.id}&amp;screen=barracks" ><img src="graphic/buildings/barracks.png" alt="" />Quartel</a></td>
			<td><a href="game.php?village={$village.id}&amp;screen=stable" ><img src="graphic/buildings/stable.png" alt="" />Est&aacute;bulo</a></td>
			<td><a href="game.php?village={$village.id}&amp;screen=garage" ><img src="graphic/buildings/garage.png" alt="" />Oficina</a></td>
			<td><a href="game.php?village={$village.id}&amp;screen=snob" ><img src="graphic/buildings/snob.png" alt="" />Academia</a></td>
			<td><a href="game.php?village={$village.id}&amp;screen=smith" ><img src="graphic/buildings/smith.png" alt="" />Ferreiro</a></td>
			<td><a href="game.php?village={$village.id}&amp;screen=place" ><img src="graphic/buildings/place.png" alt="" />Pra&ccedil;a central</a></td>
			<td><a href="game.php?village={$village.id}&amp;screen=market" ><img src="graphic/buildings/market.png" alt="" />Mercado</a></td>
		</tr>
		</table>
	{/if}
	
	<hr width="{$user.window_width}" size="2" />
	<table align="center" width="{$user.window_width}" cellspacing="0" style="padding:0px;margin-bottom:4px">
	<tr>
	<td>
	
	
		<table class="menu nowrap" align="left">
		<tr id="menu_row2">
		<td><a href="game.php?village={$village.id}&amp;screen=overview_villages" accesskey="s">Visualização</a><br /><table cellspacing="0" width="120"><tr><td><a href="game.php?village={$village.id}&amp;screen=overview_villages&amp;mode=combined">Combinado</a></td></tr><tr><td><a href="game.php?village={$village.id}&amp;screen=overview_villages&amp;mode=prod">Produção</a></td></tr><tr><td><a href="game.php?village={$village.id}&amp;screen=overview_villages&amp;mode=units">Tropas</a></td></tr><td><a href="game.php?village={$village.id}&amp;screen=overview_villages&amp;mode=commands">Comandos</a></td></tr><td><a href="game.php?village={$village.id}&amp;screen=overview_villages&amp;mode=incomings">Chegando</a></td></tr><td><a href="game.php?village={$village.id}&amp;screen=overview_villages&amp;mode=groups">Grupos</a></td></tr></tr></td></table>
		<td><a href="game.php?village={$village.id}&amp;screen=map">Mapa</a></td>
		<td class="no_hover">
	{if $aktu_group == 0}
		{if $user.villages>1}
			{if !empty($village_array.last)}
				<a href="{$village_array.last_link}" accesskey="a"><img src="graphic/links.png" alt="" /></a> 
			{else}
				<img src="graphic/links2.png" alt="" />
			{/if}
			{if !empty($village_array.next)}
				<a href="{$village_array.next_link}" accesskey="d"><img src="graphic/rechts.png" alt="" /></a> 
			{else}
				<img src="graphic/rechts2.png" alt="" />
			{/if}
		{/if}
	{else}
	 {if $user.villages > 1}
			{if !empty($village_array.last) and $village_in_group == 'true'}
				<a href="{$village_array.last_link}" accesskey="a"><img src="graphic/group_left.png" alt="" /></a> 
			{else}
				<img src="graphic/links2.png" alt="" />
			{/if}
			{if !empty($village_array.next) and $village_in_group == 'true'}
				<a href="{$village_array.next_link}" accesskey="d"><img src="graphic/group_right.png" alt="" /></a> 
			{else}
				<img src="graphic/rechts2.png" alt="" />
			{/if}
			{if $village_in_group != 'true'}
			  <a href="{$village_array.first_link}"><img src="graphic/group_jump.png" alt="" /></a>
      {/if}
		{/if}
	{/if}
		</td>
		<td><a href="game.php?village={$village.id}&amp;screen=overview">{$village.name}</a> <b>({$village.x}|{$village.y}) K{$village.continent}</b></td>
			</tr>
		</table>
		
	</td>
	
	<td align="right"><table cellspacing="0"><tr>
	<td><table class="box" cellspacing="0"><tr>
	<td><a href="game.php?village={$village.id}&amp;screen=wood"><img src="graphic/holz.png" title="Madeira" alt="" /></a></td>
	<td><span id="wood" title="{$wood_per_hour}" {if $village.r_wood==$max_storage}class="warn"{/if}>{$village.r_wood}</span>&nbsp;</td>
	<td><a href="game.php?village={$village.id}&amp;screen=stone"><img src="graphic/lehm.png" title="Argila" alt="" /></a></td>
	<td><span id="stone" title="{$stone_per_hour}" {if $village.r_stone==$max_storage}class="warn"{/if}>{$village.r_stone}</span>&nbsp;</td>
	<td><a href="game.php?village={$village.id}&amp;screen=iron"><img src="graphic/eisen.png" title="Ferro" alt="" /></a></td>
	<td><span id="iron" title="{$iron_per_hour}" {if $village.r_iron==$max_storage}class="warn"{/if}>{$village.r_iron}</span></td>
	<td style="border-left: dotted 1px;">
	&nbsp;<a href="game.php?village={$village.id}&amp;screen=storage"><img src="graphic/res.png" title="Capacidade de Armazenamento" alt="" /></a>
	</td><td id="storage">{$max_storage} </td>
	</tr></table></td>
	
	<td><table class="box" cellspacing="0"><tr>
	<td width="18" height="20" align="center"><a href="game.php?village={$village.id}&amp;screen=farm"><img src="graphic/face.png" title="Trabalhador" alt="" /></a></td>
	<td align="center">{$village.r_bh}/{$max_bh}</td>
	</tr></table></td>

	{if $user.attacks!=0}
		<td><table class="box" cellspacing="0"><tr>
		<td width="60" height="20" align="center"><img src="graphic/unit/att.png" alt="" /> <a href="game.php?village={$village.id}&amp;screen=overview_villages&amp;mode=incomings">({$user.attacks})</a></td>

		</tr></table></td>
	{/if}
	
	</tr></table></td>
	
	</tr></table>
	
	<!--[if IE ]>
	<script type="text/javascript">initMenuList("menu_row");</script>
	<script type="text/javascript">initMenuList("menu_row2");</script>
	<![endif]-->

{else}
	<table class="navi-border" style="margin: 11px auto auto; width: {$user.window_width}px; border-collapse: collapse; text-align: left;">
  <tbody>
  <tr>
  <td>
  <table class="menu nowrap" width="{$user.window_width}">
  <tbody>
	<tr id="menu_row">
	<td><a href="game.php?village={$village.id}&amp;screen=&amp;action=logout&amp;h={$hkey}" target="_top">Sair</a></td>
	<td><a href="game.php?village={$village.id}&amp;screen=support">Suporte</a></td>
	<td><a href="help.php" target="_blank">Ajuda</a></td>
	<td><a href="game.php?village={$village.id}&amp;screen=settings">Configurações</a></td>
	<td><a href="game.php?village={$village.id}&amp;screen=ranking">Classificação</a> <b>({$user.rang}.|{$user.points|format_number} P)</b></td>
	<td><a href="game.php?village={$village.id}&amp;screen=ally">Tribo</a></td>
	<td><a href="game.php?village={$village.id}&amp;screen=report">{if $user.new_report==1}<img src="graphic/new_report.png" title="Novo Relatório" alt="" />{/if} Relatórios</a></td>
	<td><a href="game.php?village={$village.id}&amp;screen=mail">{if $user.new_mail==1}<img src="graphic/new_mail.png" title="Nova Mensagem" alt="" /> {/if} Mensagens</a></td>
	<td><a href="game.php?village={$village.id}&amp;screen=memo">Notas</a></td>
	<td><a href="game.php?village={$village.id}&amp;screen=friends">Amigos</a></td>
	</tr>
	</tr>
  </tbody>
  </table>
  </td>
  </tr>
  </tbody>
  </table>
	
	<hr width="{$user.window_width}" size="2" />
	
	<table align="center" width="{$user.window_width}" cellspacing="0" style="padding:0px;margin-bottom:4px;">
	<tr>
	<td>
	
	
		<table class="menu nowrap" align="left">
		<tr id="menu_row2">
		<td><a href="game.php?village={$village.id}&amp;screen=overview_villages" accesskey="s">Visualização</a></td>
		<td><a href="game.php?village={$village.id}&amp;screen=map">Mapa</a></td>
		<td><a href="game.php?village={$village.id}&amp;screen=overview">{$village.name}</a> <b>({$village.x}|{$village.y}) K{$village.continent}</b></td>
			</tr>
		</table>
		
	</td>
	
	<td align="right"><table cellspacing="0"><tr>
	<td><table class="box" cellspacing="0"><tr>
	<td><a href="game.php?village={$village.id}&amp;screen=wood"><img src="graphic/holz.png" title="Madeira" alt="" /></a></td>
	<td><span id="wood" title="{$wood_per_hour}" {if $village.r_wood==$max_storage}class="warn"{/if}>{$village.r_wood}</span>&nbsp;</td>
	<td><a href="game.php?village={$village.id}&amp;screen=stone"><img src="graphic/lehm.png" title="Argila" alt="" /></a></td>
	<td><span id="stone" title="{$stone_per_hour}" {if $village.r_stone==$max_storage}class="warn"{/if}>{$village.r_stone}</span>&nbsp;</td>
	<td><a href="game.php?village={$village.id}&amp;screen=iron"><img src="graphic/eisen.png" title="Ferro" alt="" /></a></td>
	<td><span id="iron" title="{$iron_per_hour}" {if $village.r_iron==$max_storage}class="warn"{/if}>{$village.r_iron}</span></td>
	<td style="border-left: dotted 1px;">
	&nbsp;<a href="game.php?village={$village.id}&amp;screen=storage"><img src="graphic/res.png" title="Capacidade de Armazenamento" alt="" /></a>
	</td><td id="storage">{$max_storage} </td>
	</tr></table></td>
	
	<td><table class="box" cellspacing="0"><tr>
	<td width="18" height="20" align="center"><a href="game.php?village={$village.id}&amp;screen=farm"><img src="graphic/face.png" title="Trabalhador" alt="" /></a></td>
	<td align="center">{$village.r_bh}/{$max_bh}</td>
	</tr></table></td>
	
	{if $user.attacks!=0}
		<td><table class="box" cellspacing="0"><tr>
		<td width="60" height="20" align="center"><img src="graphic/unit/att.png" alt="" /> ({$user.attacks})</td>
		</tr></table></td>
	{/if}
	
	</tr></table></td>
	
	</tr></table>
{/if}



{if $config.no_actions}
	<table class="main" width="{$user.window_width}" align="center">
	<tr>
	<td style="padding:2px;">
	<span class="fonte2"><b>ATEN&Ccedil;&Atilde;O</b></span><b>:</b> <span class="fonte5">Fazendo BKP do banco de dados, nenhuma a&ccedil;ão como contru&ccedil;ões, recrutamentos, movimentos de tropas est&atilde;o permitidas. Espere alguns minutos.</span> </td>
	</tr>
</table>
	<br />
{/if}

<table class="main" width="{$user.window_width}" align="center" style="background-color: #e2d4b1; border: 2px solid rgb(128, 64, 0); margin-center: 2px;">
<tr>
<td style="padding:2px;">
{if in_array($screen,$allow_screens)}
	{include file="game_$screen.tpl"}
{/if}
{if $screen=='doar'}
    {include file="game_doar.tpl"}
    {/if}
	{if $screen=='premium'}
    {include file="game_premium.tpl"}
    {/if}
<p align="right" style="font-size: 7pt; margin-top:0px; margin-bottom:0px"><span class="normal">Gerado em</span> <span class="normal">{$load_msec}</span><span class="normal">ms</span><span class="cororido">|</span>
<span class="normal">Hora do servidor:</span> <span class="fuck_menu"> <span class="cororido" id="serverTime">{$servertime}</span> | {php} echo date("d/m/Y") {/php}</span></b></p>
</td>
</tr>
</table><br />

<script type="text/javascript">startTimer();</script>
      
</body>

</html>