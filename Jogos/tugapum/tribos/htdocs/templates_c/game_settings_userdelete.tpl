<h3>Apagar Conta</h3><br>

Aqui você pode apagar sua conta e desistir de todo seu trabalho conquistado com grande esforço e dedicação, basta você digitar sua senha abaixo e clicar em "<b>APAGAR</b>".<br><br>

<form action="game.php?village={$villageid}&screen=settings&mode=userdelete&do=delete" method="post">
Senha: <input type="password" name="passwort">
<input type="submit" value="Apagar">

{$err}