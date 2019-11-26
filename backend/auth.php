<?php

include_once 'conexao.php';

$user = $_POST['user'];
$pass = $_POST['password'];

//Cria a condição de pesquisa
$query = "SELECT * 
FROM employies 
WHERE username='" . $_POST["user"] . "' AND password = '". $_POST["password"]."'";

//Resultado da condição e casos
$result = mysqli_query($conexao, $query);

//Retorna número de linhas
$num_rows = mysqli_num_rows($result);

//Condições com o retorno de linhas
if($num_rows == 0) {
    $query = "SELECT * 
    FROM providers 
    WHERE username='" . $_POST["user"] . "' AND password = '". $_POST["password"]."'";     
    
    $result = mysqli_query($conexao, $query);
    $num_rows = mysqli_num_rows($result);
    
    if($num_rows == 0) {
        $query = "SELECT * 
        FROM users 
        WHERE username='" . $_POST["user"] . "' AND password = '". $_POST["password"]."'";
        
        $result = mysqli_query($conexao, $query);
        $num_rows = mysqli_num_rows($result);
        }
    }

//Retorna o array dos campos
$data = mysqli_fetch_row ($result);

if($data != null) 
{
    header ('location:../frontend/loja.html');
} else 
{
    print_r("<h1><strong>ACESSO NEGADO !</strong></h1>");
}
?>
