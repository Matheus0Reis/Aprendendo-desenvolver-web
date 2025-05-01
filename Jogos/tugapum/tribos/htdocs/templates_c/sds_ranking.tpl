<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>UltimaTe WarS - O Jogo Da Era Medieval!</title>
		<link rel="shortcut icon" href="graphic/icon.ico" type="image/x-icon" />
		<link rel="stylesheet" type="text/css" href="index.css" />
		<link rel="stylesheet" type="text/css" href="fonte.css" />
		<script language="javaScript" src="stil.js"></script>

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
				</div></div>			<div id="content">
				<div id="screenshot" style="visibility:hidden" onclick="hide_screenshot();">
					<div id="screenshot_image"></div>

				</div>
				<div class="container-block-full">
					<div class="container-top-full"></div>
					<div class="container">
						<div class="info-block register">
<h1 class="menus">Classificação Partida #{$round.id}</h1>

<table class="vis">
<tr>
	<th class="fonte6" width="60"><strong align="center">Classificação</strong></th>
	<th class="fonte6" width="160"><strong align="center">Jogador</strong></th>
	<th class="fonte6" width="100"><strong align="center">Tribo</strong></th>
	<th class="fonte6" width="120"><strong align="center">Pontos</strong></th>
	<th class="fonte6" width="60"><strong align="center">Aldeias</strong></th>
</tr>
{foreach from=$players item=arr key=id}
	<tr>
		<td align="center" class="cororido2">{$arr.rank}{/if}</td>
		<td class="cororido">{$arr.username}</td>
		<td class="fonte6maior">{if $arr.ally==0}NULL{else}{$arr.ally}{/if}</td>
		<td class="cororido2">{$arr.points|format_number}{/if}</td>
		<td align="center" class="cororido2">{$arr.villages}{/if}</td>
	</tr>
{/foreach}
</table>

<br />

						</div>
					</div>
					<div class="container-bottom-full"></div>
				</div>
			</div><!-- content -->

						<div class="closure">

				<p align="center" class="cororido">Copyright &copy; 2009 - 2010  by UltimaTe WarS</p>								
			</div>		</div><!-- main -->

						
				<script type="text/javascript" src="mootools.js?1232382056" ></script>
		<script type="text/javascript" src="index.js?1232382056"></script>	
				<div id="screenshot" style="visibility:hidden" onclick="hide_screenshot();">
				<div id="screenshot_image"></div>
			</div>
		</div>
	</body>
</html>