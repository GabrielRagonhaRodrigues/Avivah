<?php

include_once 'conexao.php';

$data = [];

foreach($_POST as $value)
{
    $data[] = $value; 
}

$query = "SELECT * FROM users WHERE username={$data['username']}";
$row = mysqli_query($conexao, $query);
$result = (mysqli_fetch_row ($row));

if(is_null($result))
{
    $query = "INSERT INTO users (username) VALUE ('{$data['username']}')";
    mysqli_query($conexao, $query);
    print_r("Não existe username com esses valores no banco");
} else {
    print_r("Esse usuário ja existe no banco");
}
?>