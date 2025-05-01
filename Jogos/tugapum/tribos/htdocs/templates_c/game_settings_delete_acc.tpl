{php}
$username = $this->_tpl_vars['user']['username'];
$iduser = $this->_tpl_vars['user']['id'];
$parola = md5($_POST['parola']);
$buton = $_POST['sterge'];
$time_del = time()+86400*3;

$select_pass = mysql_fetch_array(mysql_query("SELECT password FROM login.users WHERE username = '$username'"));
$select_pass = $select_pass[0];

if ($buton)
{
if ($select_pass == $parola){

mysql_query("UPDATE users SET delete_acc = '$time_del' WHERE id = '$iduser'");
header("Location: game.php");
} else { 
$error = 'Senha incorreta';
}
}

{/php}
<h3>Apagar conta </h3>
<p> Assim que a sua conta solicite a remo&ccedil;&atilde;o da sua conta n&atilde;o ser&aacute; mais poss&iacute;vel aceder a esta. </p>
<span style="color: red"><b>{php} echo $error; {/php}</b></span>
<form action="" method="post">
  Senha
  : 
  <input type="password" name="parola"> <input type="submit" name="sterge" value="Apagar">
</form>

