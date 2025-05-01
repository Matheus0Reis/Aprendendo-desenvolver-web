{php}
include "include/config.php";

$timp=time()-30;

//connection to the database
$dbhandle = mysql_connect($config['db_host'], $config['db_user'], $config['db_pw']); 

//select a database to work with
$selected = mysql_select_db('lan', $dbhandle); 
$sql101 = "select count(id) from `users`";
$res101 = mysql_query($sql101) or die("Error");
while ($array2 = mysql_fetch_array($res101)) {
	$nr1 = $array2[0];
}
$sql101 = "select count(id) from `users` where `last_activity`>'$timp'";
$res101 = mysql_query($sql101) or die("Error");
while ($array2 = mysql_fetch_array($res101)) {
	$online1 = $array2[0];
}

$jucatori=$nr1;
$online=$online1;
{/php}
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta name="google-site-verification" content="TatRsRbPqNRry4GXvkI1_Yo8WsxRHRCe5otxJ0vi0Oc" />
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="Pragma" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="Content-Language" content="en_EN">
		<meta name="title" content="SpeedWars, jogo da era medieval.">
		<meta name="description" content="Online strategy game set in the Middle Ages">
		<meta name="keywords" content="browsergame, game, mmog, online, internet, medieval, strategy">
		<meta name="coverage" content="worldwide">
		<meta name="revisit-after" content="1 day">
		<meta name="revisit" content="1 day">
		<meta name="robots" content="index,follow">
		<meta name="publisher" content="warriors zapto org">
		<meta name="copyright" content="warriors zapto org">
		<link rel="shortcut icon" href="img/icon.ico" type="image/x-icon">
		<title>Warriors </title>
		<link href="img/index.css" rel="stylesheet" type="text/css">
        <script type="text/javascript" src="../stil.js"></script>
        <script type="text/javascript" src="../misc.js"></script>
        <script type="text/javascript" src="../proto.js"></script>
        <script type="text/javascript" src="../ajax.js"></script>
	</head>
	<body>
		<div id="bodyBg">
			<div id="bodyWrapper">
				<div id="mainWrapper">
  

					<!-- INCEPUT LOGIN -->
					<div id="loginBox">
						<div class="boxTitle">Login</div>
                        {if $error=="Account wurde gesperrt."}
		  	<p><font color="red">O jogador está banido</font>
		  
			{elseif $error=="Account nicht vorhanden."}
			<p><h2><font color="red">A conta não existe</font></h2></p>
			{/if}
					  <DIV class="boxContent">
						<FORM action="index.php?action=login" method="post">
								<DIV class="row">
								  <LABEL for="user">
										Utilizador:
										  <INPUT type="text" name="user" size="12" value="" maxlength="15" />

								  </LABEL>
								</DIV>
								<DIV class="row">
								  <LABEL for="password">
										Senha:
										  <INPUT type="password" name="password" value="" size="12" />
								  </LABEL>
								</DIV>
								<DIV class="buttonrow">

									<INPUT type="submit" value="Login">
								</DIV>
						  </FORM>
						</DIV>
					</DIV>
					<!-- SFARSIT LOGIN -->
					<!-- INCEPUT INREGISTRARE -->
				  <div id="registerBox">

						<div class="boxTitle">Registar</div>							<div class="boxContent">
				  <form action="register.php?action=validate" method="post">
									<table>
										<tr>
											<td>
												<div style="color: #D49D42;">
													Utilizador:&nbsp;

												</div>
											</td>
											<td>
												<div class="row">
													<input name="name" type="text" value="" class="text" maxlength="15"/>
												</div>
											</td>
										</tr>
										<tr>

											<td>
												<div style="color: #D49D42;">
													Senha:
												</div>
											</td>
											<td>
												<div class="row">
													<input name="password" type="password" value="" class="text" />
												</div>

											</td>
										</tr>
                                        <tr>

	<td colspan="2">								<div><br> <input id="agb" name="agb" type="checkbox" style="margin-bottom:0;"/><label for="agb" class="cororido">Eu aceito os termos.</label>
								<label for="agb_link"></label></div><br /></td>
	</tr>
										
	</table>
									<div class="buttonrow">
										<input id="register_button" type="submit" value="REGISTAR" />
									</div>

								</form>
															</div>
                                                            
                                                        <b>  <i>{$players}</i> jogadores estão participando ! <br />
                                                        </div>
					</div>
				</div>
			</div>

			</div>
		</div>
	</body>
</html>