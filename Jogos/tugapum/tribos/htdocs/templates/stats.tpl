<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>UltimaTe WarS - O Jogo Da Era Medieval!</title>
		<link rel="shortcut icon" href="graphic/icon.ico" type="image/x-icon" />
		<link rel="stylesheet" type="text/css" href="index.css" />
		<link rel="stylesheet" type="text/css" href="fonte.css" />
		<script language="javaScript" src="stil.js"></script>
		<script language="javaScript" src="script.js"></script>

</head>

<body>
		<div id="index_body">
			<div id="main">
						<div id="header">
				<h1><a href="index.php" style="background:url(graphic/index/bg-logo.png) no-repeat 100% 0;">TribalSpeeD - O Jogo da Era Medieval!</a></h1>
				<div class="navigation">
					<div class="navigation-holder">
						<div class="navigation-wrapper">
							<div id="navigation_span">
								<a href="index.php">UltimaTe WarS</a> - <a href="rules.php">Regras</a> - <a href="help.php">Ajuda</a> - <a href="sds_rounds.php">Hall da Fama</a> - <a href="stats.php">Estat&iacute;sticas</a> - <a href="team.php">Equipe</a> - <a href="chat.php">WebChat</a>							</div>
						</div>
					</div>
				</div></div>	
				<div class="container-block-full">
					<div class="container-top-full"></div>
					<div class="container">
						<div class="info-block register">
							<h2 class="register"><span class="menus">Estatisticas Mundo 1</span></h2>
<br />
<h3><a href="guest.php" target="_top">&raquo; Entrar Como Visitante</a></h3><br />

<table class="vis" width="100%">
<tr>
  <th>Jogadores:</th>
  <th>{$players}</th></tr>
<tr><td>Total de Aldeias:</td><td>{$villages} ({$vpp} por Jogador)</td></tr>

</table><br />

<table class="vis" width="100%">
<tr><th>Resultados Calculados Em:</th>
<th>Hoje, às {$time}Hrs</th>
</tr>
<tr><td>Mensagens Enviadas:</td>
<td>{$mail} ({$mpp} por Jogadores)</td>
</tr>

<tr><td>Total de Pontos:</td>
<td>{$points} ({$ppp} por Jogador, {$ppv} por Aldeia)</td>
</tr>

<tr><td>Total de Tropas:</td>
<td>
<table><tr>
<th width="45"><img src="/graphic/unit/unit_spear.png" title="Lancier" alt="" /></th><th width="45"><img src="/graphic/unit/unit_sword.png" title="Luptator cu spada" alt="" /></th><th width="45"><img src="/graphic/unit/unit_axe.png" title="Luptator cu toporul" alt="" /></th><th width="45"><img src="/graphic/unit/unit_spy.png" title="Spion" alt="" /></th><th width="45"><img src="/graphic/unit/unit_light.png" title="Cavalerie usoara" alt="" /></th><th width="45"><img src="/graphic/unit/unit_heavy.png" title="Cavalerie Grea" alt="" /></th><th width="45"><img src="/graphic/unit/unit_ram.png" title="Berbec" alt="" /></th><th width="45"><img src="/graphic/unit/unit_catapult.png" title="Catapulta"> </th><th width="45"><img src="/graphic/unit/unit_snob.png" title="Nobil" alt="" /></th>
</tr><tr>

{foreach from=$unitsAll item=unitsAll}
{if $unitsAll == 0}
<td class="hidden">{$unitsAll}</td>
{else}
<td>{$unitsAll}</td>
{/if}
{/foreach}
</tr></table>
</td></tr>

<tr>
  <td>Média de Tropas por Jogador:</td>
  <td>
<table><tr>
<th width="45"><img src="/graphic/unit/unit_spear.png" title="Lancier" alt="" /></th><th width="45"><img src="/graphic/unit/unit_sword.png" title="Luptator cu spada" alt="" /></th><th width="45"><img src="/graphic/unit/unit_axe.png" title="Luptator cu toporul" alt="" /></th><th width="45"><img src="/graphic/unit/unit_spy.png" title="Spion" alt="" /></th><th width="45"><img src="/graphic/unit/unit_light.png" title="Cavalerie usoara" alt="" /></th><th width="45"><img src="/graphic/unit/unit_heavy.png" title="Cavalerie grea" alt="" /></th><th width="45"><img src="/graphic/unit/unit_ram.png" title="Rammbock" alt="" /></th><th width="45"><img src="/graphic/unit/unit_catapult.png" title="Catapulta" alt="" /></th></th><th width="45"><img src="/graphic/unit/unit_snob.png" title="Nobili" alt="" /></th>
</tr><tr>
{foreach from=$unitsPlayer item=unitsPlayer}
{if $unitsPlayer == 0}
<td class="hidden">{$unitsPlayer}</td>
{else}
<td>{$unitsPlayer}</td>
{/if}
{/foreach}

</tr></table>
</td></tr>

<tr>
<td>Media de Tropas por Aldeia :</td>
<td>
<table><tr>
<th width="45"><img src="/graphic/unit/unit_spear.png" title="Lancier" alt="" /></th><th width="45"><img src="/graphic/unit/unit_sword.png" title="Luptator cu spada" alt="" /></th><th width="45"><img src="/graphic/unit/unit_axe.png" title="Luptator cu toporul" alt="" /></th><th width="45"><img src="/graphic/unit/unit_spy.png" title="Spion" alt="" /></th><th width="45"><img src="/graphic/unit/unit_light.png" title="Cavalerie usoara" alt="" /></th><th width="45"><img src="/graphic/unit/unit_heavy.png" title="Cavalerie grea" alt="" /></th><th width="45"><img src="/graphic/unit/unit_ram.png" title="Rammbock" alt="" /></th><th width="45"><img src="/graphic/unit/unit_catapult.png" title="Catapulta" alt="" /></th><th width="45"><img src="/graphic/unit/unit_snob.png" title="Nobili" alt="" /></th>
</tr><tr>
{foreach from=$unitsVillage item=unitsVillage}
{if $unitsVillage == 0}
<td class="hidden">{$unitsVillage}</td>
{else}
<td>{$unitsVillage}</td>
{/if}
{/foreach}
</tr></table>
</td></tr>

</table>

</td></tr></table>

</div>
					</div>
					<div class="container-bottom-full"></div>
				</div>
			</div><!-- content -->

						<div class="closure">

				<p align="center" class="cororido">Copyright &copy; 2009 - 2011  by UltimaTe WarS</p>								
			</div>		</div><!-- main -->

						
				<script type="text/javascript" src="mootools.js?1232382056" ></script>
		<script type="text/javascript" src="index.js?1232382056"></script>	
				<div id="screenshot" style="visibility:hidden" onclick="hide_screenshot();">
				<div id="screenshot_image"></div>
			</div>
		</div>
	</body>
</html>
