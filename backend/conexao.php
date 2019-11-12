<?php

$host = "localhost";
$user = "root";
$pass = "";
$banco = "avivah";

//Cria a conexão
$conexao = new mysqli ($host, $user,$pass,$banco) or die ("Não encontrado servidor");

//Mostra o erro caso seja dado
if ($conexao->connect_error) {
    die('Connect Error (' . $conexao->connect_error . ') '
            . $conexao->connect_error);
}
//Checa a conexão
$acesso = $conexao->select_db($banco) or die ("Não foi localizado o banco");
//header("Location:../frontend/index.php");

?>