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
				</div></div>		<div id="content">
				<div id="screenshot" style="visibility:hidden" onclick="hide_screenshot();">
					<div id="screenshot_image"></div>

				</div>
				<div class="container-block-full">
					<div class="container-top-full"></div>
					<div class="container">
						<div class="info-block register">
<h1 align="center" class="menus">Hall da Fama<br><br>Aqui s&oacute; os melhores!</h1><br>

	{foreach from=$rounds item=arr key=id}
		<h3 align="center" class="cororido">Partida número: #{$id}</h3>
	
		<table cellspacing="0" cellpadding="0">
		<tr><td>
		
		<table class="vis">
		<tr><td class="fonte6maior" style="width:180px">Vencedor:</td><td style="width:300px"><strong class="fonte6maior">{$arr.name}</strong></td></tr>
		<tr><td class="fonte6maior">Tribo Vencedora: </td><td class="fonte6maior">{$arr.description}</td></tr>
		<tr><td class="cororido2">Inicio:</td><td><strong class="cororido">{$arr.start}</strong></td></tr>
		<tr><td class="cororido2">Fim:</td><td><strong class="cororido">{$arr.end}</strong></td></tr>
		<tr><td class="cororido2">Velocidade:</td><td class="cororido">{$arr.speed|format_number}x</td></tr>
		<tr><td class="cororido2">Velocidade das tropas: </td><td class="cororido">{$arr.speed_units}</td></tr>
		<tr><td class="cororido">Moral:</td><td class="cororido2">{$arr.moral|replace:"ja":"Ativo"|replace:"nein":"Desativado"}</td></tr>
		<tr><td class="cororido">Mapa:</td><td class="cororido2">{$arr.map|replace:"alte Karte":"Velho Mapa"|replace:"neue Karte":"Novo Mapa"}</td></tr>
		</table>
		
		</td><td style="padding-left: 10px" valign="top">
		
		<p><a href="sds_ranking.php?round_id={$id}">&raquo; Classifica&ccedil;&atilde;o</a></p>
		
		</td></tr></table>
	{/foreach}


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