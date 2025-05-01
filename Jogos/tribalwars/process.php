<?php
require_once("./include.inc.php");

$result = $db->query("SELECT * FROM `login`");
$row_login = $db->fetch($result);
if(isset($_POST["action"]) && $_POST['action'] == 'login'){
	if($row_login['login_locked'] == "yes") {
		exit('{"message":"Desculpe, o acesso ao jogo foi temporariamente bloqueado","type":"error"}');
    }
	$login = new login();
	$playerid = $login->login_js($_POST['username'], $_POST['password']);
	if(is_numeric($playerid)){
		exit('{"message":"Conectado com sucesso. Aguarde um momento enquanto carregamos o jogo!","type":"sucess"}');
	}
	exit($playerid);
}
if(isset($_POST["action"]) && $_POST["action"] == "logout"){
	$sid = new sid();
	$session = $sid->check_sid($_COOKIE['session']);
	$sid->logout($session['userid']);
	setcookie("session", "", time()-1);
	exit('{"message":"Você foi desconectado com sucesso. Por favor, seja paciente enquanto salvamos os dados do seu jogo :)","type":"sucess"}');
}
if(isset($_POST["action"]) && $_POST["action"] == "register"){
	$check = $db->query("SELECT * FROM `users` WHERE `email` = '".$p_mail."'");
	$cgeck = $db->numrows($check);
	if($row_login['login_locked'] == "yes"){
		$error = true;
		exit('{"message":"Desculpe, as inscrições estão encerradas no momento","type":"error"}');
	}
		if(!$error && (isset($_POST['username']))) {
			$p_name = parse(trim($_POST['username']));
		}
		if(!$error && (isset($_POST['password']))) { 
			$p_password = $_POST['password'];
		}	
		if(!$error && (isset($_POST['email'])))  {
			$p_mail = mysql_real_escape_string($_POST['email']);
		}
		
		if(!$error && (isset($_POST['username']) && strlen($_POST['username']) < 4)){
			$error = true;
			exit('{"message":"Ops, seu nome de usuário tem menos de 4 caracteres","type":"error","sms":"username"}');
		}
		if(!$error && (!isset($_POST['username']) || !(strpos($_POST['username'],";") === false) || !(strpos($_POST['username'],"'") === false))){
			$error = true;
			exit('{"message":"Desculpe, seu nome de usuário não pode conter determinados caracteres!","type":"error","sms":"username"}');
		}
		$check = $db->numrows($db->query("SELECT `id` FROM `users` WHERE `username`='".$p_name."'"));
		if(!$error && $check != 0){
			$error = true;
			exit('{"message":"Desculpe pelo nome de usuário \''.$_POST['username'].'\' já foi cadastrado","type":"error","sms":"username"}');
		}
		if(!$error && (isset($_POST['username']) && strlen($_POST['username']) > 16)){
			$error = true;
			exit('{"message":"Ops, seu nome de usuário tem mais de 16 caracteres","type":"error","sms":"username"}');
		}
		if(!$error && (isset($_POST['password']) && strlen($_POST['password']) < 6)){
			$error = true;
			exit('{"message":"Ops, sua senha tem menos de 6 caracteres","type":"error","sms":"password"}');
		}
		if(!$error && (isset($_POST['password']) && strlen($_POST['password']) > 16)){
			$error = true;
			exit('{"message":"Ops, sua senha tem mais de 16 caracteres","type":"error","sms":"password"}');
		}
		if(!$error && empty($_POST['email']) || !checkMail($_POST['email'])){
			$error = true;
			exit('{"message":"Desculpe, o endereço de e-mail que você digitou é inválido!","type":"error","sms":"mail"}');
		}

		if(!$error && $check == 1){
			$error = true;
			exit('{"message":"O endereço de e-mail \''.$_POST['email'].'\' já está em uso!","type":"error","sms":"mail"}');
		}

	if(!$error && md5($_POST['captcha']) != $_COOKIE['security']){
                $error = true;
		exit('{"message":"Ops, o código de segurança que você digitou está incorreto!","type":"error","sms":"captcha"}');
	}
		
		if(!isset($error)){
			$db->query("INSERT INTO `users` (`username`,`password`,`email`,`join_date`) VALUES ('".$p_name."','".md5(crc32(md5(sha1(md5($p_password)))))."','".$p_mail."','".time()."')");
			exit('{"message":"Você foi registrado com sucesso! Por favor, seja paciente, estamos salvando os dados!","type":"sucess"}');
		}
}

if (isset($_POST['action']) && $_POST['action'] == 'configs') {
	if ($_POST['style'] == '0'){
		$error = true;
		exit('{"message":"Selecione um estilo!","type":"error"}');
	}
	
	if (!$error && $_POST['lang'] == '0'){
		$error = true;
		exit('{"message":"Selecione um idioma!","type":"error"}');
	}
	
	if (!$error) {
		$find = $db->query("SELECT * FROM configs WHERE ip = '".$_SERVER['REMOTE_ADDR']."'");
		$row = $db->fetch($find);
		if ($row == '0') {
			$db->query("INSERT INTO configs (ip, style, lang) VALUES ('".$_SERVER['REMOTE_ADDR']."', '".$_POST['style']."', '".$_POST['lang']."')");
			exit('{"message":"O estilo e o idioma foram alterados com sucesso! Por favor espere um momento. ","type":"sucess"}');
		} else {
			$db->query("UPDATE configs SET style = '".$_POST['style']."', lang = '".$_POST['lang']."' WHERE ip = '".$_SERVER['REMOTE_ADDR']."'");
			exit('{"message":"O estilo e o idioma foram alterados com sucesso! Por favor espere um momento. ","type":"sucess"}');
		}
	}
}

if (isset($_POST['action']) && $_POST['action'] == 'team') {
	$error = true;
	exit('{"message":"Em desenvolvimento","type":"error"}');
	if (!$error) {
		exit('{"message":"Em desenvolvimento","type":"sucess"}');
	}
}
?>