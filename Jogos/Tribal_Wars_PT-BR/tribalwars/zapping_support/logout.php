<?php
 #########################################
 ### Desenvolvido por: Caique Portella ###
 ###  Email: caiqueportella@gmail.com  ###
 ########  Skype: caique-portela  ########
 ## MSN: caiqueportella@hotmail.com.br  ##
 #########################################
 
require ('../include.inc.php');
require('top.php');
?>
<!DOCTYPE html>
<html lang="pt-br">
	<head>
		<link rel="shortcut icon" href="files/images/player/favicon.ico" />
		<meta http-equiv="Content-Type" content="text/html" charset="ISO-8859-1" />
		<title><?php echo $titulo ?></title>
		<link rel="stylesheet" type="text/css" href="files/styles/bootstrap.min.css" />
		<link rel="stylesheet" type="text/css" href="files/styles/player.new.css" />
		<script src="files/js/player.js" type="text/javascript"></script>
		<script src="files/js/swfobject.js" type="text/javascript"></script>
		<script src="files/js/jquery.min.js" type="text/javascript"></script>
	</head>
	<body>
		<div id="container">
			<div id="header">
				<h1>Succesvol uitgelogd	<img src="files/images/new/logo.png" alt="" style="float: right" /></h1>
			</div>
			<div id="sep"></div>
			<div id="content">
				<h2><p>Klik<a href="index.php">Hier</a> om terug te gaan naar de homepage!</p></h2>
			</div>
		</div>
		<div id="footer">
			<div>
				&copy; <?php echo $config['ano']; ?> - <?php echo date("Y"); ?> 
				<?php for ($x = 1; $x <= 10; $x++) {
					if (isset($config["footer_$x"]) && $config["footer_$x"] != "") { echo $config["footer_$x"]; }
					if (!isset($config["footer_$x"])) { break; }
				}
				?>
			</div>
		</div>	
	</body>
</html>