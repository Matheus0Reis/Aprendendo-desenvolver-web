<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Tribos AddictGames</title>
<meta http-equiv="content-type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="stamm.css" />
<link rel="stylesheet" type="text/css" href="fonte.css" />
<script src="script.js?1159978916" type="text/javascript"></script>
</head>

<body >
<table class="main" width="800" align="center"><tr><td>
<h3 class="menus">Criar aldeia</h3>

{if !empty($ennobled_by)}
<p class="cororido">Suas aldeias foram nobladas por <span class="fonte10">{$ennobled_by}</span>. Felizmente alguns de seus trabalhadores sobreviveram aos ataques e estão dispostos a recomeçar.</p>
{/if}


<h4 class="cororido2">Em que direção deseja criar a sua nova aldeia ?</h4>

<table class="vis"><tr><td width="200">
<form action="create_village.php?action=create" method="post">
<label><input type="radio" name="direction" value="random" checked="checked" /><span class="cororido">Aleatório</span></label><br />
<label><input type="radio" name="direction" value="nw" /><span class="cororido2">Nordeste</span></label><br />
<label><input type="radio" name="direction" value="no" /><span class="cororido">Noroeste</span></label><br />
<label><input type="radio" name="direction" value="sw" /><span class="cororido2">Sudeste</span></label><br />
<label><input type="radio" name="direction" value="so" /><span class="cororido">Sudoeste</span></label><br />
<br /><input type="submit" value="Confirmar" />
</form>



</td><td>
<img src="graphic/richtung/richtung.png" alt="" />
</td></tr></table>



</td></tr></table>
<script type="text/javascript">setImageTitles();</script>
</body>
</html>
