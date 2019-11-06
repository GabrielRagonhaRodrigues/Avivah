<?php

$host = "localhost";
$user = "root";
$pass = "";
$banco = "avivah";

//Cria a conexão
$conexao = new mysqli ($host, $user,$pass) or die ("Não encontrado servidor");

//Checa a conexão
$acesso = $conexao->select_db($banco) or die ("Não foi localizado o banco");
//header("Location:../frontend/index.php");

?>