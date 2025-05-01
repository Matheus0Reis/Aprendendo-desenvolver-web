<p>{php}
  $username=$this->_tpl_vars['user']['username'];
  
  $selectare_email = mysql_query("SELECT email FROM login.users WHERE username = '$username'");
  $selectare_email = mysql_fetch_array($selectare_email);
  $selectare_email = $selectare_email[0];
  
  
  $verificare_parola = mysql_query("SELECT password FROM login.users WHERE username = '$username'");
  $verificare_parola = mysql_fetch_array($verificare_parola);
  $verificare_parola = $verificare_parola[0];
  
  
  $parola = $_POST['parola'];
  $email = $_POST['email'];
  
  
  
  
  if ($_GET['a'] == 'schimba'){
  if (eregi("^[_a-z0-9-]+(.[_a-z0-9-]+)*@[a-z0-9-]+(.[a-z0-9-]+)*(.[a-z]{2,3})$", $email)){
  $error1='';
  }else{$error1='O email introduzido n&atilde;o &eacute; v&aacute;lido!';}
  
  $check = "select id from login.users where email = '".$_POST['email']."';";
  $qry = mysql_query($check) or die ("Eroare prostule,sa modificat baza de date ,sau querryul ".mysql_error());
  $num_rows = mysql_num_rows($qry); 
  if ($email != $selectare_email){
  $error2='';
  if ($num_rows != 0) { 
  $error3="Email $email j&aacute; est&aacute; registado!";
  
  }
  else
  {$error3='';}
  }
  else
  {
  $error2 = "Aveti deja acest email!";
  }
  
  
  if ($verificare_parola == md5($_POST['parola'])){
  $error='';
  }
  else
  {
  $error = "Senha incorreta!!";
  }
  
  
  if ($error=='' && $error1=='' && $error3=='' && $error2==''){
  $sql = "UPDATE login.users SET  `email` = '$email' WHERE `username` = '$username'";
  $mq = mysql_query($sql) or die(mysql_error()); 
  $schimba_s="Email alterado com sucesso! ";{/php} </p>
<meta http-equiv="refresh" content="2;URL=game.php?village={$village.id}&amp;screen=settings&amp;mode=change_mail">
{php}
}

}

{/php}
<h3>Alterar endere&ccedil;o de email </h3> 
<p>Introduza um novo email </p> 
 
<table class="vis">
{php} echo "<strong>$schimba_s</strong>"; {/php}
{php} echo "<div class='error'>$error</div>"; {/php}
{php} echo "<div class='error'>$error1</div>"; {/php}
{php} echo "<div class='error'>$error2</div>"; {/php}
{php} echo "<div class='error'>$error3</div>"; {/php}

<form action='game.php?village={$village.id}&screen=settings&mode=change_mail&a=schimba' method='post'> 
<tr>
  <td><center>    Novo email:</td>
  <td><input name='email' type='text' /></center></td></tr> 
<tr>
  <td><center>    Senha atual:</td>
  <td><input name='parola' type='password' /></center></td></tr> 
<tr><td colspan=2><center><input type='submit' value='Schimb&#259;'/></center></td></tr> 
</form>
  <td>Email atual :</td>
    <td>{php} echo "<b>$selectare_email</b>"; {/php} </td>


</table>