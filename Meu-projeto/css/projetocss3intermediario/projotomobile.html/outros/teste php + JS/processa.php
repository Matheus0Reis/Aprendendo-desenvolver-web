<?php
// Conexão com o banco
$host = "localhost";
$user = "root";
$pass = "123";
$db = "meu_bolao";

$conn = new mysqli($host, $user, $pass, $db);

// Verifica conexão
if ($conn->connect_error) {
  die("Conexão falhou: " . $conn->connect_error);
}

// Pega dados do formulário
$nome = $_POST['nome'];
$email = $_POST['email'];

// Prepara e insere
$stmt = $conn->prepare("INSERT INTO participantes (nome, email) VALUES (?, ?)");
$stmt->bind_param("ss", $nome, $email);

if ($stmt->execute()) {
  echo "Cadastro realizado com sucesso!";
} else {
  echo "Erro: " . $stmt->error;
}

$stmt->close();
$conn->close();
?>
